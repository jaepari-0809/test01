package com.f4.main;

import com.github.scribejava.core.builder.api.DefaultApi20;

public class NaverLoginApi extends DefaultApi20 {
   protected NaverLoginApi() {
   System.out.println("API 1번째");
   }

   private static class InstanceHolder {
      private static final NaverLoginApi INSTANCE = new NaverLoginApi();
      
   }

   public static NaverLoginApi instance() {
	   System.out.println("API 인스턴스 가져오기");
      return InstanceHolder.INSTANCE;
   }

   @Override
   public String getAccessTokenEndpoint() {
	   System.out.println("API getAccessTokenEndpoint 가져오기");
      return "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code";
   }

   @Override
   protected String getAuthorizationBaseUrl() {
	   System.out.println("API getAuthorizationBaseUrl 가져오기");
      return "https://nid.naver.com/oauth2.0/authorize";
   }
}