require 'rails_helper'
require 'spec_helper'

RSpec.describe Friendship, type: :model do
  it { expect(subject).to belong_to(:user) }
  it { expect(subject).to belong_to(:friend) }
end
