class Role < ApplicationRecord
  self.data = [
    { id: 1, name: '一般ユーザ' },
    { id: 2, name: 'オペレーター' },
    { id: 3, name: '管理者' }
  ]
end
