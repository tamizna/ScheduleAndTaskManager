class User {
  final String name;
  final int age;
  final String email;

  User({
    required this.name,
    required this.age,
    required this.email,
  });

  // You can override the toString() method to make it easier to print the User data.
  @override
  String toString() {
    return 'User{name: $name, age: $age, email: $email}';
  }

  // To compare two instances of User
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! User) return false;
    return name == other.name && age == other.age && email == other.email;
  }

  @override
  int get hashCode => Object.hash(name, age, email);

  // A factory method to create a new User from a map (useful for JSON serialization)
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'],
      age: map['age'],
      email: map['email'],
    );
  }

  // Convert the User instance to a map (useful for JSON serialization)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'email': email,
    };
  }

  // Copy method to create a new instance with updated fields (immutability pattern)
  User copyWith({String? name, int? age, String? email}) {
    return User(
      name: name ?? this.name,
      age: age ?? this.age,
      email: email ?? this.email,
    );
  }
}