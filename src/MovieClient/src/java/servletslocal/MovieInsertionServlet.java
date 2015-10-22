/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package servletslocal;

import servlets.Youtube.YoutubeInfo;
import servlets.Youtube.YoutubeSearch;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.json.JSONObject;
import javax.ws.rs.ClientErrorException;

/**
 *
 * @author Hugh
 */
@WebServlet(name = "MovieInsertionServlet", urlPatterns = {"/MovieInsertionServlet"})
public class MovieInsertionServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            response.setContentType("text/html;charset=UTF-8");
            boolean flag = false;
            DatainfoRetrive restClient = new DatainfoRetrive(); 
            JSONObject jo = new JSONObject();
            String moviename = request.getParameter("txt0").toUpperCase();
            if(!moviename.equalsIgnoreCase(""))
        try{
            jo.put("movieName", moviename);
            
            String director = request.getParameter("txt1");
            if(director.equalsIgnoreCase(""))
            {
                director = "Null";
            }
            jo.put("director", director);
            
            String stars = request.getParameter("txt3");
           if(stars.equalsIgnoreCase(""))
            {
                stars = "Null";
            }
            jo.put("stars", stars);
            
            String producer = request.getParameter("txt2");
            if(producer.equalsIgnoreCase(""))
            {
                producer = "Null";
            }
            jo.put("producer", producer);
            
            String writers = request.getParameter("txt4");
            if(writers.equalsIgnoreCase(""))
            {
                writers = "Null";
            }
            jo.put("writers", writers);
            
            String rating_string = request.getParameter("txt5");
            double rating_double = 0.0;
            try{
                rating_double = Double.parseDouble(rating_string);
            }catch(java.lang.NumberFormatException e){
                Logger.getLogger(MovieInsertionServlet.class.getName()).log(Level.SEVERE, null, e);
                rating_double = 0.0;                
            } 
            jo.put("rating", rating_double);
            
            String duartion_string = request.getParameter("txt8");
            int duartion_int = 0;
            try{ 
                duartion_int = Integer.parseInt(duartion_string);
            }catch(java.lang.NumberFormatException e){
                Logger.getLogger(MovieInsertionServlet.class.getName()).log(Level.SEVERE, null, e);
                duartion_int = 0;                
            } 
            jo.put("duration", duartion_int);
            
            String rank = request.getParameter("txt6");
            if(rank.equalsIgnoreCase(""))
            {
                rank = "Null";
            }
            jo.put("rank", rank); 
            
            String movieGenre = request.getParameter("txt7");
           if(movieGenre.equalsIgnoreCase(""))
            {
                movieGenre = "Null";
            }
            jo.put("movieGenre", movieGenre);

            String picuterURLString = request.getParameter("txt9");
            if(picuterURLString.equalsIgnoreCase("NO"))
            {
                YoutubeInfo[] VideoInfoList = YoutubeSearch.searchfeed(moviename);
                if(VideoInfoList.length==0)
                {
                    picuterURLString = "images/404.jpg";
                }
                else
                {
                    picuterURLString = VideoInfoList[0].getThumbnailURL();
                }
            }
            
            else if (picuterURLString.equalsIgnoreCase(""))
            {
                picuterURLString = "images/404.jpg";
            }
            jo.put("gamePictureURL", picuterURLString);
            
            try{
                restClient.create_JSON(jo.toString());
                flag = true;
            }catch (ClientErrorException e)
            {
                Logger.getLogger(MovieInsertionServlet.class.getName()).log(Level.SEVERE, null, e);
                flag = false;
            }
         }catch(Exception e)
         {
             Logger.getLogger(MovieInsertionServlet.class.getName()).log(Level.SEVERE, null, e);
             flag = false;
         }
            else
            {
                flag = false;
            }
        
        if(flag == true)
            response.sendRedirect("index.jsp");
        else
            response.sendRedirect("404.jsp");
        
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
