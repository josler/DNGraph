//
//  DNPersonTests.m
//  DNGraph
//
//  Created by James Osler on 15/02/2013.
//  Copyright (c) 2013 James Osler. All rights reserved.
//

#import "DNPersonTests.h"
#import "DNPerson.h"

@implementation DNPersonTests

@synthesize managedObjectContext = __managedObjectContext;

- (void)setUp {
    NSManagedObjectModel *mom = [NSManagedObjectModel mergedModelFromBundles:[NSArray arrayWithObject:[NSBundle mainBundle]]];
    NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:mom];
    STAssertTrue([psc addPersistentStoreWithType:NSInMemoryStoreType configuration:nil URL:nil options:nil error:NULL] ? YES : NO, @"Should be able to add in-memory store");
    self.managedObjectContext = [[NSManagedObjectContext alloc] init];
    self.managedObjectContext.persistentStoreCoordinator = psc;
    
    [self createPersonWithId:@"someId" andName:@"somename"];

}

- (void)tearDown {
    self.managedObjectContext = nil;
}

- (void)testSetup
{
    STAssertEqualObjects(self.testPerson.facebookId, @"someId", @"facebookId should be set correctly");
    STAssertEqualObjects(self.testPerson.name, @"somename", @"name should be set correctly");
    STAssertNotNil(self.testPerson.ranker, @"ranker should not be nil");
    STAssertEquals(self.testPerson.ranking, (float)0.5, @"ranking defaulted to 0.5");
}

- (void)testGetId
{
    STAssertEqualObjects([self.testPerson getId], self.testPerson.facebookId, @"getId should return facebookId");
}

- (void)testLike
{
    [self.testPerson like];
    STAssertTrue(self.testPerson.ranking > 0.5, @"liking increases ranking");
}

- (void)testDislike
{
    [self.testPerson dislike];
    STAssertTrue(self.testPerson.ranking < 0.5, @"disliking decreases ranking");
}

- (void)testResetRanking
{
    [self.testPerson dislike];
    [self.testPerson resetRanking];
    STAssertEquals(self.testPerson.ranking, (float)0.5, @"ranking reset to 0.5");
}

#pragma mark - utility

- (void)createPersonWithId: (NSString *)facebookId andName: (NSString *)name
{
    self.testPerson = [DNPerson insertInManagedObjectContext:self.managedObjectContext];
    [self.testPerson setupWithId:facebookId andName:name];
}

@end
