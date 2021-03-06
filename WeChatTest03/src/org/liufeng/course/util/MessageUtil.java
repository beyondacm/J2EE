    package org.liufeng.course.util;  
      
    import java.io.InputStream;  
    import java.io.Writer;  
    import java.util.HashMap;  
    import java.util.List;  
    import java.util.Map;  
      
    import javax.servlet.http.HttpServletRequest;  
      
    import org.dom4j.Document;  
    import org.dom4j.Element;  
    import org.dom4j.io.SAXReader;  
    import org.liufeng.course.message.req.ImageMessage;
    import org.liufeng.course.message.resp.Article;  
    import org.liufeng.course.message.resp.MusicMessage;  
    import org.liufeng.course.message.resp.NewsMessage;  
    import org.liufeng.course.message.resp.TextMessage;  
    import org.liufeng.course.message.resp.VideoMessage;
    import org.liufeng.course.message.resp.VoiceMessage;
      
    import com.thoughtworks.xstream.XStream;  
    import com.thoughtworks.xstream.core.util.QuickWriter;  
    import com.thoughtworks.xstream.io.HierarchicalStreamWriter;  
    import com.thoughtworks.xstream.io.xml.PrettyPrintWriter;  
import com.thoughtworks.xstream.io.xml.XppDriver;  
      
    
    
    /** 
     * 消息工具类 
     *  
     * @author liufeng 
     * @date 2013-05-19 
     */  
    public class MessageUtil {  
      
    	//12种响应消息类型（6+6）
        /** 
         * 返回消息类型：文本 
         */  
        public static final String RESP_MESSAGE_TYPE_TEXT = "text";  
      
        /** 
         * 返回消息类型：图片 
         */  
        public static final String RESP_MESSAGE_TYPE_IMAGE = "image"; 
        
        /** 
         * 返回消息类型：音频 
         */  
        public static final String RESP_MESSAGE_TYPE_VOICE = "voice";
        
        /** 
         * 返回消息类型：音乐 
         */  
        public static final String RESP_MESSAGE_TYPE_MUSIC = "music";  
      
        /** 
         * 返回消息类型：图文 
         */
        
        public static final String RESP_MESSAGE_TYPE_NEWS = "news";  
      
        
        /** 
         *1 请求消息类型：文本 
         */  
        public static final String REQ_MESSAGE_TYPE_TEXT = "text";  
      
        /** 
         *2 请求消息类型：图片 
         */  
        public static final String REQ_MESSAGE_TYPE_IMAGE = "image";  
      
        /** 
         *3 请求消息类型：链接 
         */  
        public static final String REQ_MESSAGE_TYPE_LINK = "link";  
      
        /** 
         *4 请求消息类型：地理位置 
         */  
        public static final String REQ_MESSAGE_TYPE_LOCATION = "location";  
      
        /** 
         *5 请求消息类型：音频 
         */  
        public static final String REQ_MESSAGE_TYPE_VOICE = "voice";  
      
        
        /** 
         *6 请求消息类型：视频 
         */  
        public static final String REQ_MESSAGE_TYPE_VIDEO = "video";
        
        
        /** 
         * 请求消息类型：推送 
         */  
        public static final String REQ_MESSAGE_TYPE_EVENT = "event";  
      
        //事件类型
        /** 
         * 事件类型：subscribe(订阅) 
         */  
        public static final String EVENT_TYPE_SUBSCRIBE = "subscribe";  
      
        /** 
         * 事件类型：unsubscribe(取消订阅) 
         */  
        public static final String EVENT_TYPE_UNSUBSCRIBE = "unsubscribe";  
      
        /** 
         * 事件类型：CLICK(自定义菜单点击事件) 
         */  
        public static final String EVENT_TYPE_CLICK = "CLICK";  
      
        /** 
         * 解析微信发来的请求（XML） 
         *  
         * @param request 
         * @return 
         * @throws Exception 
         */  
        @SuppressWarnings("unchecked")  
        public static HashMap<String, String> parseXml(HttpServletRequest request) throws Exception {  
            // 将解析结果存储在HashMap中  
            HashMap<String, String> map = new HashMap<String, String>();  
      
            // 从request中取得输入流  
            InputStream inputStream = request.getInputStream();  
            // 读取输入流  
            SAXReader reader = new SAXReader();  
            Document document = reader.read(inputStream);  
            // 得到xml根元素  
            Element root = document.getRootElement();  
            // 得到根元素的所有子节点  
            
            recursiveParseXML(root,map);
/*            
            List<Element> elementList = root.elements();  
            // 遍历所有子节点  
            for (Element e : elementList)  
                map.put(e.getName(), e.getText());  
      
            // 释放资源  
            inputStream.close();  
            inputStream = null;  
   */   
            return map;  
        }  
        
        private static void recursiveParseXML(Element root, HashMap<String, String>map){
        	List<Element> elementList = root.elements();
        	
        	if(elementList.size() == 0) {
//        		System.out.println(root.getName() + "=>" + root.getTextTrim());
        		map.put(root.getName(), root.getText());
        	} else {
        		for(Element e : elementList) {
        			recursiveParseXML(e,map);
        		}
        	}
        }
        
        //利用xstream框架转xml
        
        /** 
         * 文本消息对象转换成xml 
         *  
         * @param textMessage 文本消息对象 
         * @return xml 
         */  
        public static String textMessageToXml(TextMessage textMessage) {  
            xstream.alias("xml", textMessage.getClass());  
            return xstream.toXML(textMessage);  
        }  
      
        /** 
         * 音乐消息对象转换成xml 
         *  
         * @param musicMessage 音乐消息对象 
         * @return xml 
         */  
        public static String musicMessageToXml(MusicMessage musicMessage) {  
            xstream.alias("xml", musicMessage.getClass());  
            return xstream.toXML(musicMessage);  
        }  
      
        /** 
         * 图文消息对象转换成xml 
         *  
         * @param newsMessage 图文消息对象 
         * @return xml 
         */  
        public static String newsMessageToXml(NewsMessage newsMessage) {  
            xstream.alias("xml", newsMessage.getClass());  
            xstream.alias("item", new Article().getClass());  
            return xstream.toXML(newsMessage);  
        }  
      
        /** 
         * 扩展xstream，使其支持CDATA块 
         *  
         * @date 2013-05-19 
         */  
        private static XStream xstream = new XStream(new XppDriver() {  
            public HierarchicalStreamWriter createWriter(Writer out) {  
                return new PrettyPrintWriter(out) {  
                    // 对所有xml节点的转换都增加CDATA标记  
                    boolean cdata = true;  
      
                    @SuppressWarnings("unchecked")  
                    public void startNode(String name, Class clazz) {  
                        super.startNode(name, clazz);  
                    }  
      
                    protected void writeText(QuickWriter writer, String text) {  
                        if (cdata) {  
                            writer.write("<![CDATA[");  
                            writer.write(text);  
                            writer.write("]]>");  
                        } else {  
                            writer.write(text);  
                        }  
                    }  
                };  
            }  
        }); 
       
       //响应消息转换xml 
       public static String messageTOXML(TextMessage textMessage) {
    	   xstream.alias("xml", TextMessage.class);
    	   return xstream.toXML(textMessage);
       } 
       
       public static String messageTOXML(ImageMessage imageMessage) {
    	   xstream.alias("xml", ImageMessage.class);
    	   return xstream.toXML(imageMessage);
       } 
       
       public static String messageTOXML(MusicMessage musicMessage) {
    	   xstream.alias("xml", MusicMessage.class);
    	   return xstream.toXML(musicMessage);
       } 
       
       public static String messageTOXML(NewsMessage newsMessage) {
    	   xstream.alias("xml", NewsMessage.class);
    	   xstream.alias("item", Article.class);	
    	   return xstream.toXML(newsMessage);
       } 
       
       public static String messageTOXML(VideoMessage videoMessage) {
    	   xstream.alias("xml", VideoMessage.class);
    	   return xstream.toXML(videoMessage);
       } 
       
       public static String messageTOXML(VoiceMessage voiceMessage) {
    	   xstream.alias("xml", VoiceMessage.class);
    	   return xstream.toXML(voiceMessage);
       } 
       
       
    }  
