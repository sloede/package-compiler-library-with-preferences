#include <stdio.h>

#include <mwe.h>
#include <julia_init.h>
#include <init.h>
#include <mpi.h>

int main(int argc, char* argv[]) {
  printf("[EXT] init MPI\n");
  MPI_Init(&argc, &argv);


  printf("\n");
  printf("[EXT] init Julia\n");
  int _argc = 0;
  char** _argv = NULL;
  init_julia(_argc, _argv);

  printf("\n");
  printf("[EXT] MPI info from Julia\n");
  mwe_eval_string("using MPI");
  mwe_eval_string("MPI.versioninfo()");
  mwe_eval_string("@show MPI.Initialized()");

  printf("\n");
  printf("[EXT] MPI_COMM_WORLD\n");
  printf("MPI_COMM_WORLD (C): %p\n", MPI_COMM_WORLD);
  mwe_eval_string("println(\"MPI_COMM_WORLD (J): 0x\", string(UInt(MPI.COMM_WORLD.val), base = 16))");

  printf("\n");
  printf("[EXT] MPI_Comm_size:\n");
  int nranks;
  MPI_Comm_size(MPI_COMM_WORLD, &nranks);
  printf("nranks (C): %d\n", nranks);
  mwe_eval_string("println(\"nranks (J): \", MPI.Comm_size(MPI.COMM_WORLD))");

  printf("\n");
  printf("[EXT] finalize Julia\n");
  shutdown_julia(0);

  printf("\n");
  printf("[EXT] finalize MPI\n");
  MPI_Finalize();

  return 0;
}
