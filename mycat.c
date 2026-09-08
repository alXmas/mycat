#include <stdio.h>
#include <stdlib.h>

void read_file(char *file_name);
void read_stdin();

int main(int argc, char *argv[]) {
  if (argc == 1) {
    read_stdin();
  } else if (argc == 2) {
    read_file(argv[1]);
  } else {
    printf("Too meny arguments");
  }

  return EXIT_SUCCESS;
}

void read_stdin() {
  int ch;

  while ((ch = getchar()) != EOF) {
    putchar(ch);
  }
}

void read_file(char *file_name) {
  FILE *file = fopen(file_name, "r");
  int ch;

  if (file == NULL) {
    fprintf(stderr, "Error while try open file\n");
  } else {
    while ((ch = fgetc(file)) != EOF) {
      putchar(ch);
    }
  }
  fclose(file);
}
