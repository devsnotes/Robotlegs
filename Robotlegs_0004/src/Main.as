package {

import flash.display.Sprite;
import flash.events.Event;
import flash.utils.Dictionary;
import flash.utils.describeType;
import flash.utils.getDefinitionByName;
import flash.utils.getQualifiedClassName;

public class Main extends Sprite {
    private var _mediatorMap:Dictionary;
    private var _injectorMap:Dictionary;


    public function Main() {
        addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler, true);

        _mediatorMap = new Dictionary();
        _mediatorMap[View]=ViewMediator;


        _injectorMap = new Dictionary();
        _injectorMap[String]="Hello, World";        // String -> "Hello, World"

        var view:View = new View();
        this.addChild(view);
    }

    private function addedToStageHandler(event:Event):void {
        var target:Object = event.target;

        var qualifiedClassName:String = getQualifiedClassName(target);
        var definitionByName:Object = getDefinitionByName(qualifiedClassName);
        var mediatorClass:* = _mediatorMap[definitionByName];
        _injectorMap[definitionByName] = target;    //View -> view

        if (mediatorClass) {
            var mediator:*=new mediatorClass;
            var mediatorDescription:XML = describeType(mediator);
            trace(mediatorDescription.toString());

            for each(var variable:XML in mediatorDescription.variable) {
                if (variable.metadata[0].@name=="Inject") {
                    mediator[variable.@name] = _injectorMap[getDefinitionByName(variable.@type)];
                }
            }
            mediator.onRegister();
        }

    }
}
}
