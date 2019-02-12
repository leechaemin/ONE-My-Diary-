package kr.co.one;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

public class UtilForFile {

	public static String fileUpByType(MultipartFile file
			, String brdType, String pkNo) {
		//int typeNo -> 0:noType, 2:tmpFile
		//////////////////////////////////file start
		String originFileName = file.getOriginalFilename();
		int endIndex = originFileName.lastIndexOf('.');
		String onlyName = originFileName.substring(0, endIndex);
		String onlyType = originFileName.substring(endIndex, originFileName.length());
		//////////////////////////////////file name 1
		Date today = new Date();
		DateFormat siganFormat = new SimpleDateFormat("HHmmss");
		String sigan = siganFormat.format(today);
		String upFileName = onlyName+"_"+sigan+onlyType;
		//////////////////////////////////file name 2
//		DateFormat naljaFormat = new SimpleDateFormat("yyyyMMdd");
//		String nalja = naljaFormat.format(today);
		//////////////////////////////////file folder 1
		String folderName = "C:/upload/"+brdType+"/"+pkNo;
		File upFolder = new File(folderName);
		if(!upFolder.exists()){
			upFolder.mkdirs();
		}
		//////////////////////////////////file folder 2
		InputStream fileIS = null;
		OutputStream fileOS = null;
		try {
			fileIS = file.getInputStream();
			fileOS = new FileOutputStream(folderName+"/"+upFileName);
			FileCopyUtils.copy(fileIS, fileOS);
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			try {
				if(fileIS != null) {
					fileIS.close();
				}
				if(fileOS != null) {
					fileOS.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		//////////////////////////////////file end
		return folderName.substring(folderName.indexOf("upload/"))
				+"/"+upFileName;
	}//fileUpProcByType

	public static void tmpPathToRealPath(String contents, String pkNo) {
		String tmpPath = "";
		String newPath = "";
		String [] sArr = contents.split("src=\"");
		for(int i=0; i<sArr.length; i++) {
			if(sArr[i].indexOf("./upload") >= 0) {//upload표현이 있는 문자열만 대상
				//임시 파일과 실제 파일의 경로를 정의
				tmpPath = sArr[i].substring(sArr[i].indexOf("./upload")+1, sArr[i].indexOf("\""));
				newPath = tmpPath.replace("/tmp/", "/"+pkNo+"/");
				//폴더 존재여부 확인
				String folderName = newPath.substring(0, newPath.lastIndexOf("/"));
				File upFolder = new File(folderName);
				if(!upFolder.exists()){
					upFolder.mkdirs();
				}
				//파일 복사
				FileInputStream fileIS = null;
				FileOutputStream fileOS = null;
				try {
					fileIS = new FileInputStream("C:/"+tmpPath);
					fileOS = new FileOutputStream("C:/"+newPath);
					FileCopyUtils.copy(fileIS, fileOS);
				} catch (IOException e) {
					e.printStackTrace();
				}finally {
					try {
						if(fileIS != null) {
							fileIS.close();
						}
						if(fileOS != null) {
							fileOS.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
				//임시 파일 삭제
				File tmpFile = new File(tmpPath);
				tmpFile.delete();
			}//if
		}//for
	}//tmpPathToRealPath

	public static void delPath(String contents, String pkNo) {
		String delPath = "";
		String [] sArr = contents.split("src=\"");
		for(int i=0; i<sArr.length; i++) {
			if(sArr[i].indexOf("./upload") >= 0) {//upload표현이 있는 문자열만 대상
				//파일의 경로를 정의
				delPath = sArr[i].substring(sArr[i].indexOf("./upload")+1, sArr[i].indexOf("\""));
				//파일 삭제
				File delFile = new File("C:/"+delPath);
				delFile.delete();
			}//if
		}//for
	}//delPath

	public static void realPathToTmpPathForUpdate(String contents, String pkNo) {
		String realPath = "";
		String tmpPath = "";
		String [] sArr = contents.split("src=\"");
		for(int i=0; i<sArr.length; i++) {
			if(sArr[i].indexOf("./upload") >= 0) {//upload표현이 있는 문자열만 대상
				//실제 파일과 임시 파일의 경로를 정의
				realPath = sArr[i].substring(sArr[i].indexOf("./upload")+1, sArr[i].indexOf("\""));
				tmpPath = realPath.replace("/"+pkNo+"/", "/tmp/");
				//폴더 존재여부 확인
				String folderName = tmpPath.substring(0, tmpPath.lastIndexOf("/"));
				File upFolder = new File(folderName);
				if(!upFolder.exists()){
					upFolder.mkdirs();
				}
				//파일 복사
				FileInputStream fileIS = null;
				FileOutputStream fileOS = null;
				try {
					fileIS = new FileInputStream("C:/"+realPath);
					fileOS = new FileOutputStream("C:/"+tmpPath);
					FileCopyUtils.copy(fileIS, fileOS);
				} catch (IOException e) {
					e.printStackTrace();
				}finally {
					try {
						if(fileIS != null) {
							fileIS.close();
						}
						if(fileOS != null) {
							fileOS.close();
						}
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
			}//if
		}//for
	}//realPathToTmpPath

	public static void clearFolder(String brdType, String pkNo) {
		File folderForDel = new File("C:/upload/"+brdType+"/"+pkNo);
		File [] fileArr = folderForDel.listFiles();
		for(int i=0; i<fileArr.length; i++) {
			fileArr[i].delete();
		}
	}//clearFolder

}//class
