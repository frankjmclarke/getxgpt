class User {
   String name="";
   int age=0;

  User({required this.name, required this.age});

   User copyWith({
     String? name,
     int? age,
   }) {
     return User(
       name: name ?? this.name,
       age: age ?? this.age,
     );
   }
}
