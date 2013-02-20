//
//  DNRanker.h
//  DNGraph
//
//  Created by James Osler on 15/02/2013.
//  Copyright (c) 2013 James Osler. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DNNode.h"

/**
 Controls the ranking behaviour of a particular Node
 */
@interface DNRanker : NSObject

/// The Node that the object controls the ranking of.
@property (nonatomic, strong) id <DNNode> delegate;

/// ------------------------------------------
/// @name Initializers
/// ------------------------------------------

/**
 Initialize an object with a given Node delegate
 @param delegate The Delegate to control the ranking of, conforms to DNNode protocol.
 */
- (id)initWithDelgate: (id <DNNode>)delegate;

/**
 Like, increasing it's ranking.
 */
- (void)like;

/**
 Dislike, decreasing it's ranking.
 */
- (void)dislike;

/**
 Resets the ranking to default value.
 */
- (void)resetRanking;

@end
