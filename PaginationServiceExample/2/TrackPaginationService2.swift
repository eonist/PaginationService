import Foundation
import FileSugar
import JSONSugar
import PaginationServiceiOS

class TrackPaginationService: PaginationService2<Track>{
   override open class var filePath: String { return Bundle.main.resourcePath! + "/assets.bundle/tracks.json" } // the resources to load from
   static var __items: [Track]?
   override class var _items: [Track]? {
      get { return __items }
      set { __items = newValue }
   }
}
