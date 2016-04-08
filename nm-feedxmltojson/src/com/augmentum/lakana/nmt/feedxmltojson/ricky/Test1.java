package com.augmentum.lakana.nmt.feedxmltojson.ricky;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;



public class Test1 implements Runnable{
	//private static Logger log = Logger.getLogger(Test1.class);
	URL url = null;
	URLConnection urlConnection = null;
	InputStream is = null;

	public static void main(String[] args) throws InterruptedException {
		long start = System.currentTimeMillis();
		ExecutorService pool = Executors.newFixedThreadPool(2);
		List<String> hrefs = new ArrayList<String>();
		List<InputStream> iStreams = new ArrayList<InputStream>();
		for (int i = 0; i < 5; i++) {
			hrefs.add("http://its.resource.augmentum.com.cn:8013/its/2015-02/2015-02-15-09-13-34--1005979685.mp4");
/*			hrefs.add("http://www.sina.com.cn");
			hrefs.add("http://www.baidu.com");
			hrefs.add("http://www.mi.com");
			hrefs.add("http://www.meizu.com");
			hrefs.add("http://www.jd.com");

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

			hrefs.add("http://www.eleme.com");*/
		}
        /*pool.execute(new Test1(hrefs, iStreams, flag));
        pool.execute(new Test1(hrefs, iStreams, flag));
        Thread.currentThread().join();
        pool.shutdownNow();*/
		Vector<Thread> threads = new Vector<Thread>();
		for (int i = 0; i < 5; i++) {
			Thread iThread = new Thread(new Test1(hrefs, iStreams));

			threads.add(iThread);
			iThread.start();
		}


		System.out.println("主线执行。");
/*		ParseXML parseXML = new ParseXML(iStreams);
		System.out.println("iStreams的大小"+iStreams.size());
		parseXML.process();*/
		System.out.println("共耗时：" + (System.currentTimeMillis()-start));

	}

	private List<String> hrefs;
	private List<String> visited = new ArrayList<String>();
	private List<InputStream> iStreams;
	private static int i = 0;
	public Test1(List<String> hrefs, List<InputStream> iStreams) {
		this.hrefs = hrefs;
		this.iStreams = iStreams;
	}
	@Override
	public void run() {
		while (!hrefs.isEmpty()) {
			try{
				synchronized (Test1.class) {
					visited.add(hrefs.get(0));
					System.err.println(Thread.currentThread().getName() +": 请求第"+ ++i  + "条资源： "+ hrefs.get(0));
					url = new URL(hrefs.remove(0));
				}
				urlConnection = url.openConnection();
				is = urlConnection.getInputStream();
				System.out.println("资源大小" + urlConnection.getContentLength());
				urlConnection.setConnectTimeout(1);
				if (is == null) {
					System.out.println("无法获得资源");
					continue;
				}
				System.out.println(Thread.currentThread().getName() +": 获得第"+ i  + "条资源： "+ urlConnection.getURL());
				visited.add(urlConnection.getURL().toString());
				iStreams.add(is);
		        System.out.println("iStreams size: "+iStreams.size());
				/*System.out.println(hrefs.size());*/
				new Thread(new ParseXML(iStreams, visited)).start();
				/*ParseXML parseXML = new ParseXML(iStreams);
				System.out.println("iStreams的大小"+iStreams.size());
				parseXML.process();*/

			}catch(Exception e) {
				System.err.println("请求"+ urlConnection.getURL() +"的资源时发生错误: "+e.getMessage());
				//System.err.println(e.getMessage());
			}
		}

	}
}
