defmodule Cadet.Course.Category do
  @moduledoc """
  Category represents a Material category
  """
  use Cadet, :model
  use Arc.Ecto.Schema

  alias Cadet.Course.{Category, Material}
  alias Cadet.Accounts.{User}

  schema "categories" do
    field(:name, :string)
    field(:description, :string)

    belongs_to(:uploader, User)
    belongs_to(:category, Category)

    has_many(:child, Material)
    has_many(:sub_category, Category)
    timestamps()
  end

  @required_fields ~w(name)a
  @optional_fields ~w(description)a

  def changeset(category, attrs \\ %{}) do
    category
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
