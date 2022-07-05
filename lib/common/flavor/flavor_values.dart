class FlavorValues {
  const FlavorValues({
    required this.baseUrl,
    required this.clientId,
    required this.clientSecret,
    required this.redirectUri,
    required this.customUriScheme,
  });

  final String baseUrl;
  final String clientId;
  final String clientSecret;
  final String redirectUri;
  final String customUriScheme;
}
