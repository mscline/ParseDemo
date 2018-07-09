//
//  Person.m
//  InstagramX
//
//  Created by xcode on 7/8/18.
//  Copyright © 2018 MSCline. All rights reserved.
//

#import "Person.h"

@implementation Person
  @dynamic name, homeTown, photo;

+(void)createPersonAndSaveToServerWithName:(NSString *)name homeTown:(NSString *)homeTown photo:UIImage completionBlock:(void(^)(Person *person))completionBlock {

    Person *person = [Person object];  // Use this initializer!
    person.name = name;
    person.homeTown = homeTown;
    // Todo: person.photo =

    [person saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        completionBlock(person);
    }];
}

+(void)getPersonsFromServerWithCompletion:(void(^)(NSArray *persons))completionBlock {

    PFQuery *query = [Person query];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {

        completionBlock(objects);
    }];
}

-(void)saveUpdatedObjectWithCompletion:(void(^)(Person *person))completionBlock {
    [self saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        completionBlock(self);
    }];
}

-(void)deleteWithCompletion:(void(^)(void))completionBlock {  

    [self deleteInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        completionBlock();
    }];
}

// PROTOCOL CONFORMANCE
+ (nonnull NSString *)parseClassName {
    return @"Person";
}

@end
