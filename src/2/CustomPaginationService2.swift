import Foundation
import FileSugar
import JSONSugar

/**
 * ## Examples:
 * CustomPaginationService.getItems(index: 0, length: 50) { success, tracks in Swift.print("success: \(success) \(tracks.count)") } //true, 50
 * CustomPaginationService.getItems(index: 120, length: 50) { success, tracks in Swift.print("success: \(success) \(tracks.count)") } //true, 30
 * CustomPaginationService.getItems(index: 160, length: 50) { success, tracks in Swift.print("success: \(success) \(tracks.count)") } //false, 0
 */
public class CustomPaginationService2: PaginationService2<String> {
   private static var __items: [String]? // the storage variable has to be in a non-generic class (concrete class)
   override public class var _items: [String]? { // Accessor to storage variable
      get { return __items }
      set { __items = newValue }
   }
}
