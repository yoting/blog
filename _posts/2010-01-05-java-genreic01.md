---
layout: post
title: Java泛型的使用
date: 2014-11-29
categories: Java
tags: java泛型
---
**1.普通的泛型使用**

　　泛型在平时编码中很常用，今天就简单介绍下泛型再各种情况下的使用。具体书写方式是在使用类的时候后面的<>中的类型就是我们确定的类型。

```java
public class MyClass1<T> {//此处定义的泛型是T
    private T var;

    public T getVar() {
        return var;
    }

    public void setVar(T var) {
        this.var = var;
    }
}
/**
 * 最普通的泛型使用，只有一个泛型类型
 */
@Test
public void testMyClass1() {
    MyClass1<String> clazz = new MyClass1<String>();//此时确定对象对应的泛型T是String
    clazz.setVar("stringType");
    String str = clazz.getVar();
    System.out.println(str);
}
```

**2.带有两个泛型类型** 

　　和普通的泛型使用基本一样，只是我们可以在使用类的时候定义两个不同的泛型类型，当然我们也可以定义多个，只要我们业务需要。

```java
public class MyClass2<K, V> {//此处定义两个泛型类型
    private K var1;//第一个变量的类型是K对应的具体类型
    private V var2;//第二个变量的类型是V对应的具体类型

    public K getVar1() {
        return var1;
    }

    public void setVar1(K var1) {
        this.var1 = var1;
    }

    public V getVar2() {
        return var2;
    }

    public void setVar2(V var2) {
        this.var2 = var2;
    }

}

/**
 * 含有两个泛型类型的使用
 */
@Test
public void testMyClass2() {
    //此处确定定义的clazz对象的第一个泛型类型是Integer，第二个泛型类型是String
    MyClass2<Integer, String> clazz = new MyClass2<Integer, String>();
    clazz.setVar1(1); //此处只能用int类型的参数
    clazz.setVar2("string");//此处只能用String类型的参数

    System.out.println(clazz.getVar1() + "," + clazz.getVar2());
}
```

**3.含有通配符的泛型** 

　　这里面又包含3种：没限制的通配符、使用extends限制、使用super限制

```java
public class MyClass3<T> {
    private T var;

    public T getVar() {
        return var;
    }

    public void setVar(T var) {
        this.var = var;
    }

    @Override
    public String toString() {
        return var.toString();
    }

}
/**
 * 通配符？的使用 包括<?>、<？extends 类型>和<？ super 类型>
 */
@Test
public void testMyClass3() {
    MyClass3<Boolean> clazz = new MyClass3<Boolean>();
    clazz.setVar(false);
    fun(clazz);//调运该方法的时候，对泛型没有限制，任何类型的泛型都可以使用

    MyClass3<Integer> clazzInt = new MyClass3<Integer>();
    clazzInt.setVar(1);
    funExtends(clazzInt);//调运该方法的时候，只能使用Number类型或者其子类型

    MyClass3<Double> clazzDouble = new MyClass3<Double>();
    clazzDouble.setVar(2.2);
    funExtends(clazzDouble);//调运该方法的时候，只能使用Number类型或者其子类型


    MyClass3<String> clazzString = new MyClass3<String>();
    clazzString.setVar("string");
    funSuper(clazzString);//调运该方法的时候，只能使用String类型或者其父类型


    MyClass3<Object> clazzObject = new MyClass3<Object>();
    clazzObject.setVar(new Object());
    funSuper(clazzObject);//调运该方法的时候，只能使用String类型或者其父类型

}

public void fun(MyClass3<?> clazz) {//没有限制的泛型使用
    System.out.println(clazz);
}

public void funExtends(MyClass3<? extends Number> clazz) {//只能使用Number及其子类的泛型
    System.out.println(clazz);
}

public void funSuper(MyClass3<? super String> clazz) {//只能使用String及其父类的泛型
    System.out.println(clazz);
}
```

**4.定义类的时候就对泛型进行限制**

```java
public class MyClass4<T extends Number> {//定义类的泛型的时候进行泛型的限制
    private T var;

    public T getVar() {
        return var;
    }

    public void setVar(T var) {
        this.var = var;
    }

    @Override
    public String toString() {
        return this.var.toString();
    }

}

/**
 * 定义类的泛型的时候都给定泛型的限制
 */
@Test
public void testMyClass4() {
    //同样只能定义Number及其子类的泛型
    // MyClass4<String> clazzString = new MyClass4<String>();
    MyClass4<Integer> clazzInt = new MyClass4<Integer>();
    MyClass4<Double> clazzDouble = new MyClass4<Double>();

    MyClass4<Float> clazzFClass4 = fun(1.1f);
    //此处调运的参数是float类型，这就确定了返回类型必须是float
}

public <T extends Number> MyClass4<T> fun(T arg) {
    return new MyClass4<T>();

}
```

**5.泛型接口的使用**

```java
public interface MyInterface<T> {
    public T getVar();
}

//两种实现方式。1，在实现的时候还是使用泛型，到具体定义对象的时候再确定
public class MyInterface1Impl<T> implements MyInterface<T> {
    private T var;

    public MyInterface1Impl() {
    }

    public MyInterface1Impl(T var) {
        this.var = var;
    }

    @Override
    public T getVar() {
        return this.var;
    }

}
//第二种实现方式，在实现的时候就确定泛型的类型
public class MyInterface2Impl implements MyInterface<String> {
    private String varStr;

    public MyInterface2Impl() {
    }

    public MyInterface2Impl(String varStr) {
        this.varStr = varStr;
    }

    @Override
    public String getVar() {
        return this.varStr;
    }
}

/**
 * 泛型接口的使用
 */
@Test
public void testMyInterface() {
    //实现类可以定义为任意类型的泛型
    MyInterface1Impl<String> varStr = new MyInterface1Impl<String>("abc");
    System.out.println(varStr.getVar());
    MyInterface1Impl<Integer> varInt = new MyInterface1Impl<Integer>(123);
    System.out.println(varInt.getVar());

    //之前已经在类实现的时候已经确定了只能是String
    MyInterface2Impl var = new MyInterface2Impl("cba");
    String str = var.getVar();
    System.out.println(str);
}
```

**6.泛型方法的使用**

```java
public class MyFunction {
    public <T> T fun1(T arg) {//传入参数和返回参数都是同样的泛型类型
        return arg;
    }

    public <T> void fun2(T arg) {//传入参数是泛型，不需要返回
        if (arg instanceof String) {
            System.out.println("T is StringType");
        } else if (arg instanceof Integer) {
            System.out.println("T is IntegerType");
        } else {
            System.out.println("T is OtherType");
        }
    }

    public <T> String fun3(T arg) {//传入的参数是泛型，返回的确定类型
        return arg.toString();
    }
}

/**
 * 泛型方法的使用
 */
@Test
public void MyFunction() {
    MyFunction clazz = new MyFunction();

    //传入什么类型，返回什么类型
    String var1 = clazz.fun1("abc");
    int var2 = clazz.fun1(12);
    System.out.println(var1);
    System.out.println(var2);

    //无论传入的是什么类型，都没关系
    clazz.fun2(1);
    clazz.fun2(false);
    clazz.fun2("string");

    //无论传入什么，都返回的是String
    String var3 = clazz.fun3(123);
    String var4 = clazz.fun3("string");
    System.out.println(var3);
    System.out.println(var4);

}
```

 **7.泛型数组**

```java
/**
 * 泛型数组的使用
 */
@Test
public void testArray(){
    Integer[] arr = fun(1,2,3);

}

public <T> T[] fun(T... args){//传入什么类型，T就是什么类型，并且可以使用泛型遍历
    for(T t:args){
        System.out.println(t.toString());
    }
    return args;
}
```

 **8.嵌套泛型**

```java
/**
 * 嵌套泛型
 */
@Test
public void testNest(){
    //外层泛型的类型其实就是内层泛型，当内层泛型确定了，那外层泛型也就确定了
    MyClass1<MyClass2<Integer, String>> nestOut = new MyClass1<MyClass2<Integer,String>>();
    MyClass2<Integer, String> nestIn = new MyClass2<Integer,String>();
    nestIn.setVar1(1);
    nestIn.setVar2("a");
    nestOut.setVar(nestIn);
    System.out.println(nestOut.getVar().getVar1());
    System.out.println(nestOut.getVar().getVar2());
}
```
