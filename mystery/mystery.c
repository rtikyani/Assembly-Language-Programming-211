#include <stdio.h>
#include <stdlib.h>
#include "mystery.h"

int array[200];

int add(int x, int y) {
    return x + y;
}

int dothething(int value) {
    int temporary = 0;

    if (array[value] == -1) {
        if (value == 0) {
            array[value] = 0;
        } else if (value == 1) {
            array[value] = 1;
        } else {
            array[value] = add(dothething(value - 1), dothething(value - 2));
        }
    }

    temporary = array[value];
    return temporary;
}

int main(int argc, char **argv) {
    int number = atoi(argv[1]);

    int index = 0;
    while (index < 200) {
        array[index] = -1;
        index++;
    }

    printf("%i\n", dothething(number));
    return 0;
}