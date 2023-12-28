package service;

import java.util.Random;

public class Ulti
{
    static final int NUMBER = 10;
    static final int ALPHABET = 26;
    static final int LENGTH = 6;
    
    public static String randomText() {
        String str = "";
        Random rd = new Random();
        char[] array = new char[2];
        for (int i = 0; i < 6; ++i) {
            array[0] = (char)(rd.nextInt(10) + 48);
            array[1] = (char)(rd.nextInt(26) + 97);
            str +=array[rd.nextInt(2)];
        }
        return str;
    }

    public static String randomOTP() {
        String result = "";
        Random random = new Random();

        for (int i = 0; i < 6; i++) {
            int randomNumber = random.nextInt(10);
            result += Integer.toString(randomNumber);
        }

        return result;
    }
}