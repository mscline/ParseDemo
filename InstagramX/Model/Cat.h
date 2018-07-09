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

@end
