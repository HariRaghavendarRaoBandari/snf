//============================================================================
// Name        : vertex.hpp
// Copyright   : KTH ICT CoS Network Systems Lab
// Description : Defines a simple graph vertex
//============================================================================

#ifndef _VERTEX_HPP_
#define _VERTEX_HPP_

#include <string>
#include <iostream>
#include "file.hpp"
#include "../logger.hpp"

class Vertex {
	private:
		/*
		 * A label for this vertex
		 */
		std::string name;
		/*
		 * The path of the NF implementation file of this node
		 */
		std::string source_code_path;

		/*
		 * The distance from the root (or the position in the chain)
		 */
		unsigned short position;

		/*
		 * A relative weight for this vertex
		 */
		unsigned short weight;

		/*
		 * A File object to handle the source code file of this vertex (NF)
		 */
		FileT<std::ifstream>* file_handler;

		/*
		 * Logger
		 */
		Logger log;

	public:
		Vertex(std::string name, std::string path, unsigned short pos, unsigned short weight = 1); //:
			//name(name), source_code_path(path), position(pos), weight(weight);
		virtual ~Vertex();

		/*
		 * Overload = for vertex operations
		 */
		Vertex& operator=(Vertex& v);

		/*
		 * Getters
		 */
		inline std::string           get_name(void)             { return this->name;             };
		inline std::string           get_source_code_path(void) { return this->source_code_path; };
		inline unsigned short        get_position(void)         { return this->position;         };
		inline unsigned short        get_weight(void)           { return this->weight;           };
		inline FileT<std::ifstream>* get_file_handler(void)     { return this->file_handler;     };

		/*
		 * Print status
		 */
		void print_info(void); /*{
			log << info << "===============================================" << def << std::endl;
			log << info << "===     NF Name: " << this->name                 << def << std::endl;
			log << info << "=== NF Position: " << this->position             << def << std::endl;
			log << info << "=== Source Code: " << this->source_code_path     << def << std::endl;
			log << info << "===============================================" << def << std::endl;
		}*/
};

#endif
