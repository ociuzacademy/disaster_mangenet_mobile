import 'package:disaster_management/modules/Sos_Update/bloc/sosupdate_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../widgets/textfiled.dart';

class SosUpdatePage extends StatefulWidget {
  const SosUpdatePage({super.key});

  @override
  State<SosUpdatePage> createState() => _SosUpdatePageState();
}

class _SosUpdatePageState extends State<SosUpdatePage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController secondaryEmailController =
      TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('SOS Update'),
      ),
      body: BlocListener<SosupdateBloc, SosupdateState>(
        listener: (context, state) {
          state.when(
            initial: () {
              setState(() => isLoading = false);
            },
            loading: () {
              setState(() => isLoading = true);
            },
            success: (response) {
              setState(() => isLoading = false);
              if (response.status == "Emergency email successfully updated") {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("SOS email updated successfully!"),
                  ),
                );
              }
            },
            error: (error) {
              setState(() => isLoading = false);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Failed to update SOS: $error")),
              );
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Update SOS Information',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Please update your emergency contact details below:',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              TextFiledWidget(
                controller: emailController,
                labelText: 'Enter your email',
                obscureText: false,
              ),
              const SizedBox(height: 15),
              TextFiledWidget(
                controller: secondaryEmailController,
                labelText: 'Enter your second email',
                obscureText: false,
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: isLoading
                    ? null
                    : () {
                        _handleSosUpdate(
                            context, emailController, secondaryEmailController);
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Center(
                    child: isLoading
                        ? const CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          )
                        : const Text(
                            'Update',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleSosUpdate(
    BuildContext context,
    TextEditingController emailController,
    TextEditingController secondaryEmailController,
  ) {
    final email = emailController.text.trim();
    final secondaryEmail = secondaryEmailController.text.trim();

    if (email.isEmpty || secondaryEmail.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill out all fields.")),
      );
      return;
    }

    if (!_isValidEmail(email) || !_isValidEmail(secondaryEmail)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter valid email addresses.")),
      );
      return;
    }

    final sosupdateBloc = BlocProvider.of<SosupdateBloc>(context);
    sosupdateBloc.add(
      SosupdateEvent.stockLists(
        email: email,
        secondaryemail: secondaryEmail,
      ),
    );
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    return emailRegex.hasMatch(email);
  }
}
