# Java Comparator使用指南

## 1、Comparator

Comparator接口的定义如下：

```java
public interface Comparator<T> {
 
    int compare(T o1, T o2);
 
    boolean equals(Object obj);
}
```

若一个类要实现Comparator接口：它一定要实现compareTo(T o1, T o2) 函数，但可以不实现 equals(Object obj) 函数。经过网上查阅得知，这是因为任何类，默认都是已经实现了equals(Object obj)的。 Java中的一切类都是继承于java.lang.Object，在Object.java中实现了equals(Object obj)函数；所以，其它所有的类也相当于都实现了该函数。这里可以用反编译去验证，就不在这写了。

int compare(T o1, T o2) 是“比较o1和o2的大小”。当o1<o2时return -1， o1=o2时return 0， o1 > o2时return 1。

那么继续说上面的例子，如果要实现对People进行排序，可以用Comparator实现类：

```java
public static List<People> compareTest(List<People> arr){
        Collections.sort(arr, new Comparator<People>(){
                public int compare(People p1,People p2){
                    int a = p1.age;    //比较的是age
                    int b = p2.age;
                    return a<b ? -1 : a==b ? 0 : 1 ;    //当a<b返回-1，a==b返回0，a>b返回1
                    }
        });
        return arr;
}
```

```java
public static void main(String[] args) {
        List<People> list = new ArrayList<>();
 
        list.add(new People("Sayo", 17,2));
        list.add(new People("Hina", 17,1));
        list.add(new People("Tsugu", 16,3));
        list.add(new People("Dio", 100,4));
        list.add(new People("Naruto", 15,7));
        list.add(new People("Sasuke", 15,6));
 
        compareTest(list);
        for(People p : list){
            System.out.println(p.toString());
        }
}


People{name='Naruto', age=15, id=7}
People{name='Sasuke', age=15, id=6}
People{name='Tsugu', age=16, id=3}
People{name='Sayo', age=17, id=2}
People{name='Hina', age=17, id=1}
People{name='Dio', age=100, id=4}
```

这时你可能又会问，如果我想有多个比较器呢？你当然可以使用多次Comparator来完成，不过Java8好心的为我们创建了许多default方法，接下来我们来看看都有什么可以使用的方法：

### Comparator的Default方法：

####  1) reversed()

既然有了升序排序，那自然最广泛的实现便是降序排列，Java为我们定义了reversed()方法：

```java
default Comparator<T> reversed() {
        return Collections.reverseOrder(this);
    }
```

可以看到这个方法使用的是Collection类的reverseOrder方法，用于返回降序排列。这里闲的蛋疼来撕一撕源码：

```java
public static <T> Comparator<T> reverseOrder(Comparator<T> cmp) {
    if (cmp == null) {
        return (Comparator<T>) ReverseComparator.REVERSE_ORDER;
    } else if (cmp == ReverseComparator.REVERSE_ORDER) {
        return (Comparator<T>) Comparators.NaturalOrderComparator.INSTANCE;
    } else if (cmp == Comparators.NaturalOrderComparator.INSTANCE) {
        return (Comparator<T>) ReverseComparator.REVERSE_ORDER;
    } else if (cmp instanceof ReverseComparator2) {
        return ((ReverseComparator2<T>) cmp).cmp;
    } else {
        return new ReverseComparator2<>(cmp);
    }
}
```

看到这里返回的都是ReverseComparator，再点进去：

```java
private static class ReverseComparator
    implements Comparator<Comparable<Object>>, Serializable {

    @java.io.Serial
        private static final long serialVersionUID = 7207038068494060240L;

    static final ReverseComparator REVERSE_ORDER
        = new ReverseComparator();

    public int compare(Comparable<Object> c1, Comparable<Object> c2) {
        return c2.compareTo(c1);
    }

    @java.io.Serial
        private Object readResolve() { return Collections.reverseOrder(); }

    @Override
    public Comparator<Comparable<Object>> reversed() {
        return Comparator.naturalOrder();
    }
}
```

可以看到这里的compare（c1, c2）方法返回的是c2.compareTo(c1), 比较有趣的是，这里如果继续调用reversed()，则会返回naturalOrder();（不许套娃！）

#### 2) thenComparing(Comparator<? super T> other)

```java
default Comparator<T> thenComparing(Comparator<? super T> other) {
    Objects.requireNonNull(other);
    return (Comparator<T> & Serializable) (c1, c2) -> {
        int res = compare(c1, c2);
        return (res != 0) ? res : other.compare(c1, c2);
    };
}
```

这个方法便是Java8为了简化代码结构整出来的东西。你可以在你的每个Comparator实现类后面接一个.thenComparing。

再拿上面的例子来说，如果我想先对age排序，之后再对id排序，最后再按名字长度我可以这样写：

```java
 public static List<People> compareTest(List<People> arr) {
     Collections.sort(arr, new Comparator<People>() {
         public int compare(People p1, People p2) {
             int a = p1.age;
             int b = p2.age;
             return a < b ? -1 : a == b ? 0 : 1;
         }
     }.thenComparing(new Comparator<People>() {    //id排序
         public int compare(People p1, People p2) {
             return p1.id < p2.id ? -1 : p1.id == p2.id ? 0 : 1;
         }
     }.thenComparingInt(x -> x.name.length())    //按名字长度排序
                    ));
     return arr;
 }
```

之后进行测试，注意Donald是排在Sasuke前面的，而Sayo也是排在Hina前：

```java
public static void main(String[] args) {
        List<People> list = new ArrayList<>();
 
        list.add(new People("Sayo", 17, 2));
        list.add(new People("Hina", 17, 1));
        list.add(new People("Tsugu", 16, 3));
        list.add(new People("Dio", 100, 4));
        list.add(new People("Naruto", 15, 7));
        list.add(new People("Donald.Trashump", 15, 6));
        list.add(new People("Sasuke", 15, 6));
 
        
 
        compareTest(list);
        for (People p : list) {
            System.out.println(p.toString());
        }
}

People{name='Sasuke', age=15, id=6}    //可以看到Sasuke因为名字较短而排在Donald之前
People{name='Donald.Trashump', age=15, id=6}
People{name='Naruto', age=15, id=7}
People{name='Tsugu', age=16, id=3}
People{name='Hina', age=17, id=1}
People{name='Sayo', age=17, id=2}    //可以看到Sayo因为id比较大，排在Hina之后
People{name='Dio', age=100, id=4}
```

可以看到先按照age排序，在其基础上对age相同的对象id进行比较，最后再对两者均相同的进行姓名长度的比较。

同时他也支持函数式接口：

```java
default <U> Comparator<T> thenComparing(
            Function<? super T, ? extends U> keyExtractor,
            Comparator<? super U> keyComparator)
{
    return thenComparing(comparing(keyExtractor, keyComparator));
}
```

这个方法还有很多变种，thenComparingInt、thenComparingLong、thenComparingDouble，顾名思义，就不做解释了

## 2、Comparable接口

这个比较简单，点进Comparable接口中发现只有一个方法compareTo，只要在需要排序的类上实现comparable接口，并重写compareTo方法即可：

依旧是People：

```java
public class ComparableTest {
    static class  People implements Comparable{
        String name;
        int age;
        int id;
 
        public People(String name, int age, int id) {
            this.name = name;
            this.age = age;
            this.id = id;
        }
 
        @Override
        public String toString() {
            return "People{" +
                    "name='" + name + '\'' +
                    ", age=" + age +
                    ", id=" + id +
                    '}';
        }
 
        @Override
        public int compareTo(Object o1) {    //重写compareTo接口
            People o = (People)o1;
            return this.age < o.age ? -1 : this.age == o.age ? 0 : 1;    //对年龄进行比较
        }
    }
 
    public static void main(String[] args) {
        List<People> list = new ArrayList<>();
 
        list.add(new People("Sayo", 17, 2));
        list.add(new People("Hina", 17, 1));
        list.add(new People("Tsugu", 16, 3));
        list.add(new People("Dio", 100, 4));
        list.add(new People("Naruto", 15, 7));
        list.add(new People("Donald.Trashump", 15, 6));
        list.add(new People("Sasuke", 15, 6));
 
 
 
        Collections.sort(list);
        for (People p : list) {
            System.out.println(p.toString());
        }
    }
}
```

```java
People{name='Naruto', age=15, id=7}
People{name='Donald.Trashump', age=15, id=6}
People{name='Sasuke', age=15, id=6}
People{name='Tsugu', age=16, id=3}
People{name='Sayo', age=17, id=2}
People{name='Hina', age=17, id=1}
People{name='Dio', age=100, id=4}
```

