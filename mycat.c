#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
  int ch;

  if (argc == 1) {
    while ((ch = getchar()) != EOF) {
      putchar(ch);
    }
  } else if (argc == 2) {
    FILE *file = fopen(argv[1], "r");
    if (file == NULL) {
        perror("Error opening file");
        return EXIT_FAILURE;
    } else {
      while ((ch = fgetc(file)) != EOF) {
        putchar(ch);
      }
    }
    fclose(file);
  } else {
    printf("Too meny arcuments");
  }

    return 0; 
}
