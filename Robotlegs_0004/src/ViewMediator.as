/**
 * Created by unclejoe33 on 03.05.2014.
 */
package {
public class ViewMediator {
    [Inject]
    public var view:View;

    [Inject]
    public var message:String;

    public function onRegister():void {
        view.message = message;
        view.init();
    }
}
}
