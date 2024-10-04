import 'package:basilbaby/core/app_constants.dart';
import 'package:basilbaby/models/social.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaIcon extends StatelessWidget {
  final Social data;

  const SocialMediaIcon({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 80,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: IconButton(
          icon: Image.network(
            data.iconUrl,
            color: Colors.black,
          ),
          onPressed: () => launchURL(data.linkUrl),
          hoverColor: kPrimaryColor,
        ),
      ),
    );
  }

  void launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
        mode: LaunchMode.externalApplication, // Use this mode for web
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
