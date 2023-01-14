class Validator {
  Validator._();

  static String? valitadeName(String? value) {
    final condition = RegExp(
        r"^(?:[\p{Lu}&&[\p{IsLatin}]])(?:(?:')?(?:[\p{Ll}&&[\p{IsLatin}]]))+(?:\-(?:[\p{Lu}&&[\p{IsLatin}]])(?:(?:')?(?:[\p{Ll}&&[\p{IsLatin}]]))+)*(?: (?:(?:e|y|de(?:(?: la| las| lo| los))?|do|dos|da|das|del|van|von|bin|le) )?(?:(?:(?:d'|D'|O'|Mc|Mac|al\-))?(?:[\p{Lu}&&[\p{IsLatin}]])(?:(?:')?(?:[\p{Ll}&&[\p{IsLatin}]]))+|(?:[\p{Lu}&&[\p{IsLatin}]])(?:(?:')?(?:[\p{Ll}&&[\p{IsLatin}]]))+(?:\-(?:[\p{Lu}&&[\p{IsLatin}]])(?:(?:')?(?:[\p{Ll}&&[\p{IsLatin}]]))+)*))+(?: (?:Jr\.|II|III|IV))?$");
    if (value != null && value.isEmpty) {
      return 'Esse Campo Não Pode Ser Vazio!';
    }
    if (value != null && condition.hasMatch(value)) {
      return 'Nome Inválido,Digite um Nome Válido';
    }
    return null;
  }

  static String? valitadeEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp condition = RegExp(pattern);
    if (value != null && value.isEmpty) {
      return 'Esse Campo Não Pode Ser Vazio!';
    }
    if (value != null && !condition.hasMatch(value)) {
      return 'Email Inválido,Digite um Email Válido';
    }
    return null;
  }

  static String? valitadePassword(String? value) {
    final condition = RegExp(
        r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$");
    if (value != null && value.isEmpty) {
      return 'Esse Campo Não Pode Ser Vazio!';
    }
    if (value != null && !condition.hasMatch(value)) {
      return 'Senha Inválido,Digite uma Senha Válida';
    }
    return null;
  }

  static String? validateConfirmPassword({
    String? passwordValue,
    String? confirmPasswordValue,
  }) {
    if (passwordValue != confirmPasswordValue) {
      return "As senhas são diferentes. Por favor, corrija para continuar.";
    }
    return null;
  }
}
