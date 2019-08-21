# PaginationService

<img width="240" alt="img" src="pagination.gif?raw=true">

### What is it
A framework for mocking pagination calls.

### How do I get it
- Carthage `github "eonist/PaginationService"`
- Manual Open `.xcodeproj`

### Example:
```swift
PaginationService.getItems(index: 20, length: 50) { success, items in Swift.print("success: \(success) \(items.count)") } // 30
```
