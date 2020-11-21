Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web08.7752.1605974121463044779
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 21 Nov 2020 07:55:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=liNqHyDh;
 spf=pass (domain: gmail.com, ip: 209.85.219.174, mailfrom: alessioigorbogani@gmail.com)
Received: by mail-yb1-f174.google.com with SMTP id k65so11631002ybk.5
        for <meta-ti@lists.yoctoproject.org>; Sat, 21 Nov 2020 07:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=Vd3BDMYGSrzQWY8MrTWjuVGWpsBCElps9MimL0IOntk=;
        b=liNqHyDhgdgt8QA5u2CHpJQ0NAN1QPHBKNshC0Sd6ML47eF4IPXVAjuyK2l65rIyYa
         T7eJHTSqleckTKpE6J6s6P/bWoRhm4KiKYPT1p4TCvD+qJf26towKtZR498LtJIB5qu5
         J9rt7IG4v7T//XThw+WOsJMi6Yw1MOKQQzojMLt0CcLSv0hopaxLXvBAlL7MZVKHC484
         n5ZrWG/LeDvD1ehP2e9r62/KpPpkZ115pwmbj/PZsPuOX08ZAKBpLp+VB8gBTC6NKnfb
         7ZO5ZI4rW4UrsspXVWEcRkwLjz/5w1+V06OxXdqbEVAvB+oOPLPBGECNBtSHvtAPDlFF
         U18Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=Vd3BDMYGSrzQWY8MrTWjuVGWpsBCElps9MimL0IOntk=;
        b=jpQjdOU6jquId+vS3iUxM2laW1BrOoI5yEbO+9v9COh79IDfsj1Zq2MI5HDt2t8XjQ
         W3MxKjein7Ueo2mDoFgMFYLjKuKkM4Q+/Qun20WSl1dAlSPA592JQ4VXbNFz27otaloD
         qWdr2pTKZj1e7Yro5CV7wYoNFPkwO5XQKq/gKFZeir3D3QoXMg3o8w29g+5d0G/XDMWq
         6E1ssNGdZgOwICSnLizPYVF5lzezQihWQLW4z3xxiSZT4Ey+9p8mBHxq+Igv+uUiPNsp
         mv4kD4j6ot8kXSgPujAk0WORvB8dBB3rWFnHPumcycnbQCAQofRgWUUPmsQTDtEO2isA
         0U5Q==
X-Gm-Message-State: AOAM533fFJK+r4jC8P8V8Ari4VHQoj1/EwdYOXTKEL8Gf8AB+OOm9s1Y
	ZcVhlFhCpm3mziDiTMenQ1AxuGeKLELQmikt4cVHdhrnlNU=
X-Google-Smtp-Source: ABdhPJxzIjT9Nac+yDoWQ1ovkBKu4Tucws1lCHLmfVE5yje7tPsBdLT1ntD1xc6oWOUbxJWSo5CPD0FcdS3MnTGNjz4=
X-Received: by 2002:a25:f20a:: with SMTP id i10mr26971504ybe.37.1605974120350;
 Sat, 21 Nov 2020 07:55:20 -0800 (PST)
MIME-Version: 1.0
From: "Alessio Igor Bogani" <alessioigorbogani@gmail.com>
Date: Sat, 21 Nov 2020 16:54:44 +0100
Message-ID: <CAPk1OjHPus_Avk2_AV1TE78knt4LrQK+F1f2tHAqOPFxduqafw@mail.gmail.com>
Subject: nativesdk-ti-cgt-pru
To: meta-ti@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Hi all,

I would like produce an SDK for the my image which includes clpru
compiler so I have added in my image's recipe:
TOOLCHAIN_HOST_TASK_append += "nativesdk-ti-cgt-pru"

Unfortunately it doesn't work:
Error:
 Problem: conflicting requests
  - nothing provides libpthread.so.0 needed by
nativesdk-ti-cgt-pru-2.3.2-r0.x86_64_nativesdk
  - nothing provides libdl.so.2 needed by
nativesdk-ti-cgt-pru-2.3.2-r0.x86_64_nativesdk
  - nothing provides libm.so.6 needed by
nativesdk-ti-cgt-pru-2.3.2-r0.x86_64_nativesdk
  - nothing provides libc.so.6(GLIBC_2.3) needed by
nativesdk-ti-cgt-pru-2.3.2-r0.x86_64_nativesdk
  - nothing provides libdl.so.2(GLIBC_2.0) needed by
nativesdk-ti-cgt-pru-2.3.2-r0.x86_64_nativesdk
  - nothing provides libdl.so.2(GLIBC_2.1) needed by
nativesdk-ti-cgt-pru-2.3.2-r0.x86_64_nativesdk
  - nothing provides libm.so.6(GLIBC_2.0) needed by
nativesdk-ti-cgt-pru-2.3.2-r0.x86_64_nativesdk
  - nothing provides libpthread.so.0(GLIBC_2.0) needed by
nativesdk-ti-cgt-pru-2.3.2-r0.x86_64_nativesdk
  - nothing provides libpthread.so.0(GLIBC_2.1) needed by
nativesdk-ti-cgt-pru-2.3.2-r0.x86_64_nativesdk
  - nothing provides libpthread.so.0(GLIBC_2.2) needed by
nativesdk-ti-cgt-pru-2.3.2-r0.x86_64_nativesdk
  - nothing provides libpthread.so.0(GLIBC_2.2.3) needed by
nativesdk-ti-cgt-pru-2.3.2-r0.x86_64_nativesdk
  - nothing provides libpthread.so.0(GLIBC_2.3.2) needed by
nativesdk-ti-cgt-pru-2.3.2-r0.x86_64_nativesdk
(try to add '--skip-broken' to skip uninstallable packages or
'--nobest' to use not only best candidate packages)

What have I made wrong?

Thank you!

Ciao,
Alessio
