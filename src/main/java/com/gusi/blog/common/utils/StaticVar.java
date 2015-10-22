package com.gusi.blog.common.utils;

import java.util.HashMap;
import java.util.Map;

public class StaticVar {

	public static class PageVar {
		public final static int PAGESIZE = 5;
	}

	public static class BaseInfoType {
		public final static int STRING = 1;
		public final static int INTEGER = 2;
		public final static int BOOLEAN = 3;
		public final static int IMAGE = 4;

		public static Map<Integer, String> baseInfoTypeMap = new HashMap<Integer, String>();
		static {
			baseInfoTypeMap.put(StaticVar.BaseInfoType.STRING, "字符串");
			baseInfoTypeMap.put(StaticVar.BaseInfoType.INTEGER, "数字");
			baseInfoTypeMap.put(StaticVar.BaseInfoType.BOOLEAN, "布尔");
			baseInfoTypeMap.put(StaticVar.BaseInfoType.IMAGE, "图片");
		}
	}

}
