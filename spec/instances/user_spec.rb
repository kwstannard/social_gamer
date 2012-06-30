load '~/social_gamer/spec_helper.rb'
describe User, :type => :instance do
  it_has_the_attributes(:email, :password, :password_confirmation)

  it 'encrypts a users password' do
    subject.password_salt.should be_nil
    subject.password_hash.should be_nil
    subject.password = "derp"
    subject.password_salt.should_not be_nil
    subject.password_hash.should_not be_nil
  end
end
