package kr.co.fribel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.co.fribel.service.EventService;
import kr.co.fribel.vo.Event;

@Controller
public class EventRestController {
	
	@Autowired
	private EventService eventService;
	
	@RequestMapping(value="/addEvent", method=RequestMethod.POST)
	public String addEvent(@RequestBody Event event){
		
		System.out.println(event);
		
		return null;
	}
}
