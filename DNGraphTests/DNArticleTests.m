//
//  DNArticleTests.m
//  DNGraph
//
//  Created by James Osler on 03/03/2013.
//  Copyright (c) 2013 James Osler. All rights reserved.
//

#import "DNArticleTests.h"
#import "DNArticle.h"
#import "DNPerson.h"
#import "DNSource.h"
#import "DNSubject.h"

@implementation DNArticleTests

@synthesize managedObjectContext = __managedObjectContext;

- (void)setUp {
    NSManagedObjectModel *mom = [NSManagedObjectModel mergedModelFromBundles:[NSArray arrayWithObject:[NSBundle mainBundle]]];
    NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:mom];
    STAssertTrue([psc addPersistentStoreWithType:NSInMemoryStoreType configuration:nil URL:nil options:nil error:NULL] ? YES : NO, @"Should be able to add in-memory store");
    self.managedObjectContext = [[NSManagedObjectContext alloc] init];
    self.managedObjectContext.persistentStoreCoordinator = psc;
    [self createTestArticle];
}

- (void)tearDown {
    self.managedObjectContext = nil;
}

- (void)testSetup {
    [self createTestArticle];
    STAssertTrue(self.testArticle.nodeRankingValue == 1.5f, @"ranking summed to 1.5");
    STAssertTrue(self.testArticle.nodeCountValue == 3, @"three nodes");
}

- (void)testSetupWithoutPerson {
    [self createTestArticleWithoutPerson];
    STAssertTrue(self.testArticle.nodeRankingValue == 1.0f, @"ranking summed to 1");
    STAssertTrue(self.testArticle.nodeCountValue == 2, @"two nodes");
}

- (void)testGetOverallRanking {
    [self createTestArticle];
    STAssertTrue([self.testArticle getOverallRanking] == 0.5f, @"overall ranking should be the average");
}

- (void)testSetComments {
    [self createTestArticle];
    NSMutableArray *people = [self createPeopleArray];
    [self.testArticle setComments:@"some comments" withPeople:people];
    STAssertTrue(self.testArticle.nodeRankingValue == 2.5f, @"ranking summed to 2.5");
    STAssertTrue(self.testArticle.nodeCountValue == 5, @"five nodes");
}

- (NSMutableArray *)createPeopleArray {
    NSMutableArray *people = [[NSMutableArray alloc] init];
    DNPerson *testPerson1 = [DNPerson insertInManagedObjectContext:self.managedObjectContext];
    [testPerson1 setupWithId:@"1" andName:@"someperson"];
    DNPerson *testPerson2 = [DNPerson insertInManagedObjectContext:self.managedObjectContext];
    [testPerson2 setupWithId:@"2" andName:@"otherperson"];
    [people addObject:testPerson1];
    [people addObject:testPerson2];
    return people;
}

- (void)createTestArticleWithoutPerson {
    DNSubject *testSubject = [DNSubject insertInManagedObjectContext:self.managedObjectContext];
    [testSubject setupWithId:@"1" andName:@"somename" andCategory:@"somecategory"];
    DNSource *testSource = [DNSource insertInManagedObjectContext:self.managedObjectContext];
    [testSource setupWithName:@"anothername"];
    
    self.testArticle = [DNArticle insertInManagedObjectContext:self.managedObjectContext];
    [self.testArticle setupWithSubject:testSubject Source:testSource andAuthor:nil];
}

- (void)createTestArticle {
    DNSubject *testSubject = [DNSubject insertInManagedObjectContext:self.managedObjectContext];
    [testSubject setupWithId:@"1" andName:@"somename" andCategory:@"somecategory"];
    DNSource *testSource = [DNSource insertInManagedObjectContext:self.managedObjectContext];
    [testSource setupWithName:@"anothername"];
    DNPerson *testPerson = [DNPerson insertInManagedObjectContext:self.managedObjectContext];
    [testPerson setupWithId:@"2" andName:@"someperson"];
    
    self.testArticle = [DNArticle insertInManagedObjectContext:self.managedObjectContext];
    [self.testArticle setupWithSubject:testSubject Source:testSource andAuthor:testPerson];
}

@end
