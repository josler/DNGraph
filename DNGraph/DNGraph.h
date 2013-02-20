//
//  DNGraph.h
//  DNGraph
//
//  Created by James Osler on 15/02/2013.
//  Copyright (c) 2013 James Osler. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DNPerson, DNSource, DNSubject;

/**
 Handles interaction with the Graph.
 */
@interface DNGraph : NSObject

#pragma mark - Factory Methods

/// ------------------------------------------
/// @name Node Access
/// ------------------------------------------

/**
 Provides a DNPerson node with the given ID.
 
 If the person already exists (matching ID), then the existing instance will be returned.
 
 @param facebookId An ID provided by Facebook Stream.
 @param name The name for the person.
 @return A DNPerson matching the ID given.
 */
- (DNPerson *)makePersonWithId: (NSString *)facebookId andName: (NSString *)name;

/**
 Returns a DNSubject node with the given ID.
 
 If the subject already exists (matching ID), then the existing instance will be returned.
 
 @param facebookId An ID provided by Facebook Stream.
 @param name The name for the subject.
 @param category The category for the subject.
 @return A DNSubject matching the ID given.
 */
- (DNSubject *)makeSubjectWithId: (NSString *)facebookId andName: (NSString *)name andCategory: (NSString *)category;

/**
 Returns a DNSource node with the given ID.
 
 If the source already exists (matching name), then the existing instance will be returned.
 
 @param name The name for the source.
 @return A DNSource matching the ID given.
 */
- (DNSource *)makeSourceWithName: (NSString *)name;


#pragma mark - Core Data Stack

@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (nonatomic, strong) NSString *modelName;

@end
