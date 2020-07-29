# Java学习笔记

## 1、Java根据字符串获取类名

```java
public class Test {
	
	public static void main(String[] args) throws InstantiationException, IllegalAccessException, ClassNotFoundException {
		System.out.println(getclass("com.company.interfacetest.Person").getSimpleName());
	}
	
	public static Class getclass(String className) throws InstantiationException, IllegalAccessException, ClassNotFoundException//className是类名
	{
	   Class obj=Class.forName(className); //以String类型的className实例化类
	   return obj;
	}
}
```

## 2、获取Java类中所有属性

```java
//bean类：Test.java
package com.dada.test;
 
public class Test {
	private String id;
	private String name;
	private String age;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	
}
//测试类:ConfigAnalsys.java
package com.dada.test;
 
import java.beans.BeanInfo;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
 
 
public class ConfigAnalsys {
	public static void main(String[] args) throws Exception {
		listBeans();
	}
	
	public static void listBeans() throws Exception {
		BeanInfo bi = Introspector.getBeanInfo(Test.class);
		PropertyDescriptor[] pds = bi.getPropertyDescriptors();
		for (int i = 0; i < pds.length; i++) {
			String propName = pds[i].getName();
			System.out.println("属性名称"+propName);
		}
	}
}
```

