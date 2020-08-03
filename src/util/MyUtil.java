package util;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.Part;
public class MyUtil {
	/**
	 * Description ��ȡϵͳ��ǰʱ���ַ���
	 */
	public static String getStringID(){
		String id=null;
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmssSSS"); 
		id=sdf.format(date);
		return id;
	}
	/**
	 * Description ��Part�л��ԭʼ�ļ���
	 */
	public static String getFileName(Part part){
		if(part == null)
			return null;
		//fileName��ʽΪ��form-data; name="resPath"; filename="20140920_110531.jpg"
		String fileName = part.getHeader("content-disposition");
		//û��ѡ���ļ�
		if(fileName.lastIndexOf("=") + 2 == fileName.length() - 1)
			return null;
		return fileName.substring(fileName.lastIndexOf("=") + 2, fileName.length() - 1);
	}
}
