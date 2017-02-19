defmodule CLITest do
  use ExUnit.Case
  doctest GithubIssuePuller

  import GithubIssuePuller.CLI, only: [ parse_args: 1, sort_into_ascending_order: 1, convert_to_list_of_maps: 1 ]

  test ":help returned by passing -h and --help" do
    assert parse_args(["-h",  "anything"]) == :help
    assert parse_args(["--h", "anything"]) == :help
  end

  test "three values returned if 3 given" do
    assert parse_args(["nicholas", "le", "42"]) == { "nicholas", "le", 42 }
  end

  test "default count if only 2 given" do
    assert parse_args(["nicholas", "bogoss"]) == { "nicholas", "bogoss", 4 }
  end

  test "sort ascending orders the correct way" do
    result = sort_into_ascending_order(fake_created_at_list(["c", "b", "a"]))
    issues = for issue <- result, do: issue["created_at"]
    assert issues == ~w{a b c}
  end

  defp fake_created_at_list(values) do
    data = for value <- values, do: [{"created_at", value}, {"other", "xxx"}]
    convert_to_list_of_maps data
  end

end
