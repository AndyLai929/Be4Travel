class Perk {
  final String id;
  final String name;
  final String category;
  final String description;
  final bool eligible;

  const Perk({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.eligible,
  });

  factory Perk.fromJson(Map<String, dynamic> json) => Perk(
        id: json['id'] as String,
        name: json['name'] as String,
        category: json['category'] as String,
        description: json['description'] as String,
        eligible: json['eligible'] as bool,
      );
}
