# DunBot

A ranked voting app, inspired by my friend Duni, on Rails 6.1.1, with a tiny bit of Stimulus, Bootstrap because I'm too busy snowboarding, and built using the [Irv gem](https://github.com/highwide/irv) to power Instant Runoff Voting.

## What is this?

Ever been stuck with a group trying to decide between many options? This app uses [instant runoff voting](https://en.wikipedia.org/wiki/Instant-runoff_voting) to allow participants to submit a ranked choice ballot, and hopefully break that decision making deadlock. DunBot will allow both users and guests to participate in votes created using the platform.

## Limitations

- Currently, pages are not dynamically updated, and I'm exploring my options on how best to implement this
- The app does not currently notify users of votes, votes being closed, or the results
- Omniauth is not currently included
- Placeholder content for past votes means that closed votes cease to be available from the home page once voting ends
- Placeholder content does not display ranks awarded to options when viewing a vote

## Planned improvements

- Tackle everything on the limitations list
- Write tests - I was horribly lazy and elected not to write tests due to other life commitments, but it's on my list
