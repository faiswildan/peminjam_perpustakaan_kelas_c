class ResponseUlasan {
  final double rating;
  final String review;

  ResponseUlasan({required this.rating, required this.review});

  factory ResponseUlasan.fromJson(Map<String, dynamic> json) {
    return ResponseUlasan(
      rating: json['rating'],
      review: json['review'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rating': rating,
      'review': review,
    };
  }
}
