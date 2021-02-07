package main

import (
	"fmt"
	"github.com/vtorosyan/readwonder/pkg/books"
	"net/http"
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
