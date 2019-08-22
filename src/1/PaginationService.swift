import Foundation
import FileSugar
import JSONSugar

open class PaginationService: PaginationServiceKind {
   public typealias T = String
   open class var networkLatency: Range<Int> { return (1..<4) } // general network response time
   open class var filePath: String { return Bundle.main.resourcePath! + "/assets.bundle/items.json" } // the resources to load from
   public static var _items: [T]? // caches the parsed items
   open class var items: [T] { // loads from file if items is not stored in cache yet
      if let _items = _items {
         return _items
      } else {
         let items: [T] = PaginationHelper.getItems(filePath: filePath)
         _items = items // store in cache
         return items
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
/**
 * Data
 */
//extension PaginationService {
//
//}

open class PaginationHelper<T: Decodable> {
   /**
    * Returns
    * - Abstract: gets json from local file and converts it into an array
    */
   open class func getItems(filePath: String) -> [T] {
      //      Swift.print("getItems(filePath)")
      guard let jsonStr: String = try? String(contentsOfFile: filePath, encoding: .utf8) as String else { Swift.print("no json at filepath"); return [] }
      return getItems(str: jsonStr)
   }
   /**
    * Returns playlist data for json string
    */
   open class func getItems(str: String) -> [T] {
      //      Swift.print("getItems(str)")
      guard let jsonData = str.data(using: .utf8) else { fatalError("unable to convert string to data") }
      do {
         guard let items: [T] = try decode(data: jsonData) else { print("unable to decode"); return [] }//From json to struct {
         //playlistCellData.forEach { Swift.print("$0.artistName:  \($0.artistName) $0.songTitle:  \($0.songTitle)") }
         return items // return result
      } catch let jsonErr {
         print("Error serializing json", jsonErr)
         return [] // return empty array
      }
   }
}
