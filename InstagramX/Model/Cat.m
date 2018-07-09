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

+(void)createCatWithName:(NSString *)name
                  weight:(int)weight
              ownersName:(NSString *)ownersName
         completionBlock:(void(^)(Cat *cat))completionBlock {

    Cat *cat = [Cat object];
    cat.name = name;
    cat.weight = weight;
    cat.ownersName = ownersName;

    [cat saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        completionBlock(cat);
    }];
}

+(void)getCatsWithCompletion:(void(^)(NSArray *cats))completionBlock {

    PFQuery *query = [Cat query];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        completionBlock(objects);
    }];
}

// PROTOCOL CONFORMANCE
+ (nonnull NSString *)parseClassName {
    return @"Cat";
}

@end


