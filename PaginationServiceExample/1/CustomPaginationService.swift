import UIKit
import PaginationServiceiOS

open class CustomPaginationService: PaginationService {
   public typealias T = Track
   override open class var filePath: String { return Bundle.main.resourcePath! + "/assets.bundle/tracks.json" } // the resources to load from
//   class func tracks() -> [Track] {
//      return super.items()
//   }
//   override open class var items: [String] {
//      return ["a", "b", "c"]
//   }
   public static var _tracks: [Track]? // caches the parsed items
//   open class var tracks: [Track] { // loads from file if items is not stored in cache yet
//      if let _tracks = _tracks {
//         return _tracks
//      } else {
//         let tracks: [Track] = PaginationHelper.getItems(filePath: filePath)
//         _tracks = tracks // store in cache
//         return tracks
//      }
//   }
   
}
extension CustomPaginationService {
   
}
public struct Track: Codable {
   let artistName: String
   let songTitle: String
}
