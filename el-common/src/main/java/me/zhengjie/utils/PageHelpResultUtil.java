/*
 *  Copyright 2019-2020 Zheng Jie
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */
package me.zhengjie.utils;

import com.github.pagehelper.PageInfo;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * @website https://docs.auauz.net
 * @description 服务接口
 * @author xin.peng
 * @date 2020-07-03
 **/
public class PageHelpResultUtil {

   public static Map<String,Object> toPage(PageInfo pageInfo){
       Map<String,Object> map = new LinkedHashMap<>(2);
       map.put("content",pageInfo.getList());
       map.put("totalElements",pageInfo.getTotal());
       //map.put("totalElements",pageInfo.getSize());
       return map;
   }
}
