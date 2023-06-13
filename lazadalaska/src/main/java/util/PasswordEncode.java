package util;
import org.mindrot.jbcrypt.BCrypt;
public class PasswordEncode {
        public static String encode(String plainTextPassword) {
            String salt = BCrypt.gensalt();
            String hashedPassword = BCrypt.hashpw(plainTextPassword, salt);
            return hashedPassword;
        }
        public static boolean check(String plainTextPassword, String hashedPassword) {
            return BCrypt.checkpw(plainTextPassword, encode(hashedPassword));
        }

}
