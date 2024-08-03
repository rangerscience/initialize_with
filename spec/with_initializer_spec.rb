RSpec.describe InitializeWith do
  let(:parent_klass) do
    Class.new do
      attr_reader :parent_var
      def initialize
        @parent_var = "parent"
      end
    end
  end

  context "when the child class has an initializer" do
    let(:klass) do
      Class.new(parent_klass) do
        include InitializeWith
        initialize_with :foo, :bar, baz: 42

        attr_reader :faz

        def initialize
          super
          @faz = 99
        end
      end
    end

    it "applies initialize_with" do
      instance = klass.new(1, 2, 3)
      expect(instance.foo).to eq 1
      expect(instance.bar).to eq 2
      expect(instance.baz).to eq 3
    end

    it 'runs the original initialize method' do
      instance = klass.new(1, 2, 3)
      expect(instance.faz).to eq 99
    end

    it "runs the parent initializer" do
      instance = klass.new(1, 2, 3)
      expect(instance.parent_var).to eq "parent"
    end
  end

  context 'when the child class does not have an initializer' do
    let(:klass) do
      Class.new(parent_klass) do
        include InitializeWith
      end
    end

    it 'does not run the parent initializer' do
      instance = klass.new
      expect(instance.parent_var).to be_nil
    end
  end
end
