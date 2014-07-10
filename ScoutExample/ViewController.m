//
//  ViewController.m
//  Scout
//
//  Created by Martin on 10/07/2014.
//  Copyright (c) 2014 ustwo. All rights reserved.
//

#import "ViewController.h"
#import "US2Scout.h"
#import "GAI.h"
#import "GAIFields.h"
#import "GAIDictionaryBuilder.h"

@import CoreData;
@import SystemConfiguration;

static NSString *const GoogleAnalyticsTrackingId = @"UA-52714436-1";
static NSString *const GoogleAnalyticsSchemeSeparator = @" ";


@implementation ViewController
            
- (void)viewDidLoad
{
    [self p_setUpTracker];
    
    
    
    
    NSSet *schemeSet = [NSMutableSet setWithArray:@[@"kayak", @"trivago", @"ebookers", @"maps", @"http"]];
    
    [US2Scout discoverSchemes:schemeSet withCompletion:^(NSSet *discoveredSchemes) {
        NSLog(@"discoveredSchemes: %@", discoveredSchemes);
        
        [self p_trackDiscoveredSchemes:discoveredSchemes];
    }];
    
    [super viewDidLoad];
}

- (void)p_setUpTracker
{
    [GAI sharedInstance].dispatchInterval = 5;
    [[[GAI sharedInstance] logger] setLogLevel:kGAILogLevelVerbose];
    [[GAI sharedInstance] trackerWithTrackingId:GoogleAnalyticsTrackingId];
}

- (void)p_trackDiscoveredSchemes:(NSSet *)schemes
{
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:@"Home Screen"];
    
    NSString *trackingLabel = [self p_buildTrackingLabelFromSet:schemes];
    NSDictionary *eventData = [[GAIDictionaryBuilder createEventWithCategory:@"scout"
                                                                      action:@"discovered"
                                                                       label:trackingLabel
                                                                       value:nil] build];
    [tracker send:eventData];
}

- (NSString *)p_buildTrackingLabelFromSet:(NSSet *)set
{
    NSString *trackingLabel = [[set allObjects] componentsJoinedByString:GoogleAnalyticsSchemeSeparator];
    
    return trackingLabel;
}

@end
