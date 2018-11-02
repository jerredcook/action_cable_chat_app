require 'test_helper'

class MessageTest < ActiveSupport::TestCase

  def setup
    @user = users(:example)
    @message = users(:example).messages.build(content: "Lorem ipsum")
    @message_with_at = @user.messages.build(content: "Hi @example")
  end

  test "should be valid" do
    assert @message.valid?, @message.errors.full_messages
  end

  test "should not be blank" do
    @message.content = " "
    assert !@message.valid?
  end


  test "mentions should work" do
    mention = @message_with_at.mentions
    assert_not mention.empty?
  end
  
  test "mentions should not work" do
    message = @message.mentions
    assert message.empty?
  end
end
