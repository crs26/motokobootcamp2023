import List "mo:base/List";
import Book "book";

actor {
  type Book = Book.Book;
  var bookList = List.nil<Book>();

  public func add_book(book : Book) : async () {
    bookList := List.push<Book>(book, bookList);
  };

  public func get_books() : async [Book] {
    return List.toArray(bookList);
  };
};
