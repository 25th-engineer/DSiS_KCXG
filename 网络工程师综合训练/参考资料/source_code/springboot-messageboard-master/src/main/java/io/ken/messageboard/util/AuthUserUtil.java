package io.ken.messageboard.util;

import io.ken.messageboard.model.User;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AuthUserUtil {

    public AuthUser getAuthUser(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        String userInfo = null;
        AuthUser user = null;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("auth")) {
                    userInfo = cookie.getValue();
                }
            }
        }

        if (userInfo != null && !userInfo.equals("")) {
            try {
                String userInfoText = AesUtil.decrypt(userInfo);
                String[] users = userInfoText.split(",");
                if (users.length == 2) {
                    user = new AuthUser();
                    user.setUserId(users[0]);
                    user.setUserName(users[1]);
                }
            } catch (Exception e) {
                //todo 记录异常日志
            }
        }
        return user;
    }

    public static void setUserAuth(HttpServletResponse response, String userId, String userName) throws Exception {
        String userInfo = String.format("%s,%s", userId, userName);
        Cookie userCookie = new Cookie("auth", AesUtil.encrypt(userInfo));
        userCookie.setPath("/");
        response.addCookie(userCookie);
    }

    public static void clearUserAuth(HttpServletResponse response) {
        Cookie userCookie = new Cookie("auth", null);
        userCookie.setPath("/");
        userCookie.setMaxAge(0);
        response.addCookie(userCookie);
    }

    public class AuthUser {
        private String userId;

        private String userName;

        public String getUserId() {
            return userId;
        }

        public void setUserId(String userId) {
            this.userId = userId;
        }

        public String getUserName() {
            return userName;
        }

        public void setUserName(String userName) {
            this.userName = userName;
        }
    }
}
