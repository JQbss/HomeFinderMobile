enum TypesOfBuilding{
  multifamilyResidential,
  tenement,
  detachedHouse,
  terraced,
  apartment,
  loft,
  another
}

final buildingTypes=["blok", "kamienica", "dom wolnostojący", "szeregowiec", "apartamentowiec", "loft", "pozostałe"];

List<String> listOfBuildingTypes(){
  return buildingTypes;
}

String getBuildingType(int index){
  return buildingTypes[index];
}