package com.hz.email.util;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

@SuppressWarnings("all")
public class Base64ConvertImageUtil {

	private Base64ConvertImageUtil() {
	}

	/**
	 * 
	 * @title: getImageToBase64
	 * @description: ͼƬת����base64�ַ���
	 * @param imgFileRealPath
	 * @return
	 */
	public static String convertImageToBase64String(String imgFileRealPath) {
		InputStream in = null;
		byte[] data = null;
		// ��ȡͼƬ�ֽ�����
		try {
			in = new FileInputStream(imgFileRealPath);
			data = new byte[in.available()];// ��ͼƬ�ļ�ת��Ϊ�ֽ�����
			in.read(data);
			in.close();
		} catch (IOException ex) {
			throw new RuntimeException(ex);
		}
		// ���ֽ�����Base64����
		BASE64Encoder encoder = new BASE64Encoder();
		return encoder.encode(data);// ����Base64��������ֽ������ַ���
	}

	/**
	 * 
	 * @title: generateImageFromBase64
	 * @description: base64�ַ���ת����ͼƬ
	 * @param imgBase64Str
	 * @param imgFileRealPath
	 */
	public static void generateImageFromBase64(String imgBase64Str,
			String imgFileRealPath) {
		if (imgBase64Str == null)
			return;
		BASE64Decoder decoder = new BASE64Decoder();
		OutputStream out = null;
		try {
			// Base64����
			byte[] buffer = decoder.decodeBuffer(imgBase64Str);
			for (int i = 0; i < buffer.length; ++i) {
				if (buffer[i] < 0) {
					buffer[i] += 256;
				}
			}
			// ����jpegͼƬ
			out = new FileOutputStream(imgFileRealPath);
			out.write(buffer);
		} catch (Exception ex) {
			throw new RuntimeException(ex);
		} finally {
			try {
				out.flush();
				out.close();
			} catch (IOException ex) {
				throw new RuntimeException(ex);
			}
		}
	}
}
