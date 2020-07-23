# Java Scanner类

## 1、基本语法

```java
Scanner scanner = new Scanner(System.in);
String input = scanner.nextLine();
```

## 2、常用方法

- next()
- nextLine()
- nextInt()
- nextDouble()
- nextFloat()

## 3、注意

### 1) next() 与 nextLine() 区别

1. next()
   - 一定要读取到有效数字之后才可以结束输入。也就是说，如果没有输入有效数字，你再怎么按回车都没用
   - 会自动忽略有效数字之前的空格字符
   - 只有在遇到有效数字之后，才会以有效数字后面的空白作为分隔符或者结束符(我怎么只发现了结束符的功能)
   - next()不能得到带有空格的字符串

2. nextLine()
   - 也是以Enter键作为结束，但会得到按下Enter键之前的所有字符，包括空格
   - nextLine()可以获得带有空白字符的字符串

```java
package ineo.package_test;
import java.util.Scanner;

public class TestScanner {

    public static void main(String[] args) {
        //testNext();
        /*
        输入：       a   bbbbb
        输出：str:a
         */
        testNextLine();
        /*
        输入：       a   bbbbb
        输出：str:       a   bbbbb
         */
    }
    public static void testNext(){
        System.out.println("请输入：");
        Scanner scanner = new Scanner(System.in);
        String str = scanner.next();
        System.out.println("str:"+str);
    }
    public static void testNextLine(){
        System.out.println("请输入：");
        Scanner scanner = new Scanner(System.in);
        String str = scanner.nextLine();
        System.out.println("str:"+str);
    }
}

```

### 2) 在输入nextXXX()之前要进行验证

如果要输入 int 或 float 类型的数据，在 Scanner 类中也有支持，但是在输入之前最好先使用 hasNextXxx() 方法进行验证，再使用 nextXxx() 来读取：

```java
//Demo 1
import java.util.Scanner;
public class ScannerDemo {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        // 从键盘接收数据
        int i = 0;
        float f = 0.0f;
        System.out.print("输入整数：");
        if (scan.hasNextInt()) {
            // 判断输入的是否是整数
            i = scan.nextInt();
            // 接收整数
            System.out.println("整数数据：" + i);
        } else {
            // 输入错误的信息
            System.out.println("输入的不是整数！");
        }
        System.out.print("输入小数：");
        if (scan.hasNextFloat()) {
            // 判断输入的是否是小数
            f = scan.nextFloat();
            // 接收小数
            System.out.println("小数数据：" + f);
        } else {
            // 输入错误的信息
            System.out.println("输入的不是小数！");
        }
        scan.close();
    }
}

//Demo 2
import java.util.Scanner;
 
class ScannerDemo {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
 
        double sum = 0;
        int m = 0;
 
        while (scan.hasNextDouble()) {
            double x = scan.nextDouble();
            m = m + 1;
            sum = sum + x;
        }
 
        System.out.println(m + "个数的和为" + sum);
        System.out.println(m + "个数的平均值是" + (sum / m));
        scan.close();
    }
}
```

