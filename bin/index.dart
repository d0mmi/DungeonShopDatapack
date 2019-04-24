import 'package:objd/core.dart';
import './Shop.dart';
import './Trigger.dart';

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


    
      Shop([
        Offer(Item(ItemType.emerald,count: 1), Item(ItemType.book,count: 2)),
        Offer(Item(ItemType.emerald,count: 2), Item(ItemType.diamond,count: 3)),
        Offer(Item(ItemType.emerald,count: 3), Item(ItemType.enchanted_book,count: 4)),
      ], name: "Shop1",level: 2,profession: VillagerProfession.cleric);
      Shop([
        Offer(Item(ItemType.emerald,count: 1), Item(ItemType.book,count: 2)),
        Offer(Item(ItemType.emerald,count: 2), Item(ItemType.diamond,count: 3)),
        Offer(Item(ItemType.emerald,count: 3), Item(ItemType.enchanted_book,count: 4)),
      ], name: "Shop2",level: 2,profession: VillagerProfession.cleric);
      Shop([
        Offer(Item(ItemType.emerald,count: 1), Item(ItemType.book,count: 2)),
        Offer(Item(ItemType.emerald,count: 2), Item(ItemType.diamond,count: 3)),
        Offer(Item(ItemType.emerald,count: 3), Item(ItemType.enchanted_book,count: 4)),
      ], name: "Shop3",level: 2,profession: VillagerProfession.cleric);
      Shop([
        Offer(Item(ItemType.emerald,count: 1), Item(ItemType.book,count: 2)),
        Offer(Item(ItemType.emerald,count: 2), Item(ItemType.diamond,count: 3)),
        Offer(Item(ItemType.emerald,count: 3), Item(ItemType.enchanted_book,count: 4)),
      ], name: "Shop4",level: 2,profession: VillagerProfession.cleric);
      Shop([
        Offer(Item(ItemType.emerald,count: 1), Item(ItemType.book,count: 2)),
        Offer(Item(ItemType.emerald,count: 2), Item(ItemType.diamond,count: 3)),
        Offer(Item(ItemType.emerald,count: 3), Item(ItemType.enchanted_book,count: 4)),
      ], name: "Shop5",level: 2,profession: VillagerProfession.cleric);
      Shop([
        Offer(Item(ItemType.emerald,count: 1), Item(ItemType.book,count: 2)),
        Offer(Item(ItemType.emerald,count: 2), Item(ItemType.diamond,count: 3)),
        Offer(Item(ItemType.emerald,count: 3), Item(ItemType.enchanted_book,count: 4)),
      ], name: "Shop6",level: 2,profession: VillagerProfession.cleric);

  for(var i = 0; i < ShopType.types.length; i++){
    ShopType type = ShopType.types[i];
    TriggerCommands(type.toString(), [File.execute(path: "/shops/"+type.toString()+"/random",child: type.getRandomShop())]);
  }

  List<Widget> load = [];
  load.add(Scoreboard("RandomShop",addIntoLoad: false));
  load.add(TriggerCommands.getLoad());
  load.addAll([
        Tellraw(Entity.All(),show: [TextComponent("Dungeon Shop v0.1 by ",color: Color.Gold),TextComponent("D0mmi",color: Color.Aqua,clickEvent: TextClickEvent.open_url("https://github.com/d0mmi")),TextComponent(" Loaded!",color: Color.Gold)]),
        Tellraw(Entity.All(),show: [TextComponent("Submit Bugs or Suggestions ",color: Color.Gold),TextComponent("here!",color: Color.Aqua,clickEvent: TextClickEvent.open_url("https://github.com/d0mmi/DungeonShopDatapack/issues/new"))]),
      ]);

  return Pack(
		name: "dungeonshop",
    load: File(
      path: 'load',
      child: For.of(load)
    ),
    main: File(path: 'main',child: TriggerCommands.getMain())
	);
	}
}