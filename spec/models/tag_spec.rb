require 'rails_helper'

describe Tag do

   it { should belong_to :image }
   it { should belong_to :user }

   it { should validate_presence_of :user_id }
end
