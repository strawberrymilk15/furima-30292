extend ActiveHash::Associations::ActiveRecordExtensions

belongs_to_active_hash :prefecture
belongs_to :user, optional: true
validates :prefecture, presence: true