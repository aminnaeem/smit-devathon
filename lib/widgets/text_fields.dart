import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter your email";
        }
        if (!value.contains("@")) {
          return "Please enter valid email";
        }
        return null;
      },
      controller: emailController,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: const InputDecoration(
        hintText: "Email",
        hintStyle: TextStyle(
          color: Colors.grey
        ),
        suffixIcon: Icon(Icons.email),
        suffixIconColor: Colors.grey,
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter your password";
        }
        if (value.length < 8) {
          return "Password must be of atleast 8 characters";
        }
        return null;
      },
      obscureText: !_isVisible,
      controller: widget.passwordController,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: InputDecoration(
        hintText: "Password",
        hintStyle: const TextStyle(
          color: Colors.grey
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _isVisible = !_isVisible;
            });
          },
          child: Icon(
            _isVisible ? Icons.visibility : Icons.visibility_off
          )
        
        ),
        suffixIconColor: Colors.grey
      ),
    );
  }
}

class ConfirmPasswordField extends StatefulWidget {
  const ConfirmPasswordField({
    super.key,
    required this.confirmPasswordController, required this.passwordController
  });

  final TextEditingController confirmPasswordController;
  final TextEditingController passwordController;

  @override
  State<ConfirmPasswordField> createState() => _ConfirmPasswordFieldState();
}

class _ConfirmPasswordFieldState extends State<ConfirmPasswordField> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter your password";
        }
        if (value != widget.passwordController.text) {
          return "Password and Confirm Password must be same";
        }
        return null;
      },
      obscureText: !_isVisible,
      controller: widget.confirmPasswordController,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: InputDecoration(
        hintText: "Confirm Password",
        hintStyle: const TextStyle(
          color: Colors.grey
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _isVisible = !_isVisible;
            });
          },
          child: Icon(
            _isVisible ? Icons.visibility : Icons.visibility_off
          )
        
        ),
        suffixIconColor: Colors.grey
      ),
    );
  }
}


class NameField extends StatelessWidget {
  const NameField({
    super.key,
    required this.nameController,
  });

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter your Name";
        }
        return null;
      },
      controller: nameController,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: const InputDecoration(
        hintText: "Full Name",
        hintStyle: TextStyle(
          color: Colors.grey
        ),
        suffixIcon: Icon(Icons.person),
        suffixIconColor: Colors.grey
      ),
    );
  }
}

class PhoneField extends StatelessWidget {
  const PhoneField({
    super.key,
    required this.phoneController,
  });

  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.numberWithOptions(),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter your Number";
        }
        return null;
      },
      controller: phoneController,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: const InputDecoration(
        hintText: "Phone",
        hintStyle: TextStyle(
          color: Colors.grey
        ),
        suffixIcon: Icon(Icons.phone),
        suffixIconColor: Colors.grey
      ),
    );
  }
}