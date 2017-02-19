defmodule GithubIssuePuller.TableFormatter do

  def print_table_to_columns issues, columns do
    lengths_map = get_max_length_for_columns issues, columns
    print_head columns, lengths_map
    print_issues(issues, columns, lengths_map)
  end

  def print_issues [], _, _ do
    :ok
  end

  def print_issues [issue | tail], columns, lengths_map do
    print_one_issue issue, columns, lengths_map
    print_issues tail, columns, lengths_map
  end

  def print_head columns, lengths_map do
    Enum.map(columns, &(pad_string(&1, lengths_map[&1])))
    |> Enum.join("|")
    |> IO.puts

    Enum.map(columns, &(String.duplicate("-", lengths_map[&1])))
    |> Enum.join("+")
    |> IO.puts
  end

  def get_max_length_for_columns _issues, _columns do
    %{"number" => 7, "created_at" => 22, "title" => 70}
  end

  def print_one_issue issue, columns, lengths_map do
    columns
    |> Enum.map(&(pad_string(to_string(issue[&1]), lengths_map[&1])))
    |> Enum.join("|")
    |> IO.puts
  end

  def pad_string value, total_length do
    sliced_value = String.slice value, 0, total_length
    string_length = String.length sliced_value
    total_padding = total_length - string_length
    left_padding = div(total_padding, 2)
    sliced_value
    |> String.ljust(left_padding + string_length)
    |> String.rjust(total_length)
  end

end
