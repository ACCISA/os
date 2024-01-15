#include "memory.h"
#include "print.h"
#include "debug.h"

static struct FreeMemRegion free_mem_region[50];

void init_memory(){
    int32_t count = *(int32_t*)0x9000;
    uint64_t total_mem = 0;
    struct E820 *mem_map = (struct E820*)0x9008;
    int free_region_count = 0;

    ASSERT(count <= 50);

    for(int_32_t i = 0; i < count; i++){
       if(mem_map[i].type == 1){
        free_mem_region[free_region_count].address = mem_map[i].address;
        freef
       } 
    }

}