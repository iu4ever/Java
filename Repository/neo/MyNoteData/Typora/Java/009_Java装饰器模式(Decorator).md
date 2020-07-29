# Java装饰器模式(Decorator)

## 示例一

### 1、概述

   装饰模式又名包装(Wrapper)模式。装饰模式以对客户端透明的方式扩展对象的功能，可以在不创建更多子类的情况下，将对象的功能加以扩展，是继承关系的一个替代方案。用意：动态地为对象添加一些额外的功能，就好比为房子进行装修一样。
   特点：1）装饰者和被装饰者拥有相同的超类型(可能是抽象类也可能是接口)；2）在装饰类中包含一个被装饰组件类的对象引用；3）可以为被装饰对象添加额外的功能；4）在装饰类中重写被装饰组件类中的方法，并对被装饰组件类中对应的方法调用；5）因为装饰者和被装饰者拥有相同的抽象类型，因此在任何需要原始对象（被包装）的场合，都可以用装饰过的对象来替代它；可以用多个装饰类来包装一个对象，装饰类可以包装装饰类或被装饰对象。简而言之，装饰模式保持接口，增强性能；继承至Component同时包含一个Component作为其成员变量（装饰器模式动机中的动态地增加功能是在这里实现的）。

### 2、结构图及其角色

![img](https://img-blog.csdn.net/20131211184204781?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvWUppYW4yMDA4/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

   抽象构件(Component)角色：给出一个抽象接口，装饰器模式中公共方法的类，在装饰器模式结构图的顶层，以规范准备接收附加责任的对象；
   具体构件(ConcreteComponent)角色：是要动态扩展的对象，转换器模式中具体的被装饰的类，它继承自Component；
   装饰(Decorator)角色：持有一个构件(Component)对象的实例，它是装饰器模式中的核心对象，所有具体装饰器对象的父类，完成装饰器的部分职能。可以只对被装饰的对象进行一些简单的包裹，也可包含对Component中方法的实现；
   具体装饰(ConcreteDecorator)角色：完成具体的装饰功能。装饰功能的实现是通过调用被装饰对象对应的方法，加上装饰对象自身的方法。这是装饰器模式动机中的添加额外功能的关键。

   具体事例：MM们要过生日了，最起码先送个蛋糕。蛋糕种类很多，如巧克力、冰淇淋、奶油等等，这都是基本的了，再加点额外的装饰，如蛋糕里放点花、放点干果吃着更香等等。看看我是如何设计的。我想既然是蛋糕，那我就把蛋糕作为一个抽象类，剩下的蛋糕子类型来继承它，每个子类都有吃该蛋糕的感觉，看起来真的不错。蛋糕的子类分别是奶酪蛋糕、冰淇淋蛋糕、放贺卡的冰淇淋蛋糕。但是某次某个MM的生日蛋糕喜欢要的蛋糕我这都没有，比如带鲜花的巧克力蛋糕、带果仁的牛奶蛋糕等等。那我还要继续添加蛋糕的子类，问题出现了，这样会造成大量的蛋糕子类，真是噩梦啊。那么我要好好思考这个问题了，发现了刚才的设计确实有问题，发现了真正的要关注的主体是蛋糕，而贺卡、花、果仁等等只不过是装饰的作用。思路来了：蛋糕作为主体，其他的东西都加到蛋糕上。MM要啥我就加啥呗。到现在我们要明确的是：蛋糕是主体；花、贺卡、果仁等等是装饰者；可以用装饰者包装蛋糕。这个实力的结构图如下所示

![img](https://img-blog.csdn.net/20131211184347093?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvWUppYW4yMDA4/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

### 3、代码实现

```java
public abstract class Cake {
	// Cake是个抽象类，扮演的是抽象构件(Component)角色，它已经实现了
	// getRemark的方法,但没有实现getImpression，必须被子类实现。
	String remark = "蛋糕";
	public String getRemark() {
		return remark;
	}
	// 用来描述吃蛋糕的感觉
	public abstract String getImpression();
}

public abstract class Decorator extends Cake {
	Cake cake;
	// 引用一个Cake，让被装饰者进入装饰者之中;
	// 这里用的是构造方法注入,这样就可以调用Cake实例的方法了。
	public Decorator(Cake cake) {
		this.cake = cake;
	}
	// 让装饰器的子类都去实现getRemark方法,业务需要每个装饰器都要有描述。
	public abstract String getRemark();
}

public class CheeseCake extends Cake {
	// 乳酪蛋糕的构造方法,修改乳酪蛋糕的描述。
	public CheeseCake() {
		super.remark = "乳酪蛋糕";
	}
	// 实现了Cake抽象类的getImpression吃乳酪蛋糕的感觉。。
	public String getImpression() {
		return "乳酪蛋糕，香甜感受";
	}
}

public class IceCake extends Cake {
	// 冰淇淋蛋糕的构造方法,修改冰淇淋蛋糕的描述。
	public IceCake() {
		super.remark = "冰淇淋蛋糕";
	}
	// 实现了Cake抽象类的getImpression吃冰淇淋蛋糕的感觉。。
	public String getImpression() {
		return "冰凉的感受很好";
	}
}

public class FlowerDecorator extends Decorator {
	// 传入一个cake实例，也就是前面所实现的Cake的子类，如奶酪蛋糕，巧克力蛋糕等等。
	public FlowerDecorator(Cake cake) {
		// 调用父类的构造方法，可以获取Cake的实例了。就可以调用Cake实例的方法
		super(cake);
		super.remark = "一朵玫瑰花";
	}
	@Override
	public String getRemark() {
		return cake.getRemark() + "+" + super.remark;
	}
	// 实现了装饰器抽象类的getImpression方法。
	// 这是重点。我们通过构造方法传入的cake实例。对cake进行了装饰，增加了新的功能。
	@Override
	public String getImpression() {
		return super.cake.getImpression() + "," + "看到一朵花真是happy";
	}
}

public class NutsDecorator extends Decorator {
	// 传入一个cake实例，也就是前面所实现的Cake的子类
	public NutsDecorator(Cake cake) {
		// 调用父类的构造方法，可以获取Cake的实例了。就可以调用Cake实例的方法
		super(cake);
		super.remark = "一颗果仁";
	}
	@Override
	public String getRemark() {
		return cake.getRemark() + "+" + super.remark;
	}
	// 实现了装饰器抽象类的getImpression方法。
	// 这是重点。我们通过构造方法传入的cake实例，对cake进行了装饰，增加了新的功能。
	@Override
	public String getImpression() {
		return super.cake.getImpression() + "," + "看到一顆果仁，哈哈";
	}
}

public class Client {
	public static void main(String[] args) {
		// 用果仁，花包装乳酪蛋糕。
		Cake nutsFlowerChocolateCake = new NutsDecorator(new FlowerDecorator(
				new CheeseCake()));
		System.out.println("remark:" + nutsFlowerChocolateCake.getRemark());
		// 吃蛋糕的感受已经发生了改变。
		System.out.println("impression:"
				+ nutsFlowerChocolateCake.getImpression());
	}
}

remark:乳酪蛋糕+一朵玫瑰花+一颗果仁
impression:乳酪蛋糕，香甜感受,看到一朵花真是happy,看到一顆果仁，哈哈
```

四、优缺点
   优点（1）装饰模式与继承关系的目的都是要扩展对象的功能，但是装饰模式可以提供比继承更多的灵活性。装饰模式允许系统动态决定“贴上”或者除掉一个“装饰”，继承关系是静态的，它在系统运行前就决定了；
  （2）通过使用不同的具体装饰类以及这些装饰类的排列组合，设计师可以创造出很多不同行为的组合；
  （3）装饰者类可以在被装饰者的行为前面或后面加上自己的行为，甚至取代被装饰者的行为，达到特定的目的；
  （4）装饰者一般对组件的客户是透明的，除非客户程序依赖于组件的具体类型
   缺点：由于使用装饰模式，可以比使用继承关系需要较少数目的类。使用较少的类，当然使设计比较易于进行。但是，在另一方面，使用装饰模式会产生比使用继承关系更多的对象。更多的对象会使得查错变得困难，特别是这些对象看上去都很相像。
五、适用场景
   1）在不影响其他对象的情况下，以动态、透明的方式给单个对象添加职责；
   2）处理那些可以撤销的职责；
   3）当不能采用生成子类的方式进行扩充时。
六、装饰器模式与适配器模式的比较
   共同点：都拥有一个目标对象。装饰器通过包装一个装饰对象来扩展其功能，而又不改变其接口，这实际上是基于对象的适配器模式的一种变种。
   不同点：适配器模式需要实现另外一个接口，而装饰器模式必须实现该对象的接口。适配器模式主要是为了接口的转换，而装饰者模式关注的是通过组合来动态的为被装饰者注入新的功能或行为(即所谓的责任)。



## 示例二



### 1、装饰器模式

实际上Java提供的工具包中，IO相关工具就普遍大量使用了装饰器模式，例如充当装饰功能的IO类如BufferedInputStream等，又被称为高级流，通常将基本流作为高级流构造器的参数传入，将其作为高级流的一个关联对象，从而对其功能进行扩展和装饰。

> **装饰器模式(Decorator Pattern)，动态地给一个对象添加一些额外的职责，就增加功能来说，装饰器模式比生成子类更灵活。     ----《大话设计模式》**

 装饰器模式使用分层对象，动态透明地对单个对象添加职责。 下面是装饰器模式的UML类图：

![img](https://img2018.cnblogs.com/blog/1300147/201903/1300147-20190301213424454-1149998680.jpg)

装饰器实现修饰对象（Component）的接口，所有请求都转发给它处理，在转发请求之前/之后增加额外功能。使用步骤是：

1. 用一个Decorator实现/继承需要修饰的对象Component；
2. 在Decorator中增加一个Component的引用；
3. 在Decorator的构造器中，增加一个Component参数来初始化Component；
4. 在Decorator类中，使用Component的引用，将所有请求转发至Component的相应方法；
5. ConcreteDecorator中所有Override自Component的方法做相应调整。

从类图上看，装饰器模式与代理模式很像，是它们的目的不同，所以使用方法和适用场景上也就不同 ，装饰器模式与代理模式的区别：

- 代理模式专注于对被代理对象的访问；
- 装饰器模式专注于对被装饰对象附加额外功能。

 就像前面所说的io工具包，我用BufferedInputStream和用FileInputStream去read一个文件实际使用方式上是一样的，能用FileInputStream.read()，就能用BufferedInputStream.read()，只不过，BufferedInputStream把FileInputStream包装了一下，增加了一个缓存，并不控制底层FileInputStream的read()行为。

------

### 2、适用场景

- 运行时，你需要动态地为对象增加额外职责时；
- 当你需要一个能够代替子类的类，借助它提供额外方法时。

------

### 3、代码实现

假设我去买咖啡，首先服务员给我冲了一杯原味咖啡，我希望服务员给我加些牛奶和白糖混合入原味咖啡中。使用装饰器模式就可以解决这个问题。

 ```java
/*
咖啡接口，定义了获取花费和配料的接口。
*/
/**
 * 咖啡
 */
interface Coffee {
    /** 获取价格 */
    double getCost();
    /** 获取配料 */
    String getIngredients();
}


/*
原味咖啡，实现Coffe接口，花费1元，配料中，只有咖啡
*/
/**
 * 原味咖啡
 */
class SimpleCoffee implements Coffee {

    @Override
    public double getCost() {
        return 1;
    }

    @Override
    public String getIngredients() {
        return "Coffee";
    }
}


/*
咖啡对象的装饰器类，同样实现Coffee接口，定义一个Coffe对象的引用，在构造器中进行初始化。并且将getCost（）
和getIntegredients()方法转发给被装饰对象。
*/
/**
 * 咖啡的"装饰器"，可以给咖啡添加各种"配料"
 */
abstract class CoffeeDecorator implements Coffee {
    protected final Coffee decoratedCoffee;

    /**
     * 在构造方法中，初始化咖啡对象的引用
     */
    public CoffeeDecorator(Coffee coffee) {
        decoratedCoffee = coffee;
    }

    /**
     * 装饰器父类中直接转发"请求"至引用对象
     */
    public double getCost() {
        return decoratedCoffee.getCost();
    }

    public String getIngredients() {
        return decoratedCoffee.getIngredients();
    }
}
/*
具体的装饰器类，负责往咖啡中“添加”牛奶，注意看getCost（）方法和getIngredients()方法，可以在转发请求之前或者之后，增加功能。如果是代理模式，这里的结构就有所不同，通常代理模式根据运行时的条件来判断是否转发请求。
*/
/**
 * 此装饰类混合"牛奶"到原味咖啡中
 */
class WithMilk extends CoffeeDecorator {

    public WithMilk(Coffee coffee) {
        super(coffee);
    }

    @Override
    public double getCost() {
        double additionalCost = 0.5;
        return super.getCost() + additionalCost;
    }

    @Override
    public String getIngredients() {
        String additionalIngredient = "milk";
        return super.getIngredients() + ", " + additionalIngredient;
    }
}
/*
另一个具体装饰器类，用来给咖啡加糖，一样的逻辑。
*/
class WithSugar extends CoffeeDecorator {

    public WithSugar(Coffee coffee) {
        super(coffee);
    }

    @Override
    public double getCost() {
        return super.getCost() + 1;
    }

    @Override
    public String getIngredients() {
        return super.getIngredients() + ", Sugar";
    }
}

/*
客户端使用装饰器模式，是不是与java中的io使用方式很像
*/
public class DecoratorDemo {

    static void print(Coffee c) {
        System.out.println("花费了: " + c.getCost());
        System.out.println("配料: " + c.getIngredients());
        System.out.println("============");
    }

    public static void main(String[] args) {
        //原味咖啡
        Coffee c = new SimpleCoffee();
        print(c);

        //增加牛奶的咖啡
        c = new WithMilk(c);
        print(c);

        //再加一点糖
        c = new WithSugar(c);
        print(c);
    }
}

输出结果：

花费了: 1.0
配料: Coffee
============
花费了: 1.5
配料: Coffee, milk
============
花费了: 2.5
配料: Coffee, milk, Sugar
============
 ```

