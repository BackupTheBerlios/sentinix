#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <limits.h>
int main(int argc, char* argv[]) {
  unsigned long int length = 0;
  if (argc != 2) {
    printf("%s must be given a time\n", argv[0]);
    return 1;
  }
  length = strtol(argv[1],NULL, 10);
  if (length == LONG_MAX) {
    printf("Number is too large\n");
    return 1;
  }
  usleep(length);
    
  return 0;
}
