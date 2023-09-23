class Ship_method < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'ネコポス' },
    { id: 3, name: '宅急便コンパクト' },
    { id: 4, name: '宅急便' },
    { id: 5, name: 'ゆうパケット' },
    { id: 6, name: 'ゆうパケットポスト' },
    { id: 7, name: 'ゆうパケットプラス' },
    { id: 8, name: 'ゆうパック' }
  ]

  include ActiveHash::Associations
  has_many :items
  
end  