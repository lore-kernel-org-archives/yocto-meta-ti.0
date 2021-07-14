Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.10021.1626282959224242327
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 14 Jul 2021 10:15:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dAghdYxT;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id p10so1387096qvk.7
        for <meta-ti@lists.yoctoproject.org>; Wed, 14 Jul 2021 10:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=aqu9IwPAHAFVi/E8FBLnRZOmRL6ciTKFufZpiK2mp70=;
        b=dAghdYxTMKmMf5reNdHedYEuVfl9Esbke3XM8fLy7pZ9rUV2+/Q6bzjCKJ1OSGJKZj
         Xu8KDjhBcJVT0soYmXarnWrXrUHKv88Ab7LHSiSoK5oTnyHxOahAZRBktttlzx9E1HWD
         EJdpduPKGLAGZNQvm0ADpIfAhRKVpi1N0tCZk/5B2wDvY1vT9WJ+IzkPB/7+y3QcpVxn
         SJUfxL6IrSG3Moy4LLFMVgB7E5VJJjwugBYpCsfdxr09Ttuw4pds6t+gkLy3DHH3v35e
         8mxREwP3yXlNjDrJ/MUhHILrnmsxRhoRCDqlrErw4JBJMQoygaWoW3p92z/h+alSHtY4
         rfYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=aqu9IwPAHAFVi/E8FBLnRZOmRL6ciTKFufZpiK2mp70=;
        b=mP2pXnFUg30JDg/+TTuboVN7+D3a637V8K2FqF6W9aQf25TYdt+gPxP8yg0trdYIyi
         dmd0G1/1StD4DSEmafhQU95GUzeDV7lTmhjeJZd3RnYDaUEibeFbpGxf3uloXIfyUjcu
         7hA0ygrpLqjfi0Rt/2/nU36eaMGiLoXacHRGR2Xcy9tveSSThdiO+ZOrw15xf8RNCLaf
         qCXgEIBX12JRcPb3V9pVUTicr9fmgtD/l8iGqy9HtJfPeRWV1e/bXPZew1hnoyDUFaWD
         b3FBx/yVjUnpMvrna5N0Rj92+sPc5/E6f/YNHZ1DM98bdRGJTT/XNYgubFoqkAxyQ/Fy
         4KlQ==
X-Gm-Message-State: AOAM532sW6ezkOFZ383OXCSl+JZl2qGtXMooffSvcTLrl+TiTWKSY4fm
	Gik8h9RVI9Q5hpymork+nsYvuRiIlhR3Z+YmKl28M/Nsh1kh/A==
X-Google-Smtp-Source: ABdhPJwY6aOj0qFUOHp8707U4zVGOKQ8UVyYO/Dndk/h/AhZjDKORSAzcgDQ1/7AgGrUYHSa7QUZLkJY1+FGMRbwIOI=
X-Received: by 2002:a05:6214:1bcf:: with SMTP id m15mr9662725qvc.55.1626282958249;
 Wed, 14 Jul 2021 10:15:58 -0700 (PDT)
MIME-Version: 1.0
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 14 Jul 2021 10:15:32 -0700
Message-ID: <CAMKF1srKvR3KrWyKtW18J6rqzLH2H2SaYQLLzSs+sa8QHQh+7w@mail.gmail.com>
Subject: Merge confict chunk
To: Denys Dmytriyenko <denis@denix.org>, meta-ti@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Hi Denys

This commit

https://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=4c1d26f6282b9959b9ee10aa77b3e05ed56299fb

has a merge anchor thats committed perhaps accidentally.

Thanks
-Khem
