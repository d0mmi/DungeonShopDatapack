import 'package:objd/core.dart';

class Offer{

  Item cost;
  Item result;
  int maxUses;

  Offer(this.cost, this.result,{this.maxUses}){
    if(maxUses == null) maxUses = 1000;
  }

  Map toMap() {

    return {
      "rewardExp": 0,
      "maxUses": this.maxUses,
      "buy": this.cost.getMap(),
      "sell": this.result.getMap(),
      "xp": 0
    };
  }

}

class Shop{

  String name;
  VillagerProfession profession;
  List<Offer> offers;
  int level;

  Shop(this.offers, {this.profession,this.name,this.level}){
    if(profession == null) profession = VillagerProfession.unemployed;
    if(name == null) name = "Shop";
    if(level == null) level = 1;
  }

  Summon getSummon(){
    var nbtOffers = [];

    for(var offer in offers){
      nbtOffers.add(offer.toMap());
    }
    Map<String,dynamic> nbt = {
      "VillagerData": {
        "profession": profession.toString(),
        "level": this.level
        },
      "Offers": {
        "Recipes": nbtOffers
        }
    };

    return Summon(EntityType.villager,name: TextComponent(this.name),nameVisible: true,location: Location.rel(),nbt: nbt,invulnerable: true,noAI: true);
  }


}

class VillagerProfession{

  static VillagerProfession niwit = VillagerProfession("minecraft:niwit", Block.air);
  static VillagerProfession unemployed = VillagerProfession("minecraft:unemployed", Block.air);
  static VillagerProfession farmer = VillagerProfession("minecraft:farmer", Block.composter);
  static VillagerProfession fisherman = VillagerProfession("minecraft:fisherman", Block.barrel);
  static VillagerProfession shepherd = VillagerProfession("minecraft:shepherd", Block.loom);
  static VillagerProfession fletcher = VillagerProfession("minecraft:fletcher", Block.fletching_table);
  static VillagerProfession cleric = VillagerProfession("minecraft:cleric", Block.brewing_stand);
  static VillagerProfession weaponsmith = VillagerProfession("minecraft:weaponsmith", Block.grindstone);
  static VillagerProfession armorer = VillagerProfession("minecraft:armorer", Block.blast_furnace);
  static VillagerProfession toolsmith = VillagerProfession("minecraft:toolsmith", Block.smithing_table);
  static VillagerProfession librarian = VillagerProfession("minecraft:librarian", Block.lectern);
  static VillagerProfession cartographer = VillagerProfession("minecraft:cartographer", Block.cartography_table);
  static VillagerProfession leatherworker = VillagerProfession("minecraft:leatherworker", Block.cauldron);
  static VillagerProfession butcher = VillagerProfession("minecraft:butcher", Block.smoker);
  static VillagerProfession mason = VillagerProfession("minecraft:mason", Block.stonecutter);
  static List<VillagerProfession> professions = [];

  final String profession;
  final Block workspace;
  VillagerProfession(this.profession,this.workspace){
    professions.add(this);
  }

  getProfessionName(){
    return profession.toString().substring(10);
  }

  @override
    String toString() {
      return profession;
    }
}