//
//  DNGraph.m
//  DNGraph
//
//  Created by James Osler on 15/02/2013.
//  Copyright (c) 2013 James Osler. All rights reserved.
//

#import "DNGraph.h"
#import "DNGraph_Private.h"
#import "DNPerson.h"
#import "DNSubject.h"
#import "DNSource.h"
#import "DNArticle.h"

@implementation DNGraph

@synthesize persistentStoreCoordinator = __persistentStoreCoordinator;
@synthesize managedObjectModel = __managedObjectModel;
@synthesize managedObjectContext = __managedObjectContext;

- (void)saveContext
{
    NSError *error;
    [self.managedObjectContext save:&error];
    if (error)
        NSLog(@"error saving context");
}

#pragma mark - Factory Methods

- (DNSource *)makeSourceWithName: (NSString *)name
{
    DNSource *source = [self getExistingNodeOfType:@"DNSource" withId:name];
    if (source) {
        NSLog(@"found existing source %@", source.name);
     return source;
        
    }
    
    source = [DNSource insertInManagedObjectContext:self.managedObjectContext];
    [source setupWithName:name];
    return source;
}

- (DNSubject *)makeSubjectWithId: (NSString *)facebookId andName: (NSString *)name andCategory: (NSString *)category
{
    DNSubject *subject = [self getExistingNodeOfType:@"DNSubject" withId:facebookId];
    if (subject) return subject;
    
    subject = [DNSubject insertInManagedObjectContext:self.managedObjectContext];
    [subject setupWithId: (NSString *)facebookId andName: (NSString *)name andCategory: (NSString *)category];
    return subject;
}

- (DNPerson *)makePersonWithId: (NSString *)facebookId andName: (NSString *)name
{
    DNPerson *person = [self getExistingNodeOfType:@"DNPerson" withId:facebookId];
    if (person) return person;
    
    person = [DNPerson insertInManagedObjectContext:self.managedObjectContext];
    [person setupWithId:facebookId andName:name];
    return person;
}

- (DNArticle *)makeArticleWithRanking: (float)ranking andHash:(NSString *)hashValue
{
    DNArticle *article = [self getExistingArticleWithHash:hashValue];
    if (article) return article;
    article = [DNArticle insertInManagedObjectContext:self.managedObjectContext];
    [article setupWithRanking:ranking];
    article.hashValue = hashValue;
    return article;
}

#pragma mark - Core Data Fetching

- (DNArticle *)getExistingArticleWithHash: (NSString *)hashValue
{
    NSManagedObjectContext *moc = self.managedObjectContext;
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              entityForName:@"DNArticle" inManagedObjectContext:moc];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:
                              @"(hashValue = %@)", hashValue];
    [request setPredicate:predicate];
    
    NSError *error = nil;
    NSArray *array = [moc executeFetchRequest:request error:&error];
    if (array == nil)
    {
        // Deal with error...
    }
    if (array.count > 0) return [array objectAtIndex:0];
    return nil;
}

- (id <DNNode>)getExistingNodeOfType: (NSString *)entityName withId: (NSString *)facebookId
{
    NSArray *results = [self fetchNodesOfType:entityName WithId:facebookId];
    if (results.count > 0) return [results objectAtIndex:0];
    return nil;
}

- (NSArray *)fetchNodesOfType: (NSString *)entityName WithId: (NSString *)facebookId
{
    NSManagedObjectContext *moc = self.managedObjectContext;
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              entityForName:entityName inManagedObjectContext:moc];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    
    if (facebookId) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:
                                  @"(facebookId = %@)", facebookId];
        [request setPredicate:predicate];
    }
    
    NSError *error = nil;
    NSArray *array = [moc executeFetchRequest:request error:&error];
    if (array == nil)
    {
        // Deal with error...
    }
    return array;
}

- (NSArray *)getAllNodes
{
    // TODO:add articles
    NSMutableArray *results = [[NSMutableArray alloc] init];
    [results addObjectsFromArray:[self fetchNodesOfType:@"DNPerson" WithId:nil]];
    [results addObjectsFromArray:[self fetchNodesOfType:@"DNSubject" WithId:nil]];
    [results addObjectsFromArray:[self fetchNodesOfType:@"DNSource" WithId:nil]];
    return results;
}


- (id <DNNode>)makeNodeForJson:(NSDictionary *)json
{
    if ([[json valueForKey:@"type"] isEqualToString:@"person"]) {
        DNPerson *person = [self makePersonWithId:[json valueForKey:@"facebookId"] andName:[json valueForKey:@"name"]];
        [person setRanking:[[json valueForKey:@"ranking"] floatValue]];
        return person;
    }
    else if ([[json valueForKey:@"type"] isEqualToString:@"source"]) {
        DNSource *source = [self makeSourceWithName:[json valueForKey:@"name"]];
        [source setRanking:[[json valueForKey:@"ranking"] floatValue]];
        return source;
    }
    else if ([[json valueForKey:@"type"] isEqualToString:@"subject"]) {
        DNSubject *subject = [self makeSubjectWithId:[json valueForKey:@"facebookId"] andName:[json valueForKey:@"name"] andCategory:[json valueForKey:@"category"]];
        [subject setRanking:[[json valueForKey:@"ranking"] floatValue]];
        return subject;
    }
    return nil;
}

#pragma mark - Application's Documents directory

/**
 Returns the URL to the application's Documents directory.
 */
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

#pragma mark - Core Data Stack

/**
 Returns the managed object context for the application.
 If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
 */
- (NSManagedObjectContext *)managedObjectContext
{
    if (__managedObjectContext != nil)
    {
        return __managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil)
    {
        __managedObjectContext = [[NSManagedObjectContext alloc] init];
        [__managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return __managedObjectContext;
}

/**
 Returns the managed object model for the application.
 If the model doesn't already exist, it is created from the application's model.
 */
- (NSManagedObjectModel *)managedObjectModel
{
    if (__managedObjectModel != nil)
    {
        return __managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:self.modelName withExtension:@"momd"];
    __managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return __managedObjectModel;
}

/**
 Returns the persistent store coordinator for the application.
 If the coordinator doesn't already exist, it is created and the application's store added to it.
 */
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (__persistentStoreCoordinator != nil)
    {
        return __persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.sqlite",self.modelName]];
    
    NSError *error = nil;
    __persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![__persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error])
    {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return __persistentStoreCoordinator;
}

- (void)resetStore
{
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.sqlite",self.modelName]];
    [self deletePersistentStore:storeURL];
}

- (void)deletePersistentStore:(NSURL *)storeURL
{
    NSError *error = nil;
    [[NSFileManager defaultManager] removeItemAtURL:storeURL error:&error];
    if (error) { // Handle error }
    }
}

@end
