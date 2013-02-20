//
//  DNSourceTests.m
//  DNGraph
//
//  Created by James Osler on 16/02/2013.
//  Copyright (c) 2013 James Osler. All rights reserved.
//

#import "DNSourceTests.h"
#import "DNSource.h"

@implementation DNSourceTests

@synthesize managedObjectContext = __managedObjectContext;

- (void)setUp {
    NSManagedObjectModel *mom = [NSManagedObjectModel mergedModelFromBundles:[NSArray arrayWithObject:[NSBundle mainBundle]]];
    NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:mom];
    STAssertTrue([psc addPersistentStoreWithType:NSInMemoryStoreType configuration:nil URL:nil options:nil error:NULL] ? YES : NO, @"Should be able to add in-memory store");
    self.managedObjectContext = [[NSManagedObjectContext alloc] init];
    self.managedObjectContext.persistentStoreCoordinator = psc;
    [self createSourceWithName:@"somename"];
}

- (void)tearDown {
    self.managedObjectContext = nil;
}

- (void)testSetup
{
    STAssertEqualObjects(self.testSource.facebookId, @"somename", @"facebookId should be set to the name");
    STAssertEqualObjects(self.testSource.name, @"somename", @"name should be set correctly");
    STAssertNotNil(self.testSource.ranker, @"ranker should not be nil");
    STAssertEquals(self.testSource.ranking, (float)0.5, @"ranking defaulted to 0.5");
}

- (void)testGetId
{
    STAssertEqualObjects([self.testSource getId], self.testSource.facebookId, @"getId should return facebookId");
}

- (void)testLike
{
    [self.testSource like];
    STAssertTrue(self.testSource.ranking > 0.5, @"liking increases ranking");
}

- (void)testDislike
{
    [self.testSource dislike];
    STAssertTrue(self.testSource.ranking < 0.5, @"disliking decreases ranking");
}

- (void)testResetRanking
{
    [self.testSource dislike];
    [self.testSource resetRanking];
    STAssertEquals(self.testSource.ranking, (float)0.5, @"ranking reset to 0.5");
}

#pragma mark - utility

- (void)createSourceWithName: (NSString *)name
{
    self.testSource = [DNSource insertInManagedObjectContext:self.managedObjectContext];
    [self.testSource setupWithName:name];
}


@end
