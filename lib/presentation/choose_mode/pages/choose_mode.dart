import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';
import 'package:spotify/core/config/assets/app_images.dart';
import 'package:spotify/core/config/assets/app_vectors.dart';
import 'package:spotify/core/config/theme/app_colors.dart';
import 'package:spotify/presentation/auth/pages/signup_or_signin.dart';
import 'package:spotify/presentation/choose_mode/bloc/theme_cubit.dart';

class ChooseModePage extends StatelessWidget {
  const ChooseModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(AppImages.chooseModeBG),
              ),
            ),
          ),
          Container(color: Colors.black.withValues(alpha: 0.15)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            child: SafeArea(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: SvgPicture.asset(AppVectors.logo),
                  ),
                  Spacer(),
                  const Text(
                    "Choose Mode",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.read<ThemeCubit>().updateTheme(
                                ThemeMode.dark,
                              );
                            },
                            child: ClipOval(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 15,
                                  sigmaY: 15,
                                ),
                                child: Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.1),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white.withValues(
                                        alpha: 0.2,
                                      ),
                                      width: 1.5,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withValues(
                                          alpha: 0.1,
                                        ),
                                        blurRadius: 10,
                                        spreadRadius: 2,
                                      ),
                                    ],
                                  ),
                                  child: SvgPicture.asset(
                                    AppVectors.moon,
                                    fit: BoxFit.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            "Dark Mode",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: AppColors.grey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 40),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.read<ThemeCubit>().updateTheme(
                                ThemeMode.light,
                              );
                            },
                            child: ClipOval(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 15,
                                  sigmaY: 15,
                                ),
                                child: Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.1),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white.withValues(
                                        alpha: 0.2,
                                      ),
                                      width: 1.5,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withValues(
                                          alpha: 0.1,
                                        ),
                                        blurRadius: 10,
                                        spreadRadius: 2,
                                      ),
                                    ],
                                  ),
                                  child: SvgPicture.asset(
                                    AppVectors.sun,
                                    fit: BoxFit.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            "Light Mode",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: AppColors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  BasicAppButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const SignupOrSigninPage(),
                        ),
                      );
                    },
                    title: "Continue",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
