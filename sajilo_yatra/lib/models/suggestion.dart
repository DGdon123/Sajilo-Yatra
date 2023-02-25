class Suggestion {
  final String placeId;
  final String description;
  final String? secondaryText;

  Suggestion(this.placeId, this.description, {this.secondaryText});

  @override
  String toString() => description;
}
