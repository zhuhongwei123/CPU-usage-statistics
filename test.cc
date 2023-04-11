#include <pthread.h>
#include <sys/syscall.h>
#include <unistd.h>
#include <iostream>

void* thread(void*) {
  pid_t tid = syscall(SYS_gettid);
  std::cout << tid << std::endl;
  while (1) {
	sleep(5);
	for(int i = 0; i < 100000; i++){
		for(int j = 0; j < 100000; j++){

		}
	}
  }
  return NULL;
}

int main() {
  pthread_t tid;
  pthread_create(&tid, NULL, thread, NULL);
  while (1) {
  }
  pthread_join(tid, NULL);
  return 0;
}
