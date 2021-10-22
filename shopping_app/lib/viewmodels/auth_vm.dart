import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';

class AuthVm extends ChangeNotifier {
  final BuildContext context;
  AuthVm(this.context);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cpasswordController = TextEditingController();
  bool _isLoading = false;

  TextEditingController get nameController => _nameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get cpasswordController => _cpasswordController;
  bool get isLoading => _isLoading;

  // update value of isLoading
  void _updateIsLoading(final bool newVal) {
    _isLoading = newVal;
    notifyListeners();
  }

  // handle login
  void loginUser() {
    if (_emailController.text.trim() != '' &&
        _passwordController.text.trim() != '') {
      _updateIsLoading(true);
      FWLAuthProvider.loginWithEmailAndPassword(
        _emailController.text.trim(),
        _passwordController.text.trim(),
        onSuccess: (val) {
          print('Success!');
        },
        onError: (e) {
          _updateIsLoading(false);
        },
      );
    }
  }

  // handle sign up
  void signUpUser() {
    if (_nameController.text.trim() != '' &&
        _emailController.text.trim() != '' &&
        _passwordController.text.trim() != '' &&
        _cpasswordController.text.trim() != '') {
      if (_passwordController.text.trim() == _cpasswordController.text.trim()) {
        _updateIsLoading(true);
        final _appUser = FoodWithLoveUser(
          uid: '',
          name: _nameController.text.trim(),
          email: _emailController.text.trim(),
          photoUrl: '',
        );
        FWLAuthProvider.createAccountWithAppUserAndPassword(
          _appUser,
          _passwordController.text.trim(),
          onSuccess: (val) {
            Navigator.pop(context);
          },
          onError: (e) {
            _updateIsLoading(false);
          },
        );
      }
    }
  }
}
