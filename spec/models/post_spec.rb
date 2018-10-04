require 'rails_helper'
require 'spec_helper'

RSpec.describe Post, type: :model do
  it { expect(subject).to have_many(:comments) }
  it { expect(subject).to belong_to(:user) }
end
