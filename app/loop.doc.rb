Enumerable: map, select, collect, inject, detect và each trong Ruby

1.Map và collect cơ bản là giống nhau(là 1)
  map sẽ duyệt toàn bộ mảng và trả về 1 mảng kết quả, 
  nhưng mảng ban đầu không bị thay đổi
  vd:[1,2,3,4,5,6,7,8,9,10].collect{ |e| e * 5 }
      # =>  [5, 10, 15, 20, 25, 30, 35, 40, 45, 50]
2.Select
  --sẽ duyệt toàn bộ mảng, nhưng chỉ trả về các 
  giá trị thoả mãn điều kiện
    vd :[1,2,3,4,5,6,7,8,9,10].select{ |e| e > 5 }
        # =>  [6 ,7, 8, 9, 10]
  --có hàm .find_all giống với .select, đều trả về 
    mảng kết quả thoả mãn
  --có hàm .reject thì cách dùng giống nhau 
    nhưng sẽ trả về mảng không thoả mãn điều kiện,
    các giá trị thoả mãn sẽ bị xoá đi
    vd:(1..10).find_all { |i|  i % 3 == 0 }   #=> [3, 6, 9]
        (1..10).reject { |i|  i % 3 == 0 }   #=> [1,2,4,5,7,8,10]
3.Each
  trả lại mảng ban đầu dùng như for_each java
4.Inject(khá hay)
  cung cấp 1 biến số cập nhật giá trị của mảng sau khi được thực thi,
   như 1 hàm mini
  nếu các phần tử trong mảng thực thi 1 hàm nào đó như sum/avg....
    vd:[1,2,3,4,5,6,7,8,9,10].inject{ |sum, e| sum += e }
    # => 55
    [1,2,3,4,5,6,7,8,9,10].inject(15){ |sum, e| sum += e }
    # => 70
5.Detect
  chỉ trả về kết quả đầu tiên thoả mãn điều kiện, nếu không có 
    điều kiện thì trả về kết quả đầu tiên
    vd:[1,2,3,4,5,6,7,8,9,10].detect{ |e| e > 5 }   # => 6
6.Find
  Giống với detect là chỉ trả về kết quả đầu tiên thoả mãn 
    mà không quan tâm vế sau,
   vd:(1..10).find { |i|  i % 3 == 0 }   #=> 3
7.Join
  có thể sử dụng để chuyển 1 array thành 1 chuỗi String 
    và có thể tuỳ ý thêm các kí tự vào
  vd: [1,2,3,4].join("-")       => "1-2-3-4"
      ["a","b","c"].join        => "abc"
      [a: 1,b: 2,c: 3].join     => "{:a=>1, :b=>2, :c=>3}"
8.So sánh map và each
  Sự khác nhau của map và each nằm ở giá trị trả về:
  each sẽ return chính nó còn map sẽ return về 1 mảng mới
  và mảng mới này sẽ có cùng size với mảng ban đầu
  map

    names  = [ "Dan", "Stella", "Elly"]
    names.map { |name| name.upcase }
    => ["DAN", "STELLA", "ELLY"]
    each

    names  = [ "Dan", "Stella", "Elly"]
    names.each { |name| name.upcase }
    => ["Dan", "Stella", "Elly"]
9.So sánh select và find_all
    Sự khác nhau của select và find_all cũng là dữ liệu trả về
      , nhưng là khi chúng ta xử lý dữ liệu kiểu Hash
      Nếu chúng ta khai báo 1 Array và sử dụng 2 method
      trên thì cả 2 đều sẽ trả về 1 Array giống hệt nhau.
      Nhưng khi chúng ta khai báo 1 Hash và sử dụng 2 method trên
      thì select sẽ trả về 1 Hash
      còn find_all sẽ vẫn trả về 1 Array find_all

    hash = {a: 1, b: 2, c: 3, d: 4}
    hash.find_all do |key, value|
      value.odd?
    end
    #would return [[:a, 1], [:c, 3]]
    select

    hash = {a: 1, b: 2, c: 3, d: 4}
    hash.select do |key, value|
      value.odd?
    end
    #would return {a:1, c:3}
    Vì sao có sự khác biệt? Đó là do select đã được định nghĩa lại 
      trong lớp Hash còn find_all thì không

##### tong ket#####
  -sử dụng select hoặc reject nếu bạn muốn chọn ra 
    hoặc loại đi những giá trị của mảng theo một điều kiện nào đó
  -sử dụng collect nếu bạn muốn tạo một mảng dựa 
    trên kết quả trả về từ logic trong block
  -sử dụng inject nếu bạn muốn tích trữ
    , lấy tổng hoặc nối các giá trị mảng lại với nhau
  -sử dụng detect nếu bạn muốn tìm một phần tử trong mảng
  ## tham khao##
  https://www.phongvanit.com/cau-hoi/phan-biet-map-select-collect-reject-detect-each-in-100630
  https://ruby-doc.org/core-2.7.2/Enumerable.html