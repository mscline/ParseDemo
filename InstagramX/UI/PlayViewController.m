//
//  PlayViewController.m
//  InstagramX
//
//  Created by xcode on 7/8/18.
//  Copyright © 2018 MSCline. All rights reserved.
//

#import "PlayViewController.h"
#import "Person.h"
#import "Dog.h"
#import "Cat.h"

@interface PlayViewController ()

  @property NSMutableArray *persons;  // a person will have cats and dogs

@end

@implementation PlayViewController

-(void)viewDidLoad {
    [super viewDidLoad];

    self.persons = [NSMutableArray new];

    // MAKE SURE WE CAN DO THESE FOUR THINGS
    [self getPeople];
    //[self createPersonAndTheirCat];
    //[self createPersonAndTheirDogs];
    //[self deleteCatsDogsAndPeople];  // wipe server
}

#pragma mark: CRUD

-(void)createPersonAndTheirCat {  // Be careful not to create dups.

    Cat *cat = [Cat object];
    cat.name = @"Jumper";

    Person *person = [Person object];  // Use this initializer!
    person.name = @"Sally";
    person.cat = cat;

    [person saveUpdatedObjectWithCompletion:^(Person *person) {
        NSLog(@"Added person and their cat.");
    }];
}

-(void )createPersonAndTheirDogs {

    Dog *dogA = [Dog object];
    dogA.name = @"Dog A";

    Dog *dogB = [Dog object];
    dogB.name = @"Dog B";

    Dog *dogC = [Dog object];
    dogC.name = @"Dog C";

    Person *person = [Person object];  // Use this initializer!
    person.name = @"Dog Owner";
    person.dogs = [NSArray arrayWithObjects:dogA, dogB, dogC, nil];

    [person saveUpdatedObjectWithCompletion:^(Person *person) {
        NSLog(@"Added person and their dogs.");
    }];
}

-(void)getPeople {

    PFQuery *query = [Person query];
    [query includeKey:@"cat"];  // GET ATTACHED CAT OBJECT
    [query includeKey:@"dogs"];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {

        self.persons = [NSMutableArray arrayWithArray:objects];
        [self printLog];
    }];
}

-(void)printLog {

    for (Person *person in self.persons) {
        NSLog(@"%@ with cat named: %@", person.name, person.cat.name);
        for (Dog *dog in person.dogs) {
            NSLog(@"and with a dog named: %@", dog.name);
        }
    }
}


#pragma mark: Purge Data from the Server

- (void)deleteCatsDogsAndPeople {

    // Quick and dirty.
    PFQuery *query = [Person query];
    [query includeKey:@"cat"];
    [query includeKey:@"dogs"];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {

        for (Person *person in objects) {

            for (Dog *dog in person.dogs) {
                [dog delete];
            }
            [person.cat delete];
            [person delete];  // remove from server (but still have locally)
        }

        NSLog(@"Async deletions sent.");

    }];
}

@end
