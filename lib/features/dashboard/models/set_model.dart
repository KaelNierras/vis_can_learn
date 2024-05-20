class Sets {
  final String name;
  final String id;
  final int count;

  Sets({required this.id, required this.name, required this.count});

  factory Sets.fromMap(Map<String, dynamic> data) {
    return Sets(
      id: data['set_id'] as String, // 'id', 'name' and 'count' are all named arguments now
      name: data['name'] as String,
      count: data['count'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'count': count,
    };
  }
}