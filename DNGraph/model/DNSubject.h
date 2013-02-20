//
//  DNSubject
//  DNGraph
//
//  Created by James Osler on 20 Feb 2013
//  Copyright (c) 2013 James Osler. All rights reserved.
//

#import "_DNSubject.h"
#import "DNNode.h"

@class DNRanker;

/**
 A Subject node in the graph.
 */
@interface DNSubject : _DNSubject <DNNode>

/// The DNRanker that controls the ranking of a Node.
@property (nonatomic, strong) DNRanker *ranker;

/**
 Sets up the DNSubject with an ID, name and category.
 @param facebookId The ID provided by Facebook.
 @param name The given name for a subject.
 @param category The category of a subject (for example, 'photo').
 */
- (void)setupWithId: (NSString *)facebookId andName: (NSString *)name andCategory: (NSString *)category;

@end
