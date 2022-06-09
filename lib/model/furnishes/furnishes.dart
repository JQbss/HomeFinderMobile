class Furnishes{
  final bool? isDesk;
  final bool? isTeapot;
  final bool? isEspressoMaker;
  final bool? isArmchair;
  final bool? isSofa;
  final bool? isCommode;
  final bool? isChairs;
  final bool? isStove;
  final bool? isTableLamp;
  final bool? isRefrigerator;
  final bool? isBed;
  final bool? isMicrowave;
  final bool? isVacuum;
  final bool? isOven;
  final bool? isWindowShade;
  final bool? isBedsideTable;
  final bool? isTable;
  final bool? isWardrobe;
  final bool? isTV;
  final bool? isBathtub;
  final bool? isDishwasher;
  final bool? isIron;


  Furnishes({this.isArmchair, this.isBathtub, this.isBed, this.isBedsideTable,
  this.isChairs, this.isCommode, this.isDesk, this.isDishwasher, this.isEspressoMaker,
  this.isIron, this.isMicrowave, this.isOven, this.isTable,
  this.isRefrigerator, this.isSofa, this.isStove, this.isTableLamp, this.isTeapot, this.isTV,
  this.isVacuum, this.isWardrobe, this.isWindowShade});

  Furnishes.fromJson(Map<dynamic,dynamic> json)
  : isDesk = json['isDesk'],
    isTeapot = json['isTeapot'],
    isEspressoMaker = json['isEspressoMaker'],
    isArmchair = json['isArmchair'],
    isSofa = json['isSofa'],
    isCommode = json['isCommode'],
    isChairs = json['isChairs'],
    isStove = json['isStove'],
    isTableLamp = json['isTableLamp'],
    isRefrigerator = json['isRefrigerator'],
    isBed = json['isBed'],
    isMicrowave = json['isMicrowave'],
    isVacuum = json['isVacuum'],
    isOven = json['isOven'],
    isWindowShade = json['isWindowShade'],
    isBedsideTable = json['isBedsideTable'],
    isTable = json['isTable'],
    isWardrobe = json['isWardrobe'],
    isTV = json['isTV'],
    isBathtub = json['isBathtub'],
    isDishwasher = json['isDishwasher'],
    isIron = json['isIron'];

  Map<dynamic,dynamic> toJson() => <dynamic,dynamic>{
    'isDesk':isDesk,
    'isTeapot':isTeapot,
    'isEspressoMaker':isEspressoMaker,
    'isArmchair':isArmchair,
    'isSofa':isSofa,
    'isCommode':isCommode,
    'isChairs':isChairs,
    'isStove':isStove,
    'isTableLamp':isTableLamp,
    'isRefrigerator':isRefrigerator,
    'isBed':isBed,
    'isMicrowave':isMicrowave,
    'isVacuum':isVacuum,
    'isOven':isOven,
    'isWindowShade':isWindowShade,
    'isBedsideTable':isBedsideTable,
    'isTable':isTable,
    'isWardrobe':isWardrobe,
    'isTV':isTV,
    'isBathtub':isBathtub,
    'isDishwasher':isDishwasher,
    'isIron':isIron,

  };

}