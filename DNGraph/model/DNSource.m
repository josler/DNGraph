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

- (NSDictionary *)jsonFormat
{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setValue:self.facebookId forKey:@"facebookId"];
    [dict setValue:self.name forKey:@"name"];
    [dict setValue:[NSNumber numberWithFloat:self.ranking] forKey:@"ranking"];
    [dict setValue:@"source" forKey:@"type"];
    return dict;
}

- (NSString *)getId {return self.facebookId;}
- (void)like {[ranker like];}
- (void)dislike {[ranker dislike];}
- (void)resetRanking {[ranker resetRanking];}

@end
