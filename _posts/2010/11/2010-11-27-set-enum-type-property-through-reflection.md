---
title: "Set enum type property through reflection"
date: 2010-11-27 09:53:00 +0000
tags:
  - Reflection
---

When you are loading third party assemblies in your application through reflection and you want to set any enum type property of any class, the situation is trickier than it appears at first. As against setting property of primitive type or any normal class type, enum type properties are not straight forward because you cannot use Activator.CreateInstance or any such APIs to create an enum instance to be set.

 

Assuming that the property to be set is a static property of a class, following sample method will do the job for you. Method is mostly self-explanatory.

 
```python
private void SetEnumValue(Assembly theirAssembly, string fullyQualifiedClassName, 
                          string propertyName, string fullyQualifiedEnumName, 
                          int newValue)
{
    //Get Type of the class which contains property to be set
    Type externalType = theirAssembly.GetType(fullyQualifiedClassName);

    // Get Type of the enum in their assembly
    Type theirEnumType = theirAssembly.GetType(fullyQualifiedEnumName);

    // Get PropertyInfo that is to be set.
    PropertyInfo enumTypePropertyInfo = externalType.GetProperty(propertyName);

    // Derive new value to be set, ensure that newValue is valid for their enum type
    object newValueToSet = Enum.ToObject(theirEnumType, newValue);

    // Assuming that Property to be set is an static property, following will update its value
    enumTypePropertyInfo.SetValue(null, newValueToSet, null);
}
```

In case, the property to be set is an instance property you can update this method to pass the instance in the last line rather than null as the first argument of PropertyInfo.SetValue.