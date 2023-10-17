// Validate Email
String validateEmail(String email) {
  if (email.isEmpty) {
    return 'Email is required';
  }
  if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(email)) {
    return 'Please enter a valid email address';
  }
  return "";
}

// Validate Password
String validatePassword(String password) {
  if (password.isEmpty) {
    return 'Password is required';
  }
  if (password.length < 6) {
    return 'Password must be at least 6 characters';
  }
  return "";
}
