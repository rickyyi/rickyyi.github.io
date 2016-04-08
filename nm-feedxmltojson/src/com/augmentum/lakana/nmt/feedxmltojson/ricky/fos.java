package com.augmentum.lakana.nmt.feedxmltojson.ricky;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;

public class fos {

	/**
	 * @param args
	 * @throws IOException
	 */
	public static void main(String[] args) throws IOException {
		URL url = new URL("http://www.xiaomi.com");
		URLConnection urlConnection = url.openConnection();
		InputStream iStream =  urlConnection.getInputStream();;
		FileOutputStream fos = new FileOutputStream(new File("D://abc123/1.txt"));
		fos.write(iStream.read());

	}

}
