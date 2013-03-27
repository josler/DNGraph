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
    STAssertTrue(self.testArticle.ranking == 1.5f, @"ranking (%f) should be 1.5", self.testArticle.rankingValue);
}

- (void)testLike {
    [self createTestArticle];
    [self.testArticle like];
    STAssertTrue(self.testArticle.favouriteValue == YES, @"like sets favourite");
}

- (void)testDislike {
    [self createTestArticle];
    self.testArticle.favouriteValue = YES;
    STAssertTrue(self.testArticle.favouriteValue == YES, @"");
    [self.testArticle dislike];
    STAssertTrue(self.testArticle.favouriteValue == NO, @"dislike sets favouriteValue to NO");
    STAssertTrue(self.testArticle.ranking < 0.001, @"ranking (%f) should be zero", self.testArticle.ranking);
}

- (void)testJsonFormat {
    [self createTestArticle];
    NSDictionary *dict = [self.testArticle jsonFormat];
    STAssertEqualObjects([dict valueForKey:@"hashValue"], self.testArticle.hashValue, @"hash should match");
    STAssertEqualObjects([dict valueForKey:@"type"], @"article", @"should be article type");
    STAssertEqualObjects([dict valueForKey:@"favourite"], self.testArticle.favourite, @"should save favourite status");
}

- (void)createTestArticle {
    DNPerson *testPerson1 = [DNPerson insertInManagedObjectContext:self.managedObjectContext];
    [testPerson1 setupWithId:@"1" andName:@"someperson"];
    DNSubject *subject = [DNSubject insertInManagedObjectContext:self.managedObjectContext];
    [subject setupWithId:@"someidsub" andName:@"sub1" andCategory:@"category"];
    DNSource *source = [DNSource insertInManagedObjectContext:self.managedObjectContext];
    [source setupWithName:@"sourcename"];
    self.testArticle = [DNArticle insertInManagedObjectContext:self.managedObjectContext];
    [self.testArticle setupWithRanking:1.5f andHashValue:@"somehash"];
    STAssertEquals(self.testArticle.ranking, 1.5f, @"ranking set");
    STAssertEqualObjects(self.testArticle.hashValue, @"somehash", @"hash set");
}

@end
