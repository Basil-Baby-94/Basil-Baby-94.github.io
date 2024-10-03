import 'package:flutter/material.dart';

class Project {
  final String banner;
  final String icon;
  final String title;
  final String description;
  final String link;
  final Color color;

  const Project({
    required this.banner,
    required this.icon,
    required this.title,
    required this.description,
    required this.link,
    required this.color,
  });
}

final List<Project> projects = [
  const Project(
    banner: "assets/projects/upcomer.png",
    icon: "assets/projects/icon-upcomer.png",
    title: "Upcomer",
    description:
        "Upcomer brings you the most comprehensive esports app on the planet! Follow your favorite players, teams and events with live stats, fantasy leagues, community pages and coverage from some of the best esports writers in your favorite games.",
    link: "https://play.google.com/store/apps/details?id=com.upcomer",
    color: Colors.blue,
  ),
  const Project(
    banner: "assets/projects/lifemd.png",
    icon: "assets/projects/icon-lifemd.png",
    title: "LifeMD",
    description:
        "Access a new kind of healthcare with LifeMD. LifeMD offers the best virtual healthcare, at the best price, from the best medical providers.",
    link: "https://play.google.com/store/apps/details?id=com.lifemd.care",
    color: Colors.green,
  ),
  const Project(
    banner: "assets/projects/telehealings.png",
    icon: "assets/projects/icon-telehealings.png",
    title: "Telehealings",
    description:
        "This app facilitates the patients to share details, details of images of changes to registered clinics your skin, eyes, or body as part of a medical teleconsultation.",
    link: "https://play.google.com/store/apps/details?id=com.telehealings",
    color: Colors.orange,
  ),
  const Project(
    banner: "assets/projects/cascade.png",
    icon: "assets/projects/icon-cascade.png",
    title: "CascadeMD",
    description:
        "With CascadMD's mobile and web apps, a healthcare provider can dictate the entire patient visit on their device of choice including tablets and mobile phones.",
    link:
        "https://play.google.com/store/apps/details?id=com.cascademd.cascademd",
    color: Colors.purple,
  ),
  const Project(
    banner: "assets/projects/doukani.png",
    icon: "assets/projects/icon-doukani.png",
    title: "Doukani",
    description:
        "Doukani.com is a full-fledged vendor/ retail stores based e-commerce service. Now will get to have a better shopping experience from our 100 plus online stores. All new products at the best prices!",
    link: "https://play.google.com/store/apps/details?id=com.doukani.doukani",
    color: Colors.red,
  ),
  const Project(
    banner: "assets/projects/sales.png",
    icon: "assets/projects/icon-sales.png",
    title: "Sales Platform",
    description:
        "This app is for the users of vistas global to foster and manage a culture of sales and revenue generation. This system is capable of providing actionable insights to make key decisions to boost sales and revenue at any given time.",
    link:
        "https://play.google.com/store/apps/details?id=com.vistas.salesplatform",
    color: Colors.teal,
  ),
  const Project(
    banner: "assets/projects/salus.png",
    icon: "assets/projects/icon-salus.png",
    title: "Salus",
    description:
        "Salus is a revolutionary technology solution developed for HSSEQ (Health, Safety, Security, Environmental and Quality) management across any industry.",
    link: "https://play.google.com/store/apps/details?id=com.ajax.salus2_0",
    color: Colors.indigo,
  ),
];
