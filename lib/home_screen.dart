import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation_bloc/bloc/sign_in_bloc.dart';
import 'package:form_validation_bloc/bloc/sign_in_event.dart';
import 'package:form_validation_bloc/bloc/sign_in_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Validation'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                if (state is SignInErrorState) {
                  return Text(
                    state.errorMessage,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 21,
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) {
                BlocProvider.of<SignInBloc>(context).add(
                  SignInTextChangeEvent(
                    _emailController.text,
                    _passwordController.text,
                  ),
                );
              },
              controller: _emailController,
              decoration: const InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) {
                BlocProvider.of<SignInBloc>(context).add(
                  SignInTextChangeEvent(
                    _emailController.text,
                    _passwordController.text,
                  ),
                );
              },
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  if (state is SignInLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: (state is SignInValidState)
                            ? Colors.blue
                            : Colors.grey,
                        shape: const StadiumBorder(),
                      ),
                      onPressed: () {
                        if (state is SignInValidState) {
                          BlocProvider.of<SignInBloc>(context)
                              .add(SignInTextSubmittedEvent());
                        }
                      },
                      child: const Text(
                        'Sign up',
                      ),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
