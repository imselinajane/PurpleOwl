package controller;

import exceptions.AuthenticationException;
import exceptions.NullValueException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class addItemServlet extends HttpServlet {

    Connection con;

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
        ServletContext sc = getServletContext();
        HttpSession session = request.getSession();
        String type = "";
        try {
            if (con != null) {
                String select = (String) session.getAttribute("buttonType");
                System.out.println(select);
                switch (select) {
                    case "Add Package": {
                        type = "Package";
                        String name = request.getParameter("name");
                        String pic1 = request.getParameter("pic1"); //this is required
                        String pic2 = request.getParameter("pic2");
                        String pic3 = request.getParameter("pic3");
                        String inclusions = request.getParameter("inclusions"); //required
                        int price = Integer.parseInt(request.getParameter("price"));

                        if (name.isEmpty()) {
                            sc.setAttribute("errorMessage", "Package name field is empty!");
                            throw new NullValueException();
                        } else if (pic1.isEmpty()) {
                            sc.setAttribute("errorMessage", "At least 1 image to be uploaded!");
                            throw new NullValueException();
                        } else if (inclusions.isEmpty()) {
                            sc.setAttribute("errorMessage", "Inclusions field is empty! Add a description for your package!");
                            throw new NullValueException();
                        } else if (price == 0) {
                            sc.setAttribute("errorMessage", "Please set a price for the package!");
                            throw new NullValueException();
                        }

                        PreparedStatement pStmt = con.prepareStatement("SELECT NAME FROM ITEMDB");
                        ResultSet rs = pStmt.executeQuery();
                        while (rs.next()) {
                            if (name.equals(rs.getString("NAME"))) { //check if email exists
                                sc.setAttribute("errorMessage", "That package name is already taken! Please use a different name!");
                                throw new AuthenticationException();
                            }
                        }
                        pStmt.close();

                        PreparedStatement st = con.prepareStatement("INSERT INTO ITEMDB (TYPE, NAME, IMAGE1, IMAGE2, IMAGE3,"
                                + "INCLUSIONS, PRICE) VALUES (?, ?, ?, ?, ?, ?, ?)");
                        st.setString(1, type);
                        st.setString(2, name);
                        st.setString(3, pic1);
                        if (pic2.isEmpty()) {
                            st.setString(4, "No link provided");
                        } else {
                            st.setString(4, pic2);
                        }
                        if (pic3.isEmpty()) {
                            st.setString(5, "No link provided");
                        } else {
                            st.setString(5, pic3);
                        }
                        st.setString(6, inclusions);
                        st.setInt(7, price);

                        st.executeUpdate();
                        st.close();
                        rs.close();
                        break;
                    }
                    case "Add Menu": {
                        type = "Menu";
                        String name = request.getParameter("name");
                        String pic = request.getParameter("pic"); //this is required
                        String inclusions = request.getParameter("inclusions"); //required
                        int price = Integer.parseInt(request.getParameter("price")); //pwede maging 0 i guess

                        if (name.isEmpty()) {
                            sc.setAttribute("errorMessage", "Menu name field is empty!");
                            throw new NullValueException();
                        } else if (pic.isEmpty()) {
                            sc.setAttribute("errorMessage", "At least 1 image to be uploaded!");
                            throw new NullValueException();
                        } else if (inclusions.isEmpty()) {
                            sc.setAttribute("errorMessage", "Inclusions field is empty! Add a description for your package!");
                            throw new NullValueException();
                        } else if (price == 0) {
                            sc.setAttribute("errorMessage", "Please set a price for the menu item!");
                            throw new NullValueException();
                        }

                        PreparedStatement pStmt = con.prepareStatement("SELECT NAME FROM ITEMDB");
                        ResultSet rs = pStmt.executeQuery();
                        while (rs.next()) {
                            if (name.equals(rs.getString("NAME"))) { //check if email exists
                                sc.setAttribute("errorMessage", "That menu name is already taken! Please use a different name!");
                                throw new AuthenticationException();
                            }
                        }
                        pStmt.close();

                        PreparedStatement st = con.prepareStatement("INSERT INTO ITEMDB (TYPE, NAME, IMAGE1,"
                                + "INCLUSIONS, PRICE) VALUES (?, ?, ?, ?, ?)");
                        st.setString(1, type);
                        st.setString(2, name);
                        st.setString(3, pic);
                        st.setString(4, inclusions);
                        st.setInt(5, price);

                        st.executeUpdate();
                        st.close();
                        rs.close();
                        break;
                    }

                    case "Add Add-On": {
                        type = "Add-On";

                        String name = request.getParameter("name");
                        String pic = request.getParameter("pic"); //this is required
                        String inclusions = request.getParameter("inclusions"); //required
                        int price = Integer.parseInt(request.getParameter("price")); //pwede maging 0 i guess

                        if (name.isEmpty()) {
                            sc.setAttribute("errorMessage", "Add-On name field is empty!");
                            throw new NullValueException();
                        } else if (pic.isEmpty()) {
                            sc.setAttribute("errorMessage", "At least 1 image to be uploaded!");
                            throw new NullValueException();
                        } else if (price == 0) {
                            sc.setAttribute("errorMessage", "Please set a price for the add-on!");
                            throw new NullValueException();
                        }

                        PreparedStatement pStmt = con.prepareStatement("SELECT NAME FROM ITEMDB");
                        ResultSet rs = pStmt.executeQuery();
                        while (rs.next()) {
                            if (name.equals(rs.getString("NAME"))) { //check if email exists
                                sc.setAttribute("errorMessage", "That add-on name is already taken! Please use a different name!");
                                throw new AuthenticationException();
                            }
                        }
                        pStmt.close();

                        PreparedStatement st = con.prepareStatement("INSERT INTO ITEMDB (TYPE, NAME, IMAGE1,"
                                + "INCLUSIONS, PRICE) VALUES (?, ?, ?, ?, ?)");
                        st.setString(1, type);
                        st.setString(2, name);
                        st.setString(3, pic);
                        st.setString(4, inclusions);
                        st.setInt(5, price);

                        st.executeUpdate();
                        st.close();
                        rs.close();
                        break;
                    }
                }

                response.sendRedirect("foodPackages.jsp");
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } catch (SQLException sqle) {
            sc.setAttribute("errorMessage", "SQL Exception occurred!");
            sqle.printStackTrace();
            response.sendRedirect("errorPage.jsp");
        } catch (AuthenticationException aue) {
            aue.printStackTrace();
            response.sendRedirect("errorPage.jsp");
        } catch (NullValueException nve) {
            nve.printStackTrace();
            response.sendRedirect("errorPage.jsp");
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
