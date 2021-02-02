package com.jhta.bonfire.util;

import java.lang.reflect.Array;
import java.util.List;
import java.util.Map;

public class CommonUtil {
    /**
     * Object type 변수가 비어있는지 체크
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

    public static Boolean isNotEmpty(Object obj) {return !isEmpty(obj);}

    /**
     * 주어진 모든 인자가 비어있지 않는지 체크 한다.
     * @param objects
     * @return
     */
    public static Boolean isAllNotEmpty(Object... objects) {
    	if(objects == null || objects.length == 0) {return false;}
    	for(Object obj : objects) {
            System.out.println((String) obj);
            System.out.println(objects.length);
    		if(isEmpty(obj)) {return false;}
    	}
    	return true;
    }

    /**
     * mapper용 비교
     * @param str
     * @param obj
     * @return
     */
    public static Boolean equals(Object obj1, Object obj2) {
        if( (obj1 instanceof String || obj1 instanceof Character) && (obj2 instanceof String || obj2 instanceof Character)) return obj1.equals(String.valueOf(obj2));
    	else if( obj1 instanceof Integer && obj2 instanceof Integer) {
    		return obj1.equals(obj2);
    	}
    	else if( obj1 == null || obj2 == null) return false;
    	return false;
    }
}
