class SimpleInputValidation {
  email(String value) {
    if (value.isEmpty) {
      return "Please enter some text";
    }

    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return "Please enter valid email";
    }

    return null;
  }

  password(String value) {
    if (value.isEmpty) {
      return "Please enter some text";
    }

    if (value.length < 6) {
      return "Please enter some text more";
    }

    return null;
  }

  confirmPassword(String value, password) {
    if (value.isEmpty) {
      return "Please enter some text";
    }

    if (value.length < 6) {
      return "Please enter some text more";
    }

    if (password != value) {
      return "Please enter exact text";
    }

    return null;
  }

  phone(String value) {
    if (value.isEmpty) {
      return "Please enter some text";
    }

    if (value.length != 11) {
      return "Please enter exact text";
    }

    return null;
  }

  name(String value) {
    if (value.isEmpty) {
      return "Please enter some text";
    }

    return null;
  }
}
