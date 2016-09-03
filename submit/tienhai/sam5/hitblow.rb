def make_answer
  list = [0,1,2,3,4,5,6,7,8,9]
  answer =[]
  while answer.size < 4
    rand_num = rand(list.size-1)
    answer << list[rand_num]
    list.delete_at(rand_num)
    end
  return answer
end

def check(user,answer)
  hit,blow=0,0
  4.times{|i| hit +=1 if user[i] == answer[i] }
  answer.each{|item_ans|
    user.each{|item_user| blow +=1 if item_ans == item_user}
  }
  blow -= hit
  return [hit, blow]
end
  

answer =  make_answer
p "== Hit and Blow =="
p "Please enter number (4-digit)"

try_times =0

loop{
  try_times +=1
  printf("try %d ::",try_times)
  user = $stdin.gets.chomp!.unpack("a1a1a1a1").collect{|i| i.to_i}
  h_b = check(user,answer)
  if h_b[0] == 4
    p "You win!"
    break
  else
    p "   hit:#{h_b[0]}  blow:#{h_b[1]}"
  end
}