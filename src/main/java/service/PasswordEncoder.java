package service;
import org.mindrot.jbcrypt.BCrypt;
public class PasswordEncoder {
    //su dung thuat toan ma hoa bcrypt de ma hoa mat khau
    //su dung thu vien Bcrypt

    //so lan lap lai khi tao ra salt
    private static final int ROUNDS = 6;

    //chuyen doi password thanh hashpassword de luu tru
    public static String hashPassword(String password) {
        String salt = BCrypt.gensalt(ROUNDS);
        return BCrypt.hashpw(password, salt);
    }

    public static boolean checkPassword(String password, String hashedPassword) {
        return BCrypt.checkpw(password, hashedPassword);
    }

    public static void main(String[] args) {
        System.out.println(hashPassword("123456789"));
    }
}
