class Version < PaperTrail::Version
  def creation?
    event == 'create'
  end

  def destruction?
    event == 'destroy'
  end

  def alteration?
    event == 'update'
  end

  def membership?
    item_type == 'Membership'
  end

  def undo
    return if membership?
    creation? ? item.destroy : reify.save
  end

  def event_description
    if creation?
      "New #{ item_type }"

    elsif destruction?
      "Deleted #{ item_type }"

    elsif alteration?
      "#{ item_type } Edited"
    end
  end
end