String logInMutation(String login, String password) {
  return '''
      {"query":"mutation {login(name:\\"$login\\", password: \\"$password\\"){me{id}}}","variables":{}}
    ''';
}
