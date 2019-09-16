import Foundation
import FileSugar
import JSONSugar
/**
 * Data
 */
extension PaginationService {
   /**
    * Simulate a pagination call for a specified range of data (get file content)
    */
   public class func getItems(index: Int, length: Int, complete: @escaping GetItemsComplete) {  // we might have to use a method to be able to use T
      DispatchQueue.global(qos: .background).async {
         sleep(UInt32(networkLatency.randomElement()!)) // sleep between 1 and 4 secs to simulate network call
         guard index < items.count else { complete(false, []); return } // index out of bound, return false
         let min = Swift.min(index + length, items.count)
         let range = (index..<min)
         let retVal = Array(items[range])
         complete(true, retVal)
      }
   }
   /**
    * Returns
    * - Abstract: gets json from local file and converts it into an array
    */
   /*open*/ class func getItems(filePath: String) -> [T] {
      //      Swift.print("getItems(filePath)")
      guard let jsonStr: String = try? String(contentsOfFile: filePath, encoding: .utf8) as String else { Swift.print("no json at filepath"); return [] }
      return getItems(str: jsonStr)
   }
   /**
    * Returns playlist data for json string
    */
   /*open*/ class func getItems(str: String) -> [T] {
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
