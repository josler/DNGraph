//
//  DNSource
//  DNGraph
//
//  Created by James Osler on 20 Feb 2013
//  Copyright (c) 2013 James Osler. All rights reserved.
//

#import "_DNSource.h"
#import "DNNode.h"

@class DNRanker;

/**
 A Source node in the graph.
 */
@interface DNSource : _DNSource <DNNode>

/// The DNRanker that controls the ranking of a Node.
@property DNRanker *ranker;

/**
 Sets up the object with a given name.
 @param name The name of the Source.
 */
- (void)setupWithName:(NSString *)name;

@end
