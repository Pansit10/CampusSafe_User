import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/primary_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final key = GlobalKey<FormState>();
  final password = TextEditingController();
  String? valid(String? v) => v == null || v.isEmpty ? 'Required' : null;
  @override
  void dispose() {
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(),
    body: SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: key,
          child: Column(
            children: [
              const CircleAvatar(
                radius: 30,
                child: Icon(Icons.person_add_alt_1),
              ),
              const SizedBox(height: 16),
              Text(
                'Create account',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text('Join CampusSafe to stay protected'),
              const SizedBox(height: 24),
              AppTextField(
                label: 'Full name',
                hint: 'Juan Dela Cruz',
                icon: Icons.person_outline,
                validator: valid,
              ),
              const SizedBox(height: 12),
              AppTextField(
                label: 'Email address',
                hint: 'student@university.edu',
                icon: Icons.mail_outline,
                validator: valid,
              ),
              const SizedBox(height: 12),
              AppTextField(
                label: 'Phone number',
                hint: '0912 345 6789',
                icon: Icons.phone_outlined,
                validator: valid,
              ),
              const SizedBox(height: 12),
              AppTextField(
                label: 'Password',
                hint: 'Create a password',
                icon: Icons.lock_outline,
                obscureText: true,
                controller: password,
                validator: valid,
              ),
              const SizedBox(height: 12),
              AppTextField(
                label: 'Confirm password',
                hint: 'Repeat password',
                icon: Icons.lock_outline,
                obscureText: true,
                validator: (v) =>
                    v != password.text ? 'Passwords do not match' : valid(v),
              ),
              const SizedBox(height: 22),
              PrimaryButton(
                label: 'Create account',
                onPressed: () {
                  if (key.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Account created')),
                    );
                    Navigator.pushReplacementNamed(context, AppRoutes.login);
                  }
                },
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Already registered? Sign in'),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
