require 'the_blob'
require 'interfaces/session_interface'

class Subj; include SessionInterface; include TheBlob; end

describe SessionInterface do

  let(:subj_class) { Class.new }
  let(:subject) { subj_class.new }

  let(:user) { User.new(email: double, password: "pass") }

  before(:each) do
    @dir = File.expand_path("../../../lib/test_instances", __FILE__)
    File.stub!(:expand_path) {@dir}
    subj_class.class_eval { include SessionInterface }
    subj_class.class_eval { include TheBlob }
  end

  describe '#fetch_user' do
    it 'returns a user when given an email' do
      subject.absorb user
      subject.fetch_user(user.email).should be(user)
    end

    it 'raises NoUserFound if email doesnt match anything' do
      expect{subject.fetch_user(user.email)}.to raise_error(NoUserFound)
    end
  end
  
  describe '#password_matches' do
    it 'returns true if given the correct password' do
      subject.password_matches?(user, user.password).should be_true
    end
    it 'raises WrongPassword if password doesnt match' do
      expect{subject.password_matches?(user, "herp")}.to raise_error(WrongPassword)
    end
  end
end
