#import "DNSubject.h"
#import "DNRanker.h"

@implementation DNSubject

@synthesize ranker;

- (void)setupWithId: (NSString *)facebookId andName: (NSString *)name andCategory: (NSString *)category
{
    self.facebookId = facebookId;
    self.name = name;
    self.category = category;
    self.ranking = 0.5f;
    self.ranker = [[DNRanker alloc] initWithDelgate:self];
}

#pragma mark - DNNode Delegate

- (NSDictionary *)jsonFormat
{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setValue:self.facebookId forKey:@"facebookId"];
    [dict setValue:self.name forKey:@"name"];
    [dict setValue:self.category forKey:@"category"];
    [dict setValue:[NSNumber numberWithFloat:self.ranking] forKey:@"ranking"];
    if (self.imageFilename)
        [dict setValue:self.imageFilename forKey:@"imageFilename"];
    if (self.meta)
        [dict setValue:self.meta forKey:@"imageFilename"];
    [dict setValue:@"subject" forKey:@"type"];
    return dict;
}

- (NSString *)getId {return self.facebookId;}
- (void)like {[ranker like];}
- (void)dislike {[ranker dislike];}
- (void)resetRanking {[ranker resetRanking];}

@end
