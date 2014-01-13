require "spec_helper"

describe Tweet do 
#  let!(:tweet) { Tweet.create(user: "joetwitter", message: "Wow! Fake twitter is so great!")}  

  describe "validations" do
    it "is valid" do
      tweet = Tweet.create(user: "joetwitter", message: "Wow! Fake twitter is so great!")
      expect(tweet).to be_valid
    end

    it "must have a name" do
      tweet = Tweet.create(message: "Tweettweettweet")
      expect(tweet.errors[:user]).to include "can't be blank"
    end

    it "can't be blank" do
      tweet = Tweet.create(user: "joetwitter", message: " ")
      expect(tweet.errors[:message]).to include "can't be blank"
    end

    it "must have a message" do
      tweet = Tweet.create(user: "joetwitter")
      expect(tweet.errors[:message]).to include "can't be blank"
    end

    it "must be less than 140 characters" do
      invalid_tweet = Tweet.new(user: "joetwitter", message: "I am typing just over 140 characters which is really not a lot when you stop to think about it. It's not enough to really explain a situation")
      expect(invalid_tweet).to be_invalid
    end
  end
end