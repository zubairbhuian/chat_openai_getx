// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ModelModel {
  final String id;
  final String created;
  final String root;
  ModelModel({
    required this.id,
    required this.created,
    required this.root,
  });

  ModelModel copyWith({
    String? id,
    String? created,
    String? root,
  }) {
    return ModelModel(
      id: id ?? this.id,
      created: created ?? this.created,
      root: root ?? this.root,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'created': created,
      'root': root,
    };
  }

  factory ModelModel.fromMap(Map<String, dynamic> map) {
    return ModelModel(
      id: map['id'] as String,
      created: map['created'] as String,
      root: map['root'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelModel.fromJson(String source) => ModelModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ModelModel(id: $id, created: $created, root: $root)';

  @override
  bool operator ==(covariant ModelModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.created == created &&
      other.root == root;
  }

  @override
  int get hashCode => id.hashCode ^ created.hashCode ^ root.hashCode;
}
