# AWS status in Slack

With this script we can listen to particular AWS RSS feeds for events, posting them
to a Slack channel.

## Features

Why use this instead of the [standard RSS feed plugin for Slack](https://slack.com/apps/A0F81R7U7-rss)?

The main reasons are of design:

- Icon: with an AWS icon you can easily tell the origin of the message.
- Clean messages: only title and summary text.
- Color code: green for recovery, yellow for informational and red for other messages.

One last reason is that you can use an existing Slack Webhook with this service,
meaning one less integration installed in your Slack account.

## Usage

You'll need to setup a [Slack Webhook](https://api.slack.com/incoming-webhooks).
Then pass the Webhook URL and the desired Slack channel to receive the notifications,
like `#notifications`, for instance.

### Listen to all feeds

You can run it with Docker:
```
docker run -d docker.io/alter/aws_status_to_slack SLACK_WEBHOOK SLACK_CHANNEL
```

The script will start to listen for changes in [http://status.aws.amazon.com/rss/all.rss](http://status.aws.amazon.com/rss/all.rss).

### Listen to specific feeds

You can select individual feeds to listen for. Just check [AWS status page](http://status.aws.amazon.com/)
and get the desired feeds names.

For instance, to check for EC2 issues in South America, AWS give us the feed
[http://status.aws.amazon.com/rss/ec2-sa-east-1.rss](http://status.aws.amazon.com/rss/ec2-sa-east-1.rss).
We just need the feed name, `ec2-sa-east-1` in this case. Just pass the feed names
you would like to listen for after the `SLACK_CHANNEL` argument, like this:
```
docker run -d docker.io/alter/aws_status_to_slack SLACK_WEBHOOK SLACK_CHANNEL ec2-sa-esat-1
```

You can pass as many feeds as you like.
