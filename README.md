# WebEngage iOS SDK

WebEngage iOS SDK distributed via Swift Package Manager (SPM). This package provides pre-built XCFrameworks for integrating WebEngage into your iOS application.

## Requirements

- iOS 13.0+
- Swift 5.8+
- Xcode 14.3+

## Installation

### Swift Package Manager

Add the package dependency in Xcode:

1. Go to **File → Add Package Dependencies...**
2. Enter the repository URL:
   ```
   https://github.com/anthropics/webengage-ios-sdk
   ```
3. Select the libraries you need from the available products.

Or add it to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/anthropics/webengage-ios-sdk", branch: "main")
]
```

## Available Libraries

| Library | Description | Dependencies |
|---|---|---|
| `WebEngageCore` | Core SDK — required for all WebEngage features | — |
| `WebEngageLocation` | Location tracking support | WebEngageCore |
| `WebEngagePersonalization` | In-app personalization | WebEngageCore |
| `WebEngageNotificationInbox` | Notification inbox | WebEngageCore |

Add only the libraries you need to your target:

```swift
.target(
    name: "YourApp",
    dependencies: [
        .product(name: "WebEngageCore", package: "webengage-ios-sdk"),
        .product(name: "WebEngageLocation", package: "webengage-ios-sdk"),       // optional
        .product(name: "WebEngagePersonalization", package: "webengage-ios-sdk"), // optional
        .product(name: "WebEngageNotificationInbox", package: "webengage-ios-sdk") // optional
    ]
)
```

## Project Structure

```
webengage-ios-sdk/
├── Package.swift                          # SPM package manifest
├── Sources/
│   ├── WELocationWrapper/                 # Wrapper linking WELocation + WebEngage
│   ├── WENotificationInboxWrapper/        # Wrapper linking WENotificationInbox + WebEngage
│   └── WEPersonalizationWrapper/          # Wrapper linking WEPersonalization + WebEngage
└── README.md
```

## Versioning

Each binary framework is independently versioned in `Package.swift` via dedicated variables:

```swift
let webEngageVersion = "beta-01"
let weLocationVersion = "beta-01"
let weNotificationInboxVersion = "beta-01"
let wePersonalizationVersion = "beta-01"
```

## License

This project is licensed under the Apache License 2.0 — see the [LICENSE](http://www.apache.org/licenses/LICENSE-2.0) for details.

Copyright (c) 2017 WebEngage
