local name = "Shawn"
local number_01 = 105
local number_02 = 10
local nameList = {"NoNameGuy", "Roger Rabbit", "Mickey Mouse"}

print("Hi, my name is Shawn ")

print("Hi, my name is Superman ")

print("Hi my name is " .. name)

name = "Roger Rabbit"

print("Hi my name is " .. name)


for _, name in pairs(nameList) do
  print(name)
  end

print()


--print(1 + 2)

print(number_01 + number_02)

local function add(num1, num2)
  local stringToPrint = "My Number is "
  print(stringToPrint)
  return num1 + num2 + number_01
end
  
  print(add(2,4))
  print(stringToPrint)