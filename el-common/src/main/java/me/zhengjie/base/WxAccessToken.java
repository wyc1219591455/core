package me.zhengjie.base;

public class WxAccessToken {

    //access_token的值
    private String accessToken;

    //token过期时间
    private Long expiresTime;

    public String getAccessToken() {
        return accessToken;
    }

    public void setAccessToken(String accessToken) {
        this.accessToken = accessToken;
    }

    public Long getExpiresTime() {
        return expiresTime;
    }

    public void setExpiresTime(Long expiresTime) {
        this.expiresTime = expiresTime;
    }

    public WxAccessToken(String accessToken, String expiresIn){
        super();
        this.accessToken = accessToken;
        expiresTime = System.currentTimeMillis() + Integer.parseInt(expiresIn) * 1000;
    }

    /**
     * 判断accessToken是否超时（有效）
     * @return
     */
    public boolean isExpires(){
        return System.currentTimeMillis() > expiresTime;
    }
}
