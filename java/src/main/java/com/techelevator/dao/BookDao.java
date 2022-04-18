package com.techelevator.dao;

import com.techelevator.model.Book;
import com.techelevator.model.LogReadingDTO;
import com.techelevator.model.UserBook;

import java.util.List;

public interface BookDao {

    Book createBook(Book book, Long readerId);

    Book getBookById(int id);

    List <UserBook> getBooksByUserId(Long userId);

    List <Book> getAllBooks();

    boolean createLogEntry(LogReadingDTO entry);

    List <LogReadingDTO> getUserBooks(long id);

    List <LogReadingDTO> getFamilyUserBooks(int id);

    List<Book> getBooksByFamilyId(String familyId);

}
