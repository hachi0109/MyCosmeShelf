class Status < ActiveHash::Base
  self.data = [
    { id: 1, name: 'リピートしたい' },
    { id: 2, name: 'リピートしない' },
    { id: 3, name: '検討中' }
  ]

  include ActiveHash::Associations
  has_many :comments
end
