import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    @IBOutlet var picker: WKInterfacePicker!
    var pickerItems: [WKPickerItem]!
    var currentItem: WKPickerItem!
    var tiposHapticos = [
        "Notificacion": WKHapticType.notification,
        "DireccionUp": WKHapticType.directionUp,
        "DireccionDown": WKHapticType.directionDown,
        "Exito": WKHapticType.success,
        "Fallo": WKHapticType.failure,
        "Reintentar": WKHapticType.retry,
        "Comenzar" : WKHapticType.start,
        "Parar": WKHapticType.stop,
        "Click": WKHapticType.click
    ]
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        pickerItems = []
        for tipo in tiposHapticos.keys {
            let pickerItem = WKPickerItem()
            pickerItem.title = tipo
            pickerItems.append(pickerItem)
        }
        
        picker.setItems(pickerItems)
        currentItem = pickerItems.first
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func metodoPicker(_ value: Int) {
        currentItem = pickerItems[value]
    }
    
    @IBAction func btnBoton() {
        let tipoHaptico = tiposHapticos[currentItem.title!]
        WKInterfaceDevice.current().play(tipoHaptico!)
    }
}
