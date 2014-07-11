//
//  US2Scout.m
//  Scout
//
//  Created by Martin on 10/07/2014.
//  Copyright (c) 2014 ustwo. All rights reserved.
//

#import "US2Scout.h"

@implementation US2Scout

+ (NSSet *)discoverSchemes:(NSSet *)schemes
{
    NSMutableSet *discoveredSchemes = [NSMutableSet set];
    [schemes enumerateObjectsUsingBlock:^(NSString *scheme, BOOL *stop) {
        NSAssert([scheme class] != [NSString class], @"Scheme must be a NSString.");
        
        BOOL exists = [US2Scout doesSchemeExist:scheme];
        if (exists)
        {
            [discoveredSchemes addObject:scheme];
        }
    }];
    
    return [discoveredSchemes copy];
}

+ (BOOL)doesSchemeExist:(NSString *)scheme
{
    UIApplication *application = [UIApplication sharedApplication];
    NSURL *schemeUrl = [[NSURL alloc] initWithScheme:scheme host:nil path:@"/"];
    BOOL exists = [application canOpenURL:schemeUrl];
    
    return exists;
}

@end
