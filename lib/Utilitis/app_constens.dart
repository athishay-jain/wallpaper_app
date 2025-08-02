class AppUrl{
  static const String base_url="https://api.pexels.com/v1";
  static const String trending_url="$base_url/curated?page=1&per_page=20";
  static  String searchPhoto({required String query}){
    return "https://api.pexels.com/v1/search?query=$query";
  }
}