package com.augmentum.lakana.nmt.feedxmltojson.ricky;
import java.io.BufferedReader;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.List;


public class ParseXML implements Runnable{

	private List<InputStream> iStreams;
	private List<String> visited;
	private static int i = 0;
	InputStreamReader read;
	BufferedReader bufferedReader;
	FileOutputStream fos;
	public ParseXML(List<InputStream> iStreams, List<String> visited) {
		this.iStreams = iStreams;
		this.visited = visited;
	}
	public ParseXML(List<InputStream> iStreams) {
		this.iStreams = iStreams;
	}
/*	public void process(){
		System.out.println("iStreams的大小2:"+iStreams.size());
		int i = 1;
		try {
			while (!iStreams.isEmpty()) {
				System.out.println(Thread.currentThread().getName() + ": 正在解析第"+ ++i +"条资源： "+visited.remove(0));
				read = new InputStreamReader(iStreams.remove(0));
				bufferedReader = new BufferedReader(read);
				String lineTxt = null;
				StringBuffer sb = new StringBuffer();
				while ((lineTxt = bufferedReader.readLine()) != null) {
					sb.append(lineTxt);

				}
				System.out.println("写入开始");
				fos = new FileOutputStream("D://abc123//==="+System.currentTimeMillis()+"==="+System.currentTimeMillis()+".mp4");
				i++;
				fos.write(sb.toString().getBytes("UTF-8"));
				fos.flush();
		        fos.close();
				System.out.println("写入完成" + sb.toString().length());
			}
		} catch (Exception e) {
				System.out.println(e.getMessage());
		} finally {
	        try {
	        	read.close();
			} catch (IOException e) {
					e.printStackTrace();
			}
		}
	}*/
	@Override
	public void run() {
		while (!iStreams.isEmpty()) {
			try {
				InputStreamReader read;
				synchronized (ParseXML.class) {
					System.out.println(Thread.currentThread().getName() + ": 正在解析第"+ ++i +"条资源： "+visited.remove(0));
					read = new InputStreamReader(iStreams.remove(0));

					BufferedReader bufferedReader = new BufferedReader(read);
					String lineTxt = null;
					StringBuffer sb = new StringBuffer();
					while ((lineTxt = bufferedReader.readLine()) != null) {
						sb.append(lineTxt);
					}
					read.close();
					FileOutputStream fos = new FileOutputStream("D://abc123//"+System.currentTimeMillis()+".mp4");
		            fos.write(sb.toString().getBytes("UTF-8"));
		            fos.flush();
		            fos.close();
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}

		}

	}

}
