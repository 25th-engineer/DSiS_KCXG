package com.one.sugarcane.io.ride.sensitive;


import java.io.*;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

/**
 * 敏感词汇过滤工具
 */


public class SensitiveWordFilter {
    private static HashMap sensitiveWordMap = null;
    private InputStream in = null;
    public static int MinMatchType = 1; // 最小匹配
    public static int MaxMatchType = 2; // 最大匹配


    /**
     * 读入默认的敏感词汇库
     */
    public SensitiveWordFilter() {
        this.in = SensitiveWordFilter.class.getClassLoader().getResourceAsStream("resource/key.txt");
        System.out.println();
        init();
    }

    /**
     * 读入制定的敏感词汇库
     *
     * @param keyWordFile 路径为相对路径
     */
    public SensitiveWordFilter(String keyWordFile) {
        try {
            this.in = new FileInputStream(keyWordFile);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }

        init();
    }

    /**
     * 初始化
     */
    private void init() {
        Set<String> keyWords = readSensitiveWords();
        sensitiveWordMap = new HashMap<>(keyWords.size());
        for (String keyword : keyWords) {
            createKeyWord(keyword);
        }
    }

    /**
     * 去读敏感词汇文件
     *
     * @return 敏感词汇的set
     */
    private Set<String> readSensitiveWords() {
        Set<String> keyWords = new HashSet<>();
        BufferedReader reader = null;
        try {
            // FileInputStream fin = new FileInputStream("resource/key.txt");
            reader = new BufferedReader(new InputStreamReader(this.in));
            String line;
            while ((line = reader.readLine()) != null) {
                keyWords.add(line.trim());
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return keyWords;
    }

    /**
     * 根据敏感词汇创建敏感词汇树
     *
     * @param keyWord 敏感词汇树
     */
    private void createKeyWord(String keyWord) {
        if (sensitiveWordMap == null) {
            System.out.println("sensitiveWordMap 未创建");
            return;
        }
        Map nowMap = sensitiveWordMap;
        for (Character c : keyWord.toCharArray()) {
            Object obj = nowMap.get(c);
            // 不存在的
            if (obj == null) {
                Map<String, Object> childMap = new HashMap<>();
                childMap.put("isEnd", "false");
                nowMap.put(c, childMap);
                nowMap = childMap;
            } else {
                nowMap = (Map) obj;
            }
        }
        nowMap.put("isEnd", "true");
    }

    /**
     * 检查是否有敏感词汇
     *
     * @param txt        等待检查的字符串
     * @param beginIndex 开始的位置
     * @param matchType  匹配模式
     * @return 如果找到就返回敏感词的长度, 没有找到返回0
     */
    public int checkSensitiveWord(String txt, int beginIndex, int matchType) {
        boolean flag = false;   // 用于敏感词只有一个字的情况
        int matchFlag = 0;
        char word;
        Map nowMap = sensitiveWordMap;
        for (int i = beginIndex; i < txt.length(); i++) {
            word = txt.charAt(i);
            nowMap = (Map) nowMap.get(word);
            // 存在
            if (nowMap != null) {
                matchFlag++;    // 长度加1
                if ("true".equals(nowMap.get("isEnd"))) {
                    flag = true;    //结束标志设置为true
                    // 最小匹配模式, 直接退出
                    if (MinMatchType == matchType) {
                        break;
                    }
                }
            } else {
                // 不存在 直接返回
                break;
            }
        }
        if (matchFlag < 2 || !flag) {
            matchFlag = 0;
        }

        return matchFlag;
    }

    /**
     * 判断字符串是否含有敏感词汇
     *
     * @param txt       字符串
     * @param matchType 匹配模式
     * @return 包含敏感词汇返回true, 不包含返回false
     */
    public boolean isContainSensitiveWord(String txt, int matchType) {
        for (int i = 0; i < txt.length(); i++) {
            if (checkSensitiveWord(txt, i, matchType) > 0) {
                return true;
            }
        }

        return false;
    }

    /**
     * 找出所有敏感词汇
     *
     * @param txt       文本
     * @param matchType 匹配模式
     * @return 包含敏感词汇的HashSet
     */
    public Set<String> getSensitiveWord(String txt, int matchType) {
        Set<String> sensitiveWords = new HashSet<>();
        for (int i = 0; i < txt.length(); i++) {
            int len = checkSensitiveWord(txt, i, matchType);
            if (len > 0) {
                sensitiveWords.add(txt.substring(i, i + len));
                i = i + len - 1;    // for循环自增, 所以减1
            }
        }

        return sensitiveWords;
    }

    /**
     * 返回替代的字符, 使用默认替换字符"*"
     *
     * @param len 需要替换的字符串的长度
     * @return 长度为n的替换字符串
     */
    private String getReplaceChars(int len) {
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < len; i++) {
            sb.append("*");
        }

        return sb.toString();
    }

    /**
     * 使用指定的字符来代替敏感词汇
     *
     * @param replaceChar 代替的字符
     * @param len         需要代替的长度
     * @return 长度为n的替换字符串
     */
    private String getReplaceChars(char replaceChar, int len) {
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < len; i++) {
            sb.append(replaceChar);
        }
        return sb.toString();
    }

    /**
     * 将文本中的敏感词汇替换成"*"
     *
     * @param txt       要替换的文本
     * @param matchType 匹配模式
     * @return 替换后的结果
     */
    public String replaceSensitiveWords(String txt, int matchType) {
        String replace = txt;
        Set<String> sensitiveWords = getSensitiveWord(txt, matchType);
        for (String word : sensitiveWords) {
            String replaceString = getReplaceChars(word.length());
            replace = replace.replaceAll(word, replaceString);
        }

        return replace;
    }

    /**
     * 将文本中的敏感词汇替换成指定的字符
     *
     * @param txt          要替换的文本
     * @param replaceChars 替换的字符
     * @param matchType    匹配模式
     * @return 替换后的结果
     */
    public String replaceSensitiveWords(String txt, char replaceChars, int matchType) {
        String replace = txt;
        Set<String> sensitiveWords = getSensitiveWord(txt, matchType);
        for (String word : sensitiveWords) {
            String replaceString = getReplaceChars(replaceChars, word.length());
            replace = replace.replaceAll(word, replaceString);
        }

        return replace;
    }

    /**
     * 递归打印敏感词树, 测试用
     *
     * @param map 敏感词树
     * @param len 控制缩进
     */
    private void print(Map map, int len) {
        for (Object key : map.keySet()) {
            boolean flag = false;
            for (int i = 0; i < len; i++) {
                System.out.print("\t");
            }
            if (key == "isEnd") {
                System.out.println(key + " = " + map.get(key));
                flag = true;
            } else {
                System.out.println(key + " = {");
            }
            if (map.get(key) instanceof Map) {
                print((Map) map.get(key), len + 1);
            }
            if (!flag) {
                for (int i = 0; i < len; i++) {
                    System.out.print("\t");
                }
                System.out.println("}");
            }
        }
    }

    public static void main(String[] args) {
        SensitiveWordFilter filter = new SensitiveWordFilter();
        String res = filter.replaceSensitiveWords("草你妈呢草你妈,撒的报复", MaxMatchType);
        System.out.println(res);
    }
}
