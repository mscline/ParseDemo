//
//  Dog.h
//  InstagramX
//
//  Created by xcode on 7/8/18.
//  Copyright © 2018 MSCline. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "Person.h"

@interface Dog : PFObject <PFSubclassing>

  @property NSString *name;
  @property int weight;

  // RELATIONSHIP
  @property Person *owner;

@end
