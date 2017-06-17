require 'rails_helper'

describe NewsDecorator do
  let(:news) { ActiveDecorator::Decorator.instance.decorate(FactoryGirl.create(:news)) }
  subject { news }
  it { is_expected.to be_a News }

  describe '#label_for_export' do
    subject { news.label_for_export }

    context 'label: :celebrity' do
      before { news.celebrity! }
      it { is_expected.to eq '1' }
    end

    context 'label: :IT' do
      before { news.sports! }
      it { is_expected.to eq '2' }
    end
  end
end
