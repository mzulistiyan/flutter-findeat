import 'package:flutter/material.dart';
import 'package:flutter_application_findeat/cubit/auth_cubit.dart';
import 'package:flutter_application_findeat/ui/pages/login_page.dart';
import 'package:flutter_application_findeat/ui/pages/main_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  TextEditingController rePasswordController = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffEEEDDE),
      body: Container(
        margin: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'FindEat!',
                style: GoogleFonts.poppins(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff203239),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Nama',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: const Color(0xff203239),
              ),
            ),
            TextFormField(
              controller: nameController,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Email',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: const Color(0xff203239),
              ),
            ),
            TextFormField(
              controller: emailController,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Password',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xff203239),
              ),
            ),
            TextFormField(
              obscureText: true,
              controller: passwordController,
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Text(
                  'Already have an account? ',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff203239),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () => Get.to(const LoginPage()),
                  child: Text(
                    'Log in here',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff217D83),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthSuccess) {
                  Get.to(MainPage());
                } else if (state is AuthFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(state.error),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is AuthLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Center(
                  child: Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Color(0xff203239),
                      ),
                      child: Center(
                          child: TextButton(
                        onPressed: () {
                          context.read<AuthCubit>().signUp(
                                email: emailController.text,
                                password: passwordController.text,
                                name: nameController.text,
                              );
                        },
                        child: Text(
                          'Register',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ))),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
