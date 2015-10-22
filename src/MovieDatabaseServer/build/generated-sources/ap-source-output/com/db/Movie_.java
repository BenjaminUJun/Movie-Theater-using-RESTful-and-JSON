package com.db;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2015-08-17T11:24:11")
@StaticMetamodel(Movie.class)
public class Movie_ { 

    public static volatile SingularAttribute<Movie, Integer> id;
    public static volatile SingularAttribute<Movie, String> movieName;
    public static volatile SingularAttribute<Movie, String> rank;
    public static volatile SingularAttribute<Movie, Integer> duration;
    public static volatile SingularAttribute<Movie, String> stars;
    public static volatile SingularAttribute<Movie, String> producer;
    public static volatile SingularAttribute<Movie, String> writers;
    public static volatile SingularAttribute<Movie, Double> rating;
    public static volatile SingularAttribute<Movie, String> director;
    public static volatile SingularAttribute<Movie, String> movieGenre;
    public static volatile SingularAttribute<Movie, String> gamePictureURL;

}