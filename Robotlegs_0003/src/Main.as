package {

import flash.display.Sprite;
import flash.events.Event;
import flash.utils.Dictionary;
import flash.utils.getDefinitionByName;
import flash.utils.getQualifiedClassName;

public class Main extends Sprite {
    private var mediatorMap:Dictionary;

    public function Main() {
        addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler, true);

        mediatorMap = new Dictionary();
        mediatorMap[View]=ViewMediator;


        var view:View = new View();
        this.addChild(view);
    }

    private function addedToStageHandler(event:Event):void {
        var target:Object=event.target;
        var qualifiedClassName:String = getQualifiedClassName(target);
        var definitionByName:Object = getDefinitionByName(qualifiedClassName);
        var mediatorClass:* = mediatorMap[definitionByName];

        if (mediatorClass) {
            var mediator:* = new mediatorClass;
            mediator.view = target;
            mediator.onRegister();
        }
    }
}
}
