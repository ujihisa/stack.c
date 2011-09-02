require 'spec_helper'

describe LibStack do
  describe '.newstack' do
    context 'with 42' do
      it 'create a new Stack of size 42' do
        stack = described_class.newstack(42)
        stack.size.should eq 42
      end
    end
  end
end
