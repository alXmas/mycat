# mycat

A simple `cat` implementation written in C.

## Description

`mycat` reads files and prints their contents to standard output.

This project is made for learning basic C programming, file I/O, command-line arguments, and error handling.

## Features

- Read one file
- Read multiple files
- Print output to `stdout`
- Print errors to `stderr`
- Read from `stdin` if no files are provided

## Build

```bash
gcc -Wall -Wextra -Werror -o mycat mycat.c
```
## Usage

Read one file:

```bash
./mycat file.txt
```
Read multiple files:
```bash
./mycat file1.txt file2.txt
```
Read from standard input:
```bash
./mycat
```
Or with a pipe:
```bash
echo "Hello" | ./mycat
```

## Examples
```bash 
echo "Hello, mycat!" > test.txt
./mycat test.txt
```
Expected output:
```bash 
Hello, mycat!
```
## License
MIT
