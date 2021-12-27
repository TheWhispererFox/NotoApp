// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Note> _$noteSerializer = new _$NoteSerializer();

class _$NoteSerializer implements StructuredSerializer<Note> {
  @override
  final Iterable<Type> types = const [Note, _$Note];

  @override
  final String wireName = 'Note';

  @override
  Note deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NoteBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'content':
          result.content = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'updatedAt':
          result.updatedAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'deletedAt':
          result.deletedAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
      }
    }

    return result.build();
  }

  @override
  Iterable<Object?> serialize(Serializers serializers, Note object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'createdAt',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(DateTime)),
      'updatedAt',
      serializers.serialize(object.updatedAt,
          specifiedType: const FullType(DateTime)),
    ];
    Object? value;
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.content;
    if (value != null) {
      result
        ..add('content')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.deletedAt;
    if (value != null) {
      result
        ..add('deletedAt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    return result;
  }
}

class _$Note extends Note {
  factory _$Note([void Function(NoteBuilder)? updates]) =>
      (new NoteBuilder()..update(updates)).build();

  _$Note._(
      {this.title,
      this.content,
      required this.id,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, 'Note', 'id');
    BuiltValueNullFieldError.checkNotNull(createdAt, 'Note', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(updatedAt, 'Note', 'updatedAt');
  }

  @override
  final String? content;

  @override
  final DateTime createdAt;

  @override
  final DateTime? deletedAt;

  @override
  final String id;

  @override
  final String? title;

  @override
  final DateTime updatedAt;

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Note &&
        title == other.title &&
        content == other.content &&
        id == other.id &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        deletedAt == other.deletedAt;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc($jc(0, title.hashCode), content.hashCode), id.hashCode),
                createdAt.hashCode),
            updatedAt.hashCode),
        deletedAt.hashCode));
  }

  @override
  Note rebuild(void Function(NoteBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NoteBuilder toBuilder() => new NoteBuilder()..replace(this);

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Note')
          ..add('title', title)
          ..add('content', content)
          ..add('id', id)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('deletedAt', deletedAt))
        .toString();
  }
}

class NoteBuilder implements Builder<Note, NoteBuilder>, EntityBuilder {
  NoteBuilder();

  _$Note? _$v;
  String? _content;
  DateTime? _createdAt;
  DateTime? _deletedAt;
  String? _id;
  String? _title;
  DateTime? _updatedAt;

  @override
  void replace(covariant Note other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Note;
  }

  @override
  void update(void Function(NoteBuilder)? updates) {
    if (updates != null) updates(this);
  }

  String? get title => _$this._title;

  set title(covariant String? title) => _$this._title = title;

  String? get content => _$this._content;

  set content(covariant String? content) => _$this._content = content;

  String? get id => _$this._id;

  set id(covariant String? id) => _$this._id = id;

  DateTime? get createdAt => _$this._createdAt;

  set createdAt(covariant DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? get updatedAt => _$this._updatedAt;

  set updatedAt(covariant DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  DateTime? get deletedAt => _$this._deletedAt;

  set deletedAt(covariant DateTime? deletedAt) => _$this._deletedAt = deletedAt;

  NoteBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _content = $v.content;
      _id = $v.id;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _deletedAt = $v.deletedAt;
      _$v = null;
    }
    return this;
  }

  @override
  _$Note build() {
    final _$result = _$v ??
        new _$Note._(
            title: title,
            content: content,
            id: BuiltValueNullFieldError.checkNotNull(id, 'Note', 'id'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, 'Note', 'createdAt'),
            updatedAt: BuiltValueNullFieldError.checkNotNull(
                updatedAt, 'Note', 'updatedAt'),
            deletedAt: deletedAt);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
