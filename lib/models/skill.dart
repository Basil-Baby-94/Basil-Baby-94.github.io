class Skill {
  final String title;
  final String? imageUrl;
  bool isHovering;

  Skill({required this.title, this.imageUrl, this.isHovering = false});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Skill) return false;
    return other.title == title;
  }

  @override
  int get hashCode => title.hashCode;
}
