package org.vivekn4u.com.springvideoservice.filter;

import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseAuthException;
import com.google.firebase.auth.FirebaseToken;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;
import org.springframework.web.server.ResponseStatusException;
import org.vivekn4u.com.springvideoservice.service.FirebaseJwtUtil;

import java.io.IOException;
import java.util.Collections;

@Component
public class JwtAuthenticationFilter extends OncePerRequestFilter {

    @Autowired
    private FirebaseJwtUtil jwtUtil;

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        String authenticationHeader = request.getHeader("Authorization");
        if (authenticationHeader != null && authenticationHeader.startsWith("Bearer ")) {
            FirebaseToken decodedToken = null;

            try {
                //Extracts token from header
                String token = authenticationHeader.substring(7, authenticationHeader.length());
                //verifies token to firebase server
                decodedToken = FirebaseAuth.getInstance().verifyIdToken(token);
                String userId = decodedToken.getUid();
                String userName = decodedToken.getName();
                String userEmail = decodedToken.getEmail();
                if (userEmail != null) {
                    UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userEmail, null, Collections.emptyList());
                    authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
                    SecurityContextHolder.getContext().setAuthentication(authentication);
                }
            }
            catch (FirebaseAuthException e) {
                throw new ResponseStatusException(HttpStatus.UNAUTHORIZED,"Error! "+e.toString());
            }

            //if token is invalid
            if (decodedToken==null){
                throw new ResponseStatusException(HttpStatus.UNAUTHORIZED,"Invalid token!");
            }

        }
        filterChain.doFilter(request, response);
    }
}
