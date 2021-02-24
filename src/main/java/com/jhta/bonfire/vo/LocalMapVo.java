package com.jhta.bonfire.vo;

public class LocalMapVo {
    private String type;
    private String geometrytype;
    private double geometrycoordinateslng;
    private double geometrycoordinatesLat;
    private String propertiesaddress_name;
    private String propertiescategory_group_code;
    private String propertiescategory_group_name;
    private String propertiescategory_name;
    private int propertiesdistance;
    private int propertiesid;
    private String propertiesphone;
    private String propertiesplace_name;
    private String propertiesplace_url;
    private String propertiesroad_address_name;


    public String getType() {
        return this.type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getGeometrytype() {
        return this.geometrytype;
    }

    public void setGeometrytype(String geometrytype) {
        this.geometrytype = geometrytype;
    }

    public double getGeometrycoordinateslng() {
        return this.geometrycoordinateslng;
    }

    public void setGeometrycoordinateslng(double geometrycoordinateslng) {
        this.geometrycoordinateslng = geometrycoordinateslng;
    }

    public double getGeometrycoordinatesLat() {
        return this.geometrycoordinatesLat;
    }

    public void setGeometrycoordinatesLat(double geometrycoordinatesLat) {
        this.geometrycoordinatesLat = geometrycoordinatesLat;
    }

    public String getPropertiesaddress_name() {
        return this.propertiesaddress_name;
    }

    public void setPropertiesaddress_name(String propertiesaddress_name) {
        this.propertiesaddress_name = propertiesaddress_name;
    }

    public String getPropertiescategory_group_code() {
        return this.propertiescategory_group_code;
    }

    public void setPropertiescategory_group_code(String propertiescategory_group_code) {
        this.propertiescategory_group_code = propertiescategory_group_code;
    }

    public String getPropertiescategory_group_name() {
        return this.propertiescategory_group_name;
    }

    public void setPropertiescategory_group_name(String propertiescategory_group_name) {
        this.propertiescategory_group_name = propertiescategory_group_name;
    }

    public String getPropertiescategory_name() {
        return this.propertiescategory_name;
    }

    public void setPropertiescategory_name(String propertiescategory_name) {
        this.propertiescategory_name = propertiescategory_name;
    }

    public int getPropertiesdistance() {
        return this.propertiesdistance;
    }

    public void setPropertiesdistance(int propertiesdistance) {
        this.propertiesdistance = propertiesdistance;
    }

    public int getPropertiesid() {
        return this.propertiesid;
    }

    public void setPropertiesid(int propertiesid) {
        this.propertiesid = propertiesid;
    }

    public String getPropertiesphone() {
        return this.propertiesphone;
    }

    public void setPropertiesphone(String propertiesphone) {
        this.propertiesphone = propertiesphone;
    }

    public String getPropertiesplace_name() {
        return this.propertiesplace_name;
    }

    public void setPropertiesplace_name(String propertiesplace_name) {
        this.propertiesplace_name = propertiesplace_name;
    }

    public String getPropertiesplace_url() {
        return this.propertiesplace_url;
    }

    public void setPropertiesplace_url(String propertiesplace_url) {
        this.propertiesplace_url = propertiesplace_url;
    }

    public String getPropertiesroad_address_name() {
        return this.propertiesroad_address_name;
    }

    public void setPropertiesroad_address_name(String propertiesroad_address_name) {
        this.propertiesroad_address_name = propertiesroad_address_name;
    }

    public LocalMapVo(String type, String geometrytype, double geometrycoordinateslng, double geometrycoordinatesLat, String propertiesaddress_name, String propertiescategory_group_code, String propertiescategory_group_name, String propertiescategory_name, int propertiesdistance, int propertiesid, String propertiesphone, String propertiesplace_name, String propertiesplace_url, String propertiesroad_address_name) {
        this.type = type;
        this.geometrytype = geometrytype;
        this.geometrycoordinateslng = geometrycoordinateslng;
        this.geometrycoordinatesLat = geometrycoordinatesLat;
        this.propertiesaddress_name = propertiesaddress_name;
        this.propertiescategory_group_code = propertiescategory_group_code;
        this.propertiescategory_group_name = propertiescategory_group_name;
        this.propertiescategory_name = propertiescategory_name;
        this.propertiesdistance = propertiesdistance;
        this.propertiesid = propertiesid;
        this.propertiesphone = propertiesphone;
        this.propertiesplace_name = propertiesplace_name;
        this.propertiesplace_url = propertiesplace_url;
        this.propertiesroad_address_name = propertiesroad_address_name;
    }

    public LocalMapVo() {
    }
    
}
