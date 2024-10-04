class Social {
  final String iconUrl; // URL for the social media icon image
  final String linkUrl; // URL to the social media profile or page

  Social({
    required this.iconUrl,
    required this.linkUrl,
  });
}

final List<Social> socialMediaAccounts = [
  Social(
    iconUrl: 'https://img.icons8.com/material-rounded/384/ffffff/linkedin.png',
    linkUrl: 'https://www.linkedin.com/in/basilbaby94/',
  ),
  Social(
    iconUrl: 'https://img.icons8.com/material-rounded/384/ffffff/github.png',
    linkUrl: 'https://github.com/Basil-Baby-94',
  )
];
