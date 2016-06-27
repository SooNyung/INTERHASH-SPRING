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
    
    //������ ��� �����Ѵ�.
    //��� 1 :  1:1 ä��
//    private Map<String, WebSocketSession> sessions = new HashMap<String, WebSocketSession>();
    
    //��� 2 : ��ü ä��
    private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
    
    
    private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
    
=======
    private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
    
    //����� �ϴ���ê�� map���
    //Map<String, WebSocketSession> sessions  = new HasMap<String, WebSocketSession>();
    
    private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
>>>>>>> f9f11d507c55813aa0b5c2ef2a1a0739a8a5c985
    /**
     * Ŭ���̾�Ʈ ���� ���Ŀ� ����Ǵ� �޼ҵ�
     */
    @Override
    public void afterConnectionEstablished(WebSocketSession session)
            throws Exception {
<<<<<<< HEAD
        //���� ���� ���
//        sessions.put(session.getId(), session);
        //List���� ���
        sessionList.add(session);
         //0��° �߰�ȣ�� session.getId()�� ������¶�
        logger.info("{} �����", session.getId()); 
        
    }
    
    /**
     * Ŭ���̾�Ʈ�� ������ ������ �޽����� �������� �� ����Ǵ� �޼ҵ�
     */
    @Override
    protected void handleTextMessage(WebSocketSession session,
            TextMessage message) throws Exception {
        
        //0��°�� session.getId() 1��°�� message.getPayload() ����
        logger.info("{}�� ���� {} ����", session.getId(), message.getPayload());
    //    logger.info("{}�κ��� {}����", new String[]{session.getId(),message.getPayload()});
        
        //����� ��� Ŭ���̾�Ʈ���� �޽��� ���� : ����Ʈ ���
        for(WebSocketSession sess : sessionList){
            sess.sendMessage(new TextMessage("echo:" + message.getPayload()));
        }
        
        // �� ���.
        /*Iterator<String> sessionIds = sessions.ketSet().iterator();
        String sessionId = "";
        while (sessionIds.hasNext()) {
            sessionId = sessionIds.next();
            sessions.get(sessionId).sendMessage(new TextMessage("echo:" + message.getPayload()));
            
        }*/
        
        //����Ǿ� �ִ� ��� Ŭ���̾�Ʈ�鿡�� �޽����� �����Ѵ�.
//        session.sendMessage(new TextMessage("echo:" + message.getPayload()));
    }
    
    /**
     * Ŭ���̾�Ʈ ������ ������ �� ����Ǵ� �޼ҵ�
=======
        //Map����
        //session.put(session.getId(), session);
        
        //List����
        sessionList.add(session);
        logger.info("{} �����", session.getId());
    }
    /**
     * Ŭ���̾�Ʈ�� �����ϼ����� �޽����� �������� �� ����Ǵ� �޼ҵ�
     */
    @Override
    protected void handleTextMessage(WebSocketSession session,
         
        TextMessage message) throws Exception {

        logger.info("{}�� ���� {} ����", session.getId(), message.getPayload());
        
        //�迭�̸� ���� ���� �ְ�, ���������� �ִ� 2���ӿ�
        /*logger.info("{}�� ���� {}����",new String[] {session.getId(), message.getPayload()});*/
        
        //����Ǿ��ִ� ��� Ŭ���̾�Ʈ�鿡�� �޽����� �����Ѵ� 
        //session.sendMessage(new TextMessage("echo:" + message.getPayload()));


 

        for(WebSocketSession sess : sessionList){
            sess.sendMessage(new TextMessage("echo: " +  message.getPayload()));
        }
        
        /*map���
        Interator<String> sessionIds = sessions.keySet().iterator();
        String sessionId="";
        while(sessionIds.hasNext()){s
            sessionId = sessionIds.next();
            sessions.get(sessionId).sendMessaget(new TextMessage("echo:" + message.getPayload()));
            
        }*/
        
    }
    /**
     * Ŭ���̾�Ʈ�� ������ ������ �� ����Ǵ� �޼ҵ�
>>>>>>> f9f11d507c55813aa0b5c2ef2a1a0739a8a5c985
     */
    @Override
    public void afterConnectionClosed(WebSocketSession session,
            CloseStatus status) throws Exception {
<<<<<<< HEAD
        //List ����
        sessionList.remove(session);
        
        //Map ����
//        sessions.remove(session.getId());
        
        logger.info("{} ���� ����.", session.getId());
    }
 
=======
        //list
        sessionList.remove(session);
        //map
        //sessions.remove(session.getId());
        //logger.info("{} ���� ����", session.getId());
    }
    
    
>>>>>>> f9f11d507c55813aa0b5c2ef2a1a0739a8a5c985
}