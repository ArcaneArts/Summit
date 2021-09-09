package art.arcane.summit.security;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.Validate;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@Slf4j
public class LudicrousPasswordEncoder implements PasswordEncoder {
    private static final char[] HEX = "0123456789abcdef".toCharArray();
    private static final String TIMING_ATTACK_MITIGATION_SIGNAL = "userNotFoundPassword";
    private static final String SUPER_DUPER_MAGIC_SAUCE = new RNG(new RNG("arcaneartssummit").s(8192)).s(4096);
    public static final int LENGTH = 224;
    public static final int RAW_LENGTH = 128;

    private String salt64() {
        return new RNG().s(64);
    }

    private String pepper32() {
        return new RNG().s(32);
    }

    public static String sha512(String b) {
        try {
            MessageDigest d = MessageDigest.getInstance("SHA-512");
            return bytesToHex(d.digest(b.getBytes(StandardCharsets.UTF_8)));
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

        return "¯\\_(ツ)_/¯";
    }

    public static String sha256(String b) {
        try {
            MessageDigest d = MessageDigest.getInstance("SHA-256");
            return bytesToHex(d.digest(b.getBytes(StandardCharsets.UTF_8)));
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

        return "¯\\_(ツ)_/¯";
    }

    private static String bytesToHex(byte[] bytes) {
        char[] hexChars = new char[bytes.length * 2];
        for (int j = 0; j < bytes.length; j++) {
            int v = bytes[j] & 0xFF;
            hexChars[j * 2] = HEX[v >>> 4];
            hexChars[j * 2 + 1] = HEX[v & 0x0F];
        }

        return new String(hexChars);
    }

    private static String season(String hash128, String salt64, String pepper32) {
        StringBuilder sb = new StringBuilder();
        String mix = sha256(salt64 + "¯\\_(ツ)_/¯" + pepper32);

        Validate.isTrue(hash128.length() == 128, "Hash size is " + hash128.length());
        Validate.isTrue(salt64.length() == 64, "Salt size is " + salt64.length());
        Validate.isTrue(pepper32.length() == 32, "Pepper size is " + pepper32.length());

        for (int i = 0; i < 8192; i++) {
            sb.append(SUPER_DUPER_MAGIC_SAUCE, i % 69, 96 + (i % 420))
                    .append(pepper32.charAt((i + 0xFA6B) % 32));

            if (SUPER_DUPER_MAGIC_SAUCE.charAt(i % 4096) % 2 == 1) {
                sb.append(salt64.charAt(i % 32)).append(hash128.charAt(i % 32)).append(pepper32.charAt(i % 16));
            } else {
                sb.append(salt64.charAt(32 + (i % 32))).append(hash128.charAt(32 + (i % 32)))
                        .append(pepper32.charAt(16 + i % 16));
            }

            if (SUPER_DUPER_MAGIC_SAUCE.charAt(i % 4096) % 7 <= 2) {
                sb.append(mix.charAt((SUPER_DUPER_MAGIC_SAUCE.charAt(i % 4096) & 37) + 9));
            }

            if (pepper32.charAt(i % 32) % 2 == 1) {
                sb.append(salt64.charAt((i + 0xAF6F) % 64)).append(hash128.charAt((i % 64) + 64));
            }
        }

        return sha512(sb.toString()) + salt64 + pepper32;
    }

    @Override
    public String encode(CharSequence rawPassword) {
        if (rawPassword.length() != RAW_LENGTH && rawPassword.equals(TIMING_ATTACK_MITIGATION_SIGNAL)) {
            return season(sha512(TIMING_ATTACK_MITIGATION_SIGNAL), salt64(), pepper32());
        }

        return season(rawPassword.toString(), salt64(), pepper32());
    }

    @Override
    public boolean matches(CharSequence rawPassword, String encodedPassword) {
        return rawPassword.length() == RAW_LENGTH && encodedPassword.length() == LENGTH &&
                encodedPassword.equals(season(rawPassword.toString(),
                        encodedPassword.substring(128, 0xc0), encodedPassword.substring(0xc0, LENGTH)));
    }
}
