#include <stdio.h>

int main(int argc, char *argv[]) {
  int ch;

  while ((ch = getchar()) != EOF && ch != '\n') {
    printf("char read  = %c, ASCII: %d\n", ch, ch);
  }
  return 0; 
}
