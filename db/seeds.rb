# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


Title.create([
    { name: "Bảo hành" }, 
    { name: "Đặt hàng" },
    { name: "Thanh toan" }, 
    { name: "Ho tro khach hang" }
    ] 
)

Faq.create([
    { question: "Tìm em nơi đâu giữa dòng đời vạn biến", answer: "Nếu anh tìm em thì em đã không còn ở đây nữa", title_id: "1"}, 
    { question: "Từ khi vào hust anh thấy thế nào", answer: "Từ một người năng động anh trở thành người trầm tính", title_id: "3"}, 
    { question: "Ai học giỏi nhất lớp", answer: "KHông phải tôi", title_id: "4"}, 
    { question: "Tìm em nơi đâu giữa dòng đời vạn biến", answer: "Nếu anh tìm em thì em đã không còn ở đây nữa", title_id: "6"}, 
    { question: "Tìm em nơi đâu giữa dòng đời vạn biến", answer: "Nếu anh tìm em thì em đã không còn ở đây nữa", title_id: "2"}
    ] 
)