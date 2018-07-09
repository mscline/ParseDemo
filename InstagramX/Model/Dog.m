//
//  Dog.m
//  InstagramX
//
//  Created by xcode on 7/8/18.
//  Copyright © 2018 MSCline. All rights reserved.
//

#import "Dog.h"

@implementation Dog
  @dynamic name, weight, ownersName;

+(void)createDogWithName:(NSString *)name
                  weight:(int)weight
              ownersName:(NSString *)ownersName
         completionBlock:(void(^)(Dog *dog))completionBlock {

    Dog *dog = [Dog object];
    dog.name = name;
    dog.weight = weight;
    dog.ownersName = ownersName;

    [dog saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        Dog *newDog = dog;
        completionBlock(newDog);
    }];
}

+(void)getDogsFromServerWithCompletion:(void(^)(NSArray *dogs))completionBlock {

    PFQuery *query = [Dog query];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {

        completionBlock(objects);
    }];
}

// PROTOCOL CONFORMANCE
+ (nonnull NSString *)parseClassName {
    return @"Dog";
}

@end
