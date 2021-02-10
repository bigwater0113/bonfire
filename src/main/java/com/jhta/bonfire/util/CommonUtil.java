package com.jhta.bonfire.util;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Array;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

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

    // public static String changeContext(String content, String boardName) {
    //     return content.replaceAll("(<img src=\"/bonfire/resources/)(TemporalFileStorage)", "$1"+boardName);
    // }
}
