#ifndef SEGMENT_LIST_HPP
#define SEGMENT_LIST_HPP

#include <utility>
#include <memory>
#include <string>

typedef unsigned int uint32_t;

struct SegmentNode {
	uint32_t m_lowerLimit;
	uint32_t m_upperLimit;
	std::shared_ptr<SegmentNode> m_parent;
	std::shared_ptr<SegmentNode> m_child;
	
	SegmentNode (uint32_t lower, uint32_t upper);
};

class DisjointSegmentList {

public:
	DisjointSegmentList ();
	~DisjointSegmentList ();
	
	bool empty();
	
	bool contains (uint32_t value);
	
	void add_segment (uint32_t lower_limit, uint32_t upper_limit);
	void substract_segment (uint32_t lower_limit, uint32_t upper_limit);
	
	std::string to_str ();

private:
	std::shared_ptr<SegmentNode> m_head;
	static void update_relation(std::shared_ptr<SegmentNode> parent,
								std::shared_ptr<SegmentNode> child);
	static void reset_node(std::shared_ptr<SegmentNode> node);
	
	static void destroy_list(std::shared_ptr<SegmentNode> node);
};

#endif