#import "DNSource.h"
#import "DNRanker.h"


@implementation DNSource

@synthesize ranker;

- (void)setupWithName:(NSString *)name
{
    self.facebookId = name; // set our facebookId to name
    self.name = name;
    self.ranking = 0.5f;
    self.ranker = [[DNRanker alloc] initWithDelgate:self];
}

#pragma mark - DNNode Delegate

- (NSString *)getId {return self.facebookId;}
- (void)like {[ranker like];}
- (void)dislike {[ranker dislike];}
- (void)resetRanking {[ranker resetRanking];}

@end
