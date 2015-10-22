/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.service;

import com.db.Movie;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

/**
 *
 * @author Hugh
 */
@Stateless
@Path("com.db.movie")
public class MovieFacadeREST extends AbstractFacade<Movie> {
    @PersistenceContext(unitName = "MovieDatabaseServerPU")
    private EntityManager em;

    public MovieFacadeREST() {
        super(Movie.class);
    }

    @POST
    @Override
    @Consumes({"application/xml", "application/json"})
    public void create(Movie entity) {
        super.create(entity);
    }

    @PUT
    @Path("{id}")
    @Consumes({"application/xml", "application/json"})
    public void edit(@PathParam("id") Integer id, Movie entity) {
        super.edit(entity);
    }

    @DELETE
    @Path("{id}")
    public void remove(@PathParam("id") Integer id) {
        super.remove(super.find(id));
    }
    
    @GET
    @Path("{movieName}")
    @Produces({"application/xml","application/json"})
    public Movie find(@PathParam("movieName") String movieName){
        int index = -1;
        Movie movieInstance = new Movie();
        List movielist = null;
        try{
            movielist = super.findAll();
            for(int i=0;i<movielist.size();i++)
            {
                movieInstance = (Movie)movielist.get(i);
                if(movieInstance.getMovieName().contains(movieName))
                {   
                    index = i;
                    break;
                }
            }
        }catch(Exception e){
            System.out.println("Some errors occur in database!");
            index = -2;
        }
        if(index == -1)
            return super.find(1);
        else if(index == -2)
            return null;
        else 
        {   
           movieInstance = (Movie)movielist.get(index);
           return super.find(movieInstance.getId());
        }
    }

    @GET
    @Override
    @Produces({"application/xml", "application/json"})
    public List<Movie> findAll() {
        return super.findAll();
    }

    @GET
    @Path("{from}/{to}")
    @Produces({"application/xml", "application/json"})
    public List<Movie> findRange(@PathParam("from") Integer from, @PathParam("to") Integer to) {
        return super.findRange(new int[]{from, to});
    }

    @GET
    @Path("count")
    @Produces("text/plain")
    public String countREST() {
        return String.valueOf(super.count());
    }

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }
    
}
