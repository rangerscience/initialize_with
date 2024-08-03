RSpec.describe InitializeWith do
  describe "with splat" do
    let(:klass) do
      Class.new do
        include InitializeWith
        initialize_with :foo, baz: 42, splat: :opts
      end
    end

    context "when extra positional arguments are provided" do
      it "sets the instance variables" do
        instance = klass.new(1, 2, 3, 4)
        expect(instance.foo).to eq 1
        expect(instance.baz).to eq 2
        expect(instance.opts).to eq [ 3, 4 ]
      end
    end

    context "when no extra positional arguments are provided" do
      it "uses the default values of the optional parameters" do
        instance = klass.new(1, 2)
        expect(instance.opts).to eq []
      end
    end
  end
end
