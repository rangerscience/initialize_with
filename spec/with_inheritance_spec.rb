RSpec.describe InitializeWith do
  describe "when used with inheritance" do
    let(:parent_klass) do
      Class.new do
        include InitializeWith
        initialize_with :bar, baz: 99
      end
    end

    let(:klass) do
      Class.new(parent_klass) do
        attr_reader :faz, :boo
        initialize_with :foo, faz: 42 do
          @bar = 3
        end
      end
    end

    it "sets the instance variables" do
      instance = klass.new(1)
      expect(instance.foo).to eq 1
      expect(instance.faz).to eq 42
    end

    it "does not set the parent instance variables" do
      instance = klass.new(1)
      expect(instance.bar).to eq 3
      expect(instance.baz).to be_nil
    end
  end
end
