Return-Path: <joel.winarske@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D4DDCD4937
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 00:08:12 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.5083.1695254890531889224
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 20 Sep 2023 17:08:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B6uC2qnh;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: joel.winarske@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-690f7bf73ddso285642b3a.2
        for <meta-ti@lists.yoctoproject.org>; Wed, 20 Sep 2023 17:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695254890; x=1695859690; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r8YbNksXz1Rnmx15higsWBBeeZJI2A8MKu7TQpdIeIs=;
        b=B6uC2qnhlN56V84aLIoEeHeEO6GX8+K1TgVa/Z0nbuJijsht5Hs9YjpQ33tMI03Aqd
         Fhj5Y4stHxHt2SIFEAQ4dY22JbXzzSfeA/+2g8E6rx7nVU6MPeoxF2NLfHThSBRTwtD2
         5FhVg3iccuhv/vo68D9kJ01lNG4OtauZ3QaChZlQ7m5ILq7cgN+ZYqAvlj7djT4rx1yX
         d7z5I+LKT4iajG/fFWRLd+5C8/bsoAwjrNt8VMJ6XDoh6+cdhjFFir8cSALdCuPui8fd
         oVqVK7Tf9xap6MhpfIdAoUMaoxg1z14oRkIle7W++ktYiJ3WaKqWf2S+8QoZs7aOjxbD
         lb2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695254890; x=1695859690;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r8YbNksXz1Rnmx15higsWBBeeZJI2A8MKu7TQpdIeIs=;
        b=Ch4nCUKD6UCTJNy2VQL/RtY4J6tOizx+ykdEG893q+CpY1mE4CcWMGo68b+qDYRsha
         fqCLlCriqW7YPEnLOJ53n2oDMGr+y/5RWgZG9DEsDgHym7coyzDtaXqrcJtyurn+19GU
         KiXwU3S7N7hULVZoO2W1S9kcryqr8TRb4s2uEEqI+r/omEwQnqq+6q63j2BltxxtEMaN
         3UiM079ONpu//RZGRKFscgOazrnyEHIDjHHYYOXMKvSbcPQHwTevmDdq2gfFRUdROjK0
         9ntMfZT2gCrQgWbRBg1vme6OMhkU6UrpZRPhVoSjW9G/WK+GyeCV2LLJwoWNLIQlYZM5
         3NeQ==
X-Gm-Message-State: AOJu0Yw7RWuEmzaEUq3YqBjJx/+N5VRmfs1HwS3+KkDlpRjnxalZZPM0
	xHlsrxEFw5l6vMW04VsWua3v9Fv59IF5qm6POSA=
X-Google-Smtp-Source: AGHT+IE9D0xAqcJKymObYVNbmk4TJU2Fx9f+hpzDxcaoe9yge6GUUaLHaByquPgInN9G/prU54Vt0BdJ0r7wgWTBRY0=
X-Received: by 2002:a05:6a21:2702:b0:154:b4cb:2e95 with SMTP id
 rm2-20020a056a21270200b00154b4cb2e95mr2897874pzb.62.1695254889236; Wed, 20
 Sep 2023 17:08:09 -0700 (PDT)
MIME-Version: 1.0
References: <cJr9.1694721437908350278.lV3S@lists.yoctoproject.org>
 <4944740.qmqfjKhsMY@gryffindor> <1786B4BD16070DE7.17733@lists.yoctoproject.org>
In-Reply-To: <1786B4BD16070DE7.17733@lists.yoctoproject.org>
From: Joel Winarske <joel.winarske@gmail.com>
Date: Wed, 20 Sep 2023 17:07:58 -0700
Message-ID: <CABKMkP+97wPKOxKd4b5HOA5PjrkbbRreW9VGCqBLbpq70RqeYQ@mail.gmail.com>
Subject: Re: [meta-ti] [kirkstone] beaglebone-ai64
To: joel.winarske@gmail.com
Cc: =?UTF-8?Q?Lisandro_Dami=C3=A1n_Nicanor_P=C3=A9rez_Meyer?= <perezmeyer@gmail.com>, 
	meta-ti@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000007a0d0a0605d34901"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 21 Sep 2023 00:08:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16998

--0000000000007a0d0a0605d34901
Content-Type: text/plain; charset="UTF-8"

Today's limited progress:

1. U-Boot from eMMC is used by default.  Shipping devices have outdated
U-Boot.
2. Rule out U-Boot, and use Yocto built U-Boot by pressing RST + BOOT,
wait, release RST, then release BOOT.  Boot flow will use all boot bits
from the SD card with this approach.
3. Update `linux-bb.org_git.bb` to use tip of tree:
# 5.10.168 version for 32-bit
SRCREV:armv7a = "0f40ca5e749e9176ad4ea30c68be4fb2340647db"
PV:armv7a = "5.10.168+git${SRCPV}"
BRANCH:armv7a = "5.10.168-ti-r71"

# 5.10.168 version for 64-bit
SRCREV:aarch64 = "ac2750dbf3a3b9078feff995e6754d5c5f609c19"
PV:aarch64 = "5.10.168+git${SRCPV}"
BRANCH:aarch64 = "v5.10.168-ti-arm64-r110"



Updating kernel has no impact on kernel panic:

[    6.621063] pvrsrvkm: loading out-of-tree module taints kernel.
[    6.637510] PVR_K:  251: Device: 4e20000000.gpu
[    6.642337] SError Interrupt on CPU0, code 0xbf000000 -- SError
[    6.642339] CPU: 0 PID: 251 Comm: systemd-udevd Tainted: G           O
   5.10.168+ #1
[    6.642340] Hardware name: BeagleBoard.org BeagleBone AI-64 (DT)
[    6.642341] pstate: 60000005 (nZCv daif -PAN -UAO -TCO BTYPE=--)
[    6.642343] pc : _RGXReadBVNCFromReg.isra.0+0x20/0x140 [pvrsrvkm]
[    6.642343] lr : RGXBvncInitialiseConfiguration+0x274/0x9c0 [pvrsrvkm]
[    6.642344] sp : ffff8000143db740
[    6.642345] x29: ffff8000143db740 x28: ffff8000091e4548
[    6.642349] x27: 0000000000000000 x26: ffff8000143db7a8
[    6.642351] x25: ffff0008132da000 x24: ffff000813c741a0
[    6.642353] x23: 0000000000000000 x22: ffff8000091ed000
[    6.642355] x21: ffff000813c74008 x20: ffff8000091947c0
[    6.642357] x19: 0000000000000000 x18: ffff800009142e74
[    6.642359] x17: 000000ffc0000000 x16: ffff8000091431e0
[    6.642361] x15: ffff800009142e60 x14: ffff800009140dd0
[    6.642363] x13: ffff80000914c124 x12: 0000000000000000
[    6.642365] x11: ffff000813c74008 x10: 0000000000000020
[    6.642367] x9 : 0000000000000000 x8 : 0000000000000024
[    6.642369] x7 : 0000000000000000 x6 : ffff800012500000
[    6.642371] x5 : ffff8000143db7b0 x4 : ffff8000143db7ac
[    6.642373] x3 : ffff8000143db7a8 x2 : ffff8000143db7a4
[    6.642375] x1 : 0000000000000000 x0 : ffff000813c74008
[    6.642377] Kernel panic - not syncing: Asynchronous SError Interrupt

--0000000000007a0d0a0605d34901
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><div><div>Today&#39;s limited progre=
ss:<br><br></div>1. U-Boot from eMMC is used by default.=C2=A0 Shipping dev=
ices have outdated U-Boot.<br></div><div>2. Rule out U-Boot, and use Yocto =
built U-Boot by pressing RST + BOOT, wait, release RST, then release BOOT.=
=C2=A0 Boot flow will use all boot bits from the SD card with this approach=
.</div></div>3. Update `<a href=3D"http://linux-bb.org_git.bb">linux-bb.org=
_git.bb</a>` to use tip of tree:<br><div></div><div><div style=3D"color:rgb=
(204,204,204);background-color:rgb(31,31,31);font-family:&quot;Droid Sans M=
ono&quot;,&quot;monospace&quot;,monospace;font-weight:normal;font-size:14px=
;line-height:19px;white-space:pre"><div><span style=3D"color:rgb(106,153,85=
)"># 5.10.168 version for 32-bit</span></div><div><span style=3D"color:rgb(=
156,220,254)">SRCREV:armv7a</span><span style=3D"color:rgb(204,204,204)"> <=
/span><span style=3D"color:rgb(212,212,212)">=3D</span><span style=3D"color=
:rgb(204,204,204)"> </span><span style=3D"color:rgb(206,145,120)">&quot;0f4=
0ca5e749e9176ad4ea30c68be4fb2340647db&quot;</span></div><div><span style=3D=
"color:rgb(156,220,254)">PV:armv7a</span><span style=3D"color:rgb(204,204,2=
04)"> </span><span style=3D"color:rgb(212,212,212)">=3D</span><span style=
=3D"color:rgb(204,204,204)"> </span><span style=3D"color:rgb(206,145,120)">=
&quot;5.10.168+git</span><span style=3D"color:rgb(86,156,214)">${SRCPV}</sp=
an><span style=3D"color:rgb(206,145,120)">&quot;</span></div><div><span sty=
le=3D"color:rgb(156,220,254)">BRANCH:armv7a</span><span style=3D"color:rgb(=
204,204,204)"> </span><span style=3D"color:rgb(212,212,212)">=3D</span><spa=
n style=3D"color:rgb(204,204,204)"> </span><span style=3D"color:rgb(206,145=
,120)">&quot;5.10.168-ti-r71&quot;</span></div><br><div><span style=3D"colo=
r:rgb(106,153,85)"># 5.10.168 version for 64-bit</span></div><div><span sty=
le=3D"color:rgb(156,220,254)">SRCREV:aarch64</span><span style=3D"color:rgb=
(204,204,204)"> </span><span style=3D"color:rgb(212,212,212)">=3D</span><sp=
an style=3D"color:rgb(204,204,204)"> </span><span style=3D"color:rgb(206,14=
5,120)">&quot;ac2750dbf3a3b9078feff995e6754d5c5f609c19&quot;</span></div><d=
iv><span style=3D"color:rgb(156,220,254)">PV:aarch64</span><span style=3D"c=
olor:rgb(204,204,204)"> </span><span style=3D"color:rgb(212,212,212)">=3D</=
span><span style=3D"color:rgb(204,204,204)"> </span><span style=3D"color:rg=
b(206,145,120)">&quot;5.10.168+git</span><span style=3D"color:rgb(86,156,21=
4)">${SRCPV}</span><span style=3D"color:rgb(206,145,120)">&quot;</span></di=
v><div><span style=3D"color:rgb(156,220,254)">BRANCH:aarch64</span><span st=
yle=3D"color:rgb(204,204,204)"> </span><span style=3D"color:rgb(212,212,212=
)">=3D</span><span style=3D"color:rgb(204,204,204)"> </span><span style=3D"=
color:rgb(206,145,120)">&quot;v5.10.168-ti-arm64-r110&quot;</span></div><br=
><br></div></div><div><br></div><div>Updating kernel has no impact on kerne=
l panic:<br><br>[ =C2=A0 =C2=A06.621063] pvrsrvkm: loading out-of-tree modu=
le taints kernel.<br>[ =C2=A0 =C2=A06.637510] PVR_K: =C2=A0251: Device: 4e2=
0000000.gpu<br>[ =C2=A0 =C2=A06.642337] SError Interrupt on CPU0, code 0xbf=
000000 -- SError<br>[ =C2=A0 =C2=A06.642339] CPU: 0 PID: 251 Comm: systemd-=
udevd Tainted: G =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O =C2=A0 =C2=A0 =C2=A05=
.10.168+ #1<br>[ =C2=A0 =C2=A06.642340] Hardware name: BeagleBoard.org Beag=
leBone AI-64 (DT)<br>[ =C2=A0 =C2=A06.642341] pstate: 60000005 (nZCv daif -=
PAN -UAO -TCO BTYPE=3D--)<br>[ =C2=A0 =C2=A06.642343] pc : _RGXReadBVNCFrom=
Reg.isra.0+0x20/0x140 [pvrsrvkm]<br>[ =C2=A0 =C2=A06.642343] lr : RGXBvncIn=
itialiseConfiguration+0x274/0x9c0 [pvrsrvkm]<br>[ =C2=A0 =C2=A06.642344] sp=
 : ffff8000143db740<br>[ =C2=A0 =C2=A06.642345] x29: ffff8000143db740 x28: =
ffff8000091e4548 <br>[ =C2=A0 =C2=A06.642349] x27: 0000000000000000 x26: ff=
ff8000143db7a8 <br>[ =C2=A0 =C2=A06.642351] x25: ffff0008132da000 x24: ffff=
000813c741a0 <br>[ =C2=A0 =C2=A06.642353] x23: 0000000000000000 x22: ffff80=
00091ed000 <br>[ =C2=A0 =C2=A06.642355] x21: ffff000813c74008 x20: ffff8000=
091947c0 <br>[ =C2=A0 =C2=A06.642357] x19: 0000000000000000 x18: ffff800009=
142e74 <br>[ =C2=A0 =C2=A06.642359] x17: 000000ffc0000000 x16: ffff80000914=
31e0 <br>[ =C2=A0 =C2=A06.642361] x15: ffff800009142e60 x14: ffff800009140d=
d0 <br>[ =C2=A0 =C2=A06.642363] x13: ffff80000914c124 x12: 0000000000000000=
 <br>[ =C2=A0 =C2=A06.642365] x11: ffff000813c74008 x10: 0000000000000020 <=
br>[ =C2=A0 =C2=A06.642367] x9 : 0000000000000000 x8 : 0000000000000024 <br=
>[ =C2=A0 =C2=A06.642369] x7 : 0000000000000000 x6 : ffff800012500000 <br>[=
 =C2=A0 =C2=A06.642371] x5 : ffff8000143db7b0 x4 : ffff8000143db7ac <br>[ =
=C2=A0 =C2=A06.642373] x3 : ffff8000143db7a8 x2 : ffff8000143db7a4 <br>[ =
=C2=A0 =C2=A06.642375] x1 : 0000000000000000 x0 : ffff000813c74008 <br>[ =
=C2=A0 =C2=A06.642377] Kernel panic - not syncing: Asynchronous SError Inte=
rrupt<br></div></div><br></div>

--0000000000007a0d0a0605d34901--

