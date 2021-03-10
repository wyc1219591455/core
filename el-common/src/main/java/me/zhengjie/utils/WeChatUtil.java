package me.zhengjie.utils;

import com.alibaba.fastjson.JSONObject;
import me.zhengjie.base.WxAccessToken;
import okhttp3.*;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@Component
public class WeChatUtil {

    //获取的access_token的url路径
    private static String ACCESS_TOKEN_URL = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET";

    //用于存储access_token的对象
    private static WxAccessToken wxAccessToken;

    @Value("${weChat.appid}")
    private String APPID;

    @Value("${weChat.secret}")
    private String APPSECRET;
    /**
     * 对字符串进行sha1加密
     * @param src
     * @return
     */
    public static String sha1Hex(String src){
        try{
            //获取一个加密对象
            MessageDigest messageDigest = MessageDigest.getInstance("sha1");
            //加密
            byte[] digest = messageDigest.digest(src.getBytes());
            char[] chars= {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
            //处理加密结果
            StringBuilder sb = new StringBuilder();
            //处理加密结果
            for(byte b:digest) {
                sb.append(chars[(b>>4)&15]);
                sb.append(chars[b&15]);
            }
            return sb.toString();
        }catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return "";
    }

    private void getToken(){
        ////第三方用户唯一凭证APPID,//第三方用户唯一凭证密钥，APPSECRET
        String url = ACCESS_TOKEN_URL.replace("APPID",APPID).replace("APPSECRET",APPSECRET);
        try {
            //1.客户端
            OkHttpClient client = new OkHttpClient();
            //2.构建request请求
            Request request = new Request.Builder().url(url).build();
            //3.请求接口拿到响应信息
            Response response = client.newCall(request).execute();
            //处理返回的结果
            if(response.isSuccessful()){
                //获取返回的结果
                String body = response.body().string();
                JSONObject jsonObject = JSONObject.parseObject(body);
                //access_token值
                String accessToken = jsonObject.getString("access_token");
                //expires_in有效时间
                String expiresIn = jsonObject.getString("expires_in");
                //创建WxAccessToken对象存储起来
                wxAccessToken = new WxAccessToken(accessToken,expiresIn);
                response.close();
            }
        } catch (Exception e) {
                e.printStackTrace();
        }
    }

    public String getAccessToken(){
        if(wxAccessToken == null || wxAccessToken.isExpires()){
            //重新获取access_token
            getToken();
        }
        return wxAccessToken.getAccessToken();
    }

    /**
     * 向微信服务器发送Post请求，返回响应的内容
     * @param requestUrl
     * @param requestBodyParam
     * @return
     */
    public String sendPostRequest(String requestUrl,String requestBodyParam){
        String accessToken = getAccessToken();
        String url = requestUrl.replace("ACCESS_TOKEN",accessToken);
        try {
            //创建客户端
            OkHttpClient client = new OkHttpClient();
            //给请求体中增加请求参数等
            RequestBody requestBody = RequestBody.create(MediaType.parse("application/json;charset=utf-8"), requestBodyParam);
            //创建请求
            Request request = new Request.Builder().url(url).post(requestBody).build();
            //发送请求，获得响应
            Response response = client.newCall(request).execute();
            if(response.isSuccessful()) {
                //获取响应返回的内容
                String respContent = response.body().string();
                response.close();
                return respContent;
            }
        }catch (IOException e) {
            e.printStackTrace();
        }
        return "";
    }
}
