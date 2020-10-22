Bạn biết gì về toán tử "===" triple equals (case equality operator) trong Ruby?
Là một lập trình viên và thường xuyên nhảy việc thì chắc hẳn các bạn cũng đã từng 
gặp câu hỏi so sánh == với === trong Javascript khi đi phỏng vấn rồi phải không? 
Nếu chưa thì mình xin nhắc lại.

Trong Javascript, toán tử === chỉ trả về true nếu như cả hai toán hạng đều cùng một loại và có cùng giá trị. 
Nếu so sánh khác loại, kết quả sẽ trả về false. Cái này sẽ có giải thích và ví dụ cụ thể ở đây. 
Xin chân thành cảm ơn bác @codeaholicguy , chả hiểu sao cứ search lại ra bài bác đầu tiên.

Vậy còn trong Ruby thì sao?
Toán tử === trong Ruby thường được gọi là case equality operator khác với toán tử == hay còn gọi là generic equality.

Thằng == so sánh có cùng giá trị hay không. Đây là cách so sánh phổ biến và cơ bản nhất trong hầu hết các ngôn ngữ lập trình.

Toán tử === thực sự là một cái gì đó rất thú vị. Nó có ở khắp mọi nơi trong Ruby nhưng hầu hết mọi người chưa bao giờ thấy nó thực ra ở đó. Nhưng, làm thế nào đến nó ở khắp mọi nơi và không ai đã từng nhìn thấy nó? Nó ẩn bên trong một cấu trúc điều khiển thông thường, "case / when". Bất cứ khi nào bạn đang sử dụng "case / when", trên thực tế bạn đang sử dụng toán tử "===" và điều này làm cho câu lệnh case trên Ruby mạnh hơn nhiều so với các ngôn ngữ như C hay Java

Toán tử === được hiểu đơn giản là so sánh theo kiểu trường hợp. Các điều kiện của case sẽ đc implement với mỗi class tương ứng như:

Range
Regex
Proc ...
Ví dụ đơn giản:

(1...10) === 5 # => true
Toán tử === sẽ kiểm tra array trong mệnh đề trên có thằng 5 hay không. Nếu có sẽ trả về true nếu không trả về false.

(1..5) === 3           # => true
(1..5) === 6           # => false
Integer === 42          # => true
Integer === 'fourtytwo' # => false
/ell/ === 'Hello'     # => true
/ell/ === 'Foobar'    # => false
"a" === "b" # false # different values, different objects
"a" === "a" # true # same values
Tiếp theo ta có:

"test" == "test"  #=> true
"test" === "test" #=> true
Thế == và === có gì khác nhau?

String === "test"   #=> true
String == "test"    #=> false
Như vậy === cũng đơn thuần là so sánh giá trị chứ không phải là so sánh object có điều nó dùng case để so sánh và === còn được gọi là Case equality.

----------Sử dụng----------
Array.grep

  Mảng có một phương pháp được gọi là grep sử dụng ===.

  # grep(pattern) → array

  (1..100).grep(38..44)
  #=> [38, 39, 40, 41, 42, 43, 44]

  names = %w(
    William
    Kate
    Adam
    Alexa
    James
    Natasha
  )
  names.grep(/am/)
  # => %w(William Adam James)
  Kết quả ta có được là một mảng với các phần tử thỏa === với pattern của grep.

Ranges ++

  === kiểm tra để xem đối tượng đó là một trong các phần tử của range đó hay không.

  (2..4) == 3 # => false
  (2..4) === 3 # => true
  (2..4) === 6 # => false

  (Date.new(2017, 8, 21)..Date.new(2017, 8, 27)) === Date.new(2017, 8, 27)
  # => true

  (Date.new(2017, 8, 21)..Date.new(2017, 8, 27)) === Date.new(2017, 8, 29)
  # => false

  ("a".."z") === "a"
  # => true

  ("a".."z") === "abc"
  # => false
Class / Module ++
  mod === obj #→ true or false
  === trả về true nếu obj là một instance của mod hoặc một trong những hậu duệ của mod. Việc sử dụng hạn chế cho module, nhưng có thể được sử dụng để phân loại các đối tượng theo class. Về cơ bản thực hiện như:

  obj.kind_of?(mod)
  Ví dụ:

  "text".class.ancestors
  # => [String, Comparable, Object, Kernel, BasicObject]

  String === "text"
  # => true

  Object === "text"
  # => true

  Comparable === "text"
  # => true

  Numeric === "text"
  # => false
Regexp ++
  rxp === str #→ true or false
  Về cơ bản thực hiện như:

  rxp =~ str >= 0
  Ví dụ:

  /^[a-z]*$/ === "HELLO"
  #=> false

  /^[A-Z]*$/ === "HELLO"
  #=> true
Proc
  proc === obj # → result_of_proc
  Gọi block với một đối tượng như tham số giống như #call.

  Ví dụ:

  is_today = -> (date) { Date.current === date }

  is_today === Date.current
  # => true

  is_today === Date.tomorrow
  # => false

  is_today === Date.yesterday
  # => false
Lambdas
  Tương tự như Proc:

  is_even = -> (x) { x % 2 == 0 }
  is_even == 4 # => false
  is_even === 4 # => true
  is_even === 5 # => false
Object
  Đối với hầu hết các Object, === tương tự như ==.

  Mọi ý kiến đóng góp và thảo luận xin bình luận bên dưới. Xin cảm ơn!