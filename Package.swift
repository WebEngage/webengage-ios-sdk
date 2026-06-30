// swift-tools-version:5.8
// The swift-tools-version declares the minimum version of Swift required to
// build this package.

// Copyright (c) 2017 WebEngage
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.


import PackageDescription

let webEngageVersion = "7.0.0"
let webEngageChecksum = "599a1b9f39961b73d3d23c0ec7e7959442db28ea087ac9eaa15c71f499aad90c"

let weLocationVersion = "1.0.0"
let weLocationChecksum = "dedcd7640a880978b6b75676336507ead223f3669c5e6316e22653405c1487ad"

let weNotificationInboxVersion = "1.2.0"
let weNotificationInboxChecksum = "5e3fc4a85883162eb22f1f5abcb94fce1cfe95f1799a536fb4aeefdb5420a266"

let wePersonalizationVersion = "1.6.0"
let wePersonalizationChecksum = "5e4df96951b9f365c66c7fb46d1d5e23a36d7bb99f39ae7b0bc37f3c17f27dc7"

let package = Package(
    name: "webengage-ios-sdk",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "WebEngageCore", targets: ["WebEngage"]),
        .library(name: "WebEngageLocation", targets: ["WELocationWrapper"]),
        .library(name: "WebEngagePersonalization", targets: ["WEPersonalizationWrapper"]),
        .library(name: "WebEngageNotificationInbox", targets: ["WENotificationInboxWrapper"])
   
    ],
    targets: [
        .binaryTarget(
            name: "WebEngage",
            url: "https://we-sdk.webengage.com/ios/WebEngageCore/\(webEngageVersion)/WebEngageCore.zip",
            checksum: webEngageChecksum
        ),
        .binaryTarget(
            name: "WELocation",
            url: "https://we-sdk.webengage.com/ios/WebEngageLocation/\(weLocationVersion)/WebEngageLocation.zip",
            checksum: weLocationChecksum
        ),
        .binaryTarget(
            name: "WENotificationInbox",
            url: "https://we-sdk.webengage.com/ios/WENotificationInbox/\(weNotificationInboxVersion)/WENotificationInbox.zip",
            checksum: weNotificationInboxChecksum
        ),
        .binaryTarget(
            name: "WEPersonalization",
            url: "https://we-sdk.webengage.com/ios/WEPersonalization/\(wePersonalizationVersion)/WEPersonalization.zip",
            checksum: wePersonalizationChecksum
        ),
        .target(
            name: "WELocationWrapper",
            dependencies: ["WebEngage", "WELocation"],
            path: "Sources/WELocationWrapper"
        ),
        .target(
            name: "WENotificationInboxWrapper",
            dependencies: ["WebEngage", "WENotificationInbox"],
            path: "Sources/WENotificationInboxWrapper"
        ),
        .target(
            name: "WEPersonalizationWrapper",
            dependencies: ["WebEngage", "WEPersonalization"],
            path: "Sources/WEPersonalizationWrapper"
        )
    ]
)
