//
//  US2ScoutTestCase.m
//  Scout
//
//  Created by Oliver White on 10/07/2014.
//  Copyright (c) 2014 ustwo. All rights reserved.
//

@import XCTest;

#import "US2Scout.h"

@interface US2ScoutTestCase : XCTestCase

@end

@implementation US2ScoutTestCase

- (void)testDiscoverSchemesWithCompletion
{
    NSString *mapsURLScheme = @"maps", *safariURLScheme = @"http", *fakeURLScheme = @"fake";

    NSSet *schemeSet = [NSMutableSet setWithArray:@[mapsURLScheme, safariURLScheme, fakeURLScheme]];
    NSSet *discoveredSchemes = [US2Scout discoverSchemes:schemeSet];

    XCTAssertTrue([discoveredSchemes containsObject:mapsURLScheme], @"maps URL scheme was not correctly discovered");
    XCTAssertTrue([discoveredSchemes containsObject:safariURLScheme], @"safari URL scheme was not correctly discovered");
    XCTAssertFalse([discoveredSchemes containsObject:fakeURLScheme], @"fake URL scheme was incorrectly discovered");
}

@end
