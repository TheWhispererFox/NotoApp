// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$NotesState extends NotesState {
  @override
  final BuiltList<Note> selectedNotes;

  factory _$NotesState([void Function(NotesStateBuilder)? updates]) =>
      (new NotesStateBuilder()..update(updates)).build();

  _$NotesState._({required this.selectedNotes}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        selectedNotes, 'NotesState', 'selectedNotes');
  }

  @override
  NotesState rebuild(void Function(NotesStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotesStateBuilder toBuilder() => new NotesStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotesState && selectedNotes == other.selectedNotes;
  }

  @override
  int get hashCode {
    return $jf($jc(0, selectedNotes.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NotesState')
          ..add('selectedNotes', selectedNotes))
        .toString();
  }
}

class NotesStateBuilder implements Builder<NotesState, NotesStateBuilder> {
  _$NotesState? _$v;

  ListBuilder<Note>? _selectedNotes;
  ListBuilder<Note> get selectedNotes =>
      _$this._selectedNotes ??= new ListBuilder<Note>();
  set selectedNotes(ListBuilder<Note>? selectedNotes) =>
      _$this._selectedNotes = selectedNotes;

  NotesStateBuilder();

  NotesStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _selectedNotes = $v.selectedNotes.toBuilder();
      _$v = null;
    }
    return this;
  }

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
    _$NotesState _$result;
    try {
      _$result =
          _$v ?? new _$NotesState._(selectedNotes: selectedNotes.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'selectedNotes';
        selectedNotes.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'NotesState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
