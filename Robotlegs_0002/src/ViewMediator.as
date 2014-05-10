/**
 * Created by unclejoe33 on 03.05.2014.
 */
package {
public class ViewMediator {
    public var view:View;

    public function onRegister():void {
        view.message = "Hello, world!!!";
        view.init();
    }

}
}
