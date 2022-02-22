defmodule Counter do
  # public API
  def start_link(initial_count \\ 0) do
    spawn_link(__MODULE__, :run, [initial_count])
  end

  def increment(pid) when is_pid(pid) do
    send(pid, :increment)
  end

  def decrement(pid) when is_pid(pid) do
    send(pid, :decrement)
  end

  def count(pid) when is_pid(pid) do
    send(pid, {:count, self()})

    receive do
      {^pid, count} -> count
    end
  end

  # implementation
  def run(count) do
    receive do
      msg -> handler(msg, count)
    end
    |> run()
  end

  def handler(:increment, count), do: count + 1
  def handler(:decrement, count), do: count - 1

  def handler({:count, pid}, count) do
    send(pid, {self(), count})
    count
  end
end
