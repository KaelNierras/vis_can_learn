class QuizData {
  final String question;
  final List<String> choices;

  QuizData({required this.question, required this.choices});

  factory QuizData.fromMap(Map<String, dynamic> data) {
    return QuizData(
      question: data.keys.first,
      choices: List<String>.from(data.values.first),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      question: choices,
    };
  }
}