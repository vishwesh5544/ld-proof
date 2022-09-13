class Feature {
  String imagePath;
  String label;

  Feature({required this.imagePath, required this.label});
}

List<Feature> featuresList = [
  Feature(imagePath: 'assets/icons/landing_page/Group_2723.png', label: 'Track Multiple Blockchain Accounts'),
  Feature(imagePath: 'assets/icons/landing_page/Group_2722.png', label: 'Super Realtime'),
  Feature(imagePath: 'assets/icons/landing_page/DeFi.png', label: 'Analye DeFi Protocols'),
  Feature(imagePath: 'assets/icons/landing_page/0Xexd...png', label: 'Labeled Wallets'),
  Feature(imagePath: 'assets/icons/landing_page/uim_process.png', label: 'DEX Integration')
];
