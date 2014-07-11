//
//  US2Scout.h
//  Scout
//
//  Created by Martin on 10/07/2014.
//  Copyright (c) 2014 ustwo. All rights reserved.
//

@import UIKit;

@interface US2Scout : NSObject

+ (void)discoverSchemes:(NSSet *)schemes withCompletion:(void(^)(NSSet *discoveredSchemes))completion;

@end
