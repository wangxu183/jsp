package com.demo.controller;

import com.demo.entity.Book;
import com.demo.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("book")
public class BookController {
    @Autowired
    BookService bookService;

    @RequestMapping(value = "add",method = RequestMethod.PUT)
    @ResponseBody
    public int add(@RequestBody Book book){
        int i=0;
        if (book.getUsername()!=null){
            bookService.add(book);
            i=1;
        }
        return i;
    }
    @RequestMapping(value = "findbook",method = RequestMethod.POST)
    @ResponseBody
    public List<Book> findbook(@RequestBody Book book){
        return bookService.findbook(book);
    }

    @RequestMapping(value = "findbookbyuser",method = RequestMethod.POST)
    @ResponseBody
    public List<Book> find(@RequestBody Book book){
        List<Book> list= bookService.findbookbyuser(book);
        return list;
    }

    @RequestMapping(value = "delbook",method = RequestMethod.DELETE)
    @ResponseBody
    public int deletebook(@RequestBody int num){
        int i=0;
        if(num>0){
            bookService.deletebook(num);
            i=1;
        }
        return i;
    }
    @RequestMapping(value = "findbookByid",method = RequestMethod.POST)
    @ResponseBody
    public Book findbookByid(@RequestBody int num){
        Book book=bookService.findbookbyid(num);
        return bookService.findbookbyid(num);
    }

    @RequestMapping(value = "updatebook",method = RequestMethod.PUT)
    @ResponseBody
    public int updatebook(@RequestBody Book book){
        bookService.updatebook(book);
        return 1;
    }
}
