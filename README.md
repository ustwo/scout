Scout
=====
Scout discovers apps installed on an iOS device utilising the URL scheme feature.

### Usage

```objc
NSSet *schemeSet = [NSMutableSet setWithArray:@[@"maps", @"http"]];
[US2Scout discoverSchemes:schemeSet withCompletion:^(NSSet *discoveredSchemes) {
    NSLog(@"discoveredSchemes: %@", discoveredSchemes);
    // Evaluate data
}];
```

### Installation with CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries in your projects. 

#### Podfile

    platform :ios, '7.0'
    pod "Scout", "~> 1.0"

### Maintainers

- [Martin Stolz](http://github.com/martinstolz) ([@martin_stolz](https://twitter.com/martin_stolz))
- [Oliver White](http://github.com/oliver-ustwo) ([@oliverwhite](https://twitter.com/oliverwhite))

### License

Scout is available under the MIT license. See the LICENSE file for more info.