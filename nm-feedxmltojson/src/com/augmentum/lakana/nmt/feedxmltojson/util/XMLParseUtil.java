package com.augmentum.lakana.nmt.feedxmltojson.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.log4j.Logger;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.augmentum.lakana.nmt.feedxmltojson.model.Abstract;
import com.augmentum.lakana.nmt.feedxmltojson.model.ArticleItem;
import com.augmentum.lakana.nmt.feedxmltojson.model.Categories;
import com.augmentum.lakana.nmt.feedxmltojson.model.Category;
import com.augmentum.lakana.nmt.feedxmltojson.model.Inline;
import com.augmentum.lakana.nmt.feedxmltojson.model.Media;
import com.augmentum.lakana.nmt.feedxmltojson.model.RelatedNews;
import com.augmentum.lakana.nmt.feedxmltojson.model.Video;
import com.augmentum.lakana.nmt.feedxmltojson.model.VideoPoster;
import com.augmentum.lakana.nmt.feedxmltojson.model.VideoSource;
import com.fasterxml.jackson.databind.ObjectMapper;

public class XMLParseUtil {


	private static Logger logger = Logger.getLogger(XMLParseUtil.class);
/*	private static InputStream is = null;*/
	private static boolean timerFlag;
	private static String urlString = "";
	private static String newUrlString = "";
	private static List<String> articleIds = new ArrayList<String>();
	private static String articleId = "";

	private static int successCounts = 0;
	private static int failedCounts = 0;

	private static int inlineImageCounts = 0;

	public static void main(String[] args) throws Exception {

		getArticleIds();
		timerFlag = Boolean.parseBoolean(PropertyUtil
				.getProperty("enableTimer"));
		if (timerFlag) {
			Timer startTimer = new Timer();

			Date time = null;
			SimpleDateFormat df = new SimpleDateFormat("hh：mm：ss");

			String runderTime = PropertyUtil.getProperty("renderTime");
			if (runderTime != null && runderTime != "") {
				time = df.parse(runderTime);
			} else {
				time = df.parse("20:00:00");
			}

			startTimer.schedule(new TimerTask() {
				@Override
				public void run() {
					loopItemXML();
				}
			}, time, 1000 * 60 * 60 * 24);
		} else {
			loopItemXML();
		}
	}

	private static void getArticleIds() {
		try {
			urlString = PropertyUtil.getProperty("url");
			if (urlString == "" || urlString == null) {
				urlString = "http://ent-uat-nme.endplay.com/feeds/rssFeed?obfType=ARTICLE_DETAIL&siteId=1000909&articleId=";
			}

			File file = new File(PropertyUtil.getProperty("sourcePath"));
			if (file.isFile() && file.exists()) {
				InputStreamReader read = new InputStreamReader(
						new FileInputStream(file), "UTF-8");
				BufferedReader bufferedReader = new BufferedReader(read);
				String lineTxt = null;
				while ((lineTxt = bufferedReader.readLine()) != null) {
					articleIds.add(lineTxt);
				}
				read.close();
			} else {
				System.out.println("can't find the file");
			}
		} catch (Exception e) {
			System.out.println("failed to read the file");
			e.printStackTrace();
		}
	}

	private static void loopItemXML() {

		long startTime = System.currentTimeMillis();
		logger.info("******** Time information *************");
		logger.info("start time：" + startTime);
		// for (int i = 0; i < articleIds.size(); i++) {
		for (int i = 0; i < articleIds.size(); i++) {
			articleId = articleIds.get(i);
			newUrlString = urlString + articleId;
			parseXML();
		}
		long endTime = System.currentTimeMillis();
		logger.info("end time：" + endTime);
		logger.info("during time：" + (endTime - startTime) / 1000 + "s");
		logger.info("*********************");
		logger.info("******** Result information *************");
		logger.info("story total counts：" + (successCounts + failedCounts));
		logger.info("success counts：" + successCounts);
		logger.info("failed counts" + failedCounts);
	}

	public static Object parseXML() {
		InputStream is = null;
		try {
			// logger.info("articleId = " + articleId + " runder start");
			is = getXMLDoc();
			ArticleItem articleItem = processItemXML(is);
			FileOutputStream fos;
			fos = new FileOutputStream(PropertyUtil.getProperty("filePath")
					+ "story_" + articleItem.getGuid() +"_"+ System.currentTimeMillis()+ ".json");
			ObjectMapper mapper = new ObjectMapper();
			String json = mapper.writeValueAsString(articleItem);
			fos.write(json.getBytes("UTF-8"));
			fos.flush();
			fos.close();
			// JSONObject jsonObject = JSONObject.fromObject(articleItem);
			// fos.write(jsonObject.toString().getBytes("UTF-8"));
			// fos.flush();
			// fos.close();
			successCounts++;
			// logger.info("articleId = " + articleId + " runder success");
		} catch (Exception e) {
			failedCounts++;
			logger.info("articleId = " + articleId + " runder failed");
			logger.error(e);
		} finally {
			if (is != null) {
				try {
					is.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return null;
	}

	private static InputStream getXMLDoc() {
		URL url;
		try {
			url = new URL(newUrlString);

			URLConnection uc = url.openConnection();
			uc.setConnectTimeout(10000);
			return uc.getInputStream();

		} catch (Exception e) {
			logger.error("Trying to get network error, Please check your network connection and try again");
		}
		return null;
	}

	private static ArticleItem processItemXML(InputStream is) throws SAXException,
			IOException, ParserConfigurationException {
		ArticleItem articleItem = new ArticleItem();
		try {
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			DocumentBuilder documentBuilder = factory.newDocumentBuilder();
			Document document = documentBuilder.parse(is);
			Element element = document.getDocumentElement();
			NodeList itemList = element.getElementsByTagName("item");

			Element itemElement = (Element) itemList.item(0);

			NodeList headlineNode = itemElement
					.getElementsByTagName("headline");
			String headline = headlineNode.item(0).getTextContent();

			String productid = "";
			NodeList productidNode = itemElement
					.getElementsByTagName("productid");
			Element productElement = (Element) productidNode.item(0);
			if (productElement != null) {
				productid = productElement.getTextContent();
			}

			NodeList subHeadlineNode = itemElement
					.getElementsByTagName("sub-headline");
			String subHeadline = subHeadlineNode.item(0).getTextContent();

			NodeList shortHeadlineNode = itemElement
					.getElementsByTagName("short-headline");
			String shortHeadline = shortHeadlineNode.item(0).getTextContent();

			NodeList linkNode = itemElement.getElementsByTagName("link");
			String link = linkNode.item(0).getTextContent();

			NodeList bodyNode = itemElement.getElementsByTagName("body");
			String body = bodyNode.item(0).getTextContent();

			NodeList guidNode = itemElement.getElementsByTagName("guid");
			String guid = guidNode.item(0).getTextContent();

			NodeList keywordsNode = itemElement
					.getElementsByTagName("keywords");
			String keywords = keywordsNode.item(0).getTextContent();

			NodeList pubDateNode = itemElement.getElementsByTagName("pubDate");
			String pubDate = pubDateNode.item(0).getTextContent();

			NodeList lastEditDateNode = itemElement
					.getElementsByTagName("lastEditDate");
			String lastEditDate = lastEditDateNode.item(0).getTextContent();

			NodeList copyrightNode = itemElement
					.getElementsByTagName("copyright");
			String copyright = copyrightNode.item(0).getTextContent();

			NodeList issueNode = itemElement.getElementsByTagName("issue");
			Element issueElement = (Element) issueNode.item(0);
			String issue = issueElement.getAttribute("id");

			articleItem.setHeadline(headline);
			articleItem.setProductid(productid);
			articleItem.setSubHeadline(subHeadline);
			articleItem.setShortHeadline(shortHeadline);
			articleItem.setLink(link);
			articleItem.setBody(body);
			articleItem.setGuid(Integer.parseInt(guid));
			articleItem.setKeywords(keywords);
			articleItem.setPubDate(pubDate);
			articleItem.setLastEditDate(lastEditDate);
			articleItem.setCopyright(copyright);
			articleItem.setIssue(issue);

			Categories categories = new Categories();
			NodeList categoriesNode = itemElement
					.getElementsByTagName("categories");
			processCategories(categoriesNode, categories);
			articleItem.setCategories(categories);

			Abstract abstractString = new Abstract();
			NodeList abstractNode = itemElement
					.getElementsByTagName("abstract");
			Element abstractElement = (Element) abstractNode.item(0);
			abstractString.setType(abstractElement.getAttribute("type"));
			abstractString.setAbstractBody(abstractElement.getTextContent());
			articleItem.setAbstractString(abstractString);

			Inline inlines = new Inline();
			NodeList inlinesNode = itemElement.getElementsByTagName("inline");
			processInline(inlinesNode, inlines);
			articleItem.setInline(inlines);

			List<Video> videos = new ArrayList<Video>();
			NodeList videoNode = itemElement.getElementsByTagName("video");
			processVideos(videoNode, videos);
			articleItem.setVideos(videos);

			List<Media> medias = new ArrayList<Media>();
			NodeList mediasNode = itemElement
					.getElementsByTagName("media:content");
			processMedia(mediasNode, medias);
			articleItem.setMedias(medias);

			RelatedNews relatedNews = new RelatedNews();
			NodeList relatedNewsNode = itemElement
					.getElementsByTagName("related-news");
			processRelatedNews(relatedNewsNode, relatedNews);
			articleItem.setRelatedNews(relatedNews);
		} catch (Exception e) {
			logger.error("Parse exception : " + e.getMessage());
		}
		return articleItem;
	}

	private static void processCategories(NodeList categoriesNode,
			Categories categories) {
		if (categoriesNode.getLength() == 0) {
			return;
		}
		List<Category> categoryList = new ArrayList<Category>();
		Element categoriesElement = (Element) categoriesNode.item(0);
		try {
			NodeList categoryNode = categoriesElement
					.getElementsByTagName("category");
			for (int j = 0; j < categoryNode.getLength(); j++) {
				Category category = new Category();
				Element categoryElement = (Element) categoryNode.item(j);
				category.setName(categoryElement.getAttribute("name"));
				category.setPrimary(Integer.parseInt(categoryElement
						.getAttribute("primary")));
				category.setId(Integer.parseInt(categoryElement
						.getAttribute("id")));
				categoryList.add(category);
			}
		} catch (NullPointerException e) {
			logger.error("articleId = " + articleId
					+ "Categories tag parse exception");
		} catch (java.lang.NumberFormatException e) {
			logger.error("articleId = " + articleId
					+ "Categories tag parseInt exception");
		}
		categories.setCategories(categoryList);
	}

	private static void processInline(NodeList inlinesNode, Inline inlines) {
		if (inlinesNode.getLength() == 0) {
			return;
		}
		List<Media> inlineList = new ArrayList<Media>();
		Element inlineElement = (Element) inlinesNode.item(0);
		try {
			NodeList mediaNode = inlineElement
					.getElementsByTagName("media:content");
			inlineImageCounts = mediaNode.getLength() > 0 ? mediaNode
					.getLength() : 0;
			for (int j = 0; j < mediaNode.getLength(); j++) {
				Element mediaElement = (Element) mediaNode.item(j);
				Media media = new Media();
				media.setId(Integer.parseInt(mediaElement.getAttribute("id")));
				media.setOrder(Integer.parseInt(mediaElement
						.getAttribute("order")));
				media.setType(mediaElement.getAttribute("type"));
				media.setMedium(mediaElement.getAttribute("medium"));
				media.setHeight(Integer.parseInt(mediaElement
						.getAttribute("height")));
				media.setWidth(Integer.parseInt(mediaElement
						.getAttribute("width")));
				media.setUrl(mediaElement.getAttribute("url"));
				media.setDescription(mediaElement.getAttribute("descript"));
				inlineList.add(media);
			}
		} catch (NullPointerException e) {
			logger.error("articleId = " + articleId
					+ "inlines tag parse exception");
		} catch (java.lang.NumberFormatException e) {
			logger.error("articleId = " + articleId
					+ "inlines tag parseInt exception");
		}
		inlines.setMediaList(inlineList);
	}

	private static void processVideos(NodeList videoNodes, List<Video> videos) {
		if (videoNodes.getLength() == 0) {
			return;
		}
		for (int j = 0; j < videoNodes.getLength(); j++) {
			Video video = new Video();
			Element videoElement = (Element) videoNodes.item(j);
			try {
				video.setId(videoElement.getAttribute("id"));
				video.setType(videoElement.getAttribute("type"));
				video.setTitle(videoElement.getAttribute("title"));

				NodeList posterNode = videoElement
						.getElementsByTagName("poster");
				List<VideoPoster> videoPosters = new ArrayList<VideoPoster>();
				for (int k = 0; k < posterNode.getLength(); k++) {
					VideoPoster videoPoster = new VideoPoster();
					Element posterElement = (Element) posterNode.item(k);
					videoPoster.setUrl(posterElement.getAttribute("url"));
					videoPoster.setHeight(Integer.parseInt(posterElement
							.getAttribute("height")));
					videoPoster.setWidth(Integer.parseInt(posterElement
							.getAttribute("width")));
					videoPoster.setWatermark(Integer.parseInt(posterElement
							.getAttribute("watermark")));
					videoPosters.add(videoPoster);
				}
				video.setVideoPosters(videoPosters);
				NodeList sourceNode = videoElement
						.getElementsByTagName("source");
				List<VideoSource> videoSources = new ArrayList<VideoSource>();
				for (int k = 0; k < sourceNode.getLength(); k++) {
					VideoSource videoSource = new VideoSource();
					Element sourceElement = (Element) sourceNode.item(k);
					videoSource.setQuality(sourceElement
							.getAttribute("quality"));
					videoSource.setFileSize(Integer.parseInt(sourceElement
							.getAttribute("fileSize")));
					videoSource.setHeight(Integer.parseInt(sourceElement
							.getAttribute("height")));
					videoSource.setWidth(Integer.parseInt(sourceElement
							.getAttribute("width")));
					videoSource.setUrl(sourceElement.getAttribute("url"));
					videoSources.add(videoSource);
				}
				video.setVideoSources(videoSources);

				videos.add(video);
			} catch (NullPointerException e) {
				logger.error("articleId = " + articleId
						+ "video tag parse exception");
			}
		}
	}

	private static void processMedia(NodeList mediasNode, List<Media> medias) {
		if (mediasNode.getLength() == 0) {
			return;
		}
		try {
			for (int j = inlineImageCounts; j < mediasNode.getLength(); j++) {
				Media media = new Media();
				Element mediaElement = (Element) mediasNode.item(j);
				media.setId(Integer.parseInt(mediaElement.getAttribute("id")));
				media.setOrder(Integer.parseInt(mediaElement
						.getAttribute("order")));
				media.setType(mediaElement.getAttribute("type"));
				media.setMedium(mediaElement.getAttribute("medium"));
				media.setHeight(Integer.parseInt(mediaElement
						.getAttribute("height")));
				media.setWidth(Integer.parseInt(mediaElement
						.getAttribute("width")));
				media.setUrl(mediaElement.getAttribute("url"));
				media.setDescription(mediaElement.getAttribute("descript"));
				medias.add(media);
			}
		} catch (NullPointerException e) {
			logger.error("articleId = " + articleId
					+ "Medias tag parse exception");
		} catch (java.lang.NumberFormatException e) {
			logger.error("articleId = " + articleId
					+ "Medias tag parseInt exception");
		}
	}

	private static void processRelatedNews(NodeList relatedNewsNode,
			RelatedNews relatedNews) {
		if (relatedNewsNode.getLength() == 0) {
			return;
		}
		try {
			List<String> guids = new ArrayList<String>();
			Element relatedNewsElement = (Element) relatedNewsNode.item(0);
			NodeList guidsNode = relatedNewsElement
					.getElementsByTagName("guid");
			for (int j = 0; j < guidsNode.getLength(); j++) {
				Element guidElement = (Element) guidsNode.item(j);
				String guid = guidElement.getTextContent();
				guids.add(guid);
			}
			relatedNews.setGuids(guids);
		} catch (NullPointerException e) {
			logger.error("articleId = " + articleId
					+ "RelatedNews tag parse exception");
		} catch (java.lang.NumberFormatException e) {
			logger.error("articleId = " + articleId
					+ "RelatedNews tag parseInt exception");
		}
	}

}
