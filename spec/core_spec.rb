RSpec.describe 'InitializeWith::initialize' do
  it "has a version number" do
    expect(InitializeWith::VERSION).not_to be nil
  end

  let(:klass) do
    Class.new do
      include InitializeWith
      initialize_with :foo, faz: 42
      initialize_with :bar, baz: 99
    end
  end

  context "when a correct number of arguments are passed" do
    it "sets the instance variables" do
      instance = klass.new(1, 2)
      expect(instance.foo).to eq 1
      expect(instance.bar).to eq 2
    end

    it "uses the default values of the optional parameters" do
      instance = klass.new(1, 2)
      expect(instance.faz).to eq 42
      expect(instance.baz).to eq 99
    end

    it "applies the provided values for the optional parameters" do
      instance = klass.new(1, 2, 3)
      expect(instance.faz).to eq 3
      expect(instance.baz).to eq 99
    end
  end

  context "when too few arguments are passed" do
    it "raises an ArgumentError" do
      expect { klass.new(1) }.to raise_error ArgumentError
    end
  end

  context 'when too many arguments are passed' do
    it 'raises an ArgumentError' do
      expect { klass.new(1, 2, 3, 4, 5) }.to raise_error ArgumentError
    end
  end

  context 'when it is unused' do
    let(:klass) do
      Class.new do
        include InitializeWith
      end
    end
  end
end
