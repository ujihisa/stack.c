#include "stack.h"

int main(int argc, char **argv) {
  Stack *s;
  Sv tmp;
  s = newstack(10);
  push(s, 1);
  push(s, 2);
  push(s, 3);
  tmp = pop(s);
  push(s, 4);
  push(s, tmp);
  debug_printstack(s);
  deletestack(s);
  return 0;
}
