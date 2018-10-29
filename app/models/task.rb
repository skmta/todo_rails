class Task < ApplicationRecord
	#値が空だったらエラー、文字数40字まで
	validates :title,:description, {presence: true,length:{maximum:30}}
end
