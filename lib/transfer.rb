require 'pry'
require_relative './bank_account.rb'
class Transfer
  # your code here
    @@Transfer_amount = []
  attr_accessor :sender, :receiver ,:amount, :status
  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @account = 0
    @@Transfer_amount << self.amount
  end 
  def valid?
    if self.sender.valid? && self.receiver.valid? 
      true 
    else 
      false 
    end
  end 
  def execute_transaction
    if self.valid? && @account == 0 && self.sender.balance >= self.amount
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      @account += 1
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end 
    def reverse_transfer
      if self.status == "complete"
      reverse_amount = @@Transfer_amount[0]
      self.sender.balance += reverse_amount
      self.receiver.balance -= reverse_amount
      self.status = "reversed"
      end 
    end
  end
end
