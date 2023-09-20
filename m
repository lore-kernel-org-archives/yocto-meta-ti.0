Return-Path: <joel.winarske@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D2DAC05021
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 20:17:21 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.6342.1695241033820577458
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 20 Sep 2023 13:17:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eaylsn6Y;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: joel.winarske@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1c46b30a1ceso1429205ad.3
        for <meta-ti@lists.yoctoproject.org>; Wed, 20 Sep 2023 13:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695241033; x=1695845833; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pOkwhaPv5IdnhAypmmgK0jscR4uh2H2Uxd+2u/xaoVA=;
        b=eaylsn6YFP6sAb1IQHDw/JWdN49xSapusU8tmRGQ7PO8FRowtp7QGwmJnPq+2bTcxF
         sVkdCgFw6mQGBP6Fuib+gAIwWg4BLCYdlGjNHIQkQuhxuba4Z8N+bDQHHxC8NrZ2sQNu
         rP0ebTYrnWPTMk2p7VK+oSWJNu3wDWX3+i/l4t7agvx7iijaQrF5mqPm/C1lKA5rnFYv
         rqA/pAwj601as11yOD+hqNrpQPuDD1Inju5W3fbjKie5JoLXYCAnz7RlR5tI9zZ5dRLJ
         8jW9jOYbmB+YZaWX3j903wNaoIgK3EDEb8ZLi81BXS/VEnT3gopPDRkdDjwGco3mWkOc
         jlOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695241033; x=1695845833;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pOkwhaPv5IdnhAypmmgK0jscR4uh2H2Uxd+2u/xaoVA=;
        b=CUu+ne20HZBBiDPJTDrjzE69DJXrDyBDZWmYW+7oHeQGzu4YJ7iAOwFrMOM0jXZ+N8
         KfB5wW8FRV/tRilEN2lQxFardbH6t9z8jWKzHwOYTU/hDqznHgGgHjqi8knauC/90mNf
         tPo5UnA6c/Xb/Bx6RjqwA8iFNxYIR9qqfX5FX3HieR1F91yv1UReUy1hXCCVwmIzx3hd
         ZaABpiGtTIvqqCErhPwY5kYPx8+j9afGgySDqUOvhjQvG01aMBGOfEj2RSaY4cgv/AmJ
         8lplcgJwce1Zgac2YcMH5mh77y3ZLsNRm5f1GxnilsTieZ5umNfyyde2L8g1xbOv3W8k
         HlXw==
X-Gm-Message-State: AOJu0YwZzgmM0yvOvK1R1lCP+mJzZNtztqHe7RzToy4+7M6r0Lhgja1+
	RGNldB+UlNpyUo74A2JxInkMu/vbaH7wKj118Bg=
X-Google-Smtp-Source: AGHT+IHijbIxD7C5VbXtLfvLkTqU4AjLZR7vnkQ5DjaW5HuKZCECkt7GtxYp1pRKMP7zOxyV9AdER0ilOdChYnqm4zE=
X-Received: by 2002:a17:90a:bb86:b0:268:2164:dc93 with SMTP id
 v6-20020a17090abb8600b002682164dc93mr3523751pjr.13.1695241032934; Wed, 20 Sep
 2023 13:17:12 -0700 (PDT)
MIME-Version: 1.0
References: <cJr9.1694721437908350278.lV3S@lists.yoctoproject.org> <4944740.qmqfjKhsMY@gryffindor>
In-Reply-To: <4944740.qmqfjKhsMY@gryffindor>
From: Joel Winarske <joel.winarske@gmail.com>
Date: Wed, 20 Sep 2023 13:17:02 -0700
Message-ID: <CABKMkPLY5i72rZd8vQw8iGXnif=ctHWZq-6geAXU-OkY9TrAgA@mail.gmail.com>
Subject: Re: [meta-ti] [kirkstone] beaglebone-ai64
To: =?UTF-8?Q?Lisandro_Dami=C3=A1n_Nicanor_P=C3=A9rez_Meyer?= <perezmeyer@gmail.com>
Cc: meta-ti@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000093ac560605d00f3e"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 20 Sep 2023 20:17:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16997

--00000000000093ac560605d00f3e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

My serial interface cables just arrived.  Looks like a kernel panic due
to pvrsrvkm.  Anyone aware of this one?

[    7.408257] pvrsrvkm: loading out-of-tree module taints kernel.
[    7.428045] PVR_K:  268: Device: 4e20000000.gpu
[    7.432837] SError Interrupt on CPU1, code 0xbf000000 -- SError
[    7.432840] CPU: 1 PID: 268 Comm: systemd-udevd Tainted: G           O
   5.10.162+ #1
[    7.432841] Hardware name:  /, BIOS 2021.01-gf65a2b8f 08/10/2022
[    7.432842] pstate: 60000005 (nZCv daif -PAN -UAO -TCO BTYPE=3D--)
[    7.432843] pc : _RGXReadBVNCFromReg.isra.0+0x20/0x140 [pvrsrvkm]
[    7.432844] lr : RGXBvncInitialiseConfiguration+0x274/0x9c0 [pvrsrvkm]
[    7.432845] sp : ffff8000132cb740
[    7.432846] x29: ffff8000132cb740 x28: ffff800011a97000
[    7.432849] x27: 0000000000000000 x26: ffff8000132cb7a8
[    7.432851] x25: ffff000812d7c000 x24: ffff0008137c29a0
[    7.432853] x23: 0000000000000000 x22: ffff8000092ae000
[    7.432855] x21: ffff0008137c2808 x20: ffff8000092557c0
[    7.432857] x19: 0000000000000000 x18: ffff8000092030f4
[    7.432859] x17: 000000ffc0000000 x16: ffff800009203460
[    7.432862] x15: ffff8000092030e0 x14: ffff800009201050
[    7.432863] x13: ffff80000920c3a4 x12: 0000000000000000
[    7.432866] x11: ffff0008137c2808 x10: 0000000000000020
[    7.432868] x9 : 0000000000000000 x8 : 0000000000000024
[    7.432870] x7 : 0000000000000000 x6 : ffff800013a00000
[    7.432872] x5 : ffff8000132cb7b0 x4 : ffff8000132cb7ac
[    7.432874] x3 : ffff8000132cb7a8 x2 : ffff8000132cb7a4
[    7.432876] x1 : 0000000000000000 x0 : ffff0008137c2808
[    7.432878] Kernel panic - not syncing: Asynchronous SError Interrupt


On Mon, Sep 18, 2023 at 1:16=E2=80=AFPM Lisandro Dami=C3=A1n Nicanor P=C3=
=A9rez Meyer <
perezmeyer@gmail.com> wrote:

> Hi!
>
> El jueves, 14 de septiembre de 2023 16:57:17 -03 Joel Winarske escribi=C3=
=B3:
> > Hi folks,
> >
> > I've built core-image-weston for beaglebone-ai64.
> >
> > I'm imaging sdcard using:
> >     sudo bmaptool copy ./core-image-weston-beaglebone-ai64.wic.xz
> /dev/sda
> >
> > The image is not booting.
> >
> > Are there any known issues with this layer on kirkstone tip of tree?
> >
> >
> > (I'm looking into making flutter-auto (AGL) run on this device; I'm the
> author of flutter-auto)
>
> Yes, I could only run the image by booting from the SD card. I'm trying t=
o
> add Balena support to it.
>
> I've compared BeagleBone's and meta-ti's u-boot and they differ in a few
> places which seem to be related to the eMMC, so my guess is that the issu=
e
> needs to be solved there first.
>

--00000000000093ac560605d00f3e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">My serial interface cables just arrived.=C2=A0 Looks like =
a kernel panic due to=C2=A0pvrsrvkm.=C2=A0 Anyone aware of this one?<br><br=
>[ =C2=A0 =C2=A07.408257] pvrsrvkm: loading out-of-tree module taints kerne=
l.<br>[ =C2=A0 =C2=A07.428045] PVR_K: =C2=A0268: Device: 4e20000000.gpu<br>=
[ =C2=A0 =C2=A07.432837] SError Interrupt on CPU1, code 0xbf000000 -- SErro=
r<br>[ =C2=A0 =C2=A07.432840] CPU: 1 PID: 268 Comm: systemd-udevd Tainted: =
G =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O =C2=A0 =C2=A0 =C2=A05.10.162+ #1<br>=
[ =C2=A0 =C2=A07.432841] Hardware name: =C2=A0/, BIOS 2021.01-gf65a2b8f 08/=
10/2022<br>[ =C2=A0 =C2=A07.432842] pstate: 60000005 (nZCv daif -PAN -UAO -=
TCO BTYPE=3D--)<br>[ =C2=A0 =C2=A07.432843] pc : _RGXReadBVNCFromReg.isra.0=
+0x20/0x140 [pvrsrvkm]<br>[ =C2=A0 =C2=A07.432844] lr : RGXBvncInitialiseCo=
nfiguration+0x274/0x9c0 [pvrsrvkm]<br>[ =C2=A0 =C2=A07.432845] sp : ffff800=
0132cb740<br>[ =C2=A0 =C2=A07.432846] x29: ffff8000132cb740 x28: ffff800011=
a97000 <br>[ =C2=A0 =C2=A07.432849] x27: 0000000000000000 x26: ffff8000132c=
b7a8 <br>[ =C2=A0 =C2=A07.432851] x25: ffff000812d7c000 x24: ffff0008137c29=
a0 <br>[ =C2=A0 =C2=A07.432853] x23: 0000000000000000 x22: ffff8000092ae000=
 <br>[ =C2=A0 =C2=A07.432855] x21: ffff0008137c2808 x20: ffff8000092557c0 <=
br>[ =C2=A0 =C2=A07.432857] x19: 0000000000000000 x18: ffff8000092030f4 <br=
>[ =C2=A0 =C2=A07.432859] x17: 000000ffc0000000 x16: ffff800009203460 <br>[=
 =C2=A0 =C2=A07.432862] x15: ffff8000092030e0 x14: ffff800009201050 <br>[ =
=C2=A0 =C2=A07.432863] x13: ffff80000920c3a4 x12: 0000000000000000 <br>[ =
=C2=A0 =C2=A07.432866] x11: ffff0008137c2808 x10: 0000000000000020 <br>[ =
=C2=A0 =C2=A07.432868] x9 : 0000000000000000 x8 : 0000000000000024 <br>[ =
=C2=A0 =C2=A07.432870] x7 : 0000000000000000 x6 : ffff800013a00000 <br>[ =
=C2=A0 =C2=A07.432872] x5 : ffff8000132cb7b0 x4 : ffff8000132cb7ac <br>[ =
=C2=A0 =C2=A07.432874] x3 : ffff8000132cb7a8 x2 : ffff8000132cb7a4 <br>[ =
=C2=A0 =C2=A07.432876] x1 : 0000000000000000 x0 : ffff0008137c2808 <br><div=
>[ =C2=A0 =C2=A07.432878] Kernel panic - not syncing: Asynchronous SError I=
nterrupt</div><div><br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Sep 18, 2023 at 1:16=E2=80=AFPM Lisan=
dro Dami=C3=A1n Nicanor P=C3=A9rez Meyer &lt;<a href=3D"mailto:perezmeyer@g=
mail.com">perezmeyer@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">Hi!<br>
<br>
El jueves, 14 de septiembre de 2023 16:57:17 -03 Joel Winarske escribi=C3=
=B3:<br>
&gt; Hi folks,<br>
&gt; <br>
&gt; I&#39;ve built core-image-weston for beaglebone-ai64.<br>
&gt; <br>
&gt; I&#39;m imaging sdcard using:<br>
&gt;=C2=A0 =C2=A0 =C2=A0sudo bmaptool copy ./core-image-weston-beaglebone-a=
i64.wic.xz /dev/sda<br>
&gt; <br>
&gt; The image is not booting.<br>
&gt; <br>
&gt; Are there any known issues with this layer on kirkstone tip of tree?<b=
r>
&gt; <br>
&gt; <br>
&gt; (I&#39;m looking into making flutter-auto (AGL) run on this device; I&=
#39;m the author of flutter-auto)<br>
<br>
Yes, I could only run the image by booting from the SD card. I&#39;m trying=
 to add Balena support to it.<br>
<br>
I&#39;ve compared BeagleBone&#39;s and meta-ti&#39;s u-boot and they differ=
 in a few places which seem to be related to the eMMC, so my guess is that =
the issue needs to be solved there first.<br>
</blockquote></div>

--00000000000093ac560605d00f3e--

