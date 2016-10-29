#include <stdio.h>
#include <stdlib.h>
#include "nCr.h"
#include <sys/time.h>
#include <string.h>

int main(int argc, const char *argv[]) {

    if (strcmp(argv[1], "-h") == 0) {
        printf("Usage: formula <positive integer>\n");
    } else {
        int power = atoi(argv[1]);

        struct timeval start, end;

        gettimeofday(&start, NULL);

        printf("(1 + x)^%i = ", power);

        if (power == 0) {
            printf("0");
        } else {
            printf("1 + ");
        }

        for (int powerIndex = 0; powerIndex <= power; powerIndex++) {
            int result = nCr(power, powerIndex);

            if (result == -1) {
                printf("There was a multiplication overflow!\n");
                return EXIT_FAILURE;
            } else {
                if (powerIndex != 0) {
                    printf("%i*x^%i ", result, powerIndex);

                    if (powerIndex != power) {
                        printf("+ ");
                    }
                }

            }
        }

        gettimeofday(&end, NULL);

        long microseconds = (end.tv_sec * 1000000 + end.tv_usec) - (start.tv_sec * 1000000 + start.tv_usec);
        printf("\n%ld microseconds\n", microseconds);
    }

    return EXIT_SUCCESS;
}