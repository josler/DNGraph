//
//  DNGraph__Private.h
//  DNGraph
//
//  Created by James Osler on 20/02/2013.
//  Copyright (c) 2013 James Osler. All rights reserved.
//

#import "DNGraph.h"
#import "DNNode.h"

@interface DNGraph ()

- (id <DNNode>)getExistingNodeOfType: (NSString *)entityName withId: (NSString *)facebookId;
- (NSArray *)fetchNodesOfType: (NSString *)entityName WithId: (NSString *)facebookId;

@end
