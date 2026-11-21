package vn.luxe.util;

import java.security.*;
import java.util.Base64;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;

public final class Passwords {
  private static byte[] derive(String password, byte[] salt) {
    try {
      return SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256")
          .generateSecret(new PBEKeySpec(password.toCharArray(), salt, 600000, 256))
          .getEncoded();
    } catch (GeneralSecurityException ex) {
      throw new IllegalStateException(ex);
    }
  }

  public static String hash(String password) {
    byte[] salt = new byte[16];
    new SecureRandom().nextBytes(salt);
    return Base64.getEncoder().encodeToString(salt)
        + "."
        + Base64.getEncoder().encodeToString(derive(password, salt));
  }

  public static boolean matches(String password, String hash) {
    String[] parts = hash.split("\\.");
    return MessageDigest.isEqual(
        Base64.getDecoder().decode(parts[1]),
        derive(password, Base64.getDecoder().decode(parts[0])));
  }
}
