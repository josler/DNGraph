//
//  DNPerson
//  DNGraph
//
//  Created by James Osler on 20 Feb 2013
//  Copyright (c) 2013 James Osler. All rights reserved.
//


#import "_DNPerson.h"
#import "DNNode.h"

@class DNRanker;

/**
 A person node in the graph.
 */
@interface DNPerson : _DNPerson <DNNode>

/**
 Sets up a Person node given an ID and a name.
 @param name The name of the person
 @param facebookId The ID for the Person (from Facebook feed)
 */
- (void)setupWithId: (NSString *)facebookId andName: (NSString *)name;

/// The DNRanker that controls the ranking of a Node.
@property (nonatomic, strong) DNRanker *ranker;

@end
