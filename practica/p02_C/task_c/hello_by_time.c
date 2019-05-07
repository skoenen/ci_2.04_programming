#include <stdio.h>
#include <sys/time.h>
#include <time.h>

int main() {
  char name[32];
  struct timeval tv;

  printf("Your name please: ");
  scanf("%31s", name);

  printf("\n");

  if(gettimeofday(&tv, NULL) == 0) {
    struct tm *l_time = localtime(&(tv.tv_sec));

    if(l_time->tm_hour < 12) {
      printf("Good Morning %s!\n", name);
      return 0;

    } else if(l_time->tm_hour >= 12 && l_time->tm_hour < 18) {
      printf("Good Afternoon %s!\n", name);
      return 0;

    } else {
      printf("Good Evening %s!\n", name);
      return 0;
    }

  } else {
    printf("Could not get time of day");
    return 1;
  }

  return 2;
}
