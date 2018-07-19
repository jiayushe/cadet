defmodule Cadet.Assessments.Submission do
  @moduledoc false
  use Cadet, :model

  alias Cadet.Accounts.User
  alias Cadet.Assessments.{Answer, Assessment}

  schema "submissions" do
    field(:xp, :integer, virtual: true)

    belongs_to(:assessment, Assessment)
    belongs_to(:student, User)
    has_many(:answers, Answer)

    timestamps()
  end

  @required_fields ~w(student_id assessment_id)a

  def changeset(submission, params) do
    submission
    |> cast(params, @required_fields)
    |> add_belongs_to_id_from_model([:student, :assessment], params)
    |> validate_required(@required_fields)
    |> foreign_key_constraint(:student_id)
    |> foreign_key_constraint(:assessment_id)
  end
end