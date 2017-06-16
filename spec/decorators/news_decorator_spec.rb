require 'rails_helper'

describe NewsDecorator do
  let(:news) { ActiveDecorator::Decorator.instance.decorate(FactoryGirl.create(:news)) }
  subject { news }
  it { is_expected.to be_a News }

  describe 'label_for_csv' do
    subject { news.label_for_csv }

    context 'label: :celebrity' do
      before { news.celebrity! }
      it { is_expected.to eq '1' }
    end

    context 'label: :IT' do
      before { news.IT! }
      it { is_expected.to eq '7' }
    end
  end
end
