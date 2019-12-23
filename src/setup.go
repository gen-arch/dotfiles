package main

import (
  "fmt"
  "github.com/src-d/go-git"
)

func main() {
  _, err = git.PlainClone("/tmp/test", false, &git.CloneOptions{
    URL: "https://github.com/git-fixtures/basic.git",
  })
}
