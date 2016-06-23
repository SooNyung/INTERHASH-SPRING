package spring.controller.chatting;

import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

public interface WebSocketConfigurer {
	void registerWebSocketHandlers(WebSocketHandlerRegistry registry);
}
