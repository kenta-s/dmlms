require 'rails_helper'

RSpec.describe News, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:key) }
    it { is_expected.to validate_presence_of(:content) }
  end

  describe 'generate_filename_as_csv' do
    subject { News.generate_filename_as_csv }

    context 'it is 2017/01/22 10:30:11' do
      before { Timecop.freeze(Time.zone.local(2017, 1, 22, 10, 30, 11)) }
      after { Timecop.return }
      it { is_expected.to eq '20170122103011.csv' }
    end

    context 'it is 2015/12/31 15:21:45' do
      before { Timecop.freeze(Time.zone.local(2015, 12, 31, 15, 21, 45)) }
      after { Timecop.return }
      it { is_expected.to eq '20151231152145.csv' }
    end
  end
end
