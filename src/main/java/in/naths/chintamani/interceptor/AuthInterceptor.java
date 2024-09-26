package in.naths.chintamani.interceptor;

import in.naths.chintamani.annotation.RequiresAuth;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class AuthInterceptor implements HandlerInterceptor {

    @Value("${auth.token}")
    private String authToken;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (handler instanceof HandlerMethod) {
            HandlerMethod handlerMethod = (HandlerMethod) handler;
            RequiresAuth requiresAuth = handlerMethod.getMethodAnnotation(RequiresAuth.class);

            if (requiresAuth != null) {
                String providedToken = request.getHeader("Authorization");
                if (providedToken == null || !providedToken.equals("Bearer " + authToken)) {
                    response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                    response.getWriter().write("Unauthorized, reported to admin");
                    return false;
                }
            }
        }
        return true;
    }
}