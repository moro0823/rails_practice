module Visible
  extend ActiveSupport::Concern

  VALID_STATUS = ['public', 'private', 'archived']
    # public:誰でも見れる
    # private:著者だけ見れる
    # archived:復旧可能な形で記事を非表示にする

  included do
    validates :status, inclusion: {in: VALID_STATUS}
      # inclusionヘルパー:与えられた集合(status)に属性の値が含まれているかの検証
      # :inオプション:受け付ける値の集合を指定する
      # statusはVALID_STATUSの値を含んでいるかを検証する
  end

  class_methods do
    def public_count
      where(status: 'public').count
    end
  end

  def archived?
    status == 'archived'
  end

end