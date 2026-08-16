import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/widgets/glass_button.dart';
import '../../../core/widgets/glass_container.dart';
import '../../../core/widgets/glass_input.dart';
import '../services/contact_service.dart';

class ContactForm extends StatefulWidget {
  final ContactService contactService;

  const ContactForm({super.key, required this.contactService});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  bool _isSubmitting = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSubmitting = true);

    final success = await widget.contactService.sendContactMessage(
      name: _nameController.text.trim(),
      email: _emailController.text.trim(),
      message: _messageController.text.trim(),
    );

    if (!mounted) return;

    setState(() => _isSubmitting = false);

    if (success) {
      _nameController.clear();
      _emailController.clear();
      _messageController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.bgSurface,
          content: Row(
            children: const [
              Icon(Icons.check_circle_rounded, color: AppColors.accentIndigo),
              SizedBox(width: 12),
              Text(
                "Message sent successfully! I'll get back to you soon.",
                style: TextStyle(color: AppColors.textPrimary),
              ),
            ],
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.bgSurface,
          content: Row(
            children: const [
              Icon(Icons.error_outline_rounded, color: Colors.redAccent),
              SizedBox(width: 12),
              Text(
                "Failed to send message. Please try again or email directly.",
                style: TextStyle(color: AppColors.textPrimary),
              ),
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      padding: const EdgeInsets.all(24),
      borderRadius: 14,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GlassInput(
              label: "YOUR NAME",
              hint: "Enter your full name...",
              controller: _nameController,
              validator: (val) {
                if (val == null || val.trim().isEmpty) {
                  return "Please enter your name";
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            GlassInput(
              label: "YOUR EMAIL",
              hint: "name@company.com",
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (val) {
                if (val == null || val.trim().isEmpty) {
                  return "Please enter your email";
                }
                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(val)) {
                  return "Please enter a valid email address";
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            GlassInput(
              label: "YOUR MESSAGE",
              hint: "Describe your project or inquiry...",
              controller: _messageController,
              maxLines: 4,
              validator: (val) {
                if (val == null || val.trim().isEmpty) {
                  return "Please enter your message";
                }
                if (val.trim().length < 10) {
                  return "Message must be at least 10 characters long";
                }
                return null;
              },
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: _isSubmitting
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.accentPurple,
                      ),
                    )
                  : GlassButton(
                      text: AppStrings.sendMessage,
                      icon: Icons.send_rounded,
                      isPrimary: true,
                      onPressed: _handleSubmit,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
