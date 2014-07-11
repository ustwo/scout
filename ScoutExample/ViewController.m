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

static NSString *const GoogleAnalyticsTrackingId            = @"UA-52714436-1";
static const NSTimeInterval GoogleAnalyticsDispatchInterval = 5.0;
static NSString *const GoogleAnalyticsCategory              = @"scout";
static NSString *const GoogleAnalyticsAction                = @"discover";
static NSString *const GoogleAnalyticsSchemeSeparator       = @",";

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self p_setUpTracker];
    [self p_discoverAndTrackSchemes];
}


#pragma mark - Discovery

- (void)p_discoverAndTrackSchemes
{
    NSSet *schemeSet = [NSMutableSet setWithArray:@[@"maps", @"http"]];
    NSSet *discoveredSchemes = [US2Scout discoverSchemes:schemeSet];

    NSMutableString *text = [[NSMutableString alloc] initWithString:@"Discovered schemes:\n\n"];

    NSArray *schemes = [discoveredSchemes allObjects];
    for (NSString *scheme in schemes)
    {
        [text appendFormat:@"\t• %@\n", scheme];
    }

    self.label.text = text;

    [self p_trackDiscoveredSchemes:discoveredSchemes];
}


#pragma mark - Tracking

- (void)p_setUpTracker
{
    [GAI sharedInstance].dispatchInterval = GoogleAnalyticsDispatchInterval;
    [[[GAI sharedInstance] logger] setLogLevel:kGAILogLevelVerbose];
    [[GAI sharedInstance] trackerWithTrackingId:GoogleAnalyticsTrackingId];
}

- (void)p_trackDiscoveredSchemes:(NSSet *)schemes
{
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    NSString *trackerLabel = [self p_trackerLabelFromSet:schemes];
    NSDictionary *eventData = [[GAIDictionaryBuilder createEventWithCategory:GoogleAnalyticsCategory
                                                                      action:GoogleAnalyticsAction
                                                                       label:trackerLabel
                                                                       value:nil] build];
    [tracker send:eventData];
}

- (NSString *)p_trackerLabelFromSet:(NSSet *)set
{
    NSArray *array = [set allObjects];
    NSArray *sortedArray = [array sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    NSString *trackerLabel = [sortedArray componentsJoinedByString:GoogleAnalyticsSchemeSeparator];
    return trackerLabel;
}

@end
