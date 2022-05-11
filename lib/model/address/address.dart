class Address{
  final String? wojewodztwo;
  final String? powiat;
  final String? miejscowosc;
  final String? gmina;
  final String? kodPocztowy;
  final String? ulica;
  final String? numerDomu;
  final String? numerMieszkania;

  Address({this.wojewodztwo, this.powiat, this.miejscowosc, this.gmina,
      this.kodPocztowy, this.ulica, this.numerDomu, this.numerMieszkania});


  Address.fromJson(Map<dynamic,dynamic> json)
  : wojewodztwo = json['wojewodztwo'],
    powiat = json['powiat'],
    miejscowosc = json['miejscowosc'],
    gmina = json['gmina'],
    kodPocztowy = json['kod_pocztowy'],
    ulica = json['ulica'],
    numerDomu = json['numer_domu'],
    numerMieszkania = json['numer_mieszkania'];

  Map<dynamic,dynamic> toJson() => <dynamic,dynamic>{
    'wojewodztwo':wojewodztwo,
    'powiat':powiat,
    'miejscowosc':miejscowosc,
    'gmina':gmina,
    'kod_pocztowy':kodPocztowy,
    'ulica':ulica,
    'numer_domu':numerDomu,
    'numer_mieszkania':numerMieszkania,
  };

}