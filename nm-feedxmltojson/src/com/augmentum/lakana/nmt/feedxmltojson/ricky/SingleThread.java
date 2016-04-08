package com.augmentum.lakana.nmt.feedxmltojson.ricky;

import java.io.BufferedReader;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;

public class SingleThread {

	/**
	 * @param args
	 * @throws IOException
	 */
	public static void main(String[] args) {
		long start = System.currentTimeMillis();
		URL url = null;
		URLConnection urlConnection = null;
		InputStream is = null;
		List<String> hrefs = new ArrayList<String>();
		List<InputStream> iStreams = new ArrayList<InputStream>();
/*		for (int i = 0; i < 100; i++) {
			hrefs.add("http://ent-uat-nme.endplay.com/feeds/rssFeed?obfType=ARTICLE_DETAIL&siteId=1000909&articleId=15540329");
			hrefs.add("http://www.baidu.com");
			hrefs.add("http://www.mi.com");
			hrefs.add("http://www.meizu.com");
			hrefs.add("http://www.360.com");

		}*/
		hrefs.add("http://www.sina.com.cn");
		hrefs.add("http://www.baidu.com");
		hrefs.add("http://www.mi.com");
		hrefs.add("http://www.meizu.com");
		hrefs.add("http://www.jd.com");
		hrefs.add("http://www.weibo.com");
		hrefs.add("http://www.qq.com");
		hrefs.add("http://www.163.com");
		hrefs.add("http://www.youku.com");
		hrefs.add("http://www.ifeng.com");
		hrefs.add("http://www.4399.com");
		hrefs.add("http://www.nuomi.com");
		hrefs.add("http://www.58.com");
		hrefs.add("http://www.fang.com");
		hrefs.add("http://www.ctrip.com");
		hrefs.add("http://www.2345.com");
		hrefs.add("http://www.hao123.com");
		hrefs.add("http://www.ganji.com");
		hrefs.add("http://www.iqiyi.com");
		hrefs.add("http://www.eleme.com");
		for (int i = 0; i < hrefs.size(); i++) {
			try {
				url = new URL(hrefs.get(i));
				urlConnection = url.openConnection();
				is = urlConnection.getInputStream();
				InputStreamReader read = new InputStreamReader(is);
				BufferedReader bufferedReader = new BufferedReader(read);
				String lineTxt = null;
				StringBuffer sb = new StringBuffer();
				while ((lineTxt = bufferedReader.readLine()) != null) {
					sb.append(lineTxt);
				}
				read.close();
				FileOutputStream fos = new FileOutputStream("D://abc123//"+System.currentTimeMillis()+".html");
	            fos.write(sb.toString().getBytes("UTF-8"));
	            fos.flush();
	            fos.close();
	            System.err.println(i);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		System.out.println("共耗时：" + (System.currentTimeMillis()-start));
	}

}
