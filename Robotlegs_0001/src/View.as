/**
 * Created by unclejoe33 on 03.05.2014.
 */
package {
import flash.display.Sprite;
import flash.text.TextField;

public class View extends Sprite {
    private var _message:String;
    private var _textField:TextField;

    public function View() {
        _textField = new TextField();
        this.addChild(_textField);
    }

    public function get message():String {
        return _message;
    }

    public function set message(value:String):void {
        _message = value;
    }

    public function init():void {
        _textField.text = this.message;
    }
}
}
