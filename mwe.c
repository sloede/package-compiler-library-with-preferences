#include <stdio.h>

#include <mwe.h>
#include <julia_init.h>
#include <init.h>

int main() {
  int argc = 0;
  char** argv = NULL;
  init_julia(argc, argv);

  printf("compile_time_value = %d\n", mwe_get_compile_time_value());
  printf("run_time_value = %d\n", mwe_get_run_time_value());

  mwe_print_paths();

  wololo();

  shutdown_julia(0);

  return 0;
}
