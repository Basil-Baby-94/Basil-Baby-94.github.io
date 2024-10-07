class Project {
  final String banner;
  final String icon;
  final String title;
  final String description;
  final String link;

  const Project({
    required this.banner,
    required this.icon,
    required this.title,
    required this.description,
    required this.link,
  });
}

final List<Project> projects = [
  const Project(
    banner: "assets/projects/upcomer.png",
    icon: "assets/projects/icon-upcomer.png",
    title: "Upcomer",
    description:
        "Upcomer brings you the most comprehensive esports app on the planet! Follow your favorite players, teams and events with live stats, fantasy leagues, community pages and coverage from some of the best esports writers in your favorite games.",
    link: "https://upcomer.com/",
  ),
  const Project(
    banner: "assets/projects/lifemd.png",
    icon: "assets/projects/icon-lifemd.png",
    title: "LifeMD",
    description:
        "Access a new kind of healthcare with LifeMD. LifeMD offers the best virtual healthcare, at the best price, from the best medical providers.",
    link: "https://apps.apple.com/us/app/lifemd/id1584079757",
  ),
  const Project(
    banner: "assets/projects/telehealings.png",
    icon: "assets/projects/icon-telehealings.png",
    title: "Telehealings",
    description:
        "This app facilitates the patients to share details, details of images of changes to registered clinics your skin, eyes, or body as part of a medical teleconsultation.",
    link: "https://play.google.com/store/apps/details?id=com.telehealings",
  ),
  const Project(
    banner: "assets/projects/cascade.png",
    icon: "assets/projects/icon-cascade.png",
    title: "CascadeMD",
    description:
        "With CascadMD's mobile and web apps, a healthcare provider can dictate the entire patient visit on their device of choice including tablets and mobile phones.",
    link: "https://apps.apple.com/ie/app/cascademd/id1563681802",
  ),
  const Project(
    banner: "assets/projects/doukani.png",
    icon: "assets/projects/icon-doukani.png",
    title: "Doukani",
    description:
        "Doukani.com is a full-fledged vendor/ retail stores based e-commerce service. Now will get to have a better shopping experience from our 100 plus online stores. All new products at the best prices!",
    link: "https://play.google.com/store/apps/details?id=com.doukani.doukani",
  ),
  const Project(
    banner: "assets/projects/sales.png",
    icon: "assets/projects/icon-sales.png",
    title: "Sales Platform",
    description:
        "This app is for the users of vistas global to foster and manage a culture of sales and revenue generation. This system is capable of providing actionable insights to make key decisions to boost sales and revenue at any given time.",
    link: "https://vistasglobal.com/",
  ),
  const Project(
    banner: "assets/projects/salus.png",
    icon: "assets/projects/icon-salus.png",
    title: "Salus",
    description:
        "Salus is a revolutionary technology solution developed for HSSEQ (Health, Safety, Security, Environmental and Quality) management across any industry.",
    link: "https://play.google.com/store/apps/details?id=com.ajax.salus2_0",
  ),
  const Project(
    banner: "assets/projects/klosa.png",
    icon: "assets/projects/klosa_icon.png",
    title: "Klosa Dance",
    description:
        "Learn new dances from world famous artists with the AI showing you exactly how you are doing. The AI evaluates your entire body for position and timing throughout the dance and helps all dancers get to the next level.",
    link: "https://apps.apple.com/us/app/klosa-dance/id1632566650",
  ),
  const Project(
    banner: "assets/projects/clear_image.png",
    icon: "assets/projects/clear_image_icon.png",
    title: "Clear Image AI",
    description:
        "This project encompasses the development of multiple mobile applications designed to provide fast and cost-effective automated data annotation services for AI projects. Each app is tailored to streamline the data annotation process while incorporating Bluetooth technology for efficient hardware communication.",
    link: "https://clearimageai.com/",
  )
];
