#ifndef OUTPUT_PORT_HPP
#define OUTPUT_PORT_HPP

#include "filter.hpp"
#include "click_element.hpp"
#include "headerFields.hpp"

class OutputPort {
public:
	int m_portNumber;
	ClickElement* m_child;
	Operation m_operation;
	PacketFilter m_filter;
	
	//Constructor
	OutputPort(int port_nb);
	
	static OutputPort port_from_filter_rule(int port_nb, std::string& rule);
	static OutputPort port_from_lookup_rule(std::string& rule);
	
	void add_filter (HeaderField field, Filter& filter);
	void add_field_op (const FieldOperation & field_op);
	
	//Getters & setters
	void set_operation (const Operation & op);
	void set_child (ClickElement * child);
};

#endif