package utill;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	
    public static Connection getConnection() {
        try {
            //1. 드라이버 로딩
        	Class.forName("oracle.jdbc.driver.OracleDriver");
            // 2) Connection 객체 생성
            String url ="jdbc:oracle:thin:@172.30.1.26:1521:xe";
   
            
            return DriverManager.getConnection(url,"system","Oracle");
        } catch (Exception e) {
            System.out.println("OracleDB connect 실패 >" + e.toString());
            return null;
        }

    }
   }

