//
//  DNArticle.h
//  DNGraph
//
//  Created by James Osler on 4 Mar 2013
//  Copyright (c) 2013 James Osler. All rights reserved.
//


#import "_DNArticle.h"

@class DNSubject, DNSource, DNPerson;

/**
 Defines an article composed of several nodes, and content added to it.
 */
@interface DNArticle : _DNArticle {}

/**
 The euclidian weighted rank from component nodes. Has to be set with setWeightedRankWithMeanRank:andMinimumNodes: first.
 */
@property (nonatomic) float weightedRank;

/**
 Sets up the DNArticle with a given DNSubject, DNSource and DNPerson.
 
 @param subject The DNSubject for the article.
 @param source The DNSource for the article.
 @param author The DNPerson (author) of the article.
 */
- (void)setupWithSubject:(DNSubject *)subject Source:(DNSource *)source andAuthor:(DNPerson *)author;

/**
 Adds comments to an article, from the people who made them. This affects the ranking.
 
 @param comments The string to be displayed for comments.
 @param people The people who made the comments (NSArray of DNPerson).
 */
- (void)setComments:(NSString *)comments withPeople:(NSArray *)people;

/**
 Sets the weighted rank for this article in comparison to the others, using the mean rank and minimum nodes.
 
 @param meanRank The mean rank of all articles in the system.
 @param minimumNodes How many nodes must an article have to be eligible for ranking (suggested value of 2).
 */
- (void)setWeightedRankWithMeanRank:(float)meanRank andMinimumNodes:(float)minimumNodes;

/**
 Gets the overall (non-weighted) ranking for this DNArticle, based on component nodes.
 
 @return The overall ranking (mean) for the DNArticle (non-weighted).
 */
- (float)getOverallRanking;
@end
