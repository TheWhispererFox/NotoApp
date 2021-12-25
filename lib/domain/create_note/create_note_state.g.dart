// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_note_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateNoteState extends CreateNoteState {
  @override
  final Note note;

  factory _$CreateNoteState([void Function(CreateNoteStateBuilder)? updates]) =>
      (new CreateNoteStateBuilder()..update(updates)).build();

  _$CreateNoteState._({required this.note}) : super._() {
    BuiltValueNullFieldError.checkNotNull(note, 'CreateNoteState', 'note');
  }

  @override
  CreateNoteState rebuild(void Function(CreateNoteStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateNoteStateBuilder toBuilder() =>
      new CreateNoteStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateNoteState && note == other.note;
  }

  @override
  int get hashCode {
    return $jf($jc(0, note.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CreateNoteState')..add('note', note))
        .toString();
  }
}

class CreateNoteStateBuilder
    implements Builder<CreateNoteState, CreateNoteStateBuilder> {
  _$CreateNoteState? _$v;

  NoteBuilder? _note;
  NoteBuilder get note => _$this._note ??= new NoteBuilder();
  set note(NoteBuilder? note) => _$this._note = note;

  CreateNoteStateBuilder();

  CreateNoteStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _note = $v.note.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateNoteState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateNoteState;
  }

  @override
  void update(void Function(CreateNoteStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CreateNoteState build() {
    _$CreateNoteState _$result;
    try {
      _$result = _$v ?? new _$CreateNoteState._(note: note.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'note';
        note.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'CreateNoteState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
