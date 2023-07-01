**EXTENSION**

# `Foundation.Bundle`
```swift
extension Foundation.Bundle
```

## Properties
### `module`

```swift
static let module: Bundle = {
    let mainPath = Bundle.main.bundleURL.appendingPathComponent("PigeonApp_PigeonApp.bundle").path
    let buildPath = "/Users/david-swift/Documents/Code/PigeonApp/PigeonApp/.build/arm64-apple-macosx/debug/PigeonApp_PigeonApp.bundle"

    let preferredBundle = Bundle(path: mainPath)

    guard let bundle = preferredBundle ?? Bundle(path: buildPath) else {
        fatalError("could not load resource bundle: from \(mainPath) or \(buildPath)")
    }

    return bundle
}()
```
