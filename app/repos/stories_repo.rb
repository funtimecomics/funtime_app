class StoriesRepo
  def filter(filtering_params)
    Story.filter(filtering_params).with_pages.alphabetical
  end

  def find(story_id)
    Story.friendly.find(story_id)
  end
end
