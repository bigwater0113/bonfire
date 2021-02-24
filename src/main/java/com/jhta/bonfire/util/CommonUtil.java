package com.jhta.bonfire.util;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Array;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import com.jhta.bonfire.vo.LocalMapVo;
import com.jhta.bonfire.vo.TripPlanVo;
import com.jhta.bonfire.vo.geoJsonVo;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class CommonUtil {
    private static Logger logger = LoggerFactory.getLogger(CommonUtil.class);

    /**
     * Object type 변수가 비어있는지 체크
     * 
     * @param obj
     * @return Boolean : true / false
     */
    public static Boolean isEmpty(Object obj) {
        if (obj instanceof String)
            return obj == null || "".equals(obj.toString().trim());
        else if (obj instanceof List)
            return obj == null || ((List<?>) obj).isEmpty();
        else if (obj instanceof Map)
            return obj == null || ((Map<?, ?>) obj).isEmpty();
        else if (obj instanceof Object[])
            return obj == null || Array.getLength(obj) == 0;
        else
            return obj == null;
    }

    public static Boolean isNotEmpty(Object obj) {
        return !isEmpty(obj);
    }

    /**
     * 주어진 모든 인자가 비어있지 않는지 체크 한다.
     * 
     * @param objects
     * @return
     */
    public static Boolean isNotEmpty(Object... objects) {
        if (objects == null || objects.length == 0) {
            return false;
        }
        for (Object obj : objects) {
            if (isEmpty(obj)) {
                return false;
            }
        }
        return true;
    }

    /**
     * mapper용 비교
     * 
     * @param str
     * @param obj
     * @return
     */
    public static Boolean equals(Object obj1, Object obj2) {
        if ((obj1 instanceof String || obj1 instanceof Character)
                && (obj2 instanceof String || obj2 instanceof Character))
            return obj1.equals(String.valueOf(obj2));
        else if (obj1 instanceof Integer && obj2 instanceof Integer) {
            return obj1.equals(obj2);
        } else if (obj1 == null || obj2 == null)
            return false;
        return false;
    }

    public static String arrayToString(Object objects) {
        // if (objects.length==0) return null;
        StringBuilder sb = new StringBuilder();
        if (objects instanceof String[]) {
            for (Object string : (String[]) objects) {
                sb.append("field : " + string + "\n");
            }
            return (sb.length() == 0) ? null : sb.toString();
        } else
            return null;
    }

    /**
     * 
     * @param fileName
     * @param boardName
     * @return moved file path
     * @throws IOException
     */
    public static String changePath(ServletContext sc, String content, String boardName, String...fileName){
        if (isNotEmpty((Object[]) fileName)) {
            for (String file : fileName) {
                logger.info(sc.getRealPath("/resources/TemporalFileStorage"));
                Path source = Paths.get(sc.getRealPath("/resources/TemporalFileStorage"), file);
                Path target = Paths.get(sc.getRealPath("/resources/"),boardName, file);
                logger.info(source.toString());
                // logger.info(target.toString());
                File parent = target.getParent().toFile();
                if (!parent.isDirectory()) parent.mkdirs();
                try {
                    Files.move(source, target);
                } catch (IOException e) {
                    logger.error("filepathnotchanged", e);
                }
            }
            content = content.replaceAll("(<img src=\"/bonfire/resources/)(TemporalFileStorage)", "$1"+boardName);
        }
        return content;
    }

    public static geoJsonVo toGeoJSON(LocalMapVo vo){
        Map<String, Object> geometry = new HashMap<>();
        
        String type = vo.getType();
        
        List<Double> coordinates = new ArrayList<>();
        coordinates.add(vo.getGeometrycoordinateslng());
        coordinates.add(vo.getGeometrycoordinatesLat());
        geometry.put("type", vo.getGeometrytype());
        geometry.put("coordinates", coordinates);
        
        Map<String, Object> properties = new HashMap<>();
        properties.put("address_name",vo.getPropertiesaddress_name());
        properties.put("category_group_code",vo.getPropertiescategory_group_code());
        properties.put("category_group_name",vo.getPropertiescategory_group_name());
        properties.put("category_name",vo.getPropertiescategory_name());
        properties.put("distance",vo.getPropertiesdistance());
        properties.put("id",vo.getPropertiesid());
        properties.put("phone",vo.getPropertiesphone());
        properties.put("place_name",vo.getPropertiesplace_name());
        properties.put("place_url",vo.getPropertiesplace_url());
        properties.put("road_address_name",vo.getPropertiesroad_address_name());

        return new geoJsonVo(type, geometry, properties);
    }
    public static LocalMapVo fromGeoJSON(geoJsonVo vo){
        Map<String, Object> geometry = vo.getGeometry();
        Map<String, Object> properties = vo.getProperties();
        
        String type = vo.getType();
        String geometrytype=(String) geometry.get("geometrytype");
        double[] corrdinates = (double[]) geometry.get("coordinates");
        double geometrycoordinateslng = corrdinates[0];
        double geometrycoordinatesLat = corrdinates[1];
        String propertiesaddress_name = (String) properties.get("address_name");
        String propertiescategory_group_code = (String) properties.get("category_group_code");
        String propertiescategory_group_name = (String) properties.get("category_group_name");
        String propertiescategory_name = (String) properties.get("category_name");
        int propertiesdistance = (int) properties.get("distance");
        int propertiesid = (int) properties.get("id");
        String propertiesphone = (String) properties.get("phone");
        String propertiesplace_name = (String) properties.get("place_name");
        String propertiesplace_url = (String) properties.get("place_url");
        String propertiesroad_address_name = (String) properties.get("road_address_name");

        return new LocalMapVo(type, geometrytype, geometrycoordinateslng, geometrycoordinatesLat, propertiesaddress_name, propertiescategory_group_code, propertiescategory_group_name, propertiescategory_name, propertiesdistance, propertiesid, propertiesphone, propertiesplace_name, propertiesplace_url, propertiesroad_address_name);
    }
    
}
