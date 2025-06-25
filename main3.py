class Book:
    def __init__(self, title, author, year):
        self.title = title
        self.author = author
        self.year = year
        self.is_borrowed = False

    def __str__(self):
        status = "Borrowed" if self.is_borrowed else "Available"
        return f"'{self.title}' by {self.author} ({status})"

class Library:
    def __init__(self):
        self.books = []

    def add_book(self, title, author):
        book = Book(title, author, 2024)  # Dummy year
        self.books.append(book)
        print(f"Book '{title}' by {author} added to the library.")

    def list_books(self):
        if not self.books:
            print("No books available in the library.")
            return
        print("Books in the library:")
        for idx, book in enumerate(self.books, 1):
            print(f"{idx}. {book}")

    def borrow_book(self, book_number):
        if 1 <= book_number <= len(self.books):
            book = self.books[book_number - 1]
            if not book.is_borrowed:
                book.is_borrowed = True
                print(f"You have borrowed '{book.title}'.")
            else:
                print(f"'{book.title}' is already borrowed.")
        else:
            print("Invalid book number.")

    def return_book(self, book_number):
        if 1 <= book_number <= len(self.books):
            book = self.books[book_number - 1]
            if book.is_borrowed:
                book.is_borrowed = False
                print(f"You have returned '{book.title}'.")
            else:
                print(f"'{book.title}' was not borrowed.")
        else:
            print("Invalid book number.")

    def search_books(self, keyword):
        found = False
        for idx, book in enumerate(self.books, 1):
            if keyword.lower() in book.title.lower() or keyword.lower() in book.author.lower():
                print(f"{idx}. {book}")
                found = True
        if not found:
            print("No books found matching your search.")

    def remove_book(self, book_number):
        if 1 <= book_number <= len(self.books):
            removed = self.books.pop(book_number - 1)
            print(f"Removed '{removed.title}' by {removed.author}")
        else:
            print("Invalid book number.")

def main():
    library = Library()
    initial_books = [
        ("The Lion", "John Backer"),
        ("Japan Train", "Nankito Tokoba"),
        ("Hiroshima Exploide", "Shin-Hauawtai"),
        ("Spider Man 3", "Leo Bakar & Nosiba Takai"),
        ("Spider Man 2", "Leos Fanci"),
    ]
    for title, author in initial_books:
        library.add_book(title, author)

    while True:
        print("\nLibrary Management System")
        print("1. Add Book")
        print("2. List Books")
        print("3. Borrow Book")
        print("4. Return Book")
        print("5. Search Books")
        print("6. Remove Book")
        print("7. Exit")
        choice = input("Enter your choice: ")

        if choice == "1":
            title = input("Enter book title: ")
            author = input("Enter author: ")
            library.add_book(title, author)
        elif choice == "2":
            library.list_books()
        elif choice == "3":
            library.list_books()
            try:
                book_number = int(input("Enter the number of the book to borrow: "))
                library.borrow_book(book_number)
            except ValueError:
                print("Invalid input.")
        elif choice == "4":
            library.list_books()
            try:
                book_number = int(input("Enter the number of the book to return: "))
                library.return_book(book_number)
            except ValueError:
                print("Invalid input.")
        elif choice == "5":
            keyword = input("Enter title or author to search: ")
            library.search_books(keyword)
        elif choice == "6":
            library.list_books()
            try:
                book_number = int(input("Enter the number of the book to remove: "))
                library.remove_book(book_number)
            except ValueError:
                print("Invalid input.")
        elif choice == "7":
            print("Exiting Library Management System.")
            break
        else:
            print("Invalid choice. Please try again.")

if __name__ == "__main__":
    main()
