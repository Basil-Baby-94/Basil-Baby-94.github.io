import 'package:basilbaby/core/app_constants.dart';
import 'package:basilbaby/core/constants/strings.dart';
import 'package:basilbaby/models/social.dart';
import 'package:basilbaby/presentation/widgets/skills_background.dart';
import 'package:basilbaby/presentation/widgets/social_media_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [kGreen.withOpacity(0.4), Colors.black],
              ),
            ),
            child: SafeArea(
              child: Stack(
                children: [
                  AnimatedBackground(child: _buildProfileSection(context)),
                  // Bottom Left Button
                  Positioned(
                    bottom: 40,
                    left: 20,
                    child: _buildTrendyButton(
                        icon: Icons.person,
                        label: kSkills,
                        onPressed: () {
                          context.go("/skills");
                        }),
                  ),
                  // Bottom Right Button
                  Positioned(
                    bottom: 40,
                    right: 20,
                    child: _buildTrendyButton(
                        icon: Icons.settings,
                        label: kProjects,
                        onPressed: () {
                          context.go("/projects");
                        }),
                  ),
                ],
              ),
            )));
  }

  Widget _buildTrendyButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: kGreen.shade400.withOpacity(0.6),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: kGreen.shade400.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: kWhite),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: const TextStyle(
                      color: kWhite, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileSection(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            kName,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: kWhite,
            ),
          ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2, end: 0),
          const SizedBox(height: 10),
          const Text(
            kJobTitle,
            style: TextStyle(fontSize: 20, color: kWhite),
          ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2, end: 0),
          const SizedBox(height: 20),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: socialMediaAccounts
                .map((e) => SocialMediaIcon(data: e))
                .toList(),
          ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2, end: 0),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            icon: const Icon(Icons.timeline, size: 32),
            label: const Text(kTimeline, style: TextStyle(fontSize: 18)),
            style: ElevatedButton.styleFrom(
              foregroundColor: kWhite,
              backgroundColor: kWhite.withOpacity(0.3),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () {
              context.go('/timeline');
            },
          ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2, end: 0),
        ],
      ),
    );
  }
}
