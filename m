Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web09.23787.1646634645963182364
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 06 Mar 2022 22:30:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BOaNbFRP;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id v189so2192090qkd.2
        for <meta-ti@lists.yoctoproject.org>; Sun, 06 Mar 2022 22:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=iCBjmCk/g6A4FTU7a+g1rUTzVLOfjJfVKglbQkmgP2I=;
        b=BOaNbFRPeMNqf+cEl/s9xKmGmw9V4xswPM3Vz+nEJNWgQT7XjbUKPnklRUhWDBwUeP
         eWkd9BOCB6q5KXbuC5V5iYJRgIXleG/iLOnmot9d4MUkCd6tP0XYGKXPjJMfFIonQ7YY
         rTMrM1oSl1KjS6EX22nsL14iXRwCcZDv3/0LdzaxU28A0ZAXsB+vehqSgof7SwqAit/W
         prg70t/IWeSSdHOPETQgI4wRgp+4MNs1RoXZEAO9R7OjKi13vH18ju0T3ciHOviOKDrg
         5WidA+HdVMzB2lncST8GdynNHynwwwsD7x27rNJf1vKT/nc7R3kCyuSk0rbUedZ1PE37
         UR5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=iCBjmCk/g6A4FTU7a+g1rUTzVLOfjJfVKglbQkmgP2I=;
        b=kPfkA7w61+eUE7Cj/esr7hXYbynz2p5sGXgkAiadHf85Awxb3+saCZ9dI3fM+YTYzT
         0PFS6q2/P6LlDsrsQyRaHyrUUUxSSjNCCVyGnIX67eVqmx3XEcDEfoK+Qfnnhbkjov4K
         YDF9EaR0UVm9rRQMzOBE5TrKGYNJtOr5ABzxbmZNM8vZVOuxMhzlDP/uPWC6hMRf/+oY
         00akkl4FpHz12PKhqElJNVg5atKqh4TYx/IY3xKCrGp8+RbjdE4lQNOH9XEKJBAEB/Kn
         XxTJdAsSM5BMQh24F6GzA2/LHz4agBaHTvD4x0eheEkl4TSZWwfa0Xh5gUYNakb10eTP
         g+lQ==
X-Gm-Message-State: AOAM530H185cZvUK0leyAH7ok293JLl0iXMtnSlGDaxThJpuVZdTi/Bz
	Z4kt6yOXVGk9sPtE55q3Q1+9wh4XzeWopH0HUXzUkl5AHORM8A==
X-Google-Smtp-Source: ABdhPJw6iTAJRRLoE3dMMi3EAVwSSDiweBFGErY+EJO/IEjM5amzF+mIHDDVXkzFSbBpP9FRSStovZYqFf348tAsPAQ=
X-Received: by 2002:a05:620a:1593:b0:60a:b223:893a with SMTP id
 d19-20020a05620a159300b0060ab223893amr6127050qkk.72.1646634644699; Sun, 06
 Mar 2022 22:30:44 -0800 (PST)
MIME-Version: 1.0
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 6 Mar 2022 22:30:18 -0800
Message-ID: <CAMKF1sqRuc4oYgu5B8m9EQhnm_ypb2oYD4xFY94qLuTLdtO+6g@mail.gmail.com>
Subject: failing recipes from meta-ti for beaglebone black
To: meta-ti@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Hello all,

I have run a world build for beaglebone without X11 and using sgx-ddk
for graphics, there are several recipes from meta-ti which are
failing, You might be interested in addressing these failures

https://errors.yoctoproject.org/Errors/Build/142444/

There are some other failures which are perhaps unrelated to meta-ti
e.g. virglrender, qtwebkitgtk, they can be ignored

Thanks
-Khem
