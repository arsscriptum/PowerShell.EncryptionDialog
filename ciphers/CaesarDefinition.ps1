<#
#ฬท๐   ๐๐ก๐ข ๐ข๐๐ก๐๐๐ฃ๐ค๐
#ฬท๐   ๐ตโโโโโ๐ดโโโโโ๐ผโโโโโ๐ชโโโโโ๐ทโโโโโ๐ธโโโโโ๐ญโโโโโ๐ชโโโโโ๐ฑโโโโโ๐ฑโโโโโ ๐ธโโโโโ๐จโโโโโ๐ทโโโโโ๐ฎโโโโโ๐ตโโโโโ๐นโโโโโ ๐งโโโโโ๐พโโโโโ ๐ฌโโโโโ๐บโโโโโ๐ฎโโโโโ๐ฑโโโโโ๐ฑโโโโโ๐ฆโโโโโ๐บโโโโโ๐ฒโโโโโ๐ชโโโโโ๐ตโโโโโ๐ฑโโโโโ๐ฆโโโโโ๐ณโโโโโ๐นโโโโโ๐ชโโโโโ.๐ถโโโโโ๐จโโโโโ@๐ฌโโโโโ๐ฒโโโโโ๐ฆโโโโโ๐ฎโโโโโ๐ฑโโโโโ.๐จโโโโโ๐ดโโโโโ๐ฒโโโโโ
#>

$Caesar = @"

using System;
using System.Text;
namespace Cryptography {
    public static class Caesar
    {
        public static String Encrypt(String text, String pass)
        {
            var passwordBytes = Encoding.UTF8.GetBytes(pass);
            var cipherBytes = Encipher(passwordBytes, Encoding.UTF8.GetBytes(text));
            var cipherText = Convert.ToBase64String(cipherBytes);
            return cipherText;
        }
        public static String Decrypt(String cipherText, String pass)
        {
            var passwordBytes = Encoding.UTF8.GetBytes(pass);
            var plaintext = Encoding.UTF8.GetString(Decipher(passwordBytes, Convert.FromBase64String(cipherText)));
            return plaintext;
        }
        private static byte[] Encipher(byte[] key, byte[] plaindata)
        {
            return Crypt(key, plaindata, 1);
        }

        private static byte[] Decipher(byte[] key, byte[] cipherdata)
        {
            return Crypt(key, cipherdata, -1);
        }

       
        static byte[] Crypt(byte[] key, byte[] dataIn, int switcher)
        {
            //Initialize return array at same length as incoming array
            var dataOut = new byte[dataIn.Length];

            var i = 0;
            var u = 0;
            var mod = dataIn.Length % key.Length;

            for (; i < dataIn.Length - mod; i = i + key.Length ){
                for (u = 0; u < key.Length; u++){
                    var c = dataIn[i + u];
                    c = (byte)(c + (key[u] * switcher));
                    dataOut[i + u] = c;
                }
            }

            if (u == key.Length) u = 0;

            //Second pass: Iterate over the remaining bytes beyond the final block.
            for (; i < dataIn.Length; i++){
                var c = dataIn[i];
                c = (byte)(c + (key[u] * switcher));
                dataOut[i] = c;
                u++;
            }

            return dataOut;
        }
    }
}
"@
