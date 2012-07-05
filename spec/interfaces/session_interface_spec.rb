require 'interfaces/session_interface'
require 'handlers/instance_handler'
require 'test_instances/user'

class Subj; include SessionInterface; end

describe SessionInterface do

  let(:subject) { Subj.new }
  let (:email) { double }
  let (:password) { "pass" }
  let (:user) { User.new(email: email, password: password) }


  before(:each) do
    subject.stub! :get_user_by_email do |e|
      user if e == email
    end
  end

  describe '#fetch_user' do
    it 'returns a user when given an email' do
      raise subject.get_user_by_email.inspect
      subject.fetch_user(email).should be(user)
    end

    it 'raises NoUserFound if email doesnt match anything' do
      expect{subject.fetch_user(email)}.to raise_error(NoUserFound)
    end
  end
  
  describe '#password_matches' do
    it 'returns true if given the correct password' do
      subject.password_matches?(user, password).should be_true
    end
    it 'raises WrongPassword if password doesnt match' do
      expect{subject.password_matches?(user, "herp")}.to raise_error(WrongPassword)
    end
  end
end
