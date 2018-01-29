/*
 * Copyright 2010 McKesson Corporation and/or one of its subsidiaries.
 * All Rights Reserved.
 *
 * Use of this material is governed by a license agreement. This material
 * contains confidential, proprietary and trade secret information of
 * McKesson Corporation and is protected under United States and
 * international copyright and other intellectual property laws. Use,
 * disclosure, reproduction, modification, distribution, or storage
 * in a retrieval system in any form or by any means is prohibited without
 * the prior express written permission of McKesson Corporation.
 */
package nodos.utils;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import net.sf.json.JSON;
//import net.sf.json.JSONSerializer;
//import net.sf.json.JsonConfig;
//
//import org.apache.commons.beanutils.PropertyUtils;
//import org.apache.commons.lang.StringUtils;
//import org.apache.commons.lang.time.DateUtils;
//import org.apache.commons.logging.Log;
//import org.apache.commons.logging.LogFactory;
//import org.json.JSONArray;
//import org.json.JSONException;
//import org.json.JSONObject;
//import org.springframework.validation.Errors;
//
//import flexjson.JSONDeserializer;

/**
 * The Class WebUtils.
 */
public final class WebUtils {

    /** The Constant LOGGER. */
//    private static final Log LOGGER = LogFactory.getLog(WebUtils.class);
    // /** The default_format. */
    // private static SimpleDateFormat default_format = new SimpleDateFormat("MM/dd/yyyy HH:mm");
    //
    // /** The default_dateonly_format. */
    // private static SimpleDateFormat default_dateonly_format = new SimpleDateFormat("MM/dd/yyyy");

    /** The Constant DEFAULT_JSON_CONTENT_TYPE. */
    private static final String DEFAULT_JSON_CONTENT_TYPE = "text/plain; charset=ISO-8859-1";

    /** The Constant DEFAULT_XML_CONTENT_TYPE. */
    private static final String DEFAULT_XML_CONTENT_TYPE = "text/html; charset=utf-8";

    /** The Constant TIME_FORMAT. */
    private static final String TIME_FORMAT = "yyyy-MM-dd'T'HH:mm:ss";

    /**
     * Formatter to convert between json dates and java dates.
     */
    public static final String FORMATTER = "yyyy-MM-dd'T'HH:mm:ss";

    /**
     * Instantiates a new web utils.
     */
    private WebUtils() {
    }

    /**
     * Write json response.
     * 
     * @param response
     *            the response
     * @param retVal
     *            the ret val
     * 
     * @throws IOException
     *             Signals that an I/O exception has occurred.
     */
//    public static void writeJSONResponse(HttpServletResponse response, JSONObject retVal)
//    throws IOException {
//        writeJSONResponse(response, retVal.toString());
//    }

    /**
     * Write json response.
     * 
     * @param response
     *            the response
     * @param retVal
     *            the ret val
     * 
     * @throws IOException
     *             Signals that an I/O exception has occurred.
     */
    public static void writeJSONResponse(HttpServletResponse response, String retVal)
    throws IOException {
        if (retVal == null || response == null) {
            return;
        }
        if (retVal.startsWith("{") || retVal.startsWith("[")) {
            response.setContentType(WebUtils.DEFAULT_JSON_CONTENT_TYPE);
        } else {
            response.setContentType(WebUtils.DEFAULT_XML_CONTENT_TYPE);
        }
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Pragma", "No-Cache");
        response.setDateHeader("Expires", 0);
        response.getWriter().println(retVal);
    }

    public static void writeStringResponse(HttpServletResponse response, String retVal)
    throws IOException {
        if (retVal == null || response == null) {
            return;
        }

        response.setContentType(WebUtils.DEFAULT_XML_CONTENT_TYPE);
            
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Pragma", "No-Cache");
        response.setDateHeader("Expires", 0);
        response.getWriter().println(retVal);
    }

    /**
     * Safe get request parm as Long.
     * 
     * @param request
     *            the request
     * @param key
     *            the key
     * 
     * @return the Long
     */
    public static Long safeGetRequestParmAsLong(HttpServletRequest request, String key) {
        Long value = 0L;
        try {
            value = Long.valueOf(safeFormat(request.getParameter(key)));
        } catch (NumberFormatException nfe) {
            value = -1L;
        }
        return value;
    }

    /**
     * Safe get request parm.
     * 
     * @param request
     *            the request
     * @param key
     *            the key
     * 
     * @return the string
     */
    public static String safeGetRequestParm(HttpServletRequest request, String key) {
        return safeFormat(request.getParameter(key));
    }

    /**
     * Safe format.
     * 
     * @param s
     *            the s
     * 
     * @return the string
     */
    public static String safeFormat(String s) {
        if (s == null) {
            return "";
        }
        return s;
    }

    /**
     * Safe format.
     * 
     * @param c
     *            the c
     * 
     * @return the string
     */
    public static String safeFormat(Calendar c) {
        return safeFormat(c, false);
    }

    /**
     * Safe format.
     * 
     * @param d
     *            the d
     * 
     * @return the string
     */
    public static String safeFormat(Date d) {
        return safeFormat(d, false);
    }

    /**
     * Safe format.
     * 
     * @param c
     *            the c
     * @param dateOnly
     *            the date only
     * 
     * @return the string
     */
    public static String safeFormat(Calendar c, boolean dateOnly) {
        if (c == null) {
            return "";
        }
        return safeFormat(c.getTime(), dateOnly);
    }

    /**
     * Safe format.
     * 
     * @param d
     *            the d
     * @param dateOnly
     *            the date only
     * 
     * @return the string
     */
    public static String safeFormat(Date d, boolean dateOnly) {

        String result = "";

        if (d == null) {
            // do nothing
        } else {

            if (dateOnly) {
                result = new SimpleDateFormat("MM/dd/yyyy").format(d);
            } else {
                result = new SimpleDateFormat("MM/dd/yyyy HH:mm").format(d);

            }
        }

        return result;

        // This use is not thresd safe:
        // return (dateOnly ? default_dateonly_format.format(d) : default_format.format(d));
    }

    /**
     * Strip.
     * 
     * @param src
     *            the src
     * @param schar
     *            the schar
     * 
     * @return the string
     */
    public static String strip(String src, char schar) {
        if (src == null) {
            return null;
        }
        StringBuffer retVal = new StringBuffer();
        for (int x = 0; x < src.length(); x++) {
            char c = src.charAt(x);
            if (c != schar) {
                retVal.append(c);
            }
        }
        return retVal.toString();
    }

    /**
     * Gets the numeric phone entries.
     * 
     * @param phoneNumber
     *            the phone number
     * 
     * @return the numeric phone entries
     */
    public static Long[] getNumericPhoneEntries(String phoneNumber) {
        /*
         * Returns a Long array of phone number broken down. Index 0 = Country Code Index 1 = Area
         * Code Index 2 = Phone Number
         */
        Long[] numericPhoneNumbers = new Long[2 + 1];
        if (phoneNumber == null || phoneNumber.length() == 0) {
            return numericPhoneNumbers;
        }

        final int uptoAreaCodeLength = 10;
        final int uptoPhoneLength = 7;
        int initialIndex = 0;
        final int numStart = 48;
        final int numEnd = 57;
        StringBuffer number = new StringBuffer();

        for (int z = 0; z < phoneNumber.length(); z++) {
            char ch = phoneNumber.charAt(z);
            if (ch >= numStart && ch <= numEnd) {
                number.append(ch);
            }
        }

        String stripedPhoneNumber = number.toString();
        int length = stripedPhoneNumber.length();
        if (length > uptoAreaCodeLength) {
            numericPhoneNumbers[2] =
                new Long(stripedPhoneNumber.substring(length - uptoPhoneLength, length));
            numericPhoneNumbers[1] =
                new Long(stripedPhoneNumber.substring(length - uptoAreaCodeLength, length
                        - uptoPhoneLength));
            numericPhoneNumbers[0] =
                new Long(
                        stripedPhoneNumber.substring(initialIndex, length - uptoAreaCodeLength));
        } else if (length > uptoPhoneLength) {
            numericPhoneNumbers[2] =
                new Long(stripedPhoneNumber.substring(length - uptoPhoneLength, length));
            numericPhoneNumbers[1] =
                new Long(stripedPhoneNumber.substring(initialIndex, length - uptoPhoneLength));
        } else if (length > initialIndex) {
            numericPhoneNumbers[2] = new Long(stripedPhoneNumber.substring(initialIndex, length));
        }

        return numericPhoneNumbers;
    }

//    /**
//     * Write exception.
//     * 
//     * @param response
//     *            HttpServletResponse
//     * @param ex
//     *            Exception
//     */
//    public static void writeException(HttpServletResponse response, Exception ex) {
//        try {
//            JSONObject json = new JSONObject();
//            json.put("success", Boolean.FALSE);
//            json.put("message", ex.getMessage());
//            writeJSONResponse(response, json);
//        } catch (Exception e) {
//            LOGGER.error("Error", e);
//        }
//    }
//
//    /**
//     * Return value as String.
//     * 
//     * @param <T>
//     *            T
//     * @param request
//     *            HttpServletRequest
//     * @param param
//     *            String
//     * @return T
//     */
//    @SuppressWarnings("unchecked")
//    public static <T> T getTypedParam(HttpServletRequest request, String param) {
//        return (T) getTypedParam(request, param, String.class);
//    }
//
//    /**
//     * Return value as designated type.
//     * 
//     * @param <T>
//     *            T
//     * @param request
//     *            HttpServletRequest
//     * @param param
//     *            String
//     * @param type
//     *            Class<T>
//     * @return T
//     */
//    public static <T> T getTypedParam(HttpServletRequest request, String param, Class<T> type) {
//        String value = request.getParameter(param);
//        return convertType(value, type);
//    }
//
//    /**
//     * Return a list of values from a comma delimited string.
//     * 
//     * @param <T>
//     *            T
//     * @param request
//     *            HttpServletRequest
//     * @param param
//     *            String
//     * @param type
//     *            Class<T>
//     * @return T
//     */
//    public static <T> List<T> getCollectionTypedParam(HttpServletRequest request, String param,
//            Class<T> type) {
//        List<T> result = new ArrayList<T>();
//        String value = request.getParameter(param);
//        if (!StringUtils.isEmpty(value)) {
//            value.replace('[', ' ').replace(']', ' ').trim();
//            String[] tokens = value.split(",");
//            for (String token : tokens) {
//                T val = convertType(token, type);
//                if (val != null) {
//                    result.add(val);
//                }
//            }
//        }
//        return result;
//    }
//
//    /**
//     * Convert type.
//     * 
//     * @param <T>
//     *            the < t>
//     * @param value
//     *            the value
//     * @param type
//     *            the type
//     * @return the t
//     */
//    @SuppressWarnings("unchecked")
//    private static <T> T convertType(String value, Class<T> type) {
//        if (StringUtils.isEmpty(value)) {
//            value = StringUtils.EMPTY;
//        }
//
//        if (type == String.class) {
//            return (T) value;
//        }
//
//        if (type == Boolean.class || type == boolean.class) {
//            try {
//                return (T) Boolean.valueOf(value);
//            } catch (Exception e) {
//                return (T) Boolean.FALSE;
//            }
//        }
//        if (type == Character.class || type == char.class) {
//            try {
//                return (T) Character.valueOf(value.charAt(0));
//            } catch (Exception e) {
//                return null;
//            }
//        }
//        if (type == Short.class || type == short.class) {
//            try {
//                return (T) Short.valueOf(value);
//            } catch (Exception e) {
//                return null;
//            }
//        }
//        if (type == Integer.class || type == int.class) {
//            try {
//                return (T) Integer.valueOf(value);
//            } catch (Exception e) {
//                return null;
//            }
//        }
//        if (type == Float.class || type == float.class) {
//            try {
//                return (T) Float.valueOf(value);
//            } catch (Exception e) {
//                return null;
//            }
//        }
//        if (type == Double.class || type == double.class) {
//            try {
//                return (T) Double.valueOf(value);
//            } catch (Exception e) {
//                return null;
//            }
//        }
//        if (type == Long.class || type == long.class) {
//            try {
//                return (T) Long.valueOf(value);
//            } catch (Exception e) {
//                return null;
//            }
//        }
//        if (type == Date.class) {
//            try {
//                return (T) new DateFormat(DateFormatPattern.COMPACT_DATE_TIME).parse(value).getTime();
//            } catch (Exception e) {
//                return null;
//            }
//        }
//        if (type == Calendar.class) {
//            try {
//                Calendar cal = Calendar.getInstance();
//                cal.setTime(new SimpleDateFormat("MM/dd/yyyy HH:mm:ss z").parse(value));
//                return (T) cal;
//            } catch (Exception e) {
//                return null;
//            }
//        }
//        return (T) value;
//    }
//
//    /**
//     * Deep serialize.
//     * 
//     * @param obj
//     *            the obj
//     * @param sdf
//     *            the sdf
//     * @return the jSON object
//     * @throws IllegalAccessException
//     *             the illegal access exception
//     * @throws InvocationTargetException
//     *             the invocation target exception
//     * @throws NoSuchMethodException
//     *             the no such method exception
//     * @throws JSONException
//     *             the JSON exception
//     */
//    @SuppressWarnings("unchecked")
//    public static JSONObject deepSerialize(Object obj, SimpleDateFormat sdf)
//    throws IllegalAccessException, InvocationTargetException, NoSuchMethodException,
//    JSONException {
//        JSONObject json;
//        Map<String, Object> map;
//        if (obj instanceof Collection) {
//            JSONArray arr;
//
//            arr = new JSONArray();
//            int i = 0;
//            for (Object o : (Collection) obj) {
//                json = deepSerialize(o, sdf);
//                arr.put(i, json);
//                i++;
//            }
//
//            return new JSONObject("{values:" + arr.toString() + "}");
//        }
//
//        json = new JSONObject();
//        map = PropertyUtils.describe(obj);
//        for (Map.Entry<String, Object> prop : map.entrySet()) {
//            if (prop.getValue() instanceof Calendar) {
//                Calendar cal = (Calendar) prop.getValue();
//                json.put(prop.getKey(), safeFormatJs(cal));
//                if (sdf != null) {
//                    json.put(prop.getKey() + "_formatted", sdf.format(cal.getTime()));
//                    json.put(prop.getKey() + "_odf",
//                            com.mckesson.rcs.services.util.DateFormat.getFormatter().format(
//                                    cal.getTime()));
//                }
//            } else if (prop.getValue() instanceof BaseDTO || prop.getValue() instanceof Collection) {
//                Object sub;
//                sub = deepSerialize(prop.getValue(), sdf);
//                json.put(prop.getKey(), sub);
//            } else if (prop.getValue() instanceof Enum) {
//                json.put(prop.getKey(), ((Enum) prop.getValue()).toString());
//            } else {
//                json.put(prop.getKey(), prop.getValue());
//            }
//        }
//
//        return json;
//    }
//
//    /**
//     * Deep serialize.
//     * 
//     * @param obj
//     *            the obj
//     * @return the jSON object
//     * @throws IllegalAccessException
//     *             the illegal access exception
//     * @throws InvocationTargetException
//     *             the invocation target exception
//     * @throws NoSuchMethodException
//     *             the no such method exception
//     * @throws JSONException
//     *             the JSON exception
//     */
//    public static JSONObject deepSerialize(Object obj) throws IllegalAccessException,
//    InvocationTargetException, NoSuchMethodException, JSONException {
//        return deepSerialize(obj, null);
//    }
//
//    /**
//     * Safe format a Calendar instance for JSON response.
//     * 
//     * @param cal
//     *            the instance calendar to format
//     * 
//     * @return the date formated for JSON response.
//     */
//    public static String safeFormatJs(Calendar cal) {
//        if (cal == null) {
//            return "";
//        }
//        String dateFormated =
//            new SimpleDateFormat(FORMATTER).format(cal.getTime())
//            + " "
//            + cal.getTimeZone().getDisplayName(cal.getTimeZone().useDaylightTime(),
//                    TimeZone.SHORT);
//        return dateFormated;
//    }
//
//    /**
//     * Deserialize a JSON string.
//     * 
//     * @param <T>
//     *            T
//     * @param jsonString
//     *            the JSON string. It cannot be null or an {@link IllegalArgumentException} will be
//     *            thrown.
//     * @param type
//     *            The class that the deserialized object will have.
//     * @return A new object with attributes obtained from the JSON string.
//     */
//    public static <T> T deserializeJsonString(String jsonString, Class<T> type) {
//        final String emptyReceived = "The JSON string cannot be null";
//        if (StringUtils.isBlank(jsonString)) {
//            throw new IllegalArgumentException(emptyReceived);
//        }
//        Object result = null;
//        try {
//            JSON jsonObj = JSONSerializer.toJSON(jsonString);
//            JsonConfig jsonConfig = new JsonConfig();
//            jsonConfig.setRootClass(type);
//            jsonConfig.setHandleJettisonEmptyElement(false);
//            result = JSONSerializer.toJava(jsonObj, jsonConfig);
//        } catch (Exception e) {
//            LOGGER.warn("Error serializing JSon string from type: " + type.getCanonicalName());
//            if (LOGGER.isDebugEnabled()) {
//                LOGGER.debug("JSon string: " + jsonString);
//                LOGGER.debug(e);
//            }
//        }
//        return type.cast(result);
//    }
//
//    /**
//     * Deserialize a JSON string into a object, this method can handle aggregations such as {@link List Lists}.
//     * 
//     * @param <T>
//     *            T
//     * @param jsonString
//     *            the JSON string. It cannot be null or an {@link IllegalArgumentException} will be
//     *            thrown.
//     * @param type
//     *            The class that the deserialized object will have.
//     * @param subTypes
//     *            The types that the objects contained within the class will have.
//     * @return A new object with attributes obtained from the JSON string.
//     */
//    @SuppressWarnings("unchecked")
//    public static <T> T deepDeserializeJsonString(String jsonString, Class<T> type,
//            HashMap<String, Class> subTypes) {
//        final String emptyReceived = "The JSON string cannot be null";
//        if (StringUtils.isBlank(jsonString)) {
//            throw new IllegalArgumentException(emptyReceived);
//        }
//        Object result = null;
//            JSONDeserializer<T> deserializer = new JSONDeserializer<T>();
//            // Calendar
//            deserializer.use(null, type);
//            deserializer.use(Calendar.class, new CalendarTransformer(DateUtilities.ISO8601_SHORT_FORMAT));
////            deserializer.use(Integer.class, new IntegerTransformer());
////            
//            // Other sub-types
//            if (subTypes!=null) {
//                for (String name : subTypes.keySet()) {
//                    LOGGER.debug("deepDeserializeJsonString() : - name: " +name);
//                    LOGGER.debug("deepDeserializeJsonString() : - subTypes.get(name): " +subTypes.get(name));
//                    deserializer.use(name, subTypes.get(name));
//                }
//            }
//            LOGGER.debug("deepDeserializeJsonString() : - jsonString: " +jsonString);
//            result = deserializer.deserialize(jsonString);
//            LOGGER.debug("deepDeserializeJsonString() : - result: " +result+" ----- result.getClass(): "+result.getClass());
//            LOGGER.debug("deepDeserializeJsonString() : - type: "+type+" ----- type.getClass(): " +type.getClass());
//        return type.cast(result);
//    }
//
//    /**
//     * Parses a date and time strings to a {@link Calendar}.
//     * 
//     * @param date
//     *            the date in format: yyyy-MM-dd
//     * @param time
//     *            the time in format: HH:mm:ss
//     * 
//     * @return the calendar
//     * 
//     * @throws ParseException
//     *             the parse exception
//     */
//    public static Calendar parseToCalendar(final String date, final String time)
//    throws ParseException {
//        // TODO this function may change when the handler for time-zone is implemented
//        Date effectiveDate = DateUtils.parseDate(date + "T" + time, new String[]{TIME_FORMAT});
//        Calendar effectiveDateCalendar = Calendar.getInstance();
//        effectiveDateCalendar.setTime(effectiveDate);
//        return effectiveDateCalendar;
//    }
//
//    /**
//     * Parses a date string to a {@link Calendar}.
//     * 
//     * @param date
//     *            the date in format: yyyy-MM-dd
//     * 
//     * @return the calendar
//     * 
//     * @throws ParseException
//     *             the parse exception
//     */
//    public static Calendar parseToCalendar(final String date) throws ParseException {
//        return parseToCalendar(date, "00:00:00");
//    }
//    
//    /**
//     * Gets the errors.
//     * 
//     * @param errors
//     *            the errors
//     * 
//     * @return the errors
//     */
//    public static String getErrors(Errors errors) {
//        Map<String, Object> result = new HashMap<String, Object>();
//        result.put(WebConstants.RETURN_FAILURE, errors.getAllErrors());
//        flexjson.JSONSerializer serializer = new flexjson.JSONSerializer();
//        String[] excludes =
//                {"arguments", "bindingFailure", "class", "codes", "objectName", "rejectedValue"};
//        serializer.exclude(excludes);
//        return serializer.deepSerialize(result);
//    }
}
