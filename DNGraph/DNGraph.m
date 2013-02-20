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

@implementation DNGraph

@synthesize persistentStoreCoordinator = __persistentStoreCoordinator;
@synthesize managedObjectModel = __managedObjectModel;
@synthesize managedObjectContext = __managedObjectContext;

- (void)saveContext
{
    [self.managedObjectContext save:nil];
}

#pragma mark - Factory Methods

- (DNSource *)makeSourceWithName: (NSString *)name
{
    DNSource *source = [self getExistingNodeOfType:@"DNSource" withId:name];
    if (source) return source;
    
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

#pragma mark - Core Data Fetching

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
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:
                              @"(facebookId = %@)", facebookId];
    [request setPredicate:predicate];
    
    NSError *error = nil;
    NSArray *array = [moc executeFetchRequest:request error:&error];
    if (array == nil)
    {
        // Deal with error...
    }
    return array;
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


@end
