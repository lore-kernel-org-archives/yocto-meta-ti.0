Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web10.197744.1598282536626612337
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 24 Aug 2020 08:22:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@openavr-org.20150623.gappssmtp.com header.s=20150623 header.b=Tosz80PX;
 spf=none, err=permanent DNS error (domain: openavr.org, ip: 209.85.166.49, mailfrom: troth@openavr.org)
Received: by mail-io1-f49.google.com with SMTP id s1so9030679iot.10
        for <meta-ti@lists.yoctoproject.org>; Mon, 24 Aug 2020 08:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openavr-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=RXSzFAzAO+HfSwYO9hHqx3BayTB2V2CBpLVeSA2DVLs=;
        b=Tosz80PXw84Yk/JpPr7FzKb+4CFI6xVOtUnLOz2lfyFrNEi1Zwck/DFq76EwAj2jEA
         KfivJTwK7AvDPZRKQRhDcuoZjIZJJHbalCUOA/RDP/N4x+jZYyZV5JMU2VYlrh46/Odc
         i5s1kSrsPSyziL4T+e7pDxkQrx4QhbOsHitoBYVwk9j/uULc1KZioNGr6lYIE9AgKjLL
         V50FTLMTMLZBkJYUDVHEKm9JYQB9vTVUw6qccjHO/AhwO0vu9sZ4+d25KS1xR5+NG517
         7cHhu9lajLr/90hkSrbU2tGvMc2nDW6E66NI+Tv4eOM/mryTx/GbAp2UxHH2Y7pyiZbp
         4DJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=RXSzFAzAO+HfSwYO9hHqx3BayTB2V2CBpLVeSA2DVLs=;
        b=M0MJXh6NX4+DzuuusdhYz4e+oe7EssW0hbcyY50isKtLcPBzDxssSA6Y/mR2dfySVY
         qCQWS90REAiR7GQ/7YRArOsZyN7vSS7gY4tL3wc9dXe0XOXvrv0cbv820ZU2WmG8NSoZ
         JCmWynl8qgTw87qMN1TTt+JQ1XAPVXiUGJMW+ZKoDF2hDkr42ynPwB/lEoXSUwQ2UdLH
         Rq/Y6F7N7FftybN3IVNxHRnaEPV2uH9QhaPLXNK6DFzNUTmnS2UPiOa0zHMNVVadjauh
         4zoMAgXCHDwZx4mTga5Yzy4+YbGjj4WlD7fo+gV21rZ6dfWn3ECImlZxRiO4Qdf4j5iL
         GbTw==
X-Gm-Message-State: AOAM5338sYfDCQakXbGP/5TwC6ksSmfsDI7BxjwzVgAPUtDdFklSp/K9
	WLHK02vF2vOKDixJdx830dtm1YVxu+j4EfEJ/BuykiT0meLVZnVK9v4=
X-Google-Smtp-Source: ABdhPJwxD5s5WaP5esQcGYy1FuXQ5XvRGtvEbq+pyalTw6ipVRXpFanXSM6HW7r6PQzm7QJkGFmA1ZBg54IXMa3awRg=
X-Received: by 2002:a5d:9cc6:: with SMTP id w6mr2155521iow.170.1598282535156;
 Mon, 24 Aug 2020 08:22:15 -0700 (PDT)
MIME-Version: 1.0
From: "Theodore A. Roth" <troth@openavr.org>
Date: Mon, 24 Aug 2020 09:22:02 -0600
Message-ID: <CAFMvBt3VaA+vULJFv14t0FprpAt1JY9OXRZg78g+qKL+8yc0hA@mail.gmail.com>
Subject: [dunfell] ti-soc-termal bandgap termperature reading got broken in 5.4.y kernel
To: meta-ti@lists.yoctoproject.org
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Eduardo Valentin <edubezval@gmail.com>, 
	Keerthy <j-keerthy@ti.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

Not sure if this is the right place to report this, but since we
noticed it via an update to
the meta-ti layer, I thought I'd start here.

We noticed that reading the bandgap temperature sensors stopped working when
the ti kernel was updated to 5.4.52 with this commit:

    $ git log -1 346017b313e7c2a376724f71c1b2559fbdc221da
    commit 346017b313e7c2a376724f71c1b2559fbdc221da (refs/bisect/bad)
    Author: Denys Dmytriyenko <denys@ti.com>
    Date:   Fri Jul 31 00:27:08 2020 +0000

        linux-ti-staging: update to 5.4.52

        Signed-off-by: Denys Dmytriyenko <denys@ti.com>

After that change, we see this output:

    # cat /sys/class/thermal/thermal_zone*/type
    cpu_thermal
    gpu_thermal
    core_thermal
    dspeve_thermal
    iva_thermal
    board_thermal
    bq27000-battery
    # cat /sys/class/thermal/thermal_zone*/temp
    cat: /sys/class/thermal/thermal_zone0/temp: Invalid argument
    cat: /sys/class/thermal/thermal_zone1/temp: Invalid argument
    cat: /sys/class/thermal/thermal_zone2/temp: Invalid argument
    cat: /sys/class/thermal/thermal_zone3/temp: Invalid argument
    cat: /sys/class/thermal/thermal_zone4/temp: Invalid argument
    30187
    cat: /sys/class/thermal/thermal_zone6/temp: No such device

After a little bit of digging, it looks like this commit in the main
line stable kernel
causes the breakage:

    https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?h=ti-linux-5.4.y&id=ea78361174c4746e8df8e6fdc0ec1dc710a6869d

After reverting that commit and adding the reverted commit as a patch to our
bbappend for the kernel, we're seeing the expected results:

    # cat /sys/class/thermal/thermal_zone*/temp
    47400
    48200
    47800
    46200
    47800
    39937
    cat: /sys/class/thermal/thermal_zone6/temp: No such device

We are seeing this using a BeagleBone X15 board. Our MACHINE config
is based on conf/machine/include/dra7xx.inc.

    # uname -a
    Linux viper-x15 5.4.58-gda26e63e96 #1 SMP PREEMPT Tue Aug 18
18:29:57 UTC 2020 armv7l armv7l armv7l GNU/Linux
