//
//  Cat.m
//  InstagramX
//
//  Created by xcode on 7/8/18.
//  Copyright © 2018 MSCline. All rights reserved.
//

#import "Cat.h"

@implementation Cat
  @dynamic name, weight, ownersName;

// PROTOCOL CONFORMANCE
+ (nonnull NSString *)parseClassName {
    return @"Cat";
}

@end


