file 'main' do
  sh 'clang -c stack.c'
  sh 'clang stack.o main.c -o main'
end

task default: 'main' do
  sh './main'
end
