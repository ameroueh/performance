#include "stdint.h"

#include <boost/python.hpp>
#include <boost/python/module.hpp>
#include <boost/python/def.hpp>

class Accumulator {
	public:
		Accumulator(): m_total(0) {}
		void add(uint64_t increment) { m_total += increment; }
		uint64_t getTotal() const {return m_total;}
	private:
		uint64_t m_total;
};

BOOST_PYTHON_MODULE(accumulator_boost) {
	boost::python::class_<Accumulator>("Accumulator", boost::python::init<>())
	.add_property("total", &Accumulator::getTotal)
	.def("add", &Accumulator::add);
}
