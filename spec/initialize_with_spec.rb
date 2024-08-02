RSpec.describe InitializeWith do
  it "has a version number" do
    expect(InitializeWith::VERSION).not_to be nil
  end

  let(:klass) do
    Class.new do
      include InitializeWith
      initialize_with :foo, :bar, baz: 42
    end
  end

  context "when a correct number of arguments are passed" do
    it "sets the instance variables" do
      instance = klass.new(1, 2, 3)
      expect(instance.foo).to eq 1
      expect(instance.bar).to eq 2
      expect(instance.baz).to eq 3
    end

    it "uses the default values of the optional parameters" do
      instance = klass.new(1, 2)
      expect(instance.baz).to eq 42
    end
  end

  context "when too few arguments are passed" do
    it "raises an ArgumentError" do
      expect { klass.new(1) }.to raise_error ArgumentError
    end
  end

  context 'when too many arguments are passed' do
    it 'raises an ArgumentError' do
      expect { klass.new(1, 2, 3, 4) }.to raise_error ArgumentError
    end
  end
end
