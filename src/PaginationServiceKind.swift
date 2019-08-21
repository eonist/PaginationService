import Foundation

public protocol PaginationServiceKind {
   associatedtype T
   static var networkLatency: Range<Int> { get } // how much simulated random network delay there should be
   static var filePath: String { get } // resource file path to get data from
   static var _items: [T]? { get }
   static var items: [T] { get }
   static func getItems(index: Int, length: Int, complete: GetItemsComplete)
}
extension PaginationServiceKind {
     public typealias GetItemsComplete = (_ items: [T], _ success: Bool) -> Void
}
