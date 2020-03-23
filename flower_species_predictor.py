#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
get_ipython().run_line_magic('matplotlib', 'inline')


# In[2]:


iris=sns.load_dataset('iris')
iris.head()


# In[3]:


fig=sns.pairplot(iris)
fig.savefig('paiplot.jpg')


# In[15]:


setosa=iris[iris['species']=='setosa']
sns.kdeplot(setosa['sepal_width'],setosa['sepal_length'],cmap='plasma')


# In[ ]:


#train test split the data, fit and predict using SVM


# In[5]:


x=iris.drop('species',axis=1)
y=iris['species']


# In[6]:


from sklearn.model_selection import train_test_split


# In[7]:


x_train,x_test,y_train,y_test=train_test_split(x,y)


# In[8]:


from sklearn.svm import SVC


# In[9]:


svcc=SVC()


# In[10]:


svcc.fit(x_train,y_train)


# In[11]:


from sklearn.metrics import confusion_matrix,classification_report


# In[26]:


pred1=svcc.predict(x_test)


# In[27]:


pred1


# In[ ]:


#evaluate the data


# In[13]:


print(confusion_matrix(y_test,pred1))
print()
print(classification_report(y_test,pred1))


# In[ ]:


#now using grid search


# In[17]:


from sklearn.model_selection import GridSearchCV


# In[21]:


d={'C':[0.1,1,10,100,1000],'gamma':[1,0.1,0.01,0.001,0.0001]}


# In[22]:


gcv=GridSearchCV(SVC(),d,verbose=3)


# In[23]:


gcv.fit(x_train,y_train)


# In[24]:


pred2=gcv.predict(x_test)


# In[25]:


pred2


# In[28]:


#evaluate model


# In[29]:


print(confusion_matrix(y_test,pred2))
print()
print(classification_report(y_test,pred2))


# In[ ]:




