#ifndef _CLICK_ELEMENT_HPP_
#define _CLICK_ELEMENT_HPP_

#include <vector>
#include <string>
#include <memory>
#include <unordered_map>
#include "element_type.hpp"

class OutputClass;

//Abstract representation of a Click element
class ClickElement {
	public:
		ClickElement (ElementType type, std::string& configuration);

		void set_child (std::shared_ptr<ClickElement> child, int port);

		bool is_leaf();

		//Getters & Setters
		static std::shared_ptr<ClickElement> get_discard_elem ();
		std::string get_configuration() const;
		int get_nbPorts() const;
		void set_nbPorts(int nbPorts);
		std::vector<OutputClass> get_outputClasses() const;
		ElementType get_type() const;

		std::string to_str() const;

	private:
		static std::shared_ptr<ClickElement> discard_elem_ptr;

		//Configuration string parsing functions:
		void parse_dec_ttl_conf (std::string& configuration);
		void parse_fix_ip_src (std::string& configuration);
		void parse_ip_filter (std::string& configuration);
		void parse_ip_classifier (std::string& configuration);
		void parse_lookup_filter (std::string& configuration);
		void parse_ip_rewriter (std::string& configuration);
		void parse_rr_ip_mapper (std::string& configuration);
		void parse_vlan_encap_configuration(std::string& configuration);
		void parse_vlan_decap_configuration(std::string& configuration);
		void parse_set_vlan_anno_configuration(std::string& configuration);

		void configuration_fail ();

		void add_output_class (OutputClass & output_class);

		ElementType m_type;
		std::string m_configuration; //FIXME: is this really necessary?
		int m_nbPorts; //Number of output ports
		std::vector<OutputClass> m_outputClasses;
};

#endif
