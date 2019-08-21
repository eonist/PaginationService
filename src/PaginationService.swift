import Foundation

open class PaginationService: PaginationServiceKind {
   public typealias T = String
   open class var networkLatency: Range<Int> { return (1..<4) }
   open class var filePath: String { return "resources/assets/items.json" }
   public static var _items: [T]?
   open class var items: [T] {
      if let _items = _items {
         return _items
      } else {
//         let fileContent: String = FileParser.fileContent(filePath: filePath)
//         let json = JsonParser.json(fileContent)// convert to json
//         let items: [T] = json.decode()// convert json to array
         return []
      }
   }
   /**
    * Simulate a pagination call for a specified range of data
    */
   public class func getItems(index: Int, length: Int, complete: GetItemsComplete) {  // we might have to use a method to be able to use T
      // get file content
      sleep(UInt32(networkLatency.randomElement()!)) // sleep between 1 and 4 secs to simulate network call
      guard index < items.count else { complete([], false); return } // index out of bound, return false
      let min = Swift.min(index + length, items.count)
      let range = (index..<min)
      let retVal = Array(items[range])
      complete(retVal, true)
   }
}
