defmodule CustomDataType do
  defstruct value: nil
end

defimpl Inspect, for: CustomDataType do
  import Inspect.Algebra

  def inspect(dict, opts) do
    concat ["#CustomDataType<", to_doc(value), ">"]
  end
end

struct = %CustomDataType{value: 10}
inspect(struct)
