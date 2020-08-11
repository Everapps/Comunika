require 'spec_helper'

describe Message do
  before :each do
    message_params = {:user_id => rand(1..3), :message => "Some message"}
    @message = Message.new message_params
  end

  describe "#new" do
    it "takes two parameters and returns a Message object" do
      expect(@message).to be_an_instance_of Message
    end
  end

  describe "#message" do
    it "returns the message text" do
      expect(@message.message).to eql "Some message"
    end
  end
end
