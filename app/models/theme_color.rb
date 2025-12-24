class ThemeColor < ActiveHash::Base
 self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'ピンク', css_code: '#e8b7b7', bg_code: '#fdfaf9' },
    { id: 3, name: 'グリーン', css_code: '#c0e8b7', bg_code: '#fafdf9' },
    { id: 4, name: 'ブルー', css_code: '#b7cde8', bg_code: '#f9fafd' },
    { id: 5, name: 'ミルクティー', css_code: '#e8d7b7', bg_code: '#fdfbf9' }
  ]

  include ActiveHash::Associations
  has_many :users
end