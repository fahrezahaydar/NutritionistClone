class SizePartner {
  final double mobile;
  final double desktop;

  const SizePartner(this.mobile, this.desktop);

  static SizePartner get homeHeroSubtitle => const SizePartner(18, 24);

  static SizePartner get mainPadding => const SizePartner(20, 80);
  static SizePartner get contentPadding => const SizePartner(30, 40);
}
