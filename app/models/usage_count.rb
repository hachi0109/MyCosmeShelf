class UsageCount < ActiveHash::Base
  self.data = [
    { id: 1, name: '新品・未開封' },
    { id: 2, name: '使い始め' },
    { id: 3, name: '半分くらい' },
    { id: 4, name: 'あと少し（底見え）' },
    { id: 5, name: '使い切り' }
  ]

  include ActiveHash::Associations
  has_many :cosmetics
end