class OnboardingItem {
  String image;
  String title;
  String description;

  OnboardingItem(this.image, this.title, this.description);

  factory OnboardingItem.fromMap(Map map) {
    OnboardingItem item = OnboardingItem(
      map['image'],
      map['title'],
      map['description'],
    );
    return item;
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'title': title,
      'description': description,
    };
  }
}
