package RSASigner;
import javax.crypto.*;
import java.nio.charset.StandardCharsets;
import java.security.*;
import javax.crypto.Cipher;
import java.nio.charset.StandardCharsets;
import java.security.*;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.Base64;
import java.util.Base64;
public class RSASigner {
    private KeyPair keyPair;
    private PublicKey publicKey;
    private PrivateKey privateKey;

    public void generateKeyPair() throws Exception {
        KeyPairGenerator keyGen = KeyPairGenerator.getInstance("RSA");
        keyGen.initialize(2048); // Độ dài của khóa
        keyPair = keyGen.generateKeyPair();
        publicKey = keyPair.getPublic();
        privateKey = keyPair.getPrivate();

    }

//    public static byte[] sign(String data, String privateKeyStr) throws Exception {
//        byte[] dataBytes = data.getBytes("UTF-8");
//
//        byte[] privateKeyBytes = Base64.getDecoder().decode(privateKeyStr);
//        PKCS8EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(privateKeyBytes);
//        KeyFactory keyFactory = KeyFactory.getInstance("RSA");
//        PrivateKey privateKey = keyFactory.generatePrivate(keySpec);
//
//        Signature signature = Signature.getInstance("SHA256withRSA");
//        signature.initSign(privateKey);
//        signature.update(dataBytes);
//
//        return signature.sign();
//    }

//    public static boolean verify(String data, String signatureStr, String publicKeyStr) throws Exception {
//        byte[] dataBytes = data.getBytes("UTF-8");
//        byte[] signatureBytes = Base64.getDecoder().decode(signatureStr);
//        byte[] publicKeyBytes = Base64.getDecoder().decode(publicKeyStr);
//
//        KeyFactory keyFactory = KeyFactory.getInstance("RSA");
//        X509EncodedKeySpec keySpec = new X509EncodedKeySpec(publicKeyBytes);
//        PublicKey publicKey = keyFactory.generatePublic(keySpec);
//
//        Signature signature = Signature.getInstance("SHA256withRSA");
//        signature.initVerify(publicKey);
//        signature.update(dataBytes);
//
//        return signature.verify(signatureBytes);
//    }


    // Hàm chuyển đổi khóa công khai sang chuỗi
    public String publicKeyToString() {
        byte[] publicKeyBytes = publicKey.getEncoded();
        return Base64.getEncoder().encodeToString(publicKeyBytes);
    }

    // Hàm chuyển đổi khóa riêng tư sang chuỗi
    public String privateKeyToString() {
        byte[] privateKeyBytes = privateKey.getEncoded();
        return Base64.getEncoder().encodeToString(privateKeyBytes);
    }
    public String encrypt(String data, String key) throws NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, BadPaddingException, IllegalBlockSizeException {
        try {
            Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
            cipher.init(Cipher.ENCRYPT_MODE, convertStringToPrivateKey(key));
            byte[] output = cipher.doFinal(data.getBytes(StandardCharsets.UTF_8));
            return Base64.getEncoder().encodeToString(output);
        } catch (InvalidKeySpecException | NoSuchAlgorithmException | NoSuchPaddingException |
                 InvalidKeyException | BadPaddingException | IllegalBlockSizeException e) {
            throw new RuntimeException("Error encrypting data", e);
        }
    }

    public String decrypt(String data, String key) throws NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, BadPaddingException, IllegalBlockSizeException {
        try {
            Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
            cipher.init(Cipher.DECRYPT_MODE, convertStringToPublicKey(key));
            byte[] output = cipher.doFinal(Base64.getDecoder().decode(data));
            return new String(output, StandardCharsets.UTF_8);
        } catch (InvalidKeySpecException | NoSuchAlgorithmException | NoSuchPaddingException |
                 InvalidKeyException | BadPaddingException | IllegalBlockSizeException e) {
            throw new RuntimeException("Error decrypting data", e);
        }
    }

    private PublicKey convertStringToPublicKey(String keyStr) throws NoSuchAlgorithmException, InvalidKeySpecException {
        byte[] keyBytes = Base64.getDecoder().decode(keyStr);
        X509EncodedKeySpec keySpec = new X509EncodedKeySpec(keyBytes);
        KeyFactory keyFactory = KeyFactory.getInstance("RSA");
        return keyFactory.generatePublic(keySpec);
    }

    private PrivateKey convertStringToPrivateKey(String keyStr) throws NoSuchAlgorithmException, InvalidKeySpecException {
        byte[] keyBytes = Base64.getDecoder().decode(keyStr);
        PKCS8EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(keyBytes);
        KeyFactory keyFactory = KeyFactory.getInstance("RSA");
        return keyFactory.generatePrivate(keySpec);
    }

    //thư
    public String getPrivateKey() {
        if (keyPair == null) {
            try {
                generateKeyPair();
            } catch (Exception e) {
                throw new RuntimeException("Error generating key pair", e);
            }
        }
        this.privateKey = keyPair.getPrivate();
        return Base64.getEncoder().encodeToString(privateKey.getEncoded());
    }

    public String getPublicKey() {
        if (keyPair == null) {
            try {
                generateKeyPair();
            } catch (Exception e) {
                throw new RuntimeException("Error generating key pair", e);
            }
        }
        this.publicKey = keyPair.getPublic();
        return Base64.getEncoder().encodeToString(publicKey.getEncoded());
    }


}
