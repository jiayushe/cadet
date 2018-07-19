defmodule Cadet.Assessments.QuestionTest do
  use Cadet.ChangesetCase, async: true

  alias Cadet.Assessments.Question

  valid_changesets Question do
    %{
      display_order: 2,
      title: "question",
      question: %{},
      type: :programming,
      library: build(:library),
      assessment_id: 2
    }

    %{
      display_order: 1,
      title: "mcq",
      question: %{},
      type: :mcq,
      library: build(:library),
      assessment_id: 2
    }

    %{
      display_order: 5,
      title: "sample title",
      question: %{},
      type: :programming,
      library: build(:library),
      raw_question: Jason.encode!(%{question: "This is a sample json"}),
      assessment_id: 2
    }
  end

  invalid_changesets Question do
    %{
      display_order: 2,
      title: "question",
      type: :programming
    }

    %{
      display_order: 2,
      question: %{},
      type: :mcq
    }
  end
end