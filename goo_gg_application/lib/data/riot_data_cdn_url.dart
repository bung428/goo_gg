const base = 'http://ddragon.leagueoflegends.com';
const champion = 'champion';
const spell = 'spell';
const version = '14.2.1';

class DataCdnUrl {
  static String getChampionIconUrl(String? value) {
    if (value == null) return '';
    return '$base/cdn/$version/img/$champion/$value.png';
  }

  static String getSpellIconUrl(String? value) {
    if (value == null) return '';
    return '$base/cdn/$version/img/$spell/$value.png';
  }

  static String getItemIconUrl(String? value) {
    if (value == '0' || value == null) return '';
    return '$base/cdn/$version/img/item/$value.png';
  }

  static String getRuneIconUrl(String? value) {
    if (value == null) return '';
    return 'https://ddragon.canisback.com/img/$value';
  }
}