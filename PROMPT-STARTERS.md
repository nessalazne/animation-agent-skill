# Prompt starters

Copy a line, change the subject, send it. Every line starts with `/animate`.

You can add three things to any prompt:

- **A style**: cut paper, crosshatch, riso, sketchbook, math, pixel or isometric. Leave it out and the skill shows you a gallery to pick from.
- **A shape**: 9:16 for Reels, TikTok and Shorts, 1:1 or 4:5 for the feed, 16:9 for YouTube. Name several and you get one video per shape.
- **A length**: 15 to 60 seconds works best. Shorter is easier to get right the first time.

Every fact on screen gets checked with a web search and listed with its source, so pick subjects you can stand behind.

## Explain one idea

```
/animate how a sales funnel works, 30 seconds, isometric, 9:16
/animate what an API is, explained for people who run a coaching business, 30 seconds, sketchbook, 9:16
/animate how email open rates are counted, 25 seconds, math, 16:9
/animate the difference between a lead magnet and a tripwire, 30 seconds, riso, 4:5
```

## Tell a short history

```
/animate a 45-second history of the bicycle, cut paper, 9:16
/animate a 40-second history of the search engine, pixel, 16:9
/animate a 30-second history of the shopping cart, crosshatch, 1:1
```

## Show your own product

Give it your site address and it takes real screenshots and animates them inside the style.

```
/animate a 20-second launch reel for https://your-site.com, riso, 9:16 and 1:1
/animate a 25-second walkthrough of our booking page https://your-site.com/book, isometric, 9:16
```

## Cut to your music

Give it a track and it cuts on the beat and puts the payoff on the loudest hit.

```
/animate a 20-second promo for my new course, cut to ./audio/track.mp3, cut paper, 9:16
/animate a 30-second before-and-after of a messy inbox turning into a clean one, cut to ./audio/track.mp3, pixel, 9:16
```

## Add a voice-over

```
/animate a narrated 45-second explainer of how DNS works, math, 16:9, voice from ElevenLabs
/animate a narrated 30-second tip on writing a better first line, sketchbook, 9:16, use my recording ./audio/voice.wav
```

## Match a look you already like

Point it at stills, a video or a web page. It measures the palette, line weight and motion, draws a matched frame next to your reference, and asks for a thumbs up before it saves the new style.

```
/animate a 30-second explainer about how I work with clients, in the style of these screenshots: ./refs/
```

Reference media stays on your machine.

## Tips

- Say who it is for. "For people who run a coaching business" changes the examples the skill picks.
- Approve the look frames carefully. Changing the look after the storyboard costs a full rebuild.
- If a beat feels long, say the beat number in your notes and ask for it shorter.

## More ideas

For a big list of what other people have asked Claude to build in code, browse [yihui-dev/awesome-opus5-5-videos](https://github.com/yihui-dev/awesome-opus5-5-videos). Those prompts belong to their creators and were written for general code generation, not for this skill. Use them for ideas and rewrite them as `/animate` prompts. Credit the creator if you share what you make from one.

Three to start with. The ideas are the creators'. The prompts below are new and written for this skill.

**A recipe from empty glass to finished drink.** Idea from [@Ror_Fly](https://x.com/Ror_Fly/status/2102853258582880547), who asked for a 30-second recipe explainer that shows each ingredient and measurement as it goes into the cup.

```
/animate a 30-second recipe explainer for a classic mojito, from empty glass to finished drink, showing each ingredient and its measurement as it goes in, sketchbook, 9:16
```

**An ad built from your real product.** Idea from [@redpersongpt](https://x.com/redpersongpt/status/2103807094554284430), who asked for a studio-quality motion ad built from the real product and not a generic mockup. This skill already works that way: give it your address and it takes screenshots of the real site.

```
/animate a 25-second ad for https://your-site.com, built from real screenshots of the product, one clear benefit per beat, no features that do not exist, isometric, 9:16 and 1:1
```

**An animation to go with a post.** Idea from [@daniel_mac8](https://x.com/daniel_mac8/status/2103824976713306214), who wanted an animation to accompany an X post and pointed Claude at a reference video for the look. Put your own reference in your project folder first. A path on someone else's computer will not work.

```
/animate a 20-second animation to go with my post about [your topic], in the style of this video: ./refs/reference.mp4, 16:9
```
