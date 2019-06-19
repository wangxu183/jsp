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

    //添加书籍
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

    //根据传入进来的参数，使用模糊查询根据书籍的名字查询书籍
    @RequestMapping(value = "findbook",method = RequestMethod.POST)
    @ResponseBody
    public List<Book> findbook(@RequestBody Book book){
        return bookService.findbook(book);
    }

    //查询该用户添加的书籍
    @RequestMapping(value = "findbookbyuser",method = RequestMethod.POST)
    @ResponseBody
    public List<Book> find(@RequestBody Book book){
        List<Book> list= bookService.findbookbyuser(book);
        return list;
    }

    //根据书籍的ID删除该用户添加的书籍
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
    //根据书籍编号ID查询书籍
    @RequestMapping(value = "findbookByid",method = RequestMethod.POST)
    @ResponseBody
    public Book findbookByid(@RequestBody int num){
        Book book=bookService.findbookbyid(num);
        return bookService.findbookbyid(num);
    }

    //根据书籍的ID修改该用户添加的数据
    @RequestMapping(value = "updatebook",method = RequestMethod.PUT)
    @ResponseBody
    public int updatebook(@RequestBody Book book){
        bookService.updatebook(book);
        return 1;
    }
}
