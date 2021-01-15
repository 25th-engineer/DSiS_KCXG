package com.veveup.utils;

import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormatter;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateConvertUtils {

//    public static Date UTC02UTC8(String date) throws ParseException {
//        String pattern = "yy-MM-dd hh:mm:ss";
//        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
//        Date parse = simpleDateFormat.parse(date);
//        System.out.println("fixBefor:"+parse.getTime());
//        long l = parse.getTime() + 3600 * 8 * 1000;
//        Date utc8 = new Date(l);
//        return utc8;
//    }

    /**
     * 传入时间 获得类似 10分钟前 1小时前 3天前 日期 这样友好的显示
     *
     * @param date
     * @return
     */
    public static String getNiceTime(String date) {
        try {
            if (date == null) {
                return "";
            }
            if (date.length() < 10) {
                return "";
            }
            String pattern = "yy-MM-dd hh:mm:ss";
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
            Date t = simpleDateFormat.parse(date);
            DateTime time = new DateTime(t);
            DateTime now = DateTime.now();
            DateTime minus = now.minus(time.getMillis()).minusHours(8);
            if (minus.getMonthOfYear() == 1 && minus.getDayOfMonth() <= 1) {
                if (minus.getHourOfDay() < 1) {
                    if (minus.getMinuteOfHour() < 1) {
                        return minus.getSecondOfMinute() + "秒前";
                    } else {
                        return minus.getMinuteOfHour() + "分钟前";
                    }
                } else {
                    return minus.getHourOfDay() + "小时前";
                }
            } else {
                return date;
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }


}
