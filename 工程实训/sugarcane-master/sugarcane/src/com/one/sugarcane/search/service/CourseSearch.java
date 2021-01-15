package com.one.sugarcane.search.service;

import java.io.IOException;
import java.io.StringReader;
import java.nio.file.Paths;
import java.util.ArrayList;

import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.cn.smart.SmartChineseAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.search.highlight.Fragmenter;
import org.apache.lucene.search.highlight.Highlighter;
import org.apache.lucene.search.highlight.QueryScorer;
import org.apache.lucene.search.highlight.SimpleHTMLFormatter;
import org.apache.lucene.search.highlight.SimpleSpanFragmenter;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;

import com.one.sugarcane.entity.Searcher;


/**
 * 根据索引搜索课程 并且高亮显示 TODO
 * 
 * @author 秦晓宇
 * @date 2018年5月29日
 * 
 */

public class CourseSearch {
	public ArrayList<Searcher> search(String indexDir, String q, int currentPage) throws Exception {

		// 得到读取索引文件的路径
		Directory dir = FSDirectory.open(Paths.get(indexDir));
		// 通过dir得到的路径下的所有的文件
		IndexReader reader = DirectoryReader.open(dir);
		// 建立索引查询器
		IndexSearcher is = new IndexSearcher(reader);
		// 实例化分析器
		SmartChineseAnalyzer analyzer = new SmartChineseAnalyzer();
		// 建立查询解析器
		/**
		 * 第一个参数是要查询的字段； 第二个参数是分析器Analyzer
		 */
		QueryParser parser = new QueryParser("courseName", analyzer);
		// 根据传进来的p查找
		Query query = parser.parse(q);
		// 计算索引开始时间
		long start = System.currentTimeMillis();
		// 开始查询
		/**
		 * 第一个参数是通过传过来的参数来查找得到的query； 第二个参数是要出查询的行数
		 */
		TopDocs hits = is.search(query, 100);
		// 计算索引结束时间
		// long end = System.currentTimeMillis();

		// 高亮显示start

		// 算分
		QueryScorer scorer = new QueryScorer(query);

		// 显示得分高的片段
		Fragmenter fragmenter = new SimpleSpanFragmenter(scorer);

		// 设置标签内部关键字的颜色
		// 第一个参数：标签的前半部分；第二个参数：标签的后半部分。
		SimpleHTMLFormatter simpleHTMLFormatter = new SimpleHTMLFormatter("<b><font color='red'>", "</font></b>");

		// 第一个参数是对查到的结果进行实例化；第二个是片段得分（显示得分高的片段，即摘要）
		Highlighter highlighter = new Highlighter(simpleHTMLFormatter, scorer);

		// 设置片段
		highlighter.setTextFragmenter(fragmenter);
		ArrayList<Searcher> list = new ArrayList<Searcher>();
		// 高亮显示end
		ScoreDoc[] scoreDocs = hits.scoreDocs;
		// 查询起始记录位置
		int begin = 4 * (currentPage - 1);
		if (currentPage == 100) {
			begin = (scoreDocs.length / 4) * 4;
		}
		if (begin < 0) {
			begin = 0;
		}
		// 查询终止记录位置
		int end1 = Math.min(begin + 4, scoreDocs.length);
		// 遍历topDocs
		/**
		 * ScoreDoc:是代表一个结果的相关度得分与文档编号等信息的对象。 scoreDocs:代表文件的数组
		 * 
		 * @throws Exception
		 */
		for (int i = begin; i < end1; i++) {
			Searcher searcher = new Searcher();
			// 获取文档
			Document document = is.doc(scoreDocs[i].doc);
			// 输出全路径
			// System.out.println(document.get("courseName"));
			searcher.setNoHighLighteTitle(document.get("courseName"));
			searcher.setBrief(document.get("courseBrief"));
			searcher.setId(document.get("id"));
			String contents = document.get("courseName");
			if (contents != null) {
				// 把全部得分高的摘要给显示出来
				// 第一个参数是对哪个参数进行设置；第二个是以流的方式读入
				TokenStream tokenStream = analyzer.tokenStream("courseName", new StringReader(contents));

				searcher.setTitle(highlighter.getBestFragment(tokenStream, contents));
				// 获取最高的片段
				// System.out.println(highlighter.getBestFragment(tokenStream, contents));

			}
			list.add(searcher);
			// 关闭reader
			// reader.close();
		}
		return list;
	}

	public String[] findIndex(String indexDir, String q) throws IOException, ParseException {
		// 得到读取索引文件的路径
		Directory dir = FSDirectory.open(Paths.get(indexDir));
		// 通过dir得到的路径下的所有的文件
		IndexReader reader = DirectoryReader.open(dir);
		// 建立索引查询器
		IndexSearcher is = new IndexSearcher(reader);
		// 实例化分析器
		SmartChineseAnalyzer analyzer = new SmartChineseAnalyzer();
		// 建立查询解析器
		/**
		 * 第一个参数是要查询的字段； 第二个参数是分析器Analyzer
		 */
		QueryParser parser = new QueryParser("courseName", analyzer);
		// 根据传进来的p查找
		Query query = parser.parse(q);
		// 计算索引开始时间
		//long start = System.currentTimeMillis();
		// 开始查询
		/**
		 * 第一个参数是通过传过来的参数来查找得到的query； 第二个参数是要出查询的行数
		 */
		TopDocs hits = is.search(query, 100);
		// 计算索引结束时间
		//long end = System.currentTimeMillis();
		String[] b = new String[2];
		ScoreDoc[] scoreDocs = hits.scoreDocs;
		if (scoreDocs.length % 4 == 0) {
			b[0] = scoreDocs.length / 4 + "";
		} else {
			b[0] = (scoreDocs.length / 4 + 1) + "";
		}
		b[1] = scoreDocs.length +"";
		return b;
	}
}
