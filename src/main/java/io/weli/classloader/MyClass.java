package io.weli.classloader;

public class MyClass {
    public static void main(String[] args) throws Exception {
        Class<?> clazz = ClassLoader
                .getSystemClassLoader()
                .loadClass("io.weli.classloader.MyClass");
        MyClass myClass = (MyClass) clazz.getDeclaredConstructor().newInstance();
        myClass.sayHello();
    }

    private void sayHello() {
        System.out.println("Hello, world!");
    }
}
