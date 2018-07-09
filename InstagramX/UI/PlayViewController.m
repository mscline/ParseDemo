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
  @property NSMutableArray *dogs;

@end

@implementation PlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.persons = [NSMutableArray new];

    [self getPeople];
    //[self createPersonAndTheirCat];
    [self deleteCatsDogsAndPeople];  // wipe server
}

#pragma mark: CRUD

- (void)createPersonAndTheirCat {  // Be careful not to create dups.

    Cat *cat = [Cat object];
    cat.name = @"Jumper";

    Person *person = [Person object];  // Use this initializer!
    person.name = @"Sally";
    person.cat = cat;

    [person saveUpdatedObjectWithCompletion:^(Person *person) {
        NSLog(@"Added person and their cat.");
    }];
}

-(void)getPeople {

    [Person getPersonsFromServerWithCompletion:^(NSArray *persons) {
        self.persons = [NSMutableArray arrayWithArray:persons];
        [self printLog];
    }];
}

-(void)printLog {

    for (Person *person in self.persons) {
        NSLog(@"%@ with cat named: %@", person.name, person.cat.name);
    }
}


#pragma mark: Purge Data from the Server

- (void)deleteCatsDogsAndPeople {

    // Quick and dirty.
    for (Person *person in self.persons) {

        [person delete];  // remove from server (but still have locally)
        [person.cat delete];
    }

    for (Dog *dog in self.dogs) {
        [dog delete];
    }
}

@end
