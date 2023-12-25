package org.vivekn4u.com.springvideoservice.service;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.auth.FirebaseToken;
import com.google.firebase.auth.internal.GetAccountInfoResponse;
import jakarta.annotation.PostConstruct;
import org.springframework.stereotype.Service;
import io.jsonwebtoken.security.Keys;

import java.io.FileInputStream;
import java.security.Key;
//import java.security.PublicKey;


@Service
public class FirebaseJwtUtil {

//    private static final String SECRET_KEY = "";

//    private SecretKey secretKey;

//    PublicKey publicKey;
//    byte[] publicKeyBytes = SECRET_KEY.getBytes();


//    public JwtUtil() throws InvalidKeySpecException, NoSuchAlgorithmException {
////        this.secretKey = Keys.builder(SECRET_KEY.getBytes());
////        this.secretKey = Keys.secretKeyFor(SignatureAlgorithm.HS256).getAlgorithm().;
////         secretKey = Keys.hmacShaKeyFor(publicKeyBytes);
//
//    }

    @PostConstruct
    public void initialization() {

        try{
            FileInputStream inputStream = new FileInputStream("src/main/resources/tiktok-7f877-serviceAccountKey.json");
            FirebaseOptions options = new FirebaseOptions.Builder()
                    .setCredentials(GoogleCredentials.fromStream(inputStream))
                    .build();

            FirebaseApp.initializeApp(options);
        }
        catch (Exception error) {
            error.printStackTrace();
        }

    }

    // ... (parseAndVerifyJwt method as previously provided)
    //TODO: code pending
//    public String parseAndVerifyJwt(String token) {
//        try {
////            publicKey = KeyFactory.getInstance("RSA")
////                    .generatePublic(new X509EncodedKeySpec(SECRET_KEY.getBytes()));
////            PublicKey publicKey = KeyFactory.getInstance("RSA")
////                    .generatePublic(new X509EncodedKeySpec(publicKeyBytes));
//
//            Claims claims = Jwts.parser()
////                    .setSigningKey(Keys.hmacShaKeyFor(SECRET_KEY))
//                    .setSigningKey(secretKey)
//                    .build()
//                    .parseClaimsJws(token.replace("Bearer ", ""))
//                    .getBody();
//            return claims.getSubject(); // Assuming userId is stored in the subject claim
//        } catch (JwtException e) {
//            return null; // Invalid token
//        }
////        catch (InvalidKeySpecException | NoSuchAlgorithmException e) {
////            return null;
////        }
//    }

//    private Key getSignKey() {
////        byte[] keyBytes= Decoders.BASE64.decode(SECRET_KEY);
//        byte[] keyBytes = SECRET_KEY.getBytes();
//        return Keys.hmacShaKeyFor(keyBytes);
//    }

//    private User firebaseTokenToUserDto(FirebaseToken decodedToken) {
//        GetAccountInfoResponse.User user = null;
//        if (decodedToken != null) {
//            user = new User();
//            user.setUid(decodedToken.getUid());
//            user.setName(decodedToken.getName());
//            user.setEmail(decodedToken.getEmail());
//            user.setPicture(decodedToken.getPicture());
//            user.setIssuer(decodedToken.getIssuer());
//            user.setEmailVerified(decodedToken.isEmailVerified());
//        }
//        return user;
//    }
}
