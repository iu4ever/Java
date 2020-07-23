# Java异常处理

java提供了两种错误的异常类。Error和Exception，他们拥有共同的父类Throwable。

## 1、Error类

Error表示在运行期间出现了很严重的错误，这种错误是不可恢复的，这属于JVM层次的严重错误，会导致程序直接终止运行。此外，程序不会自动检查Error是否被处理，Error是可以被手动处理的错误，是属于可以被解决的问题，正常的程序中不应该出现Error。OutOfMemoryError、ThreadDeath等都属于错误，这些异常发生时，JVM会选择终止。

## 2、运行时异常

Exception表示可恢复的的异常，所有的异常都是Exception的子类。Exception分为两种，一种是运行时异常(RuntimeException)，另一种是编译时异常(CheckedException)。

运行时异常，编译器并没有要求对运行时异常进行强制处理，如果我们没有对其进行异常处理，当出现这种异常时，会由JVM进行处理，例如NullPointerException就是运行时异常。常见到的空指针、数组越界和类型转换异常都是运行时异常。出现运行时异常后，系统会一直把异常会往上层抛出，直到遇到处理代码为止。若一直没有遇到处理块，则会抛到最上层。如果是多线程，就用Thread.run()方法抛出。如果是单线程，就用main()方法抛出。抛出之后，如果是线程，那么这个线程也就终止了。如果是主程序抛出异常，那么整个程序也就终止了。

所以如果没有对运行时异常进行处理后悔是很严重的，一旦发生，要么线程终止，要么整个程序都会终止。

==注意==

- Java异常捕获的过程中，如果先捕获了基类再捕获子类，那么子类永远都不可能被执行。因此在多Catch捕获中，先捕获子类再捕获基类才是正确的。如下。

```java
try{
    
}catch(SQLException e){
    
}catch(Exception ex){
    
}
```

- Java出现异常的时候，正确的做法是合理的尽早抛出异常，同时对捕获的异常进行处理，或者从程序中恢复，让程序更好的执行。对捕获的异常不处理是一个非常不好的习惯，这样不利于调试。

- 可以根据实际的需求自定义异常，这个异常只需要继承Exception就可以。

## 3、编译时异常

所有继承自Exception并且不属于运行时异常的异常都是编译时异常。比如最常见的IOException和SQLException。这种异常都发生在编译阶段，编译时异常是Java异常处理机制要求必须去处理的异常。否则这部分代码将不会编译通过。异常的处理方法包括两种方法。一种是使用try-catch语块，将异常代码放到try块中并在catch块中捕获。另一种是在该函数声明中将此异常抛出，让调用此函数的代码去进行异常处理。这种异常常在如下情况中进行使用。

- 异常的发生并不会导致程序出错，进行处理后程序仍能继续执行。如当数据库连接失败后，重新连接可以继续执行后续的程序。
- 程序的运行依赖于不可靠的外部条件。如系统IO。

## 4、常见的运行时异常类

- StringIndexOutOfBoundsException - 字符串下标越界异常
- ArrayIndexOutOfBoundsException - 数组下标越界异常
- IndexOutOfBoundsException - 下标越界异常
- ArithmeticException - 算术运算异常
- IllegalArgumentException - 传递非法参数异常
- NullPointerException - 空指针引用异常
- ClassCastException - 类型强制转换异常
- ArrayStoreException - 向数组中存放与声明类型不兼容对象异常
- NegativeArraySizeException - 创建一个大小为负数的数组错误异常
- NumberFormatException - 数字格式异常
- SecurityException - 安全异常
- UnsupportedOperationException - 不支持的操作异常

## 5、常见的编译时异常类

- SQLException 
- IOexception 
- FileNotFoundException 
- ClassNotFoundException
- EOFException 
- NoSuchFieldException
- NoSuchMethodException
- ParseException
- InterruptedException
- CloneNotSupportedException 

## 6、throws/throw 关键字：

如果一个方法没有捕获到一个检查性异常，那么该方法必须使用 throws 关键字来声明。throws 关键字放在方法签名的尾部。

也可以使用 throw 关键字抛出一个异常，无论它是新实例化的还是刚捕获到的。

throws：声明异常，用在方法定义行尾   throw：抛出异常，用在try-catch中

## 7、自定义异常

```java
package ineo.demoPackage_1;

import java.math.BigDecimal;

public class InsufficientFundsException extends Exception {

    private BigDecimal amount;

    public InsufficientFundsException(BigDecimal amount) {
        this.amount = amount;
    }

    public BigDecimal getAmount() {
        return amount;
    }
}



package ineo.demoPackage_1;

import java.math.BigDecimal;

public class CheckingAccount {

    //卡号
    private long number;
    //账户余额
    private BigDecimal amount;

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public CheckingAccount(long number) {
        this.number = number;
    }

    public void deposit(BigDecimal amount) {
        this.amount = this.amount.add(amount);
    }

    public void withdraw(BigDecimal amount) throws InsufficientFundsException {

        if (this.amount.compareTo(amount) > 0) {
            this.amount = this.amount.subtract(amount);
        } else {
            throw new InsufficientFundsException(amount.subtract(this.amount));
        }

    }

    //获取卡号
    public long getNumber() {
        return number;
    }

    //获取余额
    public BigDecimal getAmount() {
        return amount;
    }
}

package ineo.demoPackage_1;

import java.math.BigDecimal;

public class BankDemo {

    public static void main(String[] args) {
        CheckingAccount checkingAccount = new CheckingAccount(101);
        checkingAccount.setAmount(BigDecimal.valueOf(0));
        checkingAccount.deposit(BigDecimal.valueOf(500));
        System.out.println(checkingAccount.getAmount());
        try {
            checkingAccount.withdraw(BigDecimal.valueOf(600));
        } catch (InsufficientFundsException e) {

            System.out.println("余额不足，账户中缺少的资金为：" + e.getAmount());
            e.printStackTrace();
        }

    }
}

```

==关于BigDecimal需要注意==

我在CheckingAccount类中定义的amount属性是BigDecimal类型的。当我在BankDemo类中new出来一个新的CheckingAccount对象之后。因为我没有对这个对象的amout进行赋值，导致我在调用deposit()方法的时候出错。原因是。checkingAccount.amount为null而add的对象却是500。这种时候需要我在new出来checkingAccount之后就对amount进行set操作。



## 8、简答

为什么有些时候必须要进行异常抛出，否则会编译不通过。

Java的异常分为运行时异常(RuntimeException)和编译时异常(CheckedException)，所有的RuntimeException极其子类都称为运行时异常，不是运行时异常的异常都称之为编译时异常。Java语言提供了CheckedException，编译时异常必须要被处理，否则编译不通过。也就是说，Java中除了RuntimeException，其他的异常都要被Java的异常处理机制强制进行处理。否则代码根本不可能被执行。而这种异常的处理方式包括两种。一是将异常代码用try-catch机制进行捕获，将代码加入到try块中，并在catch中进行捕获。二是在该函数声明中将此异常抛出，让调用此函数的代码进行异常处理。抛出的关键字为throws。

