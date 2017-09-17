class Invitation < ActiveRecord::Base
  belongs_to :reciever, class_name: 'User' # I can use the ":class_name =>" or the "class_name:" format, both work.
  belongs_to :sender, :class_name => 'User'

  # I have to use class_name because the foreign_key doesn't match the name of the model, User in this case. The columns are "reciever_id" and "sender_id" in this model, if either of these was named user_id, I could just put "belongs_to :user", but since they are named different, I have to tell rails which Model they are for. I have to use "class_name:" for a belongs_to, it basically says, this column is reciever_id but it actually is for the User model

end
