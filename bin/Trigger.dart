import 'package:objd/core.dart';

class TriggerCommands{
  static List<TriggerCommands> triggerlist = [];

  String name;
  List<Widget> actions;
  List<Widget> cmdsMain = [];
  List<Widget> cmdsLoad = [];

  TriggerCommands(this.name,this.actions){
    cmdsLoad.add(Scoreboard.trigger(name,addIntoLoad: false));
    actions.add(Command("/scoreboard players set @s "+name+" 0"));
    cmdsMain.addAll([
      Command("/scoreboard players enable @a "+name),
      If.not(Condition.score(Score(Entity.All(), name).matches(0)),assignTag: Entity.All(),Then: actions)
    ]);
    triggerlist.add(this);
  }

  
  static Widget getMain(){
    List<Widget> list = [];
    for (var trigger in triggerlist) {
      list.addAll(trigger.cmdsMain);
    }
    return For.of(list);
  }
  static Widget getLoad(){
    List<Widget> list = [];
    for (var trigger in triggerlist) {
      list.addAll(trigger.cmdsLoad);
    }
    return For.of(list);
  }

}