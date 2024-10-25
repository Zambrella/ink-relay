class InstagramInfo {
  static Uri initialUrl = Uri.parse(
    'https://www.instagram.com/oauth/authorize?enable_fb_login=0&force_authentication=1&client_id=1630290747564041&redirect_uri=https://web.squiddies.ink/&response_type=code&scope=instagram_business_basic%2Cinstagram_business_manage_messages%2Cinstagram_business_manage_comments%2Cinstagram_business_content_publish',
  );
  static Uri redirectUri = Uri.parse('https://web.squiddies.ink/');
  static String appId = '1630290747564041';
}
