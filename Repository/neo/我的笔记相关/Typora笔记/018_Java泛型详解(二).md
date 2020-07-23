# 1 什么是泛型

面向对象的一个重要目标就是重用代码的支持，支持这个目标的重要机制就是泛型机制（generic implementation）：如果除去基本类型外，实现方法是相同的，那么就可以用泛型实现来这种基本功能。泛型是为了参数化类型，或者说将类型当作参数传递给一个类或者方法。范型在Java中的地位很重要，在设计模式中有非常广泛的应用。

# 2 实现泛型构件

## 2.1 使用Object表示范型

在Java5之前，Java并不直接支持泛型实现，泛型编程需要通过使用继承来实现。通常使用继承Object这个超类来实现。例如：

```java
public Object testThrowException(@NonNull Object generalType) throws NumberFormatException {
    return generalType;
}
```

这种方式需要注意两点

- 当访问这个对象时，需要强制转型
- 不能使用基本类型，只有引用类能够与Object相融

比如我们调用上面的方法时，编译时生成的时包装类型的参数：

```java
public static void main(String[] args) {
    User user = of();
    System.out.println(user.testThrowException(Integer.valueOf(1)));
}
```

## 2.2 基本类型的包装

```java
在java语言中虽然每一个引用类型都和Object相融，但是8种基本类型（byte,short,int,long,duoble,float,char,boolen）却不能，于是java为每一种基本类型都提供了一个包装类。每一个包装对象都是不可变的（ **它的状态绝对不能改变** ，存储的字段被设置成final）
```

**对应的8种包装类**

- Byte
- Short
- Long
- Double
- Float
- Char
- Boolean
  **扩展：Number类**
  ![在这里插入图片描述](images\12345.pgn)

## 2.3 使用接口表示泛型

函数对象

```java
一个函数通过将其放在一个对象内部而被传递，这样的对象叫做函数对象（funtion object）
```

```java
public class TestFunctionObject<T> {
    public void compare(T t) {
        System.out.println(t);
    }
}
```
```java
public void testFuntionObject(Y z, TestFunctionObject girl) {
    girl.compare(z);
}
```
对象如何实现范型将在后面讲到。

## 2.4 数组类型的兼容

一般 a IS-A c,b IS-A c,如果接口能够接手c类型的参数，也意味着能够接受a或c类型的参数，但实际上还是比较复杂的。
例如，定义一个数组，并将其第一位赋值，如下

```java
public static void main(String[] args) {
    Object[] j = new Integer [5];
    j[0] = new Long(999999999999L);
    System.out.println(j);
}
```

编译通过，但是运行时报ArrayStoreException
因为j[0]其实是一个Integer类型的引用，而程序试图将一个Long类型的肤质给Integer类型的引用，显然会报错。
编译通过是Java中的数组类型是兼容的，这叫做协变数组类型。

# 3 利用Java5范型特性实现范型构件

范型是Java5引入的一个很重要的概念。相比较Object代替一切类型简单粗暴而言，泛型使得类型像参数那样传递给类或方法。它提供了一种扩展能力，更符合面向抽象开发的编程宗旨。当具体的类型确定后，泛型又提供了一种类型检测机制，只有相匹配的类型数据才能正常赋值，否则编译就不通过。所以它是一种类型安全检测机制，一定程度上提高了软件的安全性防止出现低级错误。
泛型提高了程序代码的可读性，不必要等到运行的时候才去强制转换，在定义泛型实例化阶段就已经确定了要操作的数据的类型

## 3.1 泛型类

当指定一个泛型类时，累的声明则包含了一个或多个类型参数，这些参数被放在类名后面的一对尖括号内

```java
public class User<T, Y, Z> {

    private T t;

    private Y y;

    private Z z;
    
    public Z setZ(Z z) {
        return z;

    }
    
    public static void main(String[] args) {
        User user = User.of();
        System.out.println(user.setZ(1));
    }
    
}
```

## 3.2 泛型接口

```java
public interface UserInterface<T, B> {
    T testT(T t);

    B testB(B b);
}
```

实现泛型接口

```java
@Data(staticConstructor = "of")
public class User<T, Y, Z, B> implements UserInterface<T, B> {

    @Override
    public T testT(T t) {
        return null;
    }

    @Override
    public B testB(B b) {
        return null;
    }
    
}
```

**注意**

- 在实现泛型接口的时候需要将泛型的声明一起声明在实现类里，如果不声明，重载的方法将会被声明为Object泛型
- 当实现类声明了接口泛型的实参类型，则所有使用到泛型的地方都必须使用实参类型
  例如：

```java
public class User<T, Y, Z, B> implements UserInterface<String, B> {

    @Override
    public String testT(String s) {
        return s;
    }

    @Override
    public B testB(B b) {
        return b;
    }
    
    public static void main(String[] args) {
        User user = User.of();
        System.out.println(user.testT("3sfdg"));
        System.out.println(user.testB(3));
        System.out.println(user.testB("dfhgu"));

    }
    
 }
```

