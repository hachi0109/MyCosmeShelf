class Genre < ActiveHash::Base
 self.data = [
    { id: 1,  name: '導入液・美容液' },
    { id: 2,  name: '化粧水' },
    { id: 3,  name: '乳液・クリーム' },
    { id: 4,  name: '日焼け止め' },
    { id: 5,  name: '下地・コントロールカラー' },
    { id: 6,  name: 'ファンデーション' },
    { id: 7,  name: 'コンシーラー' },
    { id: 8,  name: 'フェイスパウダー' },
    { id: 9,  name: 'アイブロウ' },
    { id: 10, name: 'アイシャドウ' },
    { id: 11, name: 'アイライナー' },
    { id: 12, name: 'マスカラ' },
    { id: 13, name: 'リップ・ティント' },
    { id: 14, name: 'チーク' },
    { id: 15, name: 'ハイライト・シェーディング' },
    { id: 16, name: 'ネイル' },
    { id: 17, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :cosmetics
end