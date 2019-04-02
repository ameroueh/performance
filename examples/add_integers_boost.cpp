#include "stdint.h"

#include <boost/python.hpp>
#include <boost/python/module.hpp>
#include <boost/python/def.hpp>

namespace p = boost::python;

uint64_t f(uint64_t n) {
	uint64_t total = 0;
	for(uint64_t i=0; i!=n; ++i)
		total += i;
	return total;
}

BOOST_PYTHON_MODULE(add_integers_boost) {
	p::def("f", f);
}
