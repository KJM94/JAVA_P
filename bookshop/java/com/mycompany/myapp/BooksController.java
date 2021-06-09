package com.mycompany.myapp;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.mycompany.helper.FileHelper;
import com.mycompany.mapper.BookMapper;
import com.mycompany.vo.Book;

@Controller
public class BooksController {
    @Autowired
    private BookMapper bookMapper;
    @RequestMapping(value = "/books", method = RequestMethod.GET)
    public String index(Model model) {
    	// 맵퍼로부터 리스트를 받아옴.
        List<Book> books = bookMapper.getList();
        
        // 모델을 통해 뷰페이지로 데이터를 전달
        model.addAttribute("books", books);
        return "books/index";
    }
    @RequestMapping(value = "/books/new", method = RequestMethod.GET)
    public String newBook() {
        return "books/new";
    }
    @RequestMapping(value = "/books", method = RequestMethod.POST)
    public String create(@ModelAttribute Book book, @RequestParam MultipartFile file, HttpServletRequest request) {
        String fileUrl = FileHelper.upload("/uploads", file, request);
        book.setImage(fileUrl);
        bookMapper.create(book);
        return "redirect:/books";
    }
    
    @RequestMapping(value = "/books/edit/{id}", method = RequestMethod.GET)
    public String edit(@PathVariable int id, Model model) {
    	 // id 값을 통해 데이터를 가져옴
        Book book = bookMapper.getBook(id);
        // 뷰 페이지로 데이터를 전달(key/value 형식)
        model.addAttribute("book", book);
        return "books/edit";
    }
    
    @RequestMapping(value = "/books/update", method = RequestMethod.POST)
    public String update(@ModelAttribute Book book) {
        bookMapper.update(book);
        return "redirect:/books";
    }
    
    @RequestMapping(value = "/books/delete/{id}", method = RequestMethod.GET)
    public String delete(@PathVariable int id) {
        bookMapper.delete(id);
        return "redirect:/books";
    }
    
}