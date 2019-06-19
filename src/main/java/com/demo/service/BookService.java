package com.demo.service;

import com.demo.dao.BookMapper;
import com.demo.entity.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookService {
    @Autowired
    BookMapper bookMapper;

    public void add(Book book){
        bookMapper.addbook(book);
    }

    public List<Book> findbook(Book book){
        return bookMapper.findbook(book);
    }

    public List<Book> findbookbyuser(Book book){
        return bookMapper.findbookbyuser(book);
    }

    public void deletebook(int num){
        bookMapper.deletebook(num);
    }

    public Book findbookbyid(int id){
        return bookMapper.findbookByid(id);
    }

    public void updatebook(Book book){
        bookMapper.updatebook(book);
    }

}
