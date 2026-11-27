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

let webEngageVersion = "7.1.2"
let webEngageChecksum = "64172399d760d9c153051e153b99b4537ceac2456374b7aa6daf972ead53b696"

let weLocationVersion = "1.0.2"
let weLocationChecksum = "56fc5f649b1c75f44dc7dcb8fe3804e32498caee51fc0152f9ac4d88a373553b"

let weInspectorVersion = "1.0.1"
let weInspectorChecksum = "9529372d572386541b20239e8bf7e6ad5b53551685121674a3be530101e96fe7"

let weNotificationInboxVersion = "1.2.0"
let weNotificationInboxChecksum = "5e3fc4a85883162eb22f1f5abcb94fce1cfe95f1799a536fb4aeefdb5420a266"

let wePersonalizationVersion = "1.6.1"
let wePersonalizationChecksum = "1a7d94e4b204fcca5433722a19d327a06d3a6b09882d7bb5fb4c75ee1b44da1c"

let package = Package(
    name: "webengage-ios-sdk",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "WebEngageCore", targets: ["WebEngage"]),
        .library(name: "WebEngageLocation", targets: ["WELocationWrapper"]),
        .library(name: "WebEngageInspector", targets: ["WEInspectorWrapper"]),
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
            name: "WEInspector",
            url: "https://we-sdk.webengage.com/ios/WebEngageInspector/\(weInspectorVersion)/WEInspector.zip",
            checksum: weInspectorChecksum
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
            name: "WEInspectorWrapper",
            dependencies: ["WebEngage", "WEInspector"],
            path: "Sources/WEInspectorWrapper"
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
