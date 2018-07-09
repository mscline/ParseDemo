//
//  Dog.m
//  InstagramX
//
//  Created by xcode on 7/8/18.
//  Copyright © 2018 MSCline. All rights reserved.
//

#import "Dog.h"

@implementation Dog
  @dynamic name, weight, owner;

// PROTOCOL CONFORMANCE
+ (nonnull NSString *)parseClassName {
    return @"Dog";
}

@end
