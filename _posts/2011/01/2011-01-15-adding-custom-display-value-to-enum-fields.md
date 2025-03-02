---
title: "Adding custom display value to Enum fields"
date: 2011-01-15 22:04:00 +0000
tags:
  - uncategorized
---

Most of the times, display value for our custom enums are different from actual field value. We usually want to have different display string than actual field of the enum.

 

Thanks to extension method, we can extend Enum to add functionality to it. You can now add methods to an enum which was previously not possible. Here i am going to show two approaches of extending Enums to support display value for Enum fields.

 

Following is the 1st approach.

 
```python
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace SampleWinApplication
{
    public enum LoginStatus
    {
        LoggedIn,
        LoggedOut,
        Idle,
        Away
    }

    public static class LoginStatusExtensions
    {
        public static string GetDisplayName(this LoginStatus loginStatus)
        {
            switch (loginStatus)
            {
                case LoginStatus.Away:
                    return "Away";
                case LoginStatus.Idle:
                    return "Idle";
                case LoginStatus.LoggedIn:
                    return "Logged in";
                case LoginStatus.LoggedOut:
                    return "Logged out";
            }
            return loginStatus.ToString();
        }
    }

    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();

            // this will "Logged out"
            MessageBox.Show(LoginStatus.LoggedOut.GetDisplayName());
        }
    }

    
}
```

Here we add an extension method GetDisplayName to enum LoginStatus. The method returns display string depending on the given value of LoginStatus. Note that here you have full control over what display value to have for the given LoginStatus. This also has the advantage that you have consistent display value for LoginStatus throughout you application.
There is one problem with this approach that you have to add an extension method for every enum that you want to add custom display string to.
Following approach is a more generic solution to this problem using Attributes and extension methods.

```python
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace SampleWinApplication
{
    [Serializable]
    [AttributeUsage(AttributeTargets.Field, Inherited = false)]
    public class EnumDisplayInfoAttribute : Attribute
    {
        public string DisplayString { get; private set; }

        public EnumDisplayInfoAttribute(string displayString)
        {
            this.DisplayString = displayString;
        }
    }

    public enum LoginStatus
    {
        [EnumDisplayInfo("Logged in")]
        LoggedIn,

        [EnumDisplayInfo("Logged out")]
        LoggedOut,

        [EnumDisplayInfo("Idle")]
        Idle,

        [EnumDisplayInfo("Away")]
        Away
    }

    public static class EnumExtensions
    {
        public static string GetDisplayName(this Enum targetEnumValue)
        {
            object displayInfoAttribute = targetEnumValue.GetType().GetField(targetEnumValue.ToString()).GetCustomAttributes(typeof(EnumDisplayInfoAttribute), false).FirstOrDefault();
            if (displayInfoAttribute != null)
            {
                return (displayInfoAttribute as EnumDisplayInfoAttribute).DisplayString;
            }
            return targetEnumValue.ToString();
        }
    }

    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();

            // this will "Logged out"
            MessageBox.Show(LoginStatus.LoggedOut.GetDisplayName());
        }
    }

    
}
```

Here we add extension method to the base Enum class and thus it is available to every Enum. We also define an Attribute EnumDisplayInfoAttribute that you need to apply to enum fields that you want to support display string for. Note that for any new enums that you add in your application, you just need to decorate its fields with EnumDisplayInfoAttribute and they will start supporting display string feature.
Also, if there is no attribute applied to given enum field, we just return the ToString().
You can use either of the two approaches. I personally find 2nd approach more elegant and readable because the display string is defined just where the enum is.