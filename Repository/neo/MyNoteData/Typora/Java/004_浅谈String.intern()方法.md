浅谈String.intern()方法
原创抽离的心 最后发布于2018-07-14 22:43:33 阅读数 9278  收藏
展开
1.String类型“==”比较样例代码如下：
package com.luna.test;
public class StringTest {
	public static void main(String[] args) {
	String str1 = "todo";
        String str2 = "todo";
        String str3 = "to";
        String str4 = "do";
        String str5 = str3 + str4;
        String str6 = new String(str1);

        System.out.println("------普通String测试结果------");
        System.out.print("str1 == str2 ? ");
        System.out.println( str1 == str2);
        System.out.print("str1 == str5 ? ");
        System.out.println(str1 == str5);
        System.out.print("str1 == str6 ? ");
        System.out.print(str1 == str6);
        System.out.println();
     
        System.out.println("---------intern测试结果---------");
        System.out.print("str1.intern() == str2.intern() ? ");
        System.out.println(str1.intern() == str2.intern());
        System.out.print("str1.intern() == str5.intern() ? ");
        System.out.println(str1.intern() == str5.intern());
        System.out.print("str1.intern() == str6.intern() ? ");
        System.out.println(str1.intern() == str6.intern());
        System.out.print("str1 == str6.intern() ? ");
        System.out.println(str1 == str6.intern());
    }
}
      代码运行结果如下所示：

------普通String测试结果------
str1 == str2 ? true
str1 == str5 ? false
str1 == str6 ? false
---------intern测试结果---------
str1.intern() == str2.intern() ? true
str1.intern() == str5.intern() ? true
str1.intern() == str6.intern() ? true
str1 == str6.intern() ? true
      普通String代码结果分析：Java语言会使用常量池保存那些在编译期就已确定的已编译的class文件中的一份数据。主要有类、接口、方法中的常量，以及一些以文本形式出现的符号引用，如类和接口的全限定名、字段的名称和描述符、方法和名称和描述符等。因此在编译完Intern类后，生成的class文件中会在常量池中保存“todo”、“to”和“do”三个String常量。变量str1和str2均保存的是常量池中“todo”的引用，所以str1==str2成立；在执行 str5 = str3 + str4这句时，JVM会先创建一个StringBuilder对象，通过StringBuilder.append()方法将str3与str4的值拼接，然后通过StringBuilder.toString()返回一个堆中的String对象的引用，赋值给str5，因此str1和str5指向的不是同一个String对象，str1 == str5不成立；String str6 = new String(str1)一句显式创建了一个新的String对象，因此str1 == str6不成立便是显而易见的事了。

2.String.intern()使用原理
      String.intern()是一个Native方法，底层调用C++的 StringTable::intern方法实现。当通过语句str.intern()调用intern()方法后，JVM 就会在当前类的常量池中查找是否存在与str等值的String，若存在则直接返回常量池中相应Strnig的引用；若不存在，则会在常量池中创建一个等值的String，然后返回这个String在常量池中的引用。因此，只要是等值的String对象，使用intern()方法返回的都是常量池中同一个String引用，所以，这些等值的String对象通过intern()后使用==是可以匹配的。由此就可以理解上面代码中------intern------部分的结果了。因为str1、str5和str6是三个等值的String，所以通过intern()方法，他们均会指向常量池中的同一个String引用，因此str1.intern() == str5.intern() == str6.intern()均为true。

3.String.intern() in JDK6
      Jdk6中常量池位于PermGen（永久代）中，PermGen是一块主要用于存放已加载的类信息和字符串池的大小固定的区域。执行intern()方法时，若常量池中不存在等值的字符串，JVM就会在常量池中创建一个等值的字符串，然后返回该字符串的引用。除此以外，JVM 会自动在常量池中保存一份之前已使用过的字符串集合。Jdk6中使用intern()方法的主要问题就在于常量池被保存在PermGen中：首先，PermGen是一块大小固定的区域，一般不同的平台PermGen的默认大小也不相同，大致在32M到96M之间。所以不能对不受控制的运行时字符串（如用户输入信息等）使用intern()方法，否则很有可能会引发PermGen内存溢出；其次String对象保存在Java堆区，Java堆区与PermGen是物理隔离的，因此如果对多个不等值的字符串对象执行intern操作，则会导致内存中存在许多重复的字符串，会造成性能损失。

4.String.intern() in JDK7
      Jdk7将常量池从PermGen区移到了Java堆区，执行intern操作时，如果常量池已经存在该字符串，则直接返回字符串引用，否则复制该字符串对象的引用到常量池中并返回。堆区的大小一般不受限，所以将常量池从PremGen区移到堆区使得常量池的使用不再受限于固定大小。除此之外，位于堆区的常量池中的对象可以被垃圾回收。当常量池中的字符串不再存在指向它的引用时，JVM就会回收该字符串。可以使用 -XX:StringTableSize 虚拟机参数设置字符串池的map大小。字符串池内部实现为一个HashMap，所以当能够确定程序中需要intern的字符串数目时，可以将该map的size设置为所需数目*2（减少hash冲突），这样就可以使得String.intern()每次都只需要常量时间和相当小的内存就能够将一个String存入字符串池中。

5.intern()适用场景
      Jdk6中常量池位于PermGen区，大小受限，所以不建议适用intern()方法，当需要字符串池时，需要自己使用HashMap实现。Jdk7、8中，常量池由PermGen区移到了堆区，还可以通过-XX:StringTableSize参数设置StringTable的大小，常量池的使用不再受限，由此可以重新考虑使用intern()方法。intern(）方法优点：执行速度非常快，直接使用==进行比较要比使用equals(）方法快很多；内存占用少。虽然intern()方法的优点看上去很诱人，但若不是在恰当的场合中使用该方法的话，便非但不能获得如此好处，反而还可能会有性能损失。下面程序对比了使用intern()方法和未使用intern()方法存储100万个String时的性能，从输出结果可以看出，若是单纯使用intern()方法进行数据存储的话，程序运行时间要远高于未使用intern()方法时：

public class InternTest {
    public static void main(String[] args) {
        print("noIntern: " + noIntern());
        print("intern: " + intern());
    }

    private static long noIntern(){
        long start = System.currentTimeMillis();
        for (int i = 0; i < 1000000; i++) {
            int j = i % 100;
            String str = String.valueOf(j);
        }
        return System.currentTimeMillis() - start;
    }
     
    private static long intern(){
        long start = System.currentTimeMillis();
        for (int i = 0; i < 1000000; i++) {
            int j = i % 100;
            String str = String.valueOf(j).intern();
        }
        return System.currentTimeMillis() - start;
    }
}
      程序运行结果：

noIntern: 48    // 未使用intern方法时，存储100万个String所需时间
intern: 99      // 使用intern方法时，存储100万个String所需时间
      由于intern()操作每次都需要与常量池中的数据进行比较以查看常量池中是否存在等值数据，同时JVM需要确保常量池中的数据的唯一性，这就涉及到加锁机制，这些操作都是有需要占用CPU时间的，所以如果进行intern操作的是大量不会被重复利用的String的话，则有点得不偿失。由此可见，String.intern()主要 适用于只有有限值，并且这些有限值会被重复利用的场景，如数据库表中的列名、人的姓氏、编码类型等。

6.总结：
      String.intern()方法是一种手动将字符串加入常量池中的方法，原理如下：如果在常量池中存在与调用intern()方法的字符串等值的字符串，就直接返回常量池中相应字符串的引用，否则在常量池中复制一份该字符串，并将其引用返回（Jdk7中会直接在常量池中保存当前字符串的引用）；Jdk6 中常量池位于PremGen区，大小受限，不建议使用String.intern()方法，不过Jdk7 将常量池移到了Java堆区，大小可控，可以重新考虑使用String.intern()方法，但是由对比测试可知，使用该方法的耗时不容忽视，所以需要慎重考虑该方法的使用；String.intern()方法主要适用于程序中需要保存有限个会被反复使用的值的场景，这样可以减少内存消耗，同时在进行比较操作时减少时耗，提高程序性能。
————————————————
版权声明：本文为CSDN博主「抽离的心」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/u011635492/java/article/details/81048150