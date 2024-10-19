

for num in range(100):
    if num < 2:
        continue  
    primo = True 
    for i in range(2, num):
        if num % i == 0:
            primo = False  
             
    if primo:
        print(num)