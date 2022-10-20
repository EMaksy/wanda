defmodule WandaWeb.Schemas.ResultResponse.AgentCheckResult do
  @moduledoc false

  require OpenApiSpex

  alias OpenApiSpex.Schema

  alias WandaWeb.Schemas.ResultResponse.{ExpectationEvaluation, ExpectationEvaluationError, Fact}

  OpenApiSpex.schema(%{
    title: "AgentCheckResult",
    description: "The result of check on a specific agent",
    type: :object,
    properties: %{
      agent_id: %Schema{type: :string, format: :uuid, description: "Agent ID"},
      facts: %Schema{type: :array, items: Fact, description: "Facts gathered from the targets"},
      expectation_evaluations: %Schema{
        type: :array,
        items: %Schema{
          oneOf: [
            ExpectationEvaluation,
            ExpectationEvaluationError
          ]
        },
        description: "Result of the single expectation evaluation"
      }
    },
    required: [:agent_id, :facts, :expectation_evaluations]
  })
end