Question.destroy_all
Answer.destroy_all
User.destroy_all

bio = ['Rising Software Engineer. Attending Flatiron School', 'Web developer at Google', 'Software engineer intern at Citi Bank', 'Self taught active learner']
(0..3).to_a.each do |num|
    username = Faker::Internet.username
    password = Faker::Internet.password(min_length: 5)
    avatar = Faker::LoremFlickr.image(size: "50x60", search_terms: ['coding'])
    User.create(username: username, password: password, avatar: avatar, bio: bio[num])
end

title = ['html forms', 'active record migration', 'js iterators', 'form styling']
topic = %w(HTML Rails JS CSS)
body = ["I'm working on a hotel reservation webpage, and having trouble aligning the input/select fields. For example, my current code shows the first name and the last name in two different lines, but I want to have them all together.","A user has many uploads. I want to add a column to the uploads table that references the user. What should the migration look like?
    Here is what I have. I'm not sure if I should use (1) :user_id, :int or (2) :user, :references. I'm not even sure if (2) works. Just trying to do this the 'rails' way.", "How can I loop through all the entries in an array using JavaScript?
I thought it was something like this:forEach(instance in theArray) Where theArray is my array, but this seems to be incorrect", "How can I center a div using css?"]

(0..3).to_a.each do |num|
    
   question = Question.new(title: title[num], topic: topic[num], body: body[num])
   question.user = User.all[num]
   question.save

end

5.times do
    answer = Answer.new(
        body: Faker::Lorem.paragraph
    )
    answer.question = Question.all.sample
    answer.user = User.all.sample
    answer.save
end

3.times do
    vote = Vote.new
    vote.user = User.all.sample
    vote.votable = Question.all.sample
    vote.save 
end

3.times do
    vote = Vote.new
    vote.user = User.all.sample
    vote.votable = Answer.all.sample
    vote.save 
end