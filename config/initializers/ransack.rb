Ransack.configure do |config|
  config.add_predicate 'has_every_term',
                       arel_predicate: 'matches_all',
                       # Разбиваем входящую строку на массив совпадений
                       # Регуляркой ищем подстроки, заключенные в двойные кавычки для полного совпадения
                       # или содержащих только буквы и цифры или знаки препинания или символ + или вообще любой символ
                       # Метод flatten используется для преобразования двумерного массива в одномерный массив.
                       # Метод compact удаляет любые nil элементы из массива.
                       # Метод map используется для преобразования каждого элемента массива в строку, начинающуюся и заканчивающуюся на символ `%`.
                       # Это позволяет использовать эти строки в качестве параметров для поиска по шаблону в базе данных.
                       formatter: proc { |v| v.scan(/\"(.*?)\"|([[:word:]]+)|(\p{P})|(\+?)|(.+)/).flatten.compact.map{ |t| "%#{t}%" } },
                       validator: proc { |v| v.present? },
                       type: :string
end
