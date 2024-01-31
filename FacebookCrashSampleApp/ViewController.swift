import FacebookCore
import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .green
        
        // ❌ CRASH
        // `AppEvents.Name` is defined as `NSString` (bridged to `String`)
        let event = AppEvents.Name("Exclude Exercises Did Load")
        
        trackEvent(name: event)
    }
    
    func trackEvent<E: RawRepresentable>(name: E) where E.RawValue == String { }
    
    // ✅ Uncomment to fix the crash
//    func trackEvent(name: AppEvents.Name) { }
}
