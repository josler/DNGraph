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
#import "DNGraph.h"

@implementation DNArticleTests

@synthesize managedObjectContext = __managedObjectContext;

- (void)setUp {
    NSManagedObjectModel *mom = [NSManagedObjectModel mergedModelFromBundles:[NSArray arrayWithObject:[NSBundle mainBundle]]];
    NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:mom];
    STAssertTrue([psc addPersistentStoreWithType:NSInMemoryStoreType configuration:nil URL:nil options:nil error:NULL] ? YES : NO, @"Should be able to add in-memory store");
    self.managedObjectContext = [[NSManagedObjectContext alloc] init];
    self.managedObjectContext.persistentStoreCoordinator = psc;
//    [self createTestArticle];
}

- (void)tearDown {
    self.managedObjectContext = nil;
    [super tearDown];
}

- (void)testSetup {
    [self createTestArticle];
    STAssertTrue(self.testArticle.rankingValue == 1.5f, @"ranking (%f) should be 1.5", self.testArticle.rankingValue);
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

- (void)createTestArticle {
    DNGraph *graph = [[DNGraph alloc] init];
    [graph saveContext];
    self.testArticle = [DNArticle insertInManagedObjectContext:self.managedObjectContext];
    [self.testArticle setupWithRanking:1.5f];
    STAssertEquals(self.testArticle.rankingValue, 1.5f, @"ranking set");
}

@end
