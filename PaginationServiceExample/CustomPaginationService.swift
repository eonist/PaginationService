import UIKit
import PaginationServiceiOS

open class CustomPaginationService: PaginationService<String> {
   override open class var items: [String] {
      return ["a", "b", "c"]
   }
}
