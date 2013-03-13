//
//  DNSubjectTests.m
//  DNGraph
//
//  Created by James Osler on 20/02/2013.
//  Copyright (c) 2013 James Osler. All rights reserved.
//

#import "DNSubjectTests.h"
#import "DNSubject.h"

@implementation DNSubjectTests

- (void)setUp {
    NSManagedObjectModel *mom = [NSManagedObjectModel mergedModelFromBundles:[NSArray arrayWithObject:[NSBundle mainBundle]]];
    NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:mom];
    STAssertTrue([psc addPersistentStoreWithType:NSInMemoryStoreType configuration:nil URL:nil options:nil error:NULL] ? YES : NO, @"Should be able to add in-memory store");
    self.managedObjectContext = [[NSManagedObjectContext alloc] init];
    self.managedObjectContext.persistentStoreCoordinator = psc;
    [self createSubjectWithId:@"someId" Name:@"somename" andCategory:@"somecategory"];
    
}

- (void)tearDown {
    self.managedObjectContext = nil;
}

- (void)testSetup
{
    STAssertEqualObjects(self.testSubject.facebookId, @"someId", @"facebookId should be set correctly");
    STAssertEqualObjects(self.testSubject.name, @"somename", @"name should be set correctly");
    STAssertEqualObjects(self.testSubject.category, @"somecategory", @"category should be set correctly");
    STAssertNotNil(self.testSubject.ranker, @"ranker should not be nil");
    STAssertEquals(self.testSubject.ranking, (float)0.5, @"ranking defaulted to 0.5");
}

- (void)testGetId
{
    STAssertEqualObjects([self.testSubject getId], self.testSubject.facebookId, @"getId should return facebookId");
}

- (void)testLike
{
    [self.testSubject like];
    STAssertTrue(self.testSubject.ranking > 0.5, @"liking increases ranking");
}

- (void)testDislike
{
    [self.testSubject dislike];
    STAssertTrue(self.testSubject.ranking < 0.5, @"disliking decreases ranking");
}

- (void)testResetRanking
{
    [self.testSubject dislike];
    [self.testSubject resetRanking];
    STAssertEquals(self.testSubject.ranking, (float)0.5, @"ranking reset to 0.5");
}

- (void)testJsonFormat
{
    NSDictionary *dict = [self.testSubject jsonFormat];
    STAssertEqualObjects([dict valueForKey:@"facebookId"], self.testSubject.facebookId, @"facebook Id should match");
    STAssertEqualObjects([dict valueForKey:@"type"], @"subject", @"should be  subject type");
    STAssertEquals([[dict valueForKey:@"ranking"] floatValue], self.testSubject.ranking, @"ranking should match");
}

#pragma mark - utility

- (void)createSubjectWithId: (NSString *)facebookId Name: (NSString *)name andCategory: (NSString *)category
{
    self.testSubject = [DNSubject insertInManagedObjectContext:self.managedObjectContext];
    [self.testSubject setupWithId:facebookId andName:name andCategory:category];
}
@end
