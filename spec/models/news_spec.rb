require 'rails_helper'

RSpec.describe News, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:key) }
    it { is_expected.to validate_presence_of(:content) }
  end
end
