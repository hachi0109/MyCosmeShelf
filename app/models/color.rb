class Color < ActiveHash::Base
 self.data = [
    { id: 1,  name: 'レッド',      code: '#e53935' },
    { id: 2,  name: 'ピンク',      code: '#f06292' },
    { id: 3,  name: 'オレンジ',    code: '#fb8c00' },
    { id: 4,  name: 'コーラル',    code: '#ff8a65' },
    { id: 5,  name: 'ベージュ',    code: '#d7ccc8' },
    { id: 6,  name: 'ブラウン',    code: '#8d6e63' },
    { id: 7,  name: 'ローズ',      code: '#ad1457' },
    { id: 8,  name: 'パープル',    code: '#9c27b0' },
    { id: 9,  name: 'ゴールド',    code: '#ffd700' },
    { id: 10, name: 'シルバー',    code: '#c0c0c0' },
    { id: 11, name: 'ブルー',      code: '#2196f3' },
    { id: 12, name: 'グリーン',    code: '#4caf50' },
    { id: 13, name: 'イエロー',    code: '#ffeb3b' },
    { id: 14, name: 'クリア',      code: '#ffffff' },
    { id: 15, name: 'その他',      code: '#eeeeee' }
  ]

  include ActiveHash::Associations
  has_many :cosmetics
end