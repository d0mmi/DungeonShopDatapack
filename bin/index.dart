import 'package:objd/core.dart';
import './Shop.dart';

void main(){
	createProject(
		Project(
			name:"dungeonshop",
			target:"../",
			generate: DataPackWidget(),
      description: "{\"pack\": {\"pack_format\": 1, \"description\": \"Dungeon Shop Datapack by D0mmi\"}}"
		)
	);
}

class DataPackWidget extends Widget {

	@override
	Widget generate(Context context){
  return Pack(
		name: "dungeonshop",
    load: File(
      path: 'load',
      child: For.of([
        Tellraw(Entity.All(),show: [TextComponent("Dungeon Shop v0.1 by ",color: Color.Gold),TextComponent("D0mmi",color: Color.Aqua,clickEvent: TextClickEvent.open_url("https://github.com/d0mmi")),TextComponent(" Loaded!",color: Color.Gold)]),
        Tellraw(Entity.All(),show: [TextComponent("Submit Bugs or Suggestions ",color: Color.Gold),TextComponent("here!",color: Color.Aqua,clickEvent: TextClickEvent.open_url("https://github.com/d0mmi/TowerDefenseDatapack/issues/new"))]),
      ])
    ),
    files: [
      File(path: "/shop",child: Shop([
        Offer(Item(ItemType.emerald,count: 1), Item(ItemType.book,count: 2)),
        Offer(Item(ItemType.emerald,count: 2), Item(ItemType.diamond,count: 3)),
        Offer(Item(ItemType.emerald,count: 3), Item(ItemType.enchanted_book,count: 4)),
      ],name: "Test Shop",level: 2,profession: VillagerProfession.cleric).getSummon())
    ]
	);
	}
}