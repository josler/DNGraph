#import "DNArticle.h"
#import "DNSource.h"
#import "DNSubject.h"
#import "DNPerson.h"

@implementation DNArticle

@synthesize weightedRank;

- (void)setupWithSubject:(DNSubject *)subject Source:(DNSource *)source andAuthor:(DNPerson *)author
{
    self.subjectId = [subject getId]; // 'soft' link
    self.sourceId = [source getId];

    self.nodeRankingValue += subject.ranking;
    self.nodeRankingValue += source.ranking;
    self.nodeCountValue = 2;

    if (author) {
        self.personId = author.facebookId;
        self.nodeRankingValue += author.ranking;
        self.nodeCountValue += 1;
    }
}

- (void)setComments:(NSString *)comments withPeople:(NSArray *)people
{
    for (DNPerson *p in people) {
        self.nodeRankingValue += p.ranking;
        self.nodeCountValue += 1;
    }
    self.comments = comments;
}

- (void)setWeightedRankWithMeanRank:(float)meanRank andMinimumNodes:(float)minimumNodes
{
    self.weightedRank = ([self getOverallRanking] * (self.nodeCountValue / (self.nodeCountValue + minimumNodes))) + (meanRank * (minimumNodes / (self.nodeCountValue + minimumNodes)));
}

- (float)getOverallRanking {
    return (self.nodeRankingValue / self.nodeCountValue);
}
@end
