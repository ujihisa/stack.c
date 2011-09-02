#include <stdlib.h>
#include <stdio.h>
#include "stack.h"

Stack *newstack(int size) {
  Stack *s = (Stack *)malloc(sizeof(Stack));
  s->root = (Sv *)malloc(sizeof(Sv) * size);
  s->i = 0;
  s->size = size;
  return s;
}

void deletestack(Stack *s) {
  free(s->root);
  free(s);
}

void debug_printstack(Stack *s) {
  int i;
  Sv *p = s->root;
  printf("#<Stack");
  for (i = 0; i < s->i; ++i) {
    printf(" %d", (int)s->root[i]);
  }
  printf(">\n");
}

Sv pop(Stack *s) {
  return s->root[--s->i];
}

void push(Stack *s, Sv x) {
  s->root[s->i] = x;
  s->i++;
}
