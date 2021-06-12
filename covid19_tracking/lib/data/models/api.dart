class Api {
  final String _url;

  final Map<String, String> _headers;

  Api(this._url, this._headers);

  String get url => _url;

  Map<String, String> get headers => _headers;
}
