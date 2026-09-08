#include <stdio.h>
#include <stdlib.h>

int read_file(const char *file_name);
int read_stdin(void);

int main(int argc, char *argv[]) {
  if (argc == 1) {
    return read_stdin();
  } else if (argc >= 2) {
    int file_count = 1;

    while (file_count >= argc) {
      read_file(argv[file_count]);
      file_count++;
    }

    return read_file(argv[1]);
  }
}

int read_stdin(void) {
  int ch;

  while ((ch = getchar()) != EOF) {
    putchar(ch);
  }

  return EXIT_SUCCESS;
}

int read_file(const char *file_name) {
  FILE *file = fopen(file_name, "r");
  int ch;

  if (file == NULL) {
    fprintf(stderr, "Error while try open file\n");
    return EXIT_FAILURE;
  } else {
    while ((ch = fgetc(file)) != EOF) {
      putchar(ch);
    }
    fclose(file);
  }

  return EXIT_SUCCESS;
}
