#import "_DNArticle.h"

@class DNSubject, DNSource, DNPerson;

@interface DNArticle : _DNArticle {}

@property (nonatomic) float weightedRank;

- (void)setupWithSubject:(DNSubject *)subject Source:(DNSource *)source andAuthor:(DNPerson *)author;

- (void)setComments:(NSString *)comments withPeople:(NSArray *)people;

- (void)setWeightedRankWithMeanRank:(float)meanRank andMinimumNodes:(float)minimumNodes;

- (float)getOverallRanking;
@end
