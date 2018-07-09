//
//  Cat.h
//  InstagramX
//
//  Created by xcode on 7/8/18.
//  Copyright © 2018 MSCline. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface Cat : PFObject <PFSubclassing>

  @property NSString *name;
  @property int weight;
  @property NSString *ownersName;

  +(void)createCatWithName:(NSString *)name
                    weight:(int)weight
                ownersName:(NSString *)ownersName
           completionBlock:(void(^)(Cat *cat))completionBlock;

  +(void)getCatsWithCompletion:(void(^)(NSArray *cats))completionBlock;

@end
