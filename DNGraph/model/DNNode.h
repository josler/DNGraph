//
//  DNNode.h
//  DNGraph
//
//  Created by James Osler on 15/02/2013.
//  Copyright (c) 2013 James Osler. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Protocol defining requirements for a Node in the Knowledge Graph
 */
@protocol DNNode <NSObject>

@required

/**
 Like the node, increasing it's ranking.
 */
- (void)like;

/**
 Dislike the node, decreasing it's ranking.
 */
- (void)dislike;

/**
 Reset the ranking for a particular node
 */
- (void)resetRanking;

/**
 Get the ID of the node. Provided for legacy reasons.
 @return the ID.
 */
- (NSString *)getId;

/**
 ID Property of the node.
 */
@property (nonatomic) float ranking;

@end
