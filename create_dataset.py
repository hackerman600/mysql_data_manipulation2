import numpy as np 
import random as rd
import os

#employee id   gender    age    #years worked at company     salary

column_names1 = ["employee id", "gender", "age", "years worked at company", "salary"] 
column_names2 = ["employee id", "programming languages", "fields"] 


def generate_dataset1():
    data,data2 = [],[]
    for i in range(1,101):
        holder,holder2 = [],[]
        holder.append(i)
        holder2.append(i)

        holder.append(rd.randint(0,1))    
        holder2.append(rd.choice(["c++","python","sql","c#"]))

        holder.append(rd.randint(17,50))
        holder2.append(rd.choice(["cyber","app building","machine learning"]))

        holder.append(rd.randint(1,30))
        holder.append((holder[-2]+10)*10000)
        data.append(holder)
        data2.append(holder2)

    return data,data2     


data,data2 = generate_dataset1()
print(data2, "\n\n")

#np.savetxt("/home/kali/Desktop/statistical_measurements/dataset.txt", np.array(data))

col_names = str(column_names1).replace("'","").replace("]","").replace("[","").replace(" ","_") + "\n" + str(data).replace("[","").replace("],","\n").replace("]]","").replace("'","")
col_names2 = str(column_names2).replace("'","").replace("]","").replace("[","").replace(" ","_") + "\n" + str(data2).replace("[","").replace("],","\n").replace("]]","").replace("'","")

print(col_names)

with open("/home/kali/Desktop/statistical_measurements/dataset.csv",'w') as w:
    w.write(col_names)

with open("/home/kali/Desktop/statistical_measurements/dataset2.csv",'w') as w:
    w.write(col_names2)