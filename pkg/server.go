package main

import (
	"fmt"
	"github.com/gorilla/mux"
	"log"
	"net/http"
	"strings"
)

func main() {
	r := mux.NewRouter()

	api := r.PathPrefix("/api").Subrouter()

	b := strings.Builder{}
	b.WriteString("Please consult the following endpoints:\n")

	for p, h := range allRoutes() {
		b.WriteString(p + "\n")
		api.HandleFunc(p, h)
	}

	api.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, b.String())
	})

	log.Fatal(http.ListenAndServe(":9000", r))
}
