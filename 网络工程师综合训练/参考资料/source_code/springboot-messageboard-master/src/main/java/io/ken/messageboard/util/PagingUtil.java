package io.ken.messageboard.util;

public class PagingUtil {

    public static String getPagingHtml(String urlPrefix, int pageIndex, int pageSize, int dataCount) {
        /*
         * 1、计算页码组
         * 2、计算组中的页码
         * 3、计算上一页、下一页
         * 4、判断哪一个页码需要高亮
         * */
        //每组分页按钮数
        int pageBtnNum = 5;
        //页数
        int pageTotal = dataCount / pageSize;
        if (dataCount % pageSize > 0) pageTotal = pageTotal + 1;

        //修正页码
        if (pageIndex < 1) pageIndex = 1;
        if (pageIndex > pageTotal) pageIndex = pageTotal;

        //页码组
        int pageGroupIndex = pageIndex / pageBtnNum;
        if (pageIndex % pageBtnNum > 0) pageGroupIndex = pageGroupIndex + 1;

        StringBuilder pages = new StringBuilder();
        pages.append("<nav>\n" +
                "  <ul class=\"pagination\">");
        //上一页
        int pageLast = pageIndex - 1;
        if (pageLast <= 0) {

            pages.append("  <li class=\"page-item disabled\">\n" +
                    "      <a class=\"page-link\" href=\"#\" tabindex=\"-1\" aria-disabled=\"true\">上一页</a>\n" +
                    "    </li>");
        } else {
            pages.append(" <li class=\"page-item\"><a class=\"page-link\" href=\"" + urlPrefix + pageLast + "\">上一页</a></li>");
        }
        //中间页码
        int pageBegin = (pageGroupIndex - 1) * pageBtnNum + 1;
        int pageEnd = pageGroupIndex * pageBtnNum;
        if (pageEnd > pageTotal) pageEnd = pageTotal;
        for (int pageItem = pageBegin; pageItem <= pageEnd; pageItem++) {
            String css = "";
            if (pageIndex == pageItem) css = " active";
            pages.append(" <li class=\"page-item" + css + "\"><a class=\"page-link\" href=\"" + urlPrefix + pageItem + "\">" + pageItem + "</a></li>");
        }
        //下一页
        int pageNex = pageIndex + 1;
        if (pageNex >= pageTotal) {

            pages.append("  <li class=\"page-item disabled\">\n" +
                    "      <a class=\"page-link\" href=\"#\" tabindex=\"-1\" aria-disabled=\"true\">下一页</a>\n" +
                    "    </li>");
        } else {
            pages.append(" <li class=\"page-item\"><a class=\"page-link\" href=\"" + urlPrefix + pageNex + "\">下一页</a></li>");
        }
        pages.append(" </ul>\n" +
                "</nav>");
        return pages.toString();
    }
}

