package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "adminUpdate", urlPatterns = {"/updateDB.do"})
public class adminUpdate extends HttpServlet {

    Connection con;
    DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
    Date todayDate = new Date();
    Date inputDate = null;

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        try {
            //Register driver
            Class.forName(config.getInitParameter("jdbcClassName"));
            System.out.println("Loaded driver.");

            //Use String buffer for connection
            StringBuffer buff = new StringBuffer(config.getInitParameter("jdbcDriverURL"))
                    .append("://").append(config.getInitParameter("dbHostName"))
                    .append(":").append(config.getInitParameter("dbPort"))
                    .append("/").append(config.getInitParameter("databaseName"));
            //jdbc:derby://localhost:1527/PurpleOwlAdminDB

            //Establish connection
            con = DriverManager.getConnection(buff.toString(),
                    config.getInitParameter("dbUserName"), config.getInitParameter("dbPassword"));
            System.out.println("You are now connected.");

        } catch (SQLException sql) {
            System.out.println("SQL Exception occurred.");
            sql.printStackTrace();
        } catch (ClassNotFoundException cnfe) {
            System.out.println("Class not found Exception occurred.");
            cnfe.printStackTrace();
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        ServletContext sc = getServletContext();
        try {
            int userid = Integer.parseInt(request.getParameter("userid"));
            String name = request.getParameter("name");
            String date = request.getParameter("datetime");
            try {
                inputDate = (Date) sdf.parse(date);
            } catch (ParseException pe) {
                pe.printStackTrace();
            }

            String occasion = request.getParameter("occasion");
            int headcount = Integer.parseInt(request.getParameter("headcount"));
            String contact = request.getParameter("number");
            String packages = request.getParameter("package");
            String menu = request.getParameter("menu");
            String venue = request.getParameter("venue");
            String chkBox[] = request.getParameterValues("addOnsChkbox");
            String requests = request.getParameter("requestText");
            String theme = request.getParameter("theme");
            String url = request.getParameter("url");
            String message = request.getParameter("message");
            String message2 = request.getParameter("message2");
            String placeholder = "No add-ons selected.";
            List<String> addOns = new ArrayList<>();

            if (chkBox == null) {
                addOns.add(placeholder);
            } else {
                for (String item : chkBox) {
                    addOns.add(item);
                }
            }

            //checks if fields are empty
            if (name.isEmpty()) {
                sc.setAttribute("errorMessage", "Name field is empty!");
                throw new SQLException();
            } else if (date.isEmpty()) {
                sc.setAttribute("errorMessage", "Date field is empty!");
                throw new SQLException();
            } else if (occasion.isEmpty()) {
                sc.setAttribute("errorMessage", "Occasion field is empty!");
                throw new SQLException();
            } else if (headcount == 0) {
                sc.setAttribute("errorMessage", "Unallowed headcount of 0!");
                throw new SQLException();
            } else if (contact.isEmpty()) {
                sc.setAttribute("errorMessage", "Contact number field is empty!");
                throw new SQLException();
            } else if (packages.isEmpty()) {
                sc.setAttribute("errorMessage", "No package selected!");
                throw new SQLException();
            } else if (menu.isEmpty()) {
                sc.setAttribute("errorMessage", "No menu selected!");
                throw new SQLException();
            }
            System.out.println(userid);

            //separate if check if date is before today, you can't time travel bro
            if (todayDate.after(inputDate)) {
                sc.setAttribute("errorMessage", "Date entered is before today! Please enter a valid date!");
                throw new SQLException();
            }

            PreparedStatement pStmt = con.prepareStatement("UPDATE ORDERSDB SET NAME = ?, DATEANDTIME = ?, "
                    + "OCCASION = ?, HEADCOUNT = ?, CONTACTNUMBER = ?,"
                    + "PACKAGE = ?, MENU = ?, VENUE = ?, ADDONS = ?, REQUESTS = ?, THEME = ?, GDRIVE = ?, QUOTES1 = ?, QUOTES2 = ?"
                    + "WHERE USERID = ?");
            
            pStmt.setString(1, name);
            pStmt.setTimestamp(2, new Timestamp(inputDate.getTime()));
            pStmt.setString(3, occasion);
            pStmt.setInt(4, headcount);
            pStmt.setString(5, contact);
            pStmt.setString(6, packages);
            pStmt.setString(7, menu);
            pStmt.setString(8, venue);
            pStmt.setString(9, addOns.toString());
            pStmt.setString(10, requests);
            pStmt.setString(11, theme);
            pStmt.setString(12, url);
            pStmt.setString(13, message);
            pStmt.setString(14, message2);
            pStmt.setInt(15, userid);

            pStmt.executeUpdate();
            pStmt.close();
            response.sendRedirect("Homepage.jsp");
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
