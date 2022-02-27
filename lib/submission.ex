defmodule Breddit.Submission do
  @keys ~W(approved_at_utc category clicked gildings id is_original_content
  is_self media_embed name num_comments over_18 permalink post_hint
  preview score subreddit subreddit_id thumbnail thumbnail_height
  thumbnail_width title upvote_ratio url view_count)a
  defstruct @keys

  @type image :: %{height: integer(), width: integer(), url: String.t()}

  @type t() :: %Breddit.Submission{
          approved_at_utc: float(),
          category: any(),
          clicked: boolean(),
          # TODO type
          gildings: list(),
          id: String.t(),
          is_original_content: boolean(),
          is_self: boolean(),
          media_embed: %{
            content: String.t(),
            height: number(),
            scrolling: boolean(),
            width: integer()
          },
          name: String.t(),
          num_comments: integer(),
          over_18: boolean(),
          permalink: String.t(),
          post_hint: String.t(),
          preview: %{
            enabled: boolean(),
            images: list(%{id: String.t(), resolutions: list(image()), source: image()}),
            # TODO type
            variants: map()
          },
          score: integer(),
          subreddit: String.t(),
          subreddit_id: String.t(),
          thumbnail: String.t(),
          thumbnail_height: integer(),
          thumbnail_width: integer(),
          title: String.t(),
          upvote_ratio: float(),
          url: String.t(),
          view_count: integer()
        }
end
