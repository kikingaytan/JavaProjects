/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sample.insurance;

import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Enriq
 */
//@XmlRootElement
public class CoverageDTO {


    
    private Integer id;
    private String coverage;
    private String description;

    private String link;
    private String type;
    
    public CoverageDTO(Integer id, String coverage, String description, String link, String type) {
        this.id = id;
        this.coverage = coverage;
        this.description = description;
        this.link = link;
        this.type = type;
    }
    /**
     * @return the id
     */
    public Integer getId() {
        return id;
    }
    
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
    /**
     * @param id the id to set
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * @return the coverage
     */
    public String getCoverage() {
        return coverage;
    }

    /**
     * @param coverage the coverage to set
     */
    public void setCoverage(String coverage) {
        this.coverage = coverage;
    }

    /**
     * @return the link
     */
    public String getLink() {
        return link;
    }

    /**
     * @param link the link to set
     */
    public void setLink(String link) {
        this.link = link;
    }

    /**
     * @return the type
     */
    public String getType() {
        return type;
    }

    /**
     * @param type the type to set
     */
    public void setType(String type) {
        this.type = type;
    }

}
