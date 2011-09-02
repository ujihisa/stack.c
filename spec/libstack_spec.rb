require 'spec_helper'

describe LibStack do
  describe 'the initial state' do
    subject do
      described_class.newstack(42)
    end

    it "has zero index" do
      subject.i.should eq 0
    end
  end

  describe '.newstack' do
    context 'with 42' do
      it 'create a new Stack of size 42' do
        stack = described_class.newstack(42)
        stack.size.should eq 42
      end
    end
  end
end
