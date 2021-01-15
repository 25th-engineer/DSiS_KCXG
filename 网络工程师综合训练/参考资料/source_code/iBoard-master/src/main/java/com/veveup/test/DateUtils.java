package com.veveup.test;

import com.veveup.utils.DateConvertUtils;
import org.junit.Test;

import java.text.ParseException;
import java.util.Date;

public class DateUtils {

    @Test
    public void testconvert() throws ParseException {
//        String s = DateConvertUtils.UTC02UTC8("2020-07-27 09:20:14");
        String s = "2020-07-27 21:32:00";
//        System.out.println(s);
        Date date = new Date();
        System.out.println(date);
        String niceTime = DateConvertUtils.getNiceTime(s);
        System.out.println(niceTime);
    }
}
