package com.jsite.common.mapper;

import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.IOException;
import java.util.Map;

public class ObjMapper {
	
	@SuppressWarnings("rawtypes")
	public static Object getObjectFieldValue(Object obj,String field) throws IOException {
		ObjectMapper mapper = new ObjectMapper(); 
		String json= mapper.writeValueAsString(obj);
		Map  map =  mapper.readValue(json, Map.class);
		return map.get(field);
	}
}
