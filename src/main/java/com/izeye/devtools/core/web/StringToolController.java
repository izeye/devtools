package com.izeye.devtools.core.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by izeye on 15. 10. 23..
 */
@Controller
@RequestMapping(path = "/string")
public class StringToolController {
	
	@RequestMapping(path = "/compare", method = RequestMethod.GET)
	public String compare() {
		return "string/compare";
	}
	
	@RequestMapping(path = "/compare", method = RequestMethod.POST)
	@ResponseBody
	public String compare(@RequestParam String string1, @RequestParam String string2) {
		return string1.equals(string2) ? "Same." : "Different! Check your eyeballs :)";
	}
	
}
