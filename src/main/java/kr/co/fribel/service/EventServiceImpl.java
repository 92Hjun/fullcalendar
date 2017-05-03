package kr.co.fribel.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.fribel.vo.Event;

@Service
public class EventServiceImpl implements EventService{
	
	@Autowired
	private EventService eventService;
	
	
	public void addEvent(Event event){
		
		eventService.addEvent(event);
		
	}
}
