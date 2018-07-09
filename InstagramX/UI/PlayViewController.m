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

  @property NSMutableArray *persons;
  @property NSMutableArray *dogs;
  @property NSMutableArray *cats;

@end

@implementation PlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.persons = [NSMutableArray new];
    self.cats = [NSMutableArray new];
    self.dogs = [NSMutableArray new];

    //[self getCats];
    //[self getDogs];

    [self getPeople:^{
        [self onUpdatedData];
    }];
}

-(void)onUpdatedData {

    [self createSampleData];
    //[self updatePersonObject];  // change name of first person to superman
    //[self deletePersonObject];  // delete first person
    //[self deleteCatsDogsAndPeople];  // wipe server
}


#pragma mark: CRUD

- (void)createSampleData {  // Be careful not to create dups.

    [Person createPersonAndSaveToServerWithName:@"Sally" homeTown:@"Los Angeles" photo:nil completionBlock:^(Person *person) {

        [self.persons addObject:person];
        NSLog(@"Added Person to DB: %@", person.name);
        // reload data
    }];

    [Dog createDogWithName:@"Fido" weight:5 ownersName:@"Sally" completionBlock:^(Dog *dog) {
        /* do nothing */ }];
    [Dog createDogWithName:@"Max" weight:5 ownersName:@"Sally" completionBlock:^(Dog *dog) {
        /* do nothing */ }];

    [Cat createCatWithName:@"Jumper" weight:10 ownersName:@"Sue" completionBlock:^(Cat *cat) {
        /* do nothing */ }];
    [Cat createCatWithName:@"Shadow" weight:10 ownersName:@"Sue" completionBlock:^(Cat *cat) {
        /* do nothing */ }];
    [Cat createCatWithName:@"Domino" weight:10 ownersName:@"Sue" completionBlock:^(Cat *cat) {
        /* do nothing */ }];
}

-(void)getPeople:(void(^)(void))completionBlock {

    [Person getPersonsFromServerWithCompletion:^(NSArray *persons) {
        self.persons = [NSMutableArray arrayWithArray:persons];
        NSLog(@"got people");
        completionBlock();
    }];
}

-(void)getDogs {

    [Dog getDogsFromServerWithCompletion:^(NSArray *dogs) {
        self.dogs = [NSMutableArray arrayWithArray:dogs];
        NSLog(@"got dogs");
    }];
}

-(void)getCats {

    [Cat getCatsWithCompletion:^(NSArray *cats) {
        self.cats = [NSMutableArray arrayWithArray:cats];
        NSLog(@"got cats");
    }];
}

- (void)updatePersonObject {

    Person *objectToEdit = self.persons.firstObject;
    objectToEdit.name = @"Superman";
    [objectToEdit saveUpdatedObjectWithCompletion:^(Person *person) {
        // We already have the objects, so no need to do anything.
        NSLog(@"Object Updated");
    }];
}

- (void)deletePersonObject {

    Person *objectToEdit = self.persons.firstObject;
    [objectToEdit deleteWithCompletion:^{

        // Remove from my array of local data.
        [self.persons removeObject:objectToEdit];
    }];
}


#pragma mark: Purge Data from the Server

- (void)deleteCatsDogsAndPeople {

    // Quick and dirty.
    for (Person *person in self.persons) {
        [person delete];
    }

    for (Dog *dog in self.dogs) {
        [dog delete];
    }

    for (Cat *cat in self.cats) {
        [cat delete];
    }
}

@end
