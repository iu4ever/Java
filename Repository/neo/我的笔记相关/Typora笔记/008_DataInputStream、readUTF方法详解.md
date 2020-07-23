# DataInputStream、readUTF方法详解



```java

DataInputStream、readUTF方法详解

DataInputStream 是用来装饰其它输入流，它允许应用程序以与机器无关方式从底层输入流中读取基本 Java 数据类型。
要想使用数据输入流，则肯定要用户指定数据的保存格式。必须按指定的格式保存数据，才可以将数据输入流将数据读取进来。

一、继承关系与初始化方式


二、方法列举
读取方法一：

int read(byte b[])：从包含的输入流中读取一定数量的字节，并将它们存储到缓冲区数组 b 中。
（检测到文件末尾 (end of file) 或抛出异常之前，此方法将一直阻塞。）

int read(byte[] b, int off, int len)：从包含的输入流中将最多 len 个字节读入一个 byte 数组中。
读取方法二：

boolean readBoolean()：读取一个输入字节，如果该字节不是零，则返回 true，如果是零，则返回 false。
byte readByte()：读取并返回一个输入字节
char readChar()：读取两个输入字节并返回一个 char 值
double readDouble()：读取八个输入字节并返回一个 double 值
float readFloat()：读取四个输入字节并返回一个 float 值
int readInt()：读取四个输入字节并返回一个 int 值。
long readLong()：读取八个输入字节并返回一个 long 值。
short readShort()：读取两个输入字节并返回一个 short 值。

void readFully(byte[] b)：从输入流中读取一些字节，并将它们存储在缓冲区数组 b 中（读取的字节数等于 b 的长度）
（要是超过则会抛出异常）
void readFully(byte[] b, int off, int len): 从输入流中读取 len 个字节。

int readUnsignedByte()：
读取一个输入字节，将它左侧补零，转变为int类型，并返回结果（结果的范围是 0 到 255）
（读取无符号byte类型的值）

int readUnsignedShort()：读取两个输入字节，并返回 0 到 65535 范围内的一个 int 值。
（读取无符号的short类型的值）

String readUTF()：读取UTF类型的值（一般要和 writeUTF() 方法配套使用）否则会抛出异常
static String readUTF(DataInput in)： 从流 in 中读取用 UTF-8 修改版格式编码的 Unicode 字符格式的字符串；然后以 String 形式返回此字符串。
    
上述读取方法中，如果已经达到文件末尾，则抛出异常EOFException

跳过字节方法：

int skipBytes(int n)：试图在输入流中跳过数据的 n 个字节，并丢弃跳过的字节。
三、注意
DataInputStream的所有方法都是被final所修饰的

DataInputStream的作用就是专门用来读各种各样的数据的
它需要和DataOutputStream配套使用

readUTF方法详解参考此链接DataInputStream介绍

四、应用
先写入数据
public class DataOutputStreamDemo {

    public static void main(String[] args) throws IOException {

        //创建数据字节输出流
        DataOutputStream dos = new DataOutputStream(new FileOutputStream("C:\\Users\\lo\\Desktop\\test.txt"));

        //写入数据
        byte b = 5;
        short s = 10;
        long l = 100L;
        char c = 'a';

        dos.writeByte(b);
        dos.writeShort(s);
        dos.writeLong(l);
        dos.writeChar(c);
        dos.writeUTF("罗志祥");

        //关闭
        dos.close();

    }
}
读数据
public class DataInputDemo {

    public static void main(String[] args) throws IOException {

        String path =  "C:\\Users\\lo\\Desktop\\test.txt";
        FileInputStream fis = new FileInputStream(path);
        //创建流
        DataInputStream dis  = new DataInputStream(fis);


        //读取
        byte b = dis.readByte();
        short s = dis.readShort();
        long l = dis.readLong();
        char c = dis.readChar();
        String s1 = dis.readUTF();

        System.out.println(b);
        System.out.println(s);
        System.out.println(l);
        System.out.println(c);
        System.out.println(s1);

        //关闭流
        dis.close();
    }
}
注意：读的时候必须和写进去数据的类型一致，否则会出错

```

