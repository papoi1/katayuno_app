module KatasHelper
  NO_LINK =''

  def edit_kata_link(id)
    link = link_to('- Edit Kata', edit_kata_path(id))
    return link if admin_signed_in?

    NO_LINK
  end

  def delete_kata_link(id)
    return link_to('- Delete', kata_path(id),
      {method: :delete, data: {confirm: "are you sure?"} } )
    NO_LINK
  end
end
