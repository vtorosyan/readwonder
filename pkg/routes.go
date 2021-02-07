package api

import (
	"fmt"
	"net/http"

	"github.com/vtorosyan/readwonder/pkg/books"
)

type HandleFunc func(w http.ResponseWriter, r *http.Request)

func listBooks(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Books: %v", books.List())
}

func allRoutes() map[string]HandleFunc {
	routes := make(map[string]HandleFunc)

	routes["/books"] = listBooks
	return routes
}
