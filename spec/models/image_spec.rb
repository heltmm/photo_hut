require 'rails_helper'

describe Image do

   it { should have_many :tags }
   it { should belong_to :user }
   it { should validate_presence_of :photo }
end
