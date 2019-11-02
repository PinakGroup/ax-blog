package com.xbb.blog.tk.mybatis;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;

/**
 * 自己的 Mapper
 * 特别注意，该接口不能被扫描到，否则会出错
 * <p>Title: MyMapper</p>
 * <p>Description: </p>
 *
 * @author yangxiang
 * @version 1.0.0
 * @date 2019/7/29
 */
public interface TkMapper<T> extends Mapper<T>, MySqlMapper<T> {
}