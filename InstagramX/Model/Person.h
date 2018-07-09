//
//  Person.h
//  InstagramX
//
//  Created by xcode on 7/8/18.
//  Copyright © 2018 MSCline. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "Cat.h"

@interface Person : PFObject <PFSubclassing>  // Replace NSObject with PFObject and implement PFSubclassing.


  @property NSString *name;
  @property NSString *homeTown;
  @property PFFile *photo;  // Large files should be stored as PFFiles.


  // RELATIONSHIPS
  // one-to-one (a person may only have one cat)
  @property Cat *cat;

  // one-to-many (a person may have more than one dog)
  // See Dogs.h


  // CRUD (Create, read, update, delete.)
  +(void)createPersonAndSaveToServerWithName:(NSString *)name
                                    homeTown:(NSString *)homeTown
                                       photo:(UIImage *)image
                                         cat:(Cat *)cat
                             completionBlock:(void(^)(Person *person))completionBlock;
  +(void)getPersonsFromServerWithCompletion:(void(^)(NSArray *persons))completionBlock;
  -(void)saveUpdatedObjectWithCompletion:(void(^)(Person *person))completionBlock;
  -(void)deleteWithCompletion:(void(^)(void))completionBlock;  // Parse already has a delete and a delete with block call, but I wanted implement full CRUD.
@end
