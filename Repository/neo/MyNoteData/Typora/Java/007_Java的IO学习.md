# Java的IO学习

## 1、Java中IO的简介

IO(Input And Output)在编程中是一个很常见的需求，IO即意味着我们的java程序需要和"外部"进行通信，这个"外部"可以是很多介质

```java
1) 本地磁盘文件、远程磁盘文件
2) 数据库连接
3) TCP、UDP、HTTP网络通信
4) 进程间通信
5) 硬件设备(键盘、串口等)
...
```

![数据流](images\数据流.png)



## 2、Java中的流

IO是我们的目的，而要达到这一目的，我们需要一种机制来帮助我们完全，这种机制就是"流"、或者叫"数据流"。

数据流是一串连续不断的数据的集合，就象水管里的水流，在水管的一端一点一点地供水，而在水管的另一端看到的是一股连续不断的水流。数据写入程序可以是一段、一段地向数据流管道中写入数据，这些数据段会按先后顺序形成一个长的数据流。对数据读取程序来说，看不到数据流在写入时的分段情况，每次可以读取其中的任意长度的数据，但只能先读取前面的数据后，再读取后面的数据。不管写入时是将数据分多次写入，还是作为一个整体一次写入，读取时的效果都是完全一样的。

```java
Java的IO模型设计非常优秀，它使用Decorator模式，按功能划分Stream
```

记住这句话对我们在编程中选择合适的类库很重要，Java中按照功能提供不同类别的流，我们接下来深入学习一下java中的各个流、以及它们的层次结构关系

 





## 3、Java中和IO相关的类库层次结构

首先，java中所有的对象(包括)流对象都从Object 超类继承而来，所以，所有的流类的父类都是Object类

以下的缩进关闭表示的的类的继承关系。我们按照Java官方API文档列出的总的目录如下：

```java
Object(超类)
1. 基于"字节"操作的 I/O 接口:
    1) InputStream
    InputStream类是一个abstract class(抽象父类)，它不能被直接用于实例化进行流操作，我们在编程中使用的是它的子类
        1.1) ByteArrayInputStream: 从字节数组(byte[])中进行以字节为单位的读取
        1.2) FileInputStream: 从文件中进行以字节为单位的读取
            1.2.1) SocketInputStream
            org.apache.commons.net.io.SocketInputStream: 封装了对Socket的字节型流式读取
        1.3) FilterInputStream: 用来"封装其它的输入流，并为它们提供额外的功能"
            1.3.1) InflaterInputStream 
            java.util.zip.InflaterInputStream: 从压缩数据源(zip)中以字节为单位读取数据
                1.3.1.1) ZipInputStream 
                java.util.zip.ZipInputStream: 从zip文件中以字节为单位读取数据
            1.3.2) BufferedInputStream: 开辟"内部字节数组"对输入流进行缓存，函数的返回也是一个字节数组
            1.3.3) DataInputStream:
            DataInputStream 是用来装饰其它输入流，它"允许应用程序以与机器无关方式从底层输入流中读取基本 Java 数据类型"。应用程序可以使用DataOutputStream(数据输出流)　　　　　　　写入由DataInputStream(数据输入流)读取的数据。
        1.4) ObjectInputStream: 从输入流中读取序列化后的数据，并进行反序列化(deserializes)
        1.5) PipedInputStream: 从管道中读取数据
    2) OutputStream
    OutputStream类是一个abstract class(抽象父类)，它不能被直接用于实例化进行流操作，我们在编程中使用的是它的子类
        2.1) ByteArrayOutputStream: 以字节为单位将数据写入到从字节数组(byte[])中 
        2.2) FileOutputStream: 以字节为单位将数据写入到文件中
            2.2.1) SocketOutputStream
            org.apache.commons.net.io.SocketOutputStream: 封装了对Socket的字节型流式写入
        2.3) FilterOutputStream: 用来"封装其它的输出流，并为它们提供额外的功能"
            2.3.1) ZipOutputStream: java.util.zip.ZipOutputStream: 以字节为单位向zip文件写入数据
            2.3.2) PrintStream: 
            PrintStream 是用来装饰其它输出流。它能为其他输出流添加了功能，使它们能够方便地打印各种数据值表示形式
            2.3.3) DataOutputStream:
            DataOutputStream 是用来装饰其它输入流，它"允许应用程序以与机器无关方式向底层输出流中写入基本 Java 数据类型"。应用程序可以使用DataInputStream(数据输入流)　　　　　　　写入由DataOutputStream(数据输出流)写入的数据()。有点类似管道、或者进程间通信的感觉　　　　　　　2.3.4) BufferedInputStream: 
        2.4) ObjectOutputStream: 对数据进行序列化(serializes)，并向输出流中写入序列化后的数据
        2.5) PipedOutputStream: 向管道中写入数据
2. 基于"字符"操作的 I/O 接口
不管是磁盘还是网络传输，最小的存储单元都是字节，而不是字符，所以 I/O 操作的都是字节而不是字符，为了操作方便，java封装了一个直接写字符的 I/O 接口，这里就涉及到java的流机制中的一个很重要的概念，包装(装饰)。即所有的流操作在底层实现都是字节流的形式，以这个底层字节流为基础，在其上封装了各种"附加功能"(缓存、字符、管道..)
    1) Reader
    Reader类是一个abstract class(抽象父类)，它不能被直接用于实例化进行流操作，我们在编程中使用的是它的子类
        1.1) InputStreamReader:
        我们知道，字符型的流接口是在字节型的流接口基础之上进行了一次封装，提供了一些额外的功能。所以，从名字上也可以看出来，InputStreamReader是字节流通向字符流的桥梁,　　　　 　　　　 封裝了InputStream在里头, 它以较高级的方式,一次读取一个一个字符，以文本格式输入/输出，可以指定编码格式。
            1.1.1) FileReader: 提供对文本文件(保存字符的文件)进行以字符为单位的读取
        1.2) BufferedReader:
        BufferedReader会一次性从物理流中读取8k(默认数值,可以设置)字节内容到内存，如果外界有请求，就会到这里存取，如果内存里没有才到物理流里再去读。即使读，也是再8k　　　　 而直接读物理流，是按字节来读。对物理流的每次读取，都有IO操作。IO操作是最耗费时间的。BufferedReader就是减少了大量IO操作，节省了时间
        1.3) CharArrayReader:
        CharArrayReader 是字符数组输入流。它和ByteArrayInputStream类似，只不过ByteArrayInputStream是字节数组输入流，而CharArray是字符数组输入流。　　　　 CharArrayReader 是用于读取字符数组，它继承于Reader。操作的数据是以字符为单位
        1.4) FilterReader: 用来"封装其它的字符输入流，并为它们提供额外的功能"
        1.5) PipedReader: PipedReader 是字符管道输入流，它继承于Reader。
        1.6) StringReader: 以String作为数据源，进行以字符为单位的读取
　　    2) Writer
   　　 Writer类是一个abstract class(抽象父类)，它不能被直接用于实例化进行流操作，我们在编程中使用的是它的子类
        2.1) OutputStreamWriter:
            2.1.1) FileWriter: 提供对文本文件(保存字符的文件)进行以字符为单位的写入
        2.2) BufferedWriter
        2.3) StringWriter
        2.4) PipedWriter
        2.5) PrintWriter 
        2.6) CharArrayWriter
3. 基于"磁盘"操作的 I/O 接口:
    1) File: (文件特征与管理): 用于文件或者目录的描述信息，例如生成新目录，修改文件名，删除文件，判断文件所在路径等，它不负责数据的输入输出，而专门用来管理磁盘文件与目录
        1) public boolean exists( )        判断文件或目录是否存在
        2) public boolean isFile( )        判断是文件还是目录 
        3) public boolean isDirectory( )    判断是文件还是目录
        4) public String getName( )        返回文件名或目录名
        5) public String getPath( )        返回文件或目录的路径。
        6) public long length( )        获取文件的长度 
        7) public String[] list( )        将目录中所有文件名保存在字符串数组中返回  
        8) public boolean renameTo( File newFile );    重命名文件
        9) public void delete( );        删除文件
        10) public boolean mkdir( );        创建目录
4. 基于网络操作的 I/O 接口:
    1) Socket
```

> **IO类图结构**

![IO类图结构](images\IO类结构图.png)



> **字符流类图结构**

![字符流类图结构](images\字符流类图结构.png)



> **字节流类图结构**

![字节流类图结构](images\字节流类图结构.png)



> **InputStream: 字节输入流**

![字节输入流](images\字节输入流.png)

> **OutputStream: 字节输出流**

![字节输出流](images\字节输出流.png)

> **Reader:字符输入流**

![字符输入流](images\字符输入流.png)

> **Writer:字符输出流**

![字符输出流](C:\Users\niu\Desktop\Java\我的笔记相关\Typora笔记\images\字符输出流.png)





## 4、注意

```java
1. 什么时候该用什么流函数:
我在学习Java的的API的时候第一个问自己的问题就是这个，在我看来，可以遵循以下两点:
　　1) 明确我们的目的，例如需要读取文件，就使用文件流FileInputStream、需要缓存就包上一层BufferedInputStream、要进行字符型读取就使用InputStreamReader
　　2) 理解"装饰器设计模式"的概念，我们需要的功能可以通过流函数之间的包裹来进行实现，在编程的时候，注意参考API文档，查明哪些流对象之间可以互相包裹很重要
2. 对流函数的深入理解:
Java的源代码是公开的，为了深入理解Java中的IO机制，下一步希望从源代码角度去深入研究一下Java中的IO、流、缓存机制，以及优化方案
```

## 5、Demo实例与分析

### 1)字节流

#### **ByteArrayInputStream/ByteArrayOutputStream**

ByteArrayOutputStream类是在创建它的实例时，程序内部创建一个byte型数组的缓冲区，然后利用ByteArrayOutputStream和ByteArrayInputStream的实例向数组中写入或读出byte型数据。在网络传输中我们往往要传输很多变量，我们可以利用ByteArrayOutputStream把所有的变量收集到一起，然后一次性把数据发送出去。

```java
package ineo.stream.ByteArrayInputStream;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;

public class Courage {
    public void aurora(){
        //创建一个可以增长的byte类型的内存数组
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        byteArrayOutputStream.write('a');
        byteArrayOutputStream.write(1);
        byte[] arr = new byte[3];
        arr[0] = 2;
        arr[1] = 0;
        arr[2] = 'b';
        byteArrayOutputStream.write(arr,0,3);
        //需要参数，我们的参数是一个byte类型的数组。这个数组我们通过ByteArrayOutputStream来创建吧。当然给可以其他的也可以
        ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(byteArrayOutputStream.toByteArray());
        /*
        天哪这种写法不对！！
        97遍历了没输出
        1遍历了输出了
        2遍历了没输出
        0遍历了输出了
        98遍历了没输出
        然后输出了一个-1
        注意：    ！！！这个read()方法每进入一次都要累加1。没事别随便进入这个read方法。
         */
        //如下的写法是错误的。
        /*while (byteArrayInputStream.read()!=-1){
            System.out.println(byteArrayInputStream.read());
        }*/
        //得这样写
        int temp = 0;
        while ((temp = byteArrayInputStream.read())!=-1){
            System.out.println(temp);
        }
    }

    public static void main(String[] args) {
        Courage courage = new Courage();
        courage.aurora();
    }
}

```

```java
package ineo.stream.ByteArrayOutputStream;

import java.io.*;
import java.util.Scanner;

public class Courage {
    public void aurora(){
        try {
            //在内存中创建了可以增长的内存数组
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            //先来定义一个文件的位置吧
            String filePath = "";
            System.out.println("请输入要测试的文件全名：");
            Scanner scanner = new Scanner(System.in);
            filePath = scanner.nextLine();
            //初始化一个文件
            if(null == filePath || "".equals(filePath)){
                throw new Exception("文件名称无法解析,请检查输入的文件路径是否有误！");
            }
            File file = new File(filePath);
            //我们的FileInputStream需要一个file或者String类型的文件路径。我们此处给他传一个file
            FileInputStream fileInputStream = new FileInputStream(file);
            //既然是字节流。那么fileInputStream读出来的东西一定是0/1，是int类型的东西
            //不能这样写
            /*while (fileInputStream.read() != -1){
                byteArrayOutputStream.write(fileInputStream.read());
            }*/
            int temp = 0;
            while ((temp = fileInputStream.read()) != -1){
                byteArrayOutputStream.write(temp);
                System.out.print(Character.toChars(temp));
            }
            byte [] arr = byteArrayOutputStream.toByteArray();
            /*
            FileInputStream和FileOutputStream可以直接读写文件（即可以完成copy），
            但是如果需要在控制台打印读到的字符，需要用InputStreamReader转换流包起来转成字符。
            ！！！！所以下面的三个输出都不知道输出了什么狗东西
             */
            //System.out.println(new String(arr));
            //System.out.println(byteArrayOutputStream.toByteArray());
            //System.out.println(byteArrayOutputStream.toString());
            //最后一步一定要关闭流
            fileInputStream.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        Courage courage = new Courage();
        courage.aurora();
    }
}

```

#### **FileInputStream/FileOutputStream**

```java
package ineo.stream.FileOutputStream;

import java.io.File;
import java.io.FileOutputStream;
import java.util.Scanner;

public class Courage {
    public void aurora(){
        try {
            System.out.println("请输入要写入内容的文件全名称：");
            Scanner scanner = new Scanner(System.in);
            String filePath = scanner.nextLine();
            if (null == filePath || "".equals(filePath)) {
                throw new Exception("请输入一个有效的文件全名称：");
            }
            File file = new File(filePath);
            //我们再来创建一个FileOutputStream
            FileOutputStream fileOutputStream = new FileOutputStream(file);
            //fileOutputStream的write方法需要的参数可以是int和byte。我们就用byte数组吧。
            byte [] arr = "never mind I will find someone like you".getBytes();
            fileOutputStream.write(arr);
            System.out.println("写入文件成功！");
            //最后一定要关闭流
            fileOutputStream.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        Courage courage = new Courage();
        courage.aurora();
    }
}

```

```java
package ineo.stream.FileInputStream;

import java.io.File;
import java.io.FileInputStream;
import java.util.Scanner;

public class Courage {
    //既然是FileInputStream那么我们是要从一个文件中获取一些东西到程序中。我们还是用FileOutputStream一个文件吧。
    public void aurora(){
        try {
            System.out.println("请输入我们需要获取的文件全名称：");
            Scanner scanner = new Scanner(System.in);
            String filePath = scanner.nextLine();
            if (null == filePath || "".equals(filePath)) {
                throw new Exception("文件路径解析不正确，请输入正确的文件全名称：");
            }
            File file = new File(filePath);
            FileInputStream fileInputStream = new FileInputStream(file);
            //我们来new一个byte类型的数组来保存我们的获取到的内容
            byte[] arr = new byte[1024];
            //然后把我们的数组传给read()方法
            int len = fileInputStream.read(arr);
            String str = new String(arr, 0, len);
            System.out.println(str);
            //最后一定要关闭流啊。！！！
            fileInputStream.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        Courage courage = new Courage();
        courage.aurora();
    }
}

```

#### **ZipInputStream/ZipOutputStream(包装流)**

```
package ineo.stream.ZipOutputStream;

import org.apache.http.util.TextUtils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Scanner;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

public class Courage {

    public void aurora(){
        //我们现在这儿穿插一个小的知识点
        /*
        File file = new File("D:" +File.separator+"ZipOutputStream测试.txt");
        File.separator
        系统相关的默认名称分隔符。
        这个字段被初始化为包含系统属性<code>file.separator</code>值的第一个字符。
        在UNIX系统中，该字段的值为<code>'/'</code>;
        在Microsoft Windows系统中，它是<code>'\\'</code>。
         */

        try {
            //我们的要定义的文件名就不写死了。我们还是在控制台输入的方式获取吧。
            System.out.println("请输入需要压缩的源文件：");
            Scanner scanner = new Scanner(System.in);
            String oriFilePath = scanner.nextLine();
            oriFilePath = oriFilePath.trim();
            if (TextUtils.isEmpty(oriFilePath)) {
                throw new Exception("源文件名称输入错误，请重新输入！");
            }
            /*
            //没试过除了txt和md之外的格式能否打开，先就这样写吧。
            String suffix = "txt|md|docx|doc|xls";
            //Pattern pattern = Pattern.compile("[\\w]+[\\.]("+suffix+")");
            Pattern pattern = Pattern.compile("[\\.]("+suffix+")");
            Matcher mc=pattern.matcher(oriFilePath);//条件匹配
            boolean success = false;
            while(mc.find()){
                success = true;
            }
            这一段是正则表达式验证文件路径，虽然没搞懂但暂时就这样吧。
            */
            if (null == oriFilePath || "".equals(oriFilePath)) {
                throw new Exception("源文件名称输入错误，请重新输入！");
            }
            //定义了路径当然需要一个文件啦。
            File file = new File(oriFilePath);
            //现在需要FileInputStream
            FileInputStream fileInputStream = new FileInputStream(file);
            //这个输入流是要给一个zip写入东西。那么我们来一个zip
            //zip的参数是OutputStream。那我们需要个FileOutputStream
            //FileOutputStream需要一个file啊肯定。就是要写入的文件。那么我们去定义一个zip的文件。
            //那这个zipFile的路径我们就不获取了吧。直接获取上面的路径然后给拼接一下好了。
            /*
            搞笑！注意！！！！
            oriFilePath.lastIndexOf("\\")
            oriFilePath.split("\\\\")
            这两种写法真恶心。split的时候必须是4个\，而lastIndexOf的时候就是2个\。
             */
            /**split里面必须是正则表达式，"\\"的作用是对字符串转义*/
            //String [] paths = oriFilePath.split("\\\\");
            String zipFilePath = "";
            //String name = file.getName();
            //String substring = oriFilePath.substring(oriFilePath.lastIndexOf("\\")+1);
            //String substring = oriFilePath.substring(0, oriFilePath.lastIndexOf("\\"));
            String substring = oriFilePath.substring(0, oriFilePath.lastIndexOf("."));
            zipFilePath = substring + ".zip";
            if (null == zipFilePath || "".equals(zipFilePath)) {
                throw new Exception("zip文件路径获取错误！");
            }
            File zipFile = new File(zipFilePath);
            FileOutputStream fileOutputStream = new FileOutputStream(zipFile);
            ZipOutputStream zipOutputStream = null;
            //zipOutputStream = new ZipOutputStream(fileOutputStream);
            zipOutputStream = new ZipOutputStream(new FileOutputStream(zipFile));
            //这个输出流我们需要把它搞到一个zip文件里面去呀。这个文件我们名字也已经获取了。那么我们这么做。
            /*
            累不累啊你！！！！！
            zipOutputStream.putNextEntry()方法中传的参数是new ZipEntry();
            但！！！ZipEntry类初始化的时候传的参数根本不是新的zip文件的名称。后缀名根本不是zip
            而是源文件的名称。是这个：2020-07-11测试文件.txt
            而不是这个2020-07-11测试文件.zip
             */
            //zipOutputStream.putNextEntry(new ZipEntry(zipFilePath));
            zipOutputStream.putNextEntry(new ZipEntry(file.getName()));
            //记得read()遍历时候的那个问题吗，我们需要定义一个int类型的变量来用
            int temp = 0;
            while ((temp = fileInputStream.read()) != -1) {
                //读到了。我们要用把读到的东西写到一个输出流里面去
                zipOutputStream.write(temp);
            }
            //怕忘，先把流关闭加上
            fileInputStream.close();
            zipOutputStream.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        Courage courage = new Courage();
        courage.aurora();
    }

}
```

```java
package ineo.stream.ZipInputStream;

import java.io.*;
import java.util.Scanner;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

/**
 * 我们需要返回来看一下如果把字节流包装成字符流输出
 */
public class Courage {
    public void aurora() {
        try {
            System.out.println("请输入要写入内容的压缩文件全名称：");
            Scanner scanner = new Scanner(System.in);
            String zipFilePath = scanner.nextLine();
            if (null == zipFilePath || "".equals(zipFilePath)) {
                throw new Exception("文件路径解析错误，请检查输入的文件路径是否有错！");
            }
            //有了文件路径的话我们需要一个文件
            File file = new File(zipFilePath);
            ZipInputStream zipInputStream = new ZipInputStream(new FileInputStream(file));
            //有了zipInputStream了。我们可以读取zip文件的内容了。但是我们在读取的时候还需要验证。
            //怎么验证呢，我们需要一个ZipEntry
            ZipEntry zipEntry = null;
            byte[] arr = new byte[1024];
            while ((zipEntry = zipInputStream.getNextEntry()) != null) {
                //现在我们可以用我们的zipInputStream来读取东西了
                //我们在读取的时候这样吧。我们来个byte数组吧。是的。这个数组就是昨天我们说过的一个字节类型的内存缓存区
                //read()给传一个byte类型的数组的时候，会把读到的内容缓存进该数组。
                //但是我们要传byte数组的话又需要一个int类型的长度。这个长度就是我们read()方法的返回值。
                //是的。而且。我们这个read()记得吗，不能判断了之后再用。会当成遍历了两遍的。
                String noZipFile = zipFilePath.substring(0, zipFilePath.lastIndexOf("."))+".md";
                //懒得判断了。直接用吧
                FileOutputStream fileOutputStream = new FileOutputStream(noZipFile);
                int len = 0;
                while ((len = zipInputStream.read(arr)) != -1) {
                    //如果我们此时System.out.println(len)，那输出的就是缓存进arr中的字节长度。
                    //而如果我们此时遍历System.out.println(arr[i])，那么得到的就是缓存进数组中的字节
                    //嘻嘻，但我们现在不打印。我们来把读到的这些东西输出到一个文件吧。
                    //不用管上面的两个while。上面的两个while就是做了两次判断。只不过是每读一次判断一次的判断而已。
                    //我们要创建输出流得有文件名啊。来，搞个文件名。
                    fileOutputStream.write(arr);
                    //哈哈。试了一下，输出的文件Typora可以打开，但UE竟然打不开。那么们试着给他包装一下然后输出。
                    //算了算了，把这些东西做完再返回来看这个。
                }
                fileOutputStream.close();
            }
            //最后一定要关闭流
            zipInputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        Courage courage = new Courage();
        courage.aurora();
    }

}

```

#### **BufferedInputStream/BufferedInputStream(包装流)**

```java
package ineo.stream.BufferedOutputStream;

import java.io.*;

public class Courage {

    public void aurora() {
        try {
            //我们先来定义两个文件
            File fileIn = new File("C:\\Users\\niu\\Desktop\\Java\\我的工作空间\\2020-07-12测试源图片.jpg");
            File fileOut = new File("C:\\Users\\niu\\Desktop\\Java\\我的工作空间\\2020-07-12测试输出图片.jpg");
            if (!fileOut.exists()) {
                fileOut.createNewFile();
            }
            //有了文件了。那肯定需要文件流啊
            FileInputStream fileInputStream = new FileInputStream(fileIn);
            FileOutputStream fileOutputStream = new FileOutputStream(fileOut);
            //但我觉得用的不爽，我想加缓存
            BufferedInputStream bufferedInputStream = new BufferedInputStream(fileInputStream);
            BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(fileOutputStream);
            //那我现在需要读取了
            byte[] arr = new byte[1024];
            int len = 0;
            while ((len = bufferedInputStream.read(arr)) != -1) {
                bufferedOutputStream.write(arr);
            }
            bufferedInputStream.close();
            bufferedOutputStream.close();
            fileInputStream.close();
            fileOutputStream.close();

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        Courage courage = new Courage();
        courage.aurora();
    }
}

```

```java
package ineo.stream.BufferedInputStream;

import java.io.*;

public class Courage {

    public void aurora() {
        try {
            //我们先来定义两个文件
            File fileIn = new File("C:\\Users\\niu\\Desktop\\Java\\我的工作空间\\2020-07-12测试源图片.jpg");
            File fileOut = new File("C:\\Users\\niu\\Desktop\\Java\\我的工作空间\\2020-07-12测试输出图片.jpg");
            if (!fileOut.exists()) {
                fileOut.createNewFile();
            }
            //有了文件了。那肯定需要文件流啊
            FileInputStream fileInputStream = new FileInputStream(fileIn);
            FileOutputStream fileOutputStream = new FileOutputStream(fileOut);
            //但我觉得用的不爽，我想加缓存
            BufferedInputStream bufferedInputStream = new BufferedInputStream(fileInputStream);
            BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(fileOutputStream);
            //那我现在需要读取了
            byte[] arr = new byte[1024];
            int len = 0;
            while ((len = bufferedInputStream.read(arr)) != -1) {
                bufferedOutputStream.write(arr);
            }
            bufferedInputStream.close();
            bufferedOutputStream.close();
            fileInputStream.close();
            fileOutputStream.close();

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        Courage courage = new Courage();
        courage.aurora();
    }
}

```

#### **DataInputStream/DataOutputStream(包装流)**

```java
package ineo.stream.DataOutputStream;

import java.io.*;

public class Courage {
    public static void borealis() throws IOException{
        //我来在这个方法里Read吧
        String str = "C:\\Users\\niu\\Desktop\\Java\\我的工作空间\\2020-07-11测试文件.txt";
        DataInputStream dataInputStream = new DataInputStream(new FileInputStream(str));
        String s = dataInputStream.readUTF();
        System.out.println(s);
        dataInputStream.close();

    }
    public static void australis() throws IOException{
        //
        String str = "C:\\Users\\niu\\Desktop\\Java\\我的工作空间\\2020-07-11测试文件.txt";
        DataOutputStream dataOutputStream = new DataOutputStream(new FileOutputStream(str));
        dataOutputStream.writeUTF("上面的readUTF()要和这儿的writeUTF()配合使用的。否则汇报异常。");
        //他给我在写入上面的这句话“上面的readUTF()要和这儿的writeUTF()配合使用的。否则汇报异常。”的时候把原来里面的内容给删了。~
        //是相当于重新建了一个吗？
        dataOutputStream.close();

    }

    public static void main(String[] args) throws IOException{
        //要先调用writeUTF()的方法。再调用readUTF()的方法。
        australis();
        borealis();
    }

}

```

```java
package ineo.stream.DataInputStream;

import java.io.*;

public class Courage {
    public static void borealis() throws IOException{
        //我来在这个方法里Read吧
        String str = "C:\\Users\\niu\\Desktop\\Java\\我的工作空间\\2020-07-11测试文件.txt";
        DataInputStream dataInputStream = new DataInputStream(new FileInputStream(str));
        String s = dataInputStream.readUTF();
        System.out.println(s);
        dataInputStream.close();

    }
    public static void australis() throws IOException{
        //
        String str = "C:\\Users\\niu\\Desktop\\Java\\我的工作空间\\2020-07-11测试文件.txt";
        DataOutputStream dataOutputStream = new DataOutputStream(new FileOutputStream(str));
        dataOutputStream.writeUTF("上面的readUTF()要和这儿的writeUTF()配合使用的。否则汇报异常。");
        //他给我在写入上面的这句话“上面的readUTF()要和这儿的writeUTF()配合使用的。否则汇报异常。”的时候把原来里面的内容给删了。~
        //是相当于重新建了一个吗？
        dataOutputStream.close();

    }

    public static void main(String[] args) throws IOException{
        //要先调用writeUTF()的方法。再调用readUTF()的方法。
        australis();
        borealis();
    }

}

```

#### **ObjectInputStream/ObjectOutputStream**

```java
package ineo.stream.ObjectOutputStream;

import ineo.stream.ObjectOutputStream.bo.People;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;

public class Courage {
    public void aurora() {
        try {
            //我现在的最终目的是要把一个对象存入那个文件中。
            //我现在再试试定义路径那个复制过来的效果。C:\Users\niu\Desktop\Java\我的工作空间\2020-07-12-01测试文件.txt
            String filePath = "C:\\Users\\niu\\Desktop\\Java\\我的工作空间\\2020-07-12-01测试文件.txt";
            //这个字段转义是IDEA的自带的功能吗还是。应该是吧。
            FileOutputStream fileOutputStream = new FileOutputStream("C:\\Users\\niu\\Desktop\\Java\\我的工作空间\\2020-07-12-01测试文件.txt");
            //那现在肯定要用ObjectOutputStream来包装这个FileOutputStream了呗
            ObjectOutputStream objectOutputStream = new ObjectOutputStream(fileOutputStream);
            //既然已经包装起来了。那么我们去搞几个对象吧。
            People people_1 = new People(1, "邸雅琴");
            People people_2 = new People(2, "牛建业");
            objectOutputStream.writeObject(people_1);
            objectOutputStream.writeObject(people_2);

            //趁现在想起来了。关一下流
            fileOutputStream.close();
            objectOutputStream.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        Courage courage = new Courage();
        courage.aurora();
    }
}



package ineo.stream.ObjectOutputStream.bo;

import java.io.Serializable;

public class People implements Serializable {

    private int id;
    private String name;

    public People(int id, String name) {
        this.id = id;
        this.name = name;
    }

    @Override
    public String toString() {
        return "People{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}

```

```java
package ineo.stream.ObjectInputStream;

import ineo.stream.ObjectOutputStream.bo.People;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.ObjectInputStream;

public class Courage {
    public void aurora(){
        try {
            //现在我要去读刚刚存进去那个文件里的东西，
            //C:\Users\niu\Desktop\Java\我的工作空间\2020-07-12-01测试文件.txt
            FileInputStream fileInputStream = new FileInputStream("C:\\Users\\niu\\Desktop\\Java\\我的工作空间\\2020-07-12-01测试文件.txt");
            //我又需要ObjectInputStream
            ObjectInputStream objectInputStream = new ObjectInputStream(fileInputStream);
            //这儿我们没法出判断文件里面有多少个people 。所以只能全部循环
            while (true) {
                People people = (People) objectInputStream.readObject();
                System.out.println(people);
            }

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        //这儿因为EOFException已经包括在IOException中了。所以去掉算了
        //为什么要写这个呢。因为上面的while(true)什么狗东西啊。
        //所以，只能靠异常机制来中断程序了。正确的做法应该是吧people放到ArrayList中去。然后就可以判断ArrayList的长度了吧。
        //catch (EOFException e) {
        //
        //}


    }

    public static void main(String[] args) {
        Courage courage = new Courage();
        courage.aurora();
    }
}

```

#### **PipedInputStream/PipedOutputStream**

```java
package ineo.stream.PipedOutputStream;

import ineo.stream.PipedInputStream.common.CommonUtils;

import java.io.IOException;
import java.io.PipedOutputStream;

public class PipedOutputThread implements Runnable{

    private PipedOutputStream pipedOutputStream = null;

    public PipedOutputThread(PipedOutputStream pipedOutputStream){
        this.pipedOutputStream = pipedOutputStream;
    }

    //还是前面那句话，这儿因为要覆盖run()方法。所以只能try-catch。不能throws。暂时不知道为啥。先就这样
    @Override
    public void run() {
        try {
            CommonUtils.sout("\"W:开始将数据写入:但等个5秒让我们观察...\"");
            Thread.sleep(5000);//这个意味着释放了CPU的执行权5s
            //向管道写入数据，同时解除管道上的阻塞状态
            pipedOutputStream.write("W: writePiped 数据...".getBytes());
            pipedOutputStream.close();
        } catch (InterruptedException e) {
            e.printStackTrace();
            throw new RuntimeException("W:WriteThread写入失败...");
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException("W:WriteThread写入失败...");
        }

    }
}

```

```java
package ineo.stream.PipedInputStream;

import ineo.stream.PipedInputStream.common.CommonUtils;

import java.io.IOException;
import java.io.PipedInputStream;

public class PipedInputThread implements Runnable {

    //首先他需要定义一个管道输入流
    private PipedInputStream pipedInputStream = null;

    public PipedInputThread(PipedInputStream pipedInputStream) {
        this.pipedInputStream = pipedInputStream;
    }

    //由于必须要覆盖run()方法。所以这里不能抛出，只能try-catch
    @Override
    public void run() {
        try {
            CommonUtils.sout("R:读取前没有数据,阻塞中...等待数据传过来再输出到控制台...");
            byte[] arr = new byte[1024];
            int len = pipedInputStream.read(arr);
            CommonUtils.sout("R:读取数据成功,阻塞解除...");
            while ((len = pipedInputStream.read(arr)) != -1) {
                String str = new String(arr,0,len);
                CommonUtils.sout(str);
            }
            //最后一定要记得关闭流啊
            pipedInputStream.close();
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException("R:管道读取流失败!");
        }

    }
}



package ineo.stream.PipedInputStream.common;

public class CommonUtils {
    public static void sout(Object object){
        System.out.println(object);
    }
}



package ineo.stream.PipedInputStream;

import ineo.stream.PipedOutputStream.PipedOutputThread;

import java.io.IOException;
import java.io.PipedInputStream;
import java.io.PipedOutputStream;

public class Courage {

    public static void main(String[] args) throws IOException {
        //我们首先需要定义管道输入输出流然后再把两个流连起来
        PipedInputStream pipedInputStream = new PipedInputStream();
        PipedOutputStream pipedOutputStream = new PipedOutputStream();
        pipedInputStream.connect(pipedOutputStream);//都这儿了还try的干嘛，直接throws啊
        //我们定义流干嘛，不就是为了要给线程用吗。所以现在实例化线程
        PipedInputThread pipedInputThread = new PipedInputThread(pipedInputStream);
        PipedOutputThread pipedOutputThread = new PipedOutputThread(pipedOutputStream);
        new Thread(pipedInputThread).start();
        new Thread(pipedOutputThread).start();

    }
}

```

### 2)字符流

#### **InputStreamReader/OutputStreamReader**

```java
package ineo.stream.OutputStreamReader;

import java.io.*;
import java.util.Scanner;

public class Courage {
    public void aurora(){
        try {
            //这个方法里面实现我们的输入和输出字符流，我们从一个文件里面读取到东西，然后写入另一个新的文件吧
            System.out.println("请输入我们要读取的文件全名：");
            Scanner scanner = new Scanner(System.in);
            String originFilePath = scanner.nextLine().trim();
            File file = new File(originFilePath);
            //字节流走一波
            InputStream inputStream = new FileInputStream(file);
            //现在需要字符流了
            InputStreamReader inputStreamReader = new InputStreamReader(inputStream,"UTF-8");
            OutputStream outputStream = new FileOutputStream(originFilePath.substring(0,originFilePath.lastIndexOf("\\")+1) + "new_" + file.getName());
            //我们定义了一个输出字符流之后发现他里面需要包裹一个OutputStream。所以我们来定义
            OutputStreamWriter outputStreamWriter = new OutputStreamWriter(outputStream);
            //这个read。我们先来定义个byte吧
            char[] arr = new char[1024];
            //我们给这个read传一个byte数组的内存缓存区的话意味着，我们读到的东西会暂时保存到这个arr里面来
            //然后我们就发现还需要一个长度。
            /*int len = 0;
            while ((len=inputStreamReader.read(arr)) != -1) {
                //我们现在已经把我们要的东西放到了arr数组里面。我们要用这个东西干嘛嘞。要不直接输出吧。
                //那我们来定义一个输出流吧
                for (int i = 0; i < arr.length; i++) {
                    outputStreamWriter.write(arr[i]);

                    System.out.print(arr[i]);
                }
                outputStreamWriter.write("我爱你中国");
            }*/
            //我用上面有参数的read()输出的空字符串太多了。试试无参数的read()
            int letter = 0;
            while ((letter = inputStreamReader.read()) != -1) {
                outputStreamWriter.write((char)letter);
                System.out.print((char)letter);
            }
            //关闭流
            outputStreamWriter.close();
            outputStream.close();
            inputStreamReader.close();
            inputStream.close();

        } catch (FileNotFoundException e) {


        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    public static void main(String[] args) {
        Courage courage = new Courage();
        courage.aurora();
    }
}

```

```java
package ineo.stream.InputStreamReader;

import java.io.*;
import java.util.Scanner;

public class Courage {
    public void aurora(){
        try {
            //这个方法里面实现我们的输入和输出字符流，我们从一个文件里面读取到东西，然后写入另一个新的文件吧
            System.out.println("请输入我们要读取的文件全名：");
            Scanner scanner = new Scanner(System.in);
            String originFilePath = scanner.nextLine().trim();
            File file = new File(originFilePath);
            //字节流走一波
            InputStream inputStream = new FileInputStream(file);
            //现在需要字符流了
            InputStreamReader inputStreamReader = new InputStreamReader(inputStream,"UTF-8");
            OutputStream outputStream = new FileOutputStream(originFilePath.substring(0,originFilePath.lastIndexOf("\\")+1) + "new_" + file.getName());
            //我们定义了一个输出字符流之后发现他里面需要包裹一个OutputStream。所以我们来定义
            OutputStreamWriter outputStreamWriter = new OutputStreamWriter(outputStream);
            //这个read。我们先来定义个byte吧
            char[] arr = new char[1024];
            //我们给这个read传一个byte数组的内存缓存区的话意味着，我们读到的东西会暂时保存到这个arr里面来
            //然后我们就发现还需要一个长度。
            /*int len = 0;
            while ((len=inputStreamReader.read(arr)) != -1) {
                //我们现在已经把我们要的东西放到了arr数组里面。我们要用这个东西干嘛嘞。要不直接输出吧。
                //那我们来定义一个输出流吧
                for (int i = 0; i < arr.length; i++) {
                    outputStreamWriter.write(arr[i]);

                    System.out.print(arr[i]);
                }
                outputStreamWriter.write("我爱你中国");
            }*/
            //我用上面有参数的read()输出的空字符串太多了。试试无参数的read()
            int letter = 0;
            while ((letter = inputStreamReader.read()) != -1) {
                outputStreamWriter.write((char)letter);
                System.out.print((char)letter);
            }
            //关闭流
            outputStreamWriter.close();
            outputStream.close();
            inputStreamReader.close();
            inputStream.close();

        } catch (FileNotFoundException e) {


        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    public static void main(String[] args) {
        Courage courage = new Courage();
        courage.aurora();
    }
}

```

#### **FileReader/FileWriter**

```java
package ineo.stream.FileWriter;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class Courage {
    public static void main(String[] args) {
        try {
            FileReader fileReader = new FileReader("C:\\Users\\niu\\Desktop\\Java\\我的工作空间\\2020-07-13测试文件.txt");
            int read = fileReader.read();
            FileWriter fileWriter = new FileWriter("C:\\Users\\niu\\Desktop\\Java\\我的工作空间\\FileWriter输出.txt");
            while ((read = fileReader.read()) != -1) {
                System.out.print((char)read);
                fileWriter.write((char)read);
            }
            fileWriter.close();
            fileReader.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}

```

```java
package ineo.stream.FileReader;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class Courage {
    public static void main(String[] args) {
        try {
            FileReader fileReader = new FileReader("C:\\Users\\niu\\Desktop\\Java\\我的工作空间\\2020-07-13测试文件.txt");
            int read = fileReader.read();
            FileWriter fileWriter = new FileWriter("C:\\Users\\niu\\Desktop\\Java\\我的工作空间\\FileWriter输出.txt");
            while ((read = fileReader.read()) != -1) {
                System.out.print((char)read);
                fileWriter.write((char)read);
            }
            fileWriter.close();
            fileReader.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}

```

#### **BufferedReader/BufferedWriter**

和BufferedInputStream、BufferedOutputStream不同的是，BufferedReader、BufferedWriter提供了ReadLine、newLine()这种以行为单位的字符读写机制。

```java
package ineo.stream.BufferedWriter;

import java.io.*;

public class Courage {
    public static void main(String[] args) {

        try {
            Reader reader = new FileReader("C:\\Users\\niu\\Desktop\\Java\\我的工作空间\\2020-07-13测试文件.txt");
            //我们先来定义一个BufferedReader,再给他传一个不同的FileReader
            BufferedReader bufferedReader = new BufferedReader(reader);
            /*int len = 0;
            while ((len = bufferedReader.read()) != -1) {
                System.out.println((char)len);
            }*/
            //读取一行
            //来搞一个Writer吧
            Writer writer = new FileWriter("C:\\Users\\niu\\Desktop\\Java\\我的工作空间\\BufferedWriter输出.txt");
            BufferedWriter bufferedWriter = new BufferedWriter(writer);
            String per = null;
            while ((per = bufferedReader.readLine()) != null) {
                System.out.println(per);
                bufferedWriter.write(per);
            }

            bufferedWriter.close();
            bufferedReader.close();
            writer.close();
            reader.close();

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

```

```
package ineo.stream.BufferedReader;

import java.io.*;

public class Courage {
    public static void main(String[] args) {

        try {
            Reader reader = new FileReader("C:\\Users\\niu\\Desktop\\Java\\我的工作空间\\2020-07-13测试文件.txt");
            //我们先来定义一个BufferedReader,再给他传一个不同的FileReader
            BufferedReader bufferedReader = new BufferedReader(reader);
            /*int len = 0;
            while ((len = bufferedReader.read()) != -1) {
                System.out.println((char)len);
            }*/
            //读取一行
            //来搞一个Writer吧
            Writer writer = new FileWriter("C:\\Users\\niu\\Desktop\\Java\\我的工作空间\\BufferedWriter输出.txt");
            BufferedWriter bufferedWriter = new BufferedWriter(writer);
            String per = null;
            while ((per = bufferedReader.readLine()) != null) {
                System.out.println(per);
                bufferedWriter.write(per);
            }

            bufferedWriter.close();
            bufferedReader.close();
            writer.close();
            reader.close();

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

```

#### **CharArrayReader/CharArrayWriter**

CharArrayReader 是字符数组输入流。它和ByteArrayInputStream类似，只不过ByteArrayInputStream是字节数组输入流，而CharArray是字符数组输入流。CharArrayReader 是用于读取字符数组，它继承于Reader。操作的数据是以字符为单位。

```java
package ineo.stream.CharArrayWriter;

import java.io.CharArrayReader;
import java.io.CharArrayWriter;
import java.io.IOException;

public class Courage {
    public void aurora(){
        try {
            //定义了这个之后发现他需要参数。参数是char类型的数组。那我们现在先直接new一个char类型的数组试试让它读
            //CharArrayReader charArrayReader = new CharArrayReader(new char[]{'a','b','c'});
            /*int read = 0;
            while ((read = charArrayReader.read()) != -1) {
                System.out.print((char)read);
            }*/
            //好吧。可以读出来，那直接注掉，不用了。
            CharArrayWriter charArrayWriter = new CharArrayWriter();
            String lyrics = "I am a big big girl";
            charArrayWriter.write(lyrics.toCharArray());
            char[] chars = charArrayWriter.toCharArray();
            CharArrayReader charArrayReader = new CharArrayReader(chars);
            int read = 0;
            while ((read = charArrayReader.read()) != -1) {
                System.out.print((char)read);
            }
            charArrayReader.close();
            charArrayWriter.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        Courage courage = new Courage();
        courage.aurora();
    }
}

```

```java
package ineo.stream.CharArrayReader;

import java.io.CharArrayReader;
import java.io.CharArrayWriter;
import java.io.IOException;

public class Courage {
    public void aurora(){
        try {
            //定义了这个之后发现他需要参数。参数是char类型的数组。那我们现在先直接new一个char类型的数组试试让它读
            //CharArrayReader charArrayReader = new CharArrayReader(new char[]{'a','b','c'});
            /*int read = 0;
            while ((read = charArrayReader.read()) != -1) {
                System.out.print((char)read);
            }*/
            //好吧。可以读出来，那直接注掉，不用了。
            CharArrayWriter charArrayWriter = new CharArrayWriter();
            String lyrics = "I am a big big girl";
            charArrayWriter.write(lyrics.toCharArray());
            char[] chars = charArrayWriter.toCharArray();
            CharArrayReader charArrayReader = new CharArrayReader(chars);
            int read = 0;
            while ((read = charArrayReader.read()) != -1) {
                System.out.print((char)read);
            }
            charArrayReader.close();
            charArrayWriter.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        Courage courage = new Courage();
        courage.aurora();
    }
}

```

#### **FilterReader/FilterWriter**

用来"封装其它的字符输入流，并为它们提供额外的功能"。

#### **PipedReader、PipedWriter**

字符管道流，原理上和PipedInputStream类似

#### **PrintWriter**

printwriter是向文本输出流打印对象的格式化表示形式，它允许以一种格式化的方式进行数据流的写入，类似C语言中的printf()函数。

```java
package ineo.stream.PrintWriter;

import java.io.FileWriter;
import java.io.PrintWriter;

public class Courage {
    public static void main(String[] args) throws Exception
    {
        String filename = "C:\\Users\\niu\\Desktop\\Java\\我的工作空间\\PrintWriter.txt";
        /*
         * PrintWriter(Writer out)
         * Creates a new PrintWriter, without automatic line flushing.
         */
        PrintWriter pw = new PrintWriter(new FileWriter(filename));
        String[] words = new String[]{"hello", "world", "!"};

        for (int i = 0; i < words.length; i++)
        {
            /*
             * format(String format, Object... args)
             * Writes a formatted string to this writer using the specified format string and arguments.
             */
            pw.format("words: %s\n", words[i]);
        }
        /*
         * flush()
         * Flushes the stream.
         */
        pw.flush();
    }
}

```

#### **File 文件、目录操作接口**

```java
package ineo.stream.File;

import org.apache.http.util.TextUtils;

import java.io.*;

public class Courage {
    /**
     * 创建一个文件夹吧
     */
    public void createFolder(String path) {
        try {
            String folderPath = path;
            if (TextUtils.isEmpty(folderPath)) {
                throw new Exception("文件夹路径有误，请检查传入的参数是否有误！");
            }
            File folder = new File(folderPath);
            if (!folder.exists()) {
                //待会比较一下这两方法
                /*
                这个，因为我目前的目录不完整。没有CreateFolder，所以后面的1和2建不出来
                 */
                //folder.mkdir();
                /*
                但我这样可以
                 */
                folder.mkdirs();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 创建文件
     * @param filePath 文件路径
     * @param fileContent 文件内容
     * @throws Exception 异常
     */
    public void createFile(String filePath,String fileContent) throws Exception{
        try {
            if (TextUtils.isEmpty(filePath)) {
                throw new Exception("所给参数文件名称不正确，请检查！");
            }
            File file = new File(filePath);
            if (!file.exists()) {
                file.createNewFile();
            }
            FileWriter fileWriter = new FileWriter(file);
            //这样写入不会保持格式，我们来包装一下。
            //fileWriter.write(fileContent);
            PrintWriter printWriter = new PrintWriter(fileWriter);
            printWriter.println(fileContent);
            printWriter.close();
            fileWriter.close();
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("创建文件出错！");
        }
    }

    /**
     * 删除文件
     * @param filePath
     * @throws Exception
     */
    public void deleteFile(String filePath) throws Exception{
        try {
            if (TextUtils.isEmpty(filePath)) {
                throw new Exception("参数有误，文件路径为空。请检查参数！");
            }
            File file = new File(filePath);
            if (file.exists()) {
                file.delete();
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("删除文件出错");
        }
    }

    public void deleteFolder(String path) {

        try {
            if (null == path || "".equals(path)) {
                System.out.println("文件路径解析错误，请检查传入的参数是否有误！");
                return;
            }
            File file = new File(path);
            String[] list = file.list();
            if (list.length > 0) {
                deleteAllFiles(path);
            }
            file.delete();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void deleteAllFiles(String filePath) {
        try {
            if (null == filePath || "".equals(filePath)) {
                System.out.println("从参数中获取文件路径错误，请检查参数！");
                return;
            }
            File file = new File(filePath);
            if (!file.exists()) {
                return;
            }
            if (!file.isDirectory()) {
                return;
            }
            //获取该路径下的全部文件
            String[] list = file.list();
            File tempFile = null;
            for (int i = 0; i < list.length; i++) {
                if (filePath.endsWith(file.separator)) {
                    tempFile = new File(filePath + list[i]);
                } else {
                    tempFile = new File(filePath + tempFile.separator + list[i]);
                }
                if (tempFile.isDirectory()) {
                    deleteAllFiles(filePath+file.separator+list[i]);
                    deleteFolder(filePath+file.separator+list[i]);
                }
                if (tempFile.isFile()) {
                    tempFile.delete();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }


    }

    public void copyFile(String originFilePath,String targetFilePath) {
        try {
            if (null == originFilePath || "".equals(originFilePath)) {
                throw new Exception("源文件路径解析错误，请检查参数是否有误！");
            }
            if (null == targetFilePath || "".equals(targetFilePath)) {
                throw new Exception("目标文件路径解析错误，请检查参数是否有误！");
            }
            File file = new File(originFilePath);
            if (!file.exists()) {
                throw new Exception("源文件不存在！");
            }
            FileInputStream fileInputStream = new FileInputStream(file);
            FileOutputStream fileOutputStream = new FileOutputStream(targetFilePath);
            /*int temp = 0;
            while ((temp = fileInputStream.read()) != -1) {
                fileOutputStream.write(temp);
            }*/
            int len = 0;
            byte[] arr = new byte[1024];
            while ((len = fileInputStream.read(arr)) != -1) {
                fileOutputStream.write(arr,0,len);
                //这个回去测试一下
            }
            //
            fileOutputStream.close();
            fileInputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void copyFolder(String originFolder,String targetFolder) {
        try {
            if (null == originFolder || "".equals(originFolder)) {
                throw new Exception("源文件路径解析错误，请检查参数是否有误！");
            }
            if (null == targetFolder || "".equals(targetFolder)) {
                throw new Exception("目标文件路径解析错误，请检查参数是否有误！");
            }
            (new File(targetFolder)).mkdirs();//如果文件夹不存在 则建立新文件夹

            File file = new File(originFolder);
            String[] list = file.list();
            File tempFile = null;
            for (int i = 0; i < list.length; i++) {
                if (originFolder.endsWith(file.separator)) {
                    tempFile = new File(originFolder + list[i]);
                } else {
                    tempFile = new File(originFolder + tempFile.separator + list[i]);
                }
                if (tempFile.isFile()) {
                    FileInputStream fileInputStream = new FileInputStream(tempFile);
                    //这儿在做的时候写错了哦。要注意。new FileOutputStream(targetFolder+tempFile.separator + list[i]);
                    FileOutputStream fileOutputStream = new FileOutputStream(targetFolder+tempFile.separator + list[i]);
                    int len = 0;
                    byte[] arr = new byte[1024];
                    while ((len = fileInputStream.read()) != -1) {
                        fileOutputStream.write(arr,0,len);
                    }
                    fileOutputStream.flush();
                    fileOutputStream.close();
                    fileInputStream.close();
                }
                if (tempFile.isDirectory()) {
                    copyFolder(originFolder+tempFile.separator+tempFile.getName(),targetFolder+tempFile.separator+tempFile.getName());
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("复制文件夹出错！");
        }

    }

    public static void main(String[] args) throws Exception {
        Courage courage = new Courage();
        String path = "C:\\Users\\niu\\Desktop\\Java\\我的工作空间\\CreateFolder\\1\\2\\1.txt";
        //courage.createFolder("C:\\Users\\niu\\Desktop\\Java\\我的工作空间\\CreateFolder\\1\\2");
        courage.createFile(path,"我爱你中国");
        //courage.deleteFolder(path.substring(0,path.lastIndexOf("\\")));
        //courage.deleteFile(path);

        String str1 = "C:\\Users\\niu\\Desktop\\Java\\我的工作空间\\Someone_Like_You.md";
        String str2 = "C:\\Users\\niu\\Desktop\\Java\\我的工作空间\\File_someone_like_you.txt";
        //courage.copyFile(str1,str2);

        String str3 = "C:\\Users\\niu\\Desktop\\Java\\我的工作空间\\CreateFolder\\1";
        String str4 = "C:\\Users\\niu\\Desktop\\Java\\我的工作空间\\CreateFolder\\copyFolder";
        courage.copyFolder(str3,str4);

    }
}

```

```java
https://www.cnblogs.com/LittleHann/p/3678685.html
```

