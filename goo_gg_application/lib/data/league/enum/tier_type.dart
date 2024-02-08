enum TierType {
  iron('Rank=Iron'),
  bronze('Rank=Bronze'),
  silver('Rank=Silver'),
  gold('Rank=Gold'),
  platinum('Rank=Platinum'),
  emerald('Rank=Emerald'),
  diamond('Rank=Diamond'),
  master('Rank=Master'),
  grandMaster('Rank=Grandmaster'),
  challenger('Rank=Challenger'),
  ;

  final String assetUrl;

  const TierType(this.assetUrl);
}