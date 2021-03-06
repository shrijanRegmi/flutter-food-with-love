import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_with_love/food_with_love.dart';
import 'package:shopping_app/viewmodels/auth_vm.dart';
import 'package:shopping_app/viewmodels/vm_provider.dart';
import 'package:shopping_app/views/screen/auth/sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VMProvider<AuthVm>(
      vm: AuthVm(context),
      builder: (context, vm, appVm, appUser) {
        return Scaffold(
          body: SafeArea(
            child: GestureDetector(
              onTap: () => removeFocus(context),
              child: vm.isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _bannerBuilder(),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20.0,
                                ),
                                FoodWithLoveText.heading1('Login'),
                                SizedBox(
                                  height: 30.0,
                                ),
                                FoodWithLoveInput(
                                  leftIcon: Icon(
                                    Icons.email_outlined,
                                  ),
                                  hintText: 'Email ID',
                                  controller: vm.emailController,
                                ),
                                SizedBox(
                                  height: 30.0,
                                ),
                                FoodWithLoveInput(
                                  leftIcon: Icon(
                                    Icons.lock_outline_rounded,
                                  ),
                                  hintText: 'Password',
                                  password: true,
                                  controller: vm.passwordController,
                                ),
                                SizedBox(
                                  height: 50.0,
                                ),
                                FoodWithLoveButton.bordered(
                                  value: 'Login',
                                  borderRadius: 10.0,
                                  textStyle: TextStyle(
                                    color: kcPrimaryColor,
                                  ),
                                  onPressed: () {
                                    removeFocus(context);
                                    vm.loginUser();
                                  },
                                ),
                                SizedBox(
                                  height: 40.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FoodWithLoveText.body('or, login with...'),
                                  ],
                                ),
                                SizedBox(
                                  height: 40.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                        child: FoodWithLoveButton.bordered(
                                          icon: CachedNetworkImage(
                                            imageUrl:
                                                'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/2048px-Google_%22G%22_Logo.svg.png',
                                            width: 20.0,
                                            height: 20.0,
                                          ),
                                          borderRadius: 15.0,
                                          borderColor: kcLightGreyColor,
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 15.0,
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20.0,
                                      ),
                                      Expanded(
                                        child: FoodWithLoveButton.bordered(
                                          icon: CachedNetworkImage(
                                            imageUrl:
                                                'https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Facebook_f_logo_%282019%29.svg/1365px-Facebook_f_logo_%282019%29.svg.png',
                                            width: 20.0,
                                            height: 20.0,
                                          ),
                                          borderRadius: 15.0,
                                          borderColor: kcLightGreyColor,
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 15.0,
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20.0,
                                      ),
                                      Expanded(
                                        child: FoodWithLoveButton.bordered(
                                          icon: CachedNetworkImage(
                                            imageUrl:
                                                'https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Octicons-mark-github.svg/2048px-Octicons-mark-github.svg.png',
                                            width: 20.0,
                                            height: 20.0,
                                          ),
                                          borderRadius: 15.0,
                                          borderColor: kcLightGreyColor,
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 15.0,
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 50.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FoodWithLoveText.body(
                                      'New to FoodWithLove ?',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: kcGreyColor,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => SignUpScreen(),
                                        ),
                                      ),
                                      child: FoodWithLoveText.body(
                                        ' Create Account.',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: kcPrimaryColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 50.0,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }

  Widget _bannerBuilder() {
    return Container(
      height: 300.0,
      decoration: BoxDecoration(
        color: kcExtraLightGreyColor.withOpacity(0.3),
      ),
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Image.asset('assets/images/cooking2.png'),
      ),
    );
  }

  void removeFocus(final BuildContext context) {
    FocusScope.of(context).unfocus();
  }
}
