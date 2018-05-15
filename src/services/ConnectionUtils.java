package services;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionUtils {
    private static String user = "root";
    private static String password = "root";
    private static String url = "jdbc:mysql://localhost:3306/mylogin";
    public static Connection connect (){
        Connection connection = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(url,user,password);
        }catch (SQLException | ClassNotFoundException e){
            e.printStackTrace();
        }return connection;
    }
}
