package com.itwillbs.util;

import java.io.File;
import java.util.Calendar;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {

   public static String fileUpload(String uploadPath,
                                   String fileName,
                                   byte[] fileData,
                                   String ymdPath) throws Exception {

      UUID uid = UUID.randomUUID();

      String newFileName = uid + "_" + fileName;
      String imgPath = uploadPath + ymdPath;

      File target = new File(imgPath, newFileName);
      FileCopyUtils.copy(fileData, target);

      return newFileName;
   }

   public static String calcPath(String uploadPath) {
      Calendar cal = Calendar.getInstance();
      String yearPath = File.separator + cal.get(Calendar.YEAR);
      String monthPath = yearPath + File.separator + String.format("%02d", cal.get(Calendar.MONTH) + 1);
      String datePath = monthPath + File.separator + String.format("%02d", cal.get(Calendar.DATE));

      makeDir(uploadPath, yearPath, monthPath, datePath);

      return datePath;
   }

   private static void makeDir(String uploadPath, String... paths) {
      for (String path : paths) {
         File dirPath = new File(uploadPath + path);

         if (!dirPath.exists()) {
            dirPath.mkdir();
         }
      }
   }
}
