#ifndef _CLICK_TREE_HPP_
#define _CLICK_TREE_HPP_

#include <memory>

#include "filter.hpp"

class ClickElement;

//Overlay of Element to make it a node
struct ClickNode {
	std::shared_ptr<ClickElement> element;
	TrafficClass traffic_class;
};

class ClickTree {
	public:
		ClickTree (std::shared_ptr<ClickElement> root) ;
		std::vector<TrafficClass> get_trafficClasses() const;

	private:
		ClickNode m_root;
		std::vector<TrafficClass> m_trafficClasses;

		void find_classes(void); //Graph search from m_root
};
#endif
