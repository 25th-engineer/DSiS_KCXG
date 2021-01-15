package io.ken.messageboard.util;

import org.junit.jupiter.api.Test;

public class Md5UtilTest {

    @Test
    public void test() {
        String result = Md5Util.getMD5("1234");
        System.out.println(result);
        assert (result.equals("81dc9bdb52d04dc20036dbd8313ed055")) : "MD5不匹配";
    }
}
