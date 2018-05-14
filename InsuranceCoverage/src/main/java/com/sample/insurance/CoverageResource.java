/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sample.insurance;
import javax.ws.rs.core.Response;
import java.util.ArrayList;
import java.util.List;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Consumes;
import javax.ws.rs.Produces;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PUT;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.GenericEntity;
import javax.ws.rs.core.MediaType;

/**
 * REST Web Service
 *
 * @author Enriq
 */
@Path("/coverage")
public class CoverageResource {

    @Context
    private UriInfo context;

    /**
     * Creates a new instance of CoverageResource
     */
    public CoverageResource() {
    }

    /**
     * Retrieves representation of an instance of com.sample.insurance.CoverageResource
     * @return an instance of java.lang.String
     */
    @GET
    @Path("/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getCoverageById(@PathParam("id") Integer id) {
        CoverageDTO coverageDTO =  new CoverageDTO(2,"Coverage type2","Coverage description2","http://www.example.com/some-additional-page2.html","auto");
        return  Response.ok(coverageDTO)
                .header("Content-Type", "application/javascript;")
                .build();
    }

    /**
     * PUT method for updating or creating an instance of CoverageResource
     * @param content representation for the resource
     */
    @GET
   // @Path("/coverage/")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getCoverage(){
        List<CoverageDTO> coverageList = new ArrayList<>();
        coverageList.add(new CoverageDTO(1,"Vestibulum Vestibulum",content1,"http://www.example.com/some-additional-page.html","auto") );
        coverageList.add(new CoverageDTO(2,"Lorem ipsum dolor",content2,"http://www.example.com/some-additional-page2.html","auto") );
        coverageList.add(new CoverageDTO(3,"Nulla cursus orci sed type3",content3,"http://www.example.com/some-additional-page3.html","auto") );
        coverageList.add(new CoverageDTO(4,"Sed dapibus porta",content2,"http://www.example.com/some-additional-page4.html","auto") );
        coverageList.add(new CoverageDTO(5,"Maecenas vel vestibulum",content3,"http://www.example.com/some-additional-page5.html","auto") );
     GenericEntity<List<CoverageDTO>> list = new GenericEntity<List<CoverageDTO>>(coverageList) {
        };
        return  Response.ok(list)
                .header("Content-Type", "application/javascript;")
                .header("Access-Control-Allow-Origin", "*")
                .header("Access-Control-Allow-Headers", "origin, content-type, accept, authorization")
                .header("Access-Control-Allow-Credentials", "true")
                .header("Access-Control-Allow-Methods","GET, POST, PUT, DELETE, OPTIONS, HEAD")
                .build();
    }
    
    
    private static final String content1 ="Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.";
    private static final String  content2 ="Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui." ;    
    private static final String  content3 ="Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.";
}
