package com.ctrl;

import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.Entities.ToDo;
import com.dao.TodoDao;

@Controller
public class contrl {

	@Autowired
	ServletContext context;
	
	@Autowired
	TodoDao todoDao;
	

	@RequestMapping("/home")
	public String home(Model m) {
		String str = "home";

		List<ToDo> list = this.todoDao.getAll();

		m.addAttribute("todos", list);

		m.addAttribute("page", str);

		return "home";
	}

	@RequestMapping("/add")
	public String addTodo(Model m) {
		ToDo t = new ToDo();
		m.addAttribute("page", "add");

		m.addAttribute("todo", t);
		return "home";
	}

	@RequestMapping(value = "/saveTodo", method = RequestMethod.POST)
	public String saveTodo(@ModelAttribute("todo") ToDo t, Model m) {
		t.setDateAdded(new Date());
		System.out.println(t);
//
//		List<ToDo> list = (List<ToDo>) context.getAttribute("list");

//		list.add(t);
		
		this.todoDao.save(t);
		
		m.addAttribute("Msg", "Successfully added");

		return "home";

	}
}
