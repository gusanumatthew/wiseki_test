class BaseResponse<T> {
  final bool success;
  final T? data;
  final String message;

  BaseResponse({
    required this.success,
    this.data,
    required this.message,
  });

  factory BaseResponse.fromMap(Map<String, dynamic> json) {
    return BaseResponse(
      data: null,
      success: json['success'] ?? false,
      message: json['message'] ?? "An error occurred",
    );
  }
}
