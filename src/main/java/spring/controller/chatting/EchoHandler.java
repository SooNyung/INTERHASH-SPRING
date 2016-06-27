package spring.controller.chatting;
<<<<<<< HEAD

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
=======
import java.util.ArrayList;
>>>>>>> f9f11d507c55813aa0b5c2ef2a1a0739a8a5c985
import java.util.List;
import java.util.Map;
 
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
 
public class EchoHandler extends TextWebSocketHandler{
<<<<<<< HEAD
    
    //세션을 모두 저장한다.
    //방법 1 :  1:1 채팅
//    private Map<String, WebSocketSession> sessions = new HashMap<String, WebSocketSession>();
    
    //방법 2 : 전체 채팅
    private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
    
    
    private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
    
=======
    private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
    
    //방법일 일대일챗팅 map사용
    //Map<String, WebSocketSession> sessions  = new HasMap<String, WebSocketSession>();
    
    private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
>>>>>>> f9f11d507c55813aa0b5c2ef2a1a0739a8a5c985
    /**
     * 클라이언트 연결 이후에 실행되는 메소드
     */
    @Override
    public void afterConnectionEstablished(WebSocketSession session)
            throws Exception {
<<<<<<< HEAD
        //맵을 쓸때 방법
//        sessions.put(session.getId(), session);
        //List쓸때 방법
        sessionList.add(session);
         //0번째 중괄호에 session.getId()을 넣으라는뜻
        logger.info("{} 연결됨", session.getId()); 
        
    }
    
    /**
     * 클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행되는 메소드
     */
    @Override
    protected void handleTextMessage(WebSocketSession session,
            TextMessage message) throws Exception {
        
        //0번째에 session.getId() 1번째에 message.getPayload() 넣음
        logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
    //    logger.info("{}로부터 {}받음", new String[]{session.getId(),message.getPayload()});
        
        //연결된 모든 클라이언트에게 메시지 전송 : 리스트 방법
        for(WebSocketSession sess : sessionList){
            sess.sendMessage(new TextMessage("echo:" + message.getPayload()));
        }
        
        // 맵 방법.
        /*Iterator<String> sessionIds = sessions.ketSet().iterator();
        String sessionId = "";
        while (sessionIds.hasNext()) {
            sessionId = sessionIds.next();
            sessions.get(sessionId).sendMessage(new TextMessage("echo:" + message.getPayload()));
            
        }*/
        
        //연결되어 있는 모든 클라이언트들에게 메시지를 전송한다.
//        session.sendMessage(new TextMessage("echo:" + message.getPayload()));
    }
    
    /**
     * 클라이언트 연결을 끊었을 때 실행되는 메소드
=======
        //Map사용시
        //session.put(session.getId(), session);
        
        //List쓸때
        sessionList.add(session);
        logger.info("{} 연결됨", session.getId());
    }
    /**
     * 클라이언트가 웹소켓서버로 메시지를 전송했을 때 실행되는 메소드
     */
    @Override
    protected void handleTextMessage(WebSocketSession session,
         
        TextMessage message) throws Exception {

        logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
        
        //배열이면 많이 쓸수 있고, 쓰지않으면 최대 2개임여
        /*logger.info("{}와 부터 {}받음",new String[] {session.getId(), message.getPayload()});*/
        
        //연결되어있는 모든 클라이언트들에게 메시지를 전송한다 
        //session.sendMessage(new TextMessage("echo:" + message.getPayload()));


 

        for(WebSocketSession sess : sessionList){
            sess.sendMessage(new TextMessage("echo: " +  message.getPayload()));
        }
        
        /*map사용
        Interator<String> sessionIds = sessions.keySet().iterator();
        String sessionId="";
        while(sessionIds.hasNext()){s
            sessionId = sessionIds.next();
            sessions.get(sessionId).sendMessaget(new TextMessage("echo:" + message.getPayload()));
            
        }*/
        
    }
    /**
     * 클라이언트가 연결을 끊었을 때 실행되는 메소드
>>>>>>> f9f11d507c55813aa0b5c2ef2a1a0739a8a5c985
     */
    @Override
    public void afterConnectionClosed(WebSocketSession session,
            CloseStatus status) throws Exception {
<<<<<<< HEAD
        //List 삭제
        sessionList.remove(session);
        
        //Map 삭제
//        sessions.remove(session.getId());
        
        logger.info("{} 연결 끊김.", session.getId());
    }
 
=======
        //list
        sessionList.remove(session);
        //map
        //sessions.remove(session.getId());
        //logger.info("{} 연결 끊김", session.getId());
    }
    
    
>>>>>>> f9f11d507c55813aa0b5c2ef2a1a0739a8a5c985
}