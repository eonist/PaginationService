import UIKit
import PaginationServiceiOS

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
   lazy var window: UIWindow? = {
      let win = UIWindow(frame: UIScreen.main.bounds)
      let vc = MainVC()
      win.rootViewController = vc
      win.makeKeyAndVisible()/*Important since we have no Main storyboard anymore*/
      return win
   }()
   func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      _ = window
      return true
   }
}
class MainVC: UIViewController {
   override func viewDidLoad() {
      super.viewDidLoad()
      view = MainView()
      view.backgroundColor = .orange
      
//      let a = A<Int>()
//      let a = A<Int>.test()
//      Swift.print("a:  \(a)")
//      a.data = 2//2
      
//
      _ = {
         let items: [Track] = TrackPaginationService.items
         Swift.print("items.count:  \(items.count)")
         items.forEach { Swift.print("\($0.artistName)") }
      }
      
      _ = {
         let b = CustomPaginationService2.items
         b.forEach { Swift.print("\($0)") }
         Swift.print("b:  \(b.count)")
      }
      
//      CustomPaginationService2.getItems(index: 0, length: 50) { success, tracks in Swift.print("success: \(success) \(tracks.count)") }
      CustomPaginationService2.getItems(index: 120, length: 50) { success, tracks in Swift.print("success: \(success) \(tracks.count)") } // 30
//      _ = {
//         let items: [String] = PaginationService.items
//         Swift.print("items.count:  \(items.count)")
//         items.forEach { Swift.print("$0:  \($0)") }
//      }
   }
   override var prefersStatusBarHidden: Bool { return false }
}
class MainView: UIView { }
