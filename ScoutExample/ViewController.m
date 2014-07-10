//
//  ViewController.m
//  Scout
//
//  Created by Martin on 10/07/2014.
//  Copyright (c) 2014 ustwo. All rights reserved.
//

#import "ViewController.h"
#import "US2Scout.h"


@implementation ViewController
            
- (void)viewDidLoad
{
    NSSet *schemeSet = [NSMutableSet setWithArray:@[@"kayak", @"trivago", @"ebookers", @"maps", @"safari"]];
    
    [US2Scout discoverSchemes:schemeSet withCompletion:^(NSSet *discoveredSchemes) {
        NSLog(@"discoveredSchemes: %@", discoveredSchemes);
    }];
    
    [super viewDidLoad];
}

@end
