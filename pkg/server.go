package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
	"os/signal"
	"strings"

	"github.com/gorilla/mux"
	"github.com/spf13/viper"
)

func main() {
	viper.SetEnvPrefix("readwonder") // defaults to uppercase
	err := viper.BindEnv("port") // defaults to uppercase
	if err != nil {
		log.Fatalf("failed to bind env variable %v", err)
	}
	port := viper.GetString("port")

	r := mux.NewRouter()
	api := r.PathPrefix("/api").Subrouter()

	b := strings.Builder{}
	b.WriteString("Please consult the following endpoints:\n\n")

	for p, h := range allRoutes() {
		b.WriteString(p + "\n")
		api.HandleFunc(p, h)
	}

	api.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, b.String())
	})

	srv := &http.Server{
		Addr: fmt.Sprintf(":%s", port),
		Handler: r,
	}

	go func() {
		err := srv.ListenAndServe()
		if err != nil && err != http.ErrServerClosed {
			log.Fatalf("server error: %s\n", err)
		}
	}()

	log.Printf("started server and waiting for connections on: %s", port)

	quit := make(chan os.Signal)
	signal.Notify(quit, os.Interrupt)
	sig := <-quit
	log.Printf("shutting down server: %v\n", sig)
}
