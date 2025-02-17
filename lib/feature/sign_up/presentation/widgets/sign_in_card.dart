part of '../sign_up_presentation.dart';

class SignUpCard extends StatelessWidget {
  final String title;
  final Widget content;
  final VoidCallback onBackClick;

  const SignUpCard({
    super.key,
    required this.title,
    required this.content,
    required this.onBackClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: FloodingColor.white,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
              onTap: onBackClick,
              child: FloodingIcon.arrowLeft()
          ),
          const SizedBox(height: 60),
          _buildInputSection(),
        ],
      ),
    );
  }

  Widget _buildInputSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: FloodingTypography.body1SemiBold,
        ),
        const SizedBox(height: 36),
        content,
      ],
    );
  }
}
