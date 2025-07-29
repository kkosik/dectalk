package main

import (
	"fmt"
	"io"
	"log"
	"net/http"
	"os"
	"os/exec"
	"time"
	"strings"
    	"io/ioutil"	
    	"path"
)

func main() {

	mux := http.NewServeMux()

	fs := http.FileServer(http.Dir("./html"))
	mux.Handle("/", fs)
	mux.HandleFunc("/synthesize", synthesize)

	err := http.ListenAndServe(":80", mux)
	if err != nil {
		log.Fatalln(err)
	}
}

func synthesize(w http.ResponseWriter, r *http.Request) {

	// Clear wavs directory
	dir, err := ioutil.ReadDir("/opt/say/wavs")
	for _, d := range dir {
	    os.RemoveAll(path.Join("/opt/say/wavs", d.Name()))
	}
	
	timestamp := time.Now().Nanosecond()
	filename := fmt.Sprintf("wavs/%d.wav", timestamp)

	args := []string{
		"say.exe",
		"-w",
		"../" + filename,
		"-pre",
		"[:phoneme on]",
	}

	cmd := exec.Command("wine", args...)
	cmd.Env = []string{
		"DISPLAY=:1",
	}
	cmd.Dir = "lib"
	text := r.URL.Query().Get("text")
	cmd.Stdin = strings.NewReader(text)

	err = cmd.Run()
	if err != nil {
		log.Println(err)
		w.WriteHeader(500)
		return
	}

	file, err := os.Open(filename)
	if err != nil {
		log.Println(err)
		w.WriteHeader(500)
		return
	}

	defer func() {
		_ = file.Close()
	}()

	stats, err := file.Stat()
	if err != nil {
		log.Println(err)
		w.WriteHeader(500)
		return
	}

	w.Header().Set("Content-Type", "audio/wav")
	w.Header().Set("Content-Length", fmt.Sprint(stats.Size()))

	_, err = io.Copy(w, file)
	if err != nil {
		log.Println(err)
		w.WriteHeader(500)
		return
	}
}
