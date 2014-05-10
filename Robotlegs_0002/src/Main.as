package {

import flash.display.Sprite;
import flash.events.Event;

public class Main extends Sprite {
    public function Main() {
        addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler, true);

        var view:View=new View();
        this.addChild(view);
    }

    private function addedToStageHandler(event:Event):void {
        if (event.target is View) {
            var viewMediator:ViewMediator = new ViewMediator();
            viewMediator.view = event.target as View;
            viewMediator.onRegister();
        }
    }
}
}
