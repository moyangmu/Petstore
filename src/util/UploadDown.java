package util;

import java.io.FileInputStream;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

public class UploadDown {
	/**
	 * Description �����ļ�
	 * @param aFilePath Ҫ���ص��ļ�·��
	 * @param aFileName Ҫ���ص��ļ���
	 * @param response ��Ӧ����
	 */
	public static void downLoad(String aFilePath, String aFileName, HttpServletResponse response){
		FileInputStream in = null; //������
		ServletOutputStream out = null; //�����
		try {
			//���������ļ�ʹ�õı�ͷ
			response.setHeader("Content-disposition", "attachment; filename="
					+ aFileName);
			// �����ļ�
			in = new FileInputStream(aFilePath + aFileName); 
			//�õ���Ӧ������������������ͻ����������������
			out = response.getOutputStream();
			out.flush();
			int aRead = 0;
			byte b[] = new byte[1024];
			while ((aRead = in.read(b)) != -1 & in != null) {
				out.write(b,0,aRead);
			}
			out.flush();
			in.close();
			out.close();
		} catch (Throwable e) {
			e.printStackTrace();
		} 
	}
	
}
