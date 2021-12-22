// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$NotesState extends NotesState {
  factory _$NotesState([void Function(NotesStateBuilder)? updates]) =>
      (new NotesStateBuilder()..update(updates)).build();

  _$NotesState._() : super._();

  @override
  NotesState rebuild(void Function(NotesStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotesStateBuilder toBuilder() => new NotesStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotesState;
  }

  @override
  int get hashCode {
    return 637387391;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('NotesState').toString();
  }
}

class NotesStateBuilder implements Builder<NotesState, NotesStateBuilder> {
  _$NotesState? _$v;

  NotesStateBuilder();

  @override
  void replace(NotesState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotesState;
  }

  @override
  void update(void Function(NotesStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NotesState build() {
    final _$result = _$v ?? new _$NotesState._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
