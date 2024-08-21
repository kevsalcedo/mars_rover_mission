import 'package:formz/formz.dart';

enum CommandsError { empty, format, redundant }

class Commands extends FormzInput<String, CommandsError> {
  const Commands.pure(super.value) : super.pure();

  const Commands.dirty(super.value) : super.dirty();

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == CommandsError.empty) return 'The field cannot be empty';
    if (displayError == CommandsError.format) return 'No valid commands';
    if (displayError == CommandsError.redundant) return 'Too many twists and turns. You waste energy!';

    return null;
  }

  static final RegExp validCharacters = RegExp(r'^[FRLfrl]+$');
  static final RegExp redundantInput = RegExp(r'([Rr]{4,}|[Ll]{4,})');
  
  @override
  validator(value) {
    if (value.isEmpty || value.trim().isEmpty) return CommandsError.empty;
    if (!validCharacters.hasMatch(value)) return CommandsError.format;
    if (redundantInput.hasMatch(value)) return CommandsError.redundant;

    return null;
  }
}
