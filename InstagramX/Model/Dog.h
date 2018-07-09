//
//  Dog.h
//  InstagramX
//
//  Created by xcode on 7/8/18.
//  Copyright © 2018 MSCline. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface Dog : PFObject <PFSubclassing>

  @property NSString *name;
  @property int weight;
  @property NSString *ownersName;

  +(void)createDogWithName:(NSString *)name
                    weight:(int)weight
                ownersName:(NSString *)ownersName
           completionBlock:(void(^)(Dog *dog))completionBlock;

  +(void)getDogsFromServerWithCompletion:(void(^)(NSArray *dogs))completionBlock;

@end
