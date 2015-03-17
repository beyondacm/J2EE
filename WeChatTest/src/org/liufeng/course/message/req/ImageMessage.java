    package org.liufeng.course.message.req;  
      
    /** 
     * 图片消息 
     *  
     * @author liufeng 
     * @date 2013-05-19 
     */  
    public class ImageMessage extends BaseMessage {  
        // 图片链接  
        private Image Image;

		public Image getImage() {
			return Image;
		}

		public void setImage(Image image) {
			Image = image;
		}
        
    }  