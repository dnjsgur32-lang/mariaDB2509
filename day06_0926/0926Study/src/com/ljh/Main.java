package com.ljh;

import com.ljh.conn.DBConnection;
import com.ljh.crud.CRUDClass;

public class Main {
    public static void main(String[] args) {
        var testConn = DBConnection.getConnection();
        if (testConn == null) {
            System.out.println("연결 실패. URL/계정 확인 필요");
            return;
        }
        System.out.println("메인에서 DB 연결 확인 완료!");
        try { testConn.close();
        } catch (Exception ignore)
        {
        }

        CRUDClass crud = new CRUDClass();

        crud.createTable();
        crud.insertUser("강감찬");
        crud.insertMany("임꺽정", "홍길동");
        crud.selectAll();

        crud.updateUserName(1, "홍길순");
        crud.deleteUser(1);
        crud.selectAll();
    }
}