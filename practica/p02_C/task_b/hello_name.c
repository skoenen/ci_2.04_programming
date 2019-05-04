#include <stdio.h>

int main() {
  char name[20];

  printf("Your name please: ");
  scanf("%s", name);

  printf("\nHello %s!\n", name);

  return 0;
}
