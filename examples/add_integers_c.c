#include "add_integers_c.h"

uint64_t f(uint64_t n) {
	uint64_t total = 0;
	for(uint64_t i=0; i!=n; ++i)
		total += i;
	return total;
}
