package com.jhta.bonfire.util;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Array;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class CommonUtil {
    private static Logger logger = LoggerFactory.getLogger(CommonUtil.class);

    /**
     * Object type 蹂��닔媛� 鍮꾩뼱�엳�뒗吏� 泥댄겕
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
     * 二쇱뼱吏� 紐⑤뱺 �씤�옄媛� 鍮꾩뼱�엳吏� �븡�뒗吏� 泥댄겕 �븳�떎.
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
     * mapper�슜 鍮꾧탳
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
    
    
    public static Boolean pageBlock(String id,String feedId,String feedRole,HashMap<String, Object> map) {
    	if(id==null) {
			return true;
		}else {
			if(map!=null) {
				if(feedRole.equals("ROLE_ADMIN")) {
					return false;
				}else if(feedRole.equals("ROLE_MEMBER")) {
					if(id.equals(feedId) || id.equals("admin")) {
						return false;
					}else {
						return true;
					}
				}else if(feedRole.equals("ROLE_AUTHOR")) {
					return false;
				}else {
					return true;
				}
			}else {
				return true;
			}
		}
    }
}
