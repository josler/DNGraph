//
//  DNRanker.m
//  DNGraph
//
//  Created by James Osler on 15/02/2013.
//  Copyright (c) 2013 James Osler. All rights reserved.
//

#import "DNRanker.h"

@implementation DNRanker

- (id)initWithDelgate:(id<DNNode>)delegate
{
    self = [super init];
    if (self) {
        if (delegate) self.delegate = delegate;
    }
    return self;
}

- (void)like
{
    float difference = 1 - self.delegate.ranking;
    self.delegate.ranking += difference / 5;
}

- (void)dislike
{
    self.delegate.ranking -= self.delegate.ranking / 5;
}

- (void)resetRanking
{
    self.delegate.ranking = 0.5;
}


@end
