//
//  DNRankerTest.m
//  DNGraph
//
//  Created by James Osler on 20/02/2013.
//  Copyright (c) 2013 James Osler. All rights reserved.
//

#import "DNRankerTest.h"
#import "DNRanker.h"
#import "DNPerson.h"

@implementation DNRankerTest

@synthesize managedObjectContext = __managedObjectContext;

- (void)setUp {
    NSManagedObjectModel *mom = [NSManagedObjectModel mergedModelFromBundles:[NSArray arrayWithObject:[NSBundle mainBundle]]];
    NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:mom];
    STAssertTrue([psc addPersistentStoreWithType:NSInMemoryStoreType configuration:nil URL:nil options:nil error:NULL] ? YES : NO, @"Should be able to add in-memory store");
    self.managedObjectContext = [[NSManagedObjectContext alloc] init];
    self.managedObjectContext.persistentStoreCoordinator = psc;
    
    DNPerson *person = [DNPerson insertInManagedObjectContext:self.managedObjectContext];
    [person setupWithId:@"someid" andName:@"somename"];
    self.testRanker = [[DNRanker alloc] initWithDelgate:person];
    
}

- (void)tearDown {
    self.managedObjectContext = nil;
}

- (void)testInit {
    DNPerson *person = [DNPerson insertInManagedObjectContext:self.managedObjectContext];
    person.ranking = 0.6f;
    DNRanker *ranker = [[DNRanker alloc] initWithDelgate:person];
    STAssertEquals(ranker.delegate, person, @"delegate should be set");
    STAssertFalse(ranker.delegate.ranking == 0.5f, @"ranking should not be reset on init");
}

- (void)testLike {
    [self.testRanker like];
    STAssertEquals(self.testRanker.delegate.ranking, 0.6f, @"ranking moved up");
    [self.testRanker like];
    STAssertEquals(self.testRanker.delegate.ranking, 0.68f, @"ranking moved up further");
}

- (void)testDislike {
    [self.testRanker dislike];
    STAssertEquals(self.testRanker.delegate.ranking, 0.4f, @"ranking moved down");
    [self.testRanker dislike];
    STAssertEquals(self.testRanker.delegate.ranking, 0.32f, @"ranking moved down further");
}

- (void)testResetRanking {
    [self.testRanker like];
    STAssertEquals(self.testRanker.delegate.ranking, 0.6f, @"ranking moved up");
    [self.testRanker resetRanking];
    STAssertEquals(self.testRanker.delegate.ranking, 0.5f, @"ranking reset");
}

@end
