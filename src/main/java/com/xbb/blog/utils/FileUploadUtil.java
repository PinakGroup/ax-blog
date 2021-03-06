package com.xbb.blog.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

/**
 * @author shiex-薛
 * @title: FileUploadUtils
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\8\3 000323:44
 */
public class FileUploadUtil {

    /**
     * 生成一个唯一的ID
     * @param
     * @return: java.lang.String
     */
    public static String createUUID () {
        String s = UUID.randomUUID().toString();
        String s2 = s.substring(24).replace("-","");
        return s2.toUpperCase();
    }

    /**
     * 得到一个保证不重复的临时文件名
     * @param suffix 后缀
     * @return: java.lang.String
     */
    public static String createTmpFileName(String suffix) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd-HHmmss");
        String datestr = sdf.format(new Date());
        String name = datestr + "-" + createUUID() + "." + suffix;
        return name;
    }

    /**
     * 得到文件的后缀名
     * @param fileName 原始文件名
     * @return: java.lang.String
     */
    public static String fileSuffix(String fileName) {
        int p = fileName.lastIndexOf('.');
        if(p >= 0)
        {
            return fileName.substring(p+1).toLowerCase();
        }
        return "";
    }

}
