

class DataResponse{
  String message;
  String accessToken;
  DataResponse({
    required this.message,
    required this.accessToken,
  });
  factory DataResponse.fromJson(Map<String,Object?> json){
    return DataResponse(message: json["message"] as String, accessToken: json["accessToken"] as String);
  }

  @override
  String toString() {
    return 'DataResponse{message: $message, accessToken: $accessToken}';
  }
}