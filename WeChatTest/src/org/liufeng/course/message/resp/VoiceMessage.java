    package org.liufeng.course.message.resp;  

import org.liufeng.course.message.req.BaseMessage;
      
    /** 
     * 音频消息 
     *  
     * @author liufeng 
     * @date 2013-05-19 
     */  
    public class VoiceMessage extends BaseMessage {  
    	private Voice Voice;

		public Voice getVoice() {
			return Voice;
		}

		public void setVoice(Voice voice) {
			Voice = voice;
		}
    	
    }  