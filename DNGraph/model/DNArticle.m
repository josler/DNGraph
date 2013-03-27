#import "DNArticle.h"
#import "DNSource.h"
#import "DNSubject.h"
#import "DNPerson.h"

@implementation DNArticle


- (void)setupWithPerson:(DNPerson *)person Source:(DNSource *)source Subject:(DNSubject *)subject andRanking: (float)ranking;
{
    self.source = source;
    self.person = person;
    self.subject = subject;
    [self setPrimitiveRanking:[NSNumber numberWithFloat:ranking]];
    self.dateCreated = [NSDate date];
}

- (UIImage *)getImage
{
    if (self.imageFilename) {
        NSArray *sysPaths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES );
        NSString *docDirectory = [sysPaths objectAtIndex:0];
        NSString *filePath = [NSString stringWithFormat:@"%@/%@", docDirectory, self.imageFilename];
        return [[UIImage alloc] initWithContentsOfFile:filePath];
    }
    return nil;
}

- (void)like
{
    if (self.subject)
        [self.subject like];
    if (self.person)
        [self.person like];
    if (self.source)
        [self.source like];
}

- (void)dislike
{
    if (self.subject)
        [self.subject dislike];
    if (self.person)
        [self.person dislike];
    if (self.source)
        [self.source dislike];
    [self setPrimitiveRanking:[NSNumber numberWithFloat:0.0f]]; // the actual article is not liked and should go.
}

- (void)resetRanking {} // no meaning for an article as it's ranking composed of it's parts

- (NSString *)getId { return self.hashValue; }

- (NSDictionary *)jsonFormat
{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setValue:@"article" forKey:@"type"];
    [dict setValue:self.type forKey:@"articleType"];
    [dict setValue:self.hashValue forKey:@"hashValue"];
    [dict setValue:self.title forKey:@"title"];
    [dict setValue:self.textValue forKey:@"textValue"];
    [dict setValue:self.primitiveRanking forKey:@"ranking"];
    [dict setValue:self.comments forKey:@"comments"];
    [dict setValue:self.favourite forKey:@"favourite"];
    [dict setValue:self.imageFilename forKey:@"imageFilename"];
    [dict setValue:self.videoUrl forKey:@"videoUrl"];
    return dict;
}


@end
