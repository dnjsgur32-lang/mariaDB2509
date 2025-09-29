package com.ljh;

import com.ljh.dao.LibraryDAO;

public class Main {
   public static void main(String[] args) {
        LibraryDAO dao = new LibraryDAO();

       System.out.println("[Q1] 2020년 이후 출판 도서");
       dao.q1BooksAfter2020().forEach(System.out::println);

       System.out.println("\n[Q2] '홍길동' 대출 목록");
       dao.q2BorrowedBy("홍길동").forEach(System.out::println);

       System.out.println("\n[Q3] 미반납 도서");
       dao.q3Unreturned().forEach(System.out::println);

       System.out.println("\n[Q4] 도서별 대출 횟수");
       dao.q4BorrowCountByBook().forEach(System.out::println);

       System.out.println("\n[Q5] 최고가 도서");
       dao.q5MostExpensive().forEach(System.out::println);

       System.out.println("\n완료!");
    }
}
