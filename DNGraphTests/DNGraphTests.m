//
//  DNGraphTests.m
//  DNGraphTests
//
//  Created by James Osler on 15/02/2013.
//  Copyright (c) 2013 James Osler. All rights reserved.
//

#import "DNGraphTests.h"
#import "DNGraph.h"
#import "DNSource.h"
#import "DNPerson.h"
#import "DNSubject.h"
#import "DNGraph_Private.h"

@implementation DNGraphTests

- (void)setUp
{
    [super setUp];
    NSManagedObjectModel *mom = [NSManagedObjectModel mergedModelFromBundles:[NSArray arrayWithObject:[NSBundle mainBundle]]];
    NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:mom];
    STAssertTrue([psc addPersistentStoreWithType:NSInMemoryStoreType configuration:nil URL:nil options:nil error:NULL] ? YES : NO, @"Should be able to add in-memory store");
    self.managedObjectContext = [[NSManagedObjectContext alloc] init];
    self.managedObjectContext.persistentStoreCoordinator = psc;
    
    self.graph = [[DNGraph alloc] init];
}

- (void)tearDown
{
    self.managedObjectContext = nil;
    [super tearDown];
}

- (void)testMakeSourceWithName
{
    DNSource *source = [self.graph makeSourceWithName:@"somename"];
    STAssertEquals(source.name, @"somename", @"Should return a source with the given name");
    [source like]; // altering the source so we can identify it
    source = [self.graph makeSourceWithName:@"somename"]; // should return the same object
    STAssertFalse(source.ranking == 0.5f, @"Should return the previously created Source");
}

- (void)testMakeSubjectWithIdNameAndCategory
{
    DNSubject *subject = [self.graph makeSubjectWithId:@"someId" andName:@"somename" andCategory:@"somecategory"];
    STAssertEquals(subject.facebookId, @"someId", @"Should return a subject with the given ID");
    [subject like];
    subject = [self.graph makeSubjectWithId:@"someId" andName:@"somename" andCategory:@"somecategory"];
    STAssertFalse(subject.ranking == 0.5f, @"Should return the previously created Subject");
}

- (void)testMakeSubjectWithIdNameAndCategoryDifferentNames
{
    DNSubject *subject = [self.graph makeSubjectWithId:@"someId" andName:@"somename" andCategory:@"somecategory"];
    STAssertEquals(subject.facebookId, @"someId", @"Should return a subject with the given ID");
    [subject like];
    subject = [self.graph makeSubjectWithId:@"someId" andName:@"anothername" andCategory:@"somecategory"]; // names dont matter
    STAssertFalse(subject.ranking == 0.5f, @"Should return the previously created Subject");
}

- (void)testMakePersonWithIdAndName
{
    DNPerson *person = [self.graph makePersonWithId:@"someId" andName:@"somename"];
    STAssertEquals(person.facebookId, @"someId", @"Should return a person with the given ID");
    [person like];
    person = [self.graph makePersonWithId:@"someId" andName:@"somename"];
    STAssertFalse(person.ranking == 0.5f, @"Should return the previously created person");
}

- (void)testGetExistingNodeOfTypeNoResult
{
    DNPerson *person = [self.graph getExistingNodeOfType:@"DNPerson" withId:@"someId"];
    STAssertNil(person, @"no result returned");
}

- (void)testGetExistingNodeOfType
{
    [self.graph makePersonWithId:@"someId" andName:@"somename"];
    DNPerson *person = [self.graph getExistingNodeOfType:@"DNPerson" withId:@"someId"];
    STAssertEquals(person.name, @"somename", @"returns the existing person");
}

- (void)testGetExistingNodeOfTypeMultipleReturnsOnlyOne
{
    [self.graph makePersonWithId:@"someId" andName:@"somename"];
     [self.graph makePersonWithId:@"someId" andName:@"othername"];
    DNPerson *person = [self.graph getExistingNodeOfType:@"DNPerson" withId:@"someId"];
    STAssertEquals(person.name, @"somename", @"returns the existing person"); // only returns one result, in practise there should only be one result.
}
@end
