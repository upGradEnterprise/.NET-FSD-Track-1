-- DDL Operations (Creating Tables with Constraints)

-- Create Authors table
CREATE TABLE Authors (
    Author_ID NUMBER PRIMARY KEY,
    Author_Name VARCHAR2(100) NOT NULL
);

-- Create Books table
CREATE TABLE Books (
    Book_ID NUMBER PRIMARY KEY,
    Title VARCHAR2(200) NOT NULL,
    Author_ID NUMBER NOT NULL,
    ISBN VARCHAR2(13) UNIQUE NOT NULL,
    Publication_Year NUMBER(4) CHECK (Publication_Year > 1900),
    Available_Copies NUMBER DEFAULT 1 CHECK (Available_Copies >= 0),
    CONSTRAINT fk_author FOREIGN KEY (Author_ID) REFERENCES Authors(Author_ID) ON DELETE CASCADE
);

-- Create Members table
CREATE TABLE Members (
    Member_ID NUMBER PRIMARY KEY,
    Member_Name VARCHAR2(100) NOT NULL,
    Address VARCHAR2(200),
    Phone VARCHAR2(15) UNIQUE,
    Membership_Date DATE DEFAULT SYSDATE
);

-- Create Borrowings table
CREATE TABLE Borrowings (
    Borrowing_ID NUMBER PRIMARY KEY,
    Book_ID NUMBER NOT NULL,
    Member_ID NUMBER NOT NULL,
    Borrow_Date DATE DEFAULT SYSDATE,
    Due_Date DATE NOT NULL CHECK (Due_Date > Borrow_Date),
    Return_Date DATE,
    Fine NUMBER(10,2) DEFAULT 0 CHECK (Fine >= 0),
    CONSTRAINT fk_book FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID) ON DELETE CASCADE,
    CONSTRAINT fk_member FOREIGN KEY (Member_ID) REFERENCES Members(Member_ID) ON DELETE CASCADE
);

-- DML Operations (Insert, Update, Delete)

-- INSERT examples
INSERT INTO Authors (Author_ID, Author_Name) VALUES (1, 'J.K. Rowling');
INSERT INTO Authors (Author_ID, Author_Name) VALUES (2, 'J.R.R. Tolkien');

INSERT INTO Books (Book_ID, Title, Author_ID, ISBN, Publication_Year, Available_Copies)
VALUES (1, 'Harry Potter and the Sorcerer''s Stone', 1, '9780747532743', 1997, 5);
INSERT INTO Books (Book_ID, Title, Author_ID, ISBN, Publication_Year, Available_Copies)
VALUES (2, 'The Hobbit', 2, '9780261103344', 1937, 3);

INSERT INTO Members (Member_ID, Member_Name, Address, Phone)
VALUES (1, 'John Doe', '123 Main St, City', '123-456-7890');
INSERT INTO Members (Member_ID, Member_Name, Address, Phone)
VALUES (2, 'Jane Smith', '456 Elm St, Town', '987-654-3210');

INSERT INTO Borrowings (Borrowing_ID, Book_ID, Member_ID, Due_Date)
VALUES (1, 1, 1, SYSDATE + 14);
 