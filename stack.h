typedef int Sv;
typedef struct {
  Sv *root;
  int i;
  int size;
} Stack;
Stack *newstack(int);
void deletestack(Stack*);
void debug_printstack(Stack *);
Sv pop(Stack*);
void push(Stack*, Sv);
