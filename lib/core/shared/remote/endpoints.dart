class RemoteEndpoints {
  static const String _baseUrl = 'https://api.podcast.piistech.com';

  static Uri get fixtures => Uri.parse('$_baseUrl/fixtures');

  static Uri get prediction => Uri.parse('$_baseUrl/prediction');
  
  static Uri get analysis => Uri.parse('$_baseUrl/analysis');

  static Uri get commentary => Uri.parse('$_baseUrl/commentary');

  static Uri get team => Uri.parse('$_baseUrl/team');
}
