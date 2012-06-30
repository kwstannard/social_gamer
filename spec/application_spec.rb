require 'spec_helper'
require 'application'
describe Application do

  let (:email) { double }
  let (:password) { "pass" }
  let (:user) { User.new(email: email, password: password) }

  it 'logs in users given correct email and password' do
    subject.absorb(user)
    subject.make_session(email, password).should be(user)
  end

  it 'logs in users given correct email and password' do
    subject.absorb(user)
    subject.make_session(email, "herp").should be_nil
  end

end
