
package com.one.sugarcane.search.index;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import org.apache.lucene.analysis.cn.smart.SmartChineseAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.CorruptIndexException;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.store.FSDirectory;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;  

/**
 * 为course表创建索引
 * 
 * @author 秦晓宇
 * @date 2018.5.29
 */
public class TestCourse {
    private ArrayList dbList = new ArrayList();  
    
    private String INDEX_DIR = null;  
    
    
  
    public String getINDEX_DIR() {
		return INDEX_DIR;
	}

	public void setINDEX_DIR(String iNDEX_DIR) {
		INDEX_DIR = iNDEX_DIR;
	}

	/** 
     * 获取数据库数据 
     *  
     * @return 
     */   
    public void getResults() {  
        ResultSet rs = null;  
        Statement stmt = null;  
        Connection conn = null;  
          
  
        try {  
            Class.forName("com.mysql.jdbc.Driver");// 加载驱动  
            // new oracle.jdbc.driver.OracleDriver();  
            String url = "jdbc:mysql://127.0.0.1:3306/sugarcane?useUnicode=true&characterEncoding=UTF-8";  
            conn = (Connection) DriverManager.getConnection(url, "root", "qinxiaoyu");// 建立连接  
            stmt = (Statement) conn.createStatement();  
            rs = stmt.executeQuery("select * from course");// 发送执行，获得结果集  
            while (rs.next()) {// 遍历结果  
                HashMap map = new HashMap();  
                map.put("id", rs.getString(1));  
                map.put("courseName", rs.getString(2));  
                map.put("courseBrief", rs.getString(3));  
                map.put("price", rs.getString(4));  
                map.put("phoneNumber", rs.getString(5));
                map.put("teacher", rs.getString(13));  
                this.dbList.add(map);  
            }  
        } catch (ClassNotFoundException e) {  
            e.printStackTrace();  
        } catch (SQLException e) {  
            e.printStackTrace();  
        } finally {  
            try {  
                if (rs != null) {// 关闭连接释放资源  
                    rs.close();  
                    rs = null;  
                }  
                if (stmt != null) {  
                    stmt.close();  
                    stmt = null;  
                }  
                if (conn != null) {  
                    conn.close();  
                    conn = null;  
                }  
            } catch (SQLException e) {  
                e.printStackTrace();  
            }  
  
        }  
  
    }  
  
    /** 
     * 创建索引 
     */  
    public void indexDocs() {  
  
        if (this.dbList.size() <= 0)  
            return;  
        try {  
            //中文分词器  
            SmartChineseAnalyzer analyzer=new SmartChineseAnalyzer();  
            //保存用于创建IndexWriter的所有配置。
            IndexWriterConfig iwConfig = new IndexWriterConfig(analyzer);
            IndexWriter writer = new IndexWriter(FSDirectory.open(Paths.get(this.INDEX_DIR)),iwConfig);  
            createIndex(writer);  
            System.out.println("正在优化...");  
//            ((Object) writer).optimize();  
            writer.close();  
        } catch (IOException e) {  
            System.out.println(" caught a " + e.getClass()  
                    + "\n with message: " + e.getMessage());  
        }  
    }  
  
    public void createIndex(IndexWriter writer) {  
        HashMap map = new HashMap();  
        for (Iterator it = this.dbList.iterator(); it.hasNext();) {  
            map = (HashMap)it.next();  
            Document doc = new Document();//必须放在循环中  
            //System.out.println("-->" + map.get("date").toString());  
            doc.add(new TextField("id", map.get("id").toString(),Field.Store.YES));  
            doc.add(new TextField("courseName", map.get("courseName").toString(),Field.Store.YES));  
            doc.add(new TextField("price", map.get("price").toString(),Field.Store.YES )); 
            doc.add(new TextField("phoneNumber", map.get("phoneNumber").toString(),Field.Store.YES ));  
            doc.add(new TextField("teacher", map.get("teacher").toString(),Field.Store.YES ));
            doc.add(new TextField("courseBrief", map.get("courseBrief").toString(),Field.Store.YES ));  
         
            //增加共同域  
//            doc.add(new TextField("all", "0",Field.Store.YES));  
            try {  
                writer.addDocument(doc);//添加到索引器writer  
            } catch (CorruptIndexException e) {  
                e.printStackTrace();  
            } catch (IOException e) {  
                e.printStackTrace();  
            }  
  
        }  
    } 
    public static void main(String[] args) {
		File directory = new File("");
		//获取文件根目录
        try {
			String courseFile = directory.getCanonicalPath();
			String pt = courseFile + "\\src\\com\\one\\sugarcane\\search\\dataIndex\\courseIndex" ;
			TestCourse t = new TestCourse();
			t.setINDEX_DIR(pt);
			t.getResults();
			t.indexDocs();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
