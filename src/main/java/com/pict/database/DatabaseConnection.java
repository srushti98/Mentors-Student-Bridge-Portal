package com.pict.database;

import com.sun.istack.internal.NotNull;

import java.io.IOException;
import java.sql.*;

public class DatabaseConnection {
    private static Connection databaseConnection;

    public static Connection getDatabaseConnection() {
        try {
            if(databaseConnection == null) {
/*
                Properties prop = new Properties();
                InputStream inputStream = DatabaseConnection.class.getResourceAsStream("messages.properties");
                prop.load(inputStream);
                String driver = prop.getProperty("driver");
*/

                String url = "jdbc:mysql://localhost:3306/mentorsys";
                String userName = "root";
                String password = "root@123";
                Class.forName("com.mysql.jdbc.Driver");
                databaseConnection = DriverManager.getConnection(url, userName, password);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return databaseConnection;
    }

    public static PreparedStatement getPreparedStatement(String sql) throws IOException {
        Connection connection = getDatabaseConnection();
        try {
            if (connection != null) {
                return connection.prepareStatement(sql);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static Statement getStatement() throws IOException {

        Connection connection = getDatabaseConnection();
        try {
            if (connection != null) {
                return connection.createStatement();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static ResultSet getResultSet(@NotNull String sql) throws SQLException, IOException {
        try {
            return getStatement().executeQuery(sql);
        } catch (NullPointerException e) {
            e.printStackTrace();
        }
        return null;
    }



}