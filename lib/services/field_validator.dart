class Validator {
  static String fieldValidate(String value) {
    if (value.isEmpty) {
      return 'Field is required';
    }
    return null;
  }

  static String emailValidate(String email) {
    if (email.isEmpty) {
      return 'Email is required';
    }
    if (email.length < 2) {
      return 'enter your correct email';
    }
    if (!RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?").hasMatch(email)) {
      return 'enter your correct email';
    }
    return null;
  }

  static String passwordValidate(String password) {
    if (password.isEmpty) {
      return 'password is required';
    }
    if (password.length < 6) {
      return 'minimum 6 character password';
    }
    return null;
  }

  static String nameValidate(String name) {
    if (name.isEmpty) {
      return 'ini salah 1';
    }
    if (name.length < 2) {
      return 'ini salah 2';
    }
    return null;
  }
}
