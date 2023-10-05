Return-Path: <joel.winarske@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4590E92708
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 15:08:19 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.17849.1696518492824326025
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Oct 2023 08:08:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=US9Ao5Q9;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: joel.winarske@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-691c05bc5aaso940256b3a.2
        for <meta-ti@lists.yoctoproject.org>; Thu, 05 Oct 2023 08:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696518492; x=1697123292; darn=lists.yoctoproject.org;
        h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Tob/TYQevK6dkfPHFG+KysgMp14nzI66HG6ihhjjDI=;
        b=US9Ao5Q9kfVvNdGM+K5wZ7yfoxoqrih577+AWEwk03WP5nBW9t9As5HOVrWwcGnqOa
         WnnzVkwPwf5r+HpxcTRHMTUaAveRAtvdziNKRz8AMDt+01SUvBklY3Z88uLXuVLQrIWv
         0Bulg/PDSo8wwC7MM1R+XJh9joW5IDSD6EdIUIgxIU7HL7Et90th58EipBGjwK2Pui2n
         heLgr0p5eFiMKcnnlQFjCtB332DoNoahlD+wXiI5EYGImDHdYdRLQ2G0O4b6dFtr4sCk
         G3g4S9szCVj1bsygTWeYcDjKsRpUBPCGFF2JZOuTENZZPI1LbQWSA0tzMjGFcTMvMNIC
         +XnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696518492; x=1697123292;
        h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Tob/TYQevK6dkfPHFG+KysgMp14nzI66HG6ihhjjDI=;
        b=ebmH4/9+j3j63LP+2F/mN8QozSeTRbOKRXmzP/3Zk6zOdDDfaT8Yz7H+6o8OXnIxgu
         znOpDyLnwQzGecGT33jEPk6l1chSuyPiwFJOoQR97F/MQUh97CZS9Vsyn3yffUfm8cJn
         LCbg00hLrF9pVMRTuCsExungeHwa9V8q1T9/dZjBTr1piUeLlxA/I2otITyCHmm0/4IB
         oWSJaTM9Tg+P+RKdhmWxIt9k7K4XI5D2o0pqSZGFx+GJCnCzvXwupSVZaHk0EbqjD0Il
         GqbncR2FWVUZYhSaz5C+NuZZVWlnHT2mgtk4yvEi995j3ecRaMMHbarXJ96nlIm4Yfi6
         I6lg==
X-Gm-Message-State: AOJu0Yx9CotLVnzA4sB+Ic9fD3dTWPIQ9cxWB4NQJ7fwfmumbcKIesIe
	W3aix1nC3C7XoudARgZYf5MDiXpthUt5lWTWtg6jcEGNyYk=
X-Google-Smtp-Source: AGHT+IG6px/4U7jeyu6iF+e5Vy3tEXu4qZVLC16GPvkFyeyxPCX1qCYML29wWbpTMLEXZPQgwwXedvg/g81dEyX4Mgk=
X-Received: by 2002:a05:6a21:7892:b0:15e:96d3:a31b with SMTP id
 bf18-20020a056a21789200b0015e96d3a31bmr6458809pzc.39.1696518491665; Thu, 05
 Oct 2023 08:08:11 -0700 (PDT)
MIME-Version: 1.0
References: <cJr9.1694721437908350278.lV3S@lists.yoctoproject.org>
 <4944740.qmqfjKhsMY@gryffindor> <1786B4BD16070DE7.17733@lists.yoctoproject.org>
 <1786C15758510F16.1961@lists.yoctoproject.org> <1788393BCE69D553.9831@lists.yoctoproject.org>
In-Reply-To: <1788393BCE69D553.9831@lists.yoctoproject.org>
From: Joel Winarske <joel.winarske@gmail.com>
Date: Thu, 5 Oct 2023 08:08:00 -0700
Message-ID: <CABKMkPK_CXQ-DdiBvmuWKSz6KccTvXqW=-=h=fz8q6Ar-ZzFEQ@mail.gmail.com>
Subject: Re: [meta-ti] [kirkstone] beaglebone-ai64
Cc: meta-ti@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000000cf7ef0606f97e83"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 05 Oct 2023 15:08:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17058

--0000000000000cf7ef0606f97e83
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm narrowing in on the issue.

I have a BeagleBoard.org OS image release where I can see PowerVR running,
and PCIe (WiFi/BT) works:
* bbai64-emmc-flasher-debian-11.7-xfce-edgeai-arm64-2023-09-02-10gb.img
Rescue option 1 (default image panics when booting with PCIe populated):
[    0.000000] Linux version 5.10.168-ti-arm64-r111 (voodoo@AM69-SK-32g-01)
(gcc (Debian 10.2.1-6) 10.2.1u3

These images use a device tree from a different repo than the ti-kernel
repo:
    kernel: https://github.com/beagleboard/linux.git
    dt:
https://git.beagleboard.org/beagleboard/BeagleBoard-DeviceTrees

Dumping the DT from Yocto linux-bb and BeagleBoard.org the output is not
the same.

Proposed minimum changes:
* add option for BeagleBoard-DeviceTree
* update kernel versions in linux-bb
* update PowerVR version to match kernel/DT

Thoughts?

On Mon, Sep 25, 2023 at 11:56=E2=80=AFAM Joel Winarske via lists.yoctoproje=
ct.org
<joel.winarske=3Dgmail.com@lists.yoctoproject.org> wrote:

> Update on issue.
>
> I can boot a kirkstone core-image-base (headless) without any issue.
>
> Randolph at TI has indicated the panic is related to an outdated gpu
> definition in DT.  The gpu DT def defines two power domains, only one is
> required.  I have not yet successfully confirmed this change.
>
>
>
> On Wed, Sep 20, 2023 at 5:08=E2=80=AFPM Joel Winarske via lists.yoctoproj=
ect.org
> <joel.winarske=3Dgmail.com@lists.yoctoproject.org> wrote:
>
>> Today's limited progress:
>>
>> 1. U-Boot from eMMC is used by default.  Shipping devices have outdated
>> U-Boot.
>> 2. Rule out U-Boot, and use Yocto built U-Boot by pressing RST + BOOT,
>> wait, release RST, then release BOOT.  Boot flow will use all boot bits
>> from the SD card with this approach.
>> 3. Update `linux-bb.org_git.bb` to use tip of tree:
>> # 5.10.168 version for 32-bit
>> SRCREV:armv7a =3D "0f40ca5e749e9176ad4ea30c68be4fb2340647db"
>> PV:armv7a =3D "5.10.168+git${SRCPV}"
>> BRANCH:armv7a =3D "5.10.168-ti-r71"
>>
>> # 5.10.168 version for 64-bit
>> SRCREV:aarch64 =3D "ac2750dbf3a3b9078feff995e6754d5c5f609c19"
>> PV:aarch64 =3D "5.10.168+git${SRCPV}"
>> BRANCH:aarch64 =3D "v5.10.168-ti-arm64-r110"
>>
>>
>>
>> Updating kernel has no impact on kernel panic:
>>
>> [    6.621063] pvrsrvkm: loading out-of-tree module taints kernel.
>> [    6.637510] PVR_K:  251: Device: 4e20000000.gpu
>> [    6.642337] SError Interrupt on CPU0, code 0xbf000000 -- SError
>> [    6.642339] CPU: 0 PID: 251 Comm: systemd-udevd Tainted: G           =
O
>>      5.10.168+ #1
>> [    6.642340] Hardware name: BeagleBoard.org BeagleBone AI-64 (DT)
>> [    6.642341] pstate: 60000005 (nZCv daif -PAN -UAO -TCO BTYPE=3D--)
>> [    6.642343] pc : _RGXReadBVNCFromReg.isra.0+0x20/0x140 [pvrsrvkm]
>> [    6.642343] lr : RGXBvncInitialiseConfiguration+0x274/0x9c0 [pvrsrvkm=
]
>> [    6.642344] sp : ffff8000143db740
>> [    6.642345] x29: ffff8000143db740 x28: ffff8000091e4548
>> [    6.642349] x27: 0000000000000000 x26: ffff8000143db7a8
>> [    6.642351] x25: ffff0008132da000 x24: ffff000813c741a0
>> [    6.642353] x23: 0000000000000000 x22: ffff8000091ed000
>> [    6.642355] x21: ffff000813c74008 x20: ffff8000091947c0
>> [    6.642357] x19: 0000000000000000 x18: ffff800009142e74
>> [    6.642359] x17: 000000ffc0000000 x16: ffff8000091431e0
>> [    6.642361] x15: ffff800009142e60 x14: ffff800009140dd0
>> [    6.642363] x13: ffff80000914c124 x12: 0000000000000000
>> [    6.642365] x11: ffff000813c74008 x10: 0000000000000020
>> [    6.642367] x9 : 0000000000000000 x8 : 0000000000000024
>> [    6.642369] x7 : 0000000000000000 x6 : ffff800012500000
>> [    6.642371] x5 : ffff8000143db7b0 x4 : ffff8000143db7ac
>> [    6.642373] x3 : ffff8000143db7a8 x2 : ffff8000143db7a4
>> [    6.642375] x1 : 0000000000000000 x0 : ffff000813c74008
>> [    6.642377] Kernel panic - not syncing: Asynchronous SError Interrupt
>>
>>
>>
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17014):
> https://lists.yoctoproject.org/g/meta-ti/message/17014
> Mute This Topic: https://lists.yoctoproject.org/mt/101366039/2167248
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [
> joel.winarske@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000000cf7ef0606f97e83
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;m narrowing in on the issue.<br><br>I have a Be=
agleBoard.org OS image release where I can see PowerVR running, and PCIe (W=
iFi/BT) works:<div>* bbai64-emmc-flasher-debian-11.7-xfce-edgeai-arm64-2023=
-09-02-10gb.img<br>Rescue option 1 (default image panics when booting with =
PCIe populated):<br>[ =C2=A0 =C2=A00.000000] Linux version 5.10.168-ti-arm6=
4-r111 (voodoo@AM69-SK-32g-01) (gcc (Debian 10.2.1-6) 10.2.1u3<br></div><di=
v></div><div><br></div><div>These images use a device tree from a different=
 repo than the ti-kernel repo:</div><div></div><div>=C2=A0=C2=A0=C2=A0 kern=
el: <a href=3D"https://github.com/beagleboard/linux.git">https://github.com=
/beagleboard/linux.git</a></div><div>=C2=A0=C2=A0=C2=A0 dt:=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a href=3D"https://git.beagleboard.org/beaglebo=
ard/BeagleBoard-DeviceTrees">https://git.beagleboard.org/beagleboard/Beagle=
Board-DeviceTrees</a><br><br>Dumping the DT from Yocto linux-bb and BeagleB=
oard.org the output is not the same.<br></div><div><br>Proposed minimum cha=
nges:<br>* add option for BeagleBoard-DeviceTree<br>* update kernel version=
s in linux-bb<br></div><div>* update PowerVR version to match kernel/DT<br>=
</div><div><br></div>Thoughts?<br></div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 25, 2023 at 11:56=E2=80=
=AFAM Joel Winarske via <a href=3D"http://lists.yoctoproject.org">lists.yoc=
toproject.org</a> &lt;joel.winarske=3D<a href=3D"mailto:gmail.com@lists.yoc=
toproject.org">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Update=
 on issue.</div><div><br>I can boot a kirkstone core-image-base (headless) =
without any=20
issue.<br><br></div><div>Randolph at TI has indicated the panic is related =
to an outdated gpu definition in DT.=C2=A0 The gpu DT def defines two power=
 domains, only one is required.=C2=A0 I have not yet successfully confirmed=
 this change.<br><br></div><div><br></div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 20, 2023 at 5:08=E2=
=80=AFPM Joel Winarske via <a href=3D"http://lists.yoctoproject.org" target=
=3D"_blank">lists.yoctoproject.org</a> &lt;joel.winarske=3D<a href=3D"mailt=
o:gmail.com@lists.yoctoproject.org" target=3D"_blank">gmail.com@lists.yocto=
project.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div><div><div>Today&#39;s lim=
ited progress:<br><br></div>1. U-Boot from eMMC is used by default.=C2=A0 S=
hipping devices have outdated U-Boot.<br></div><div>2. Rule out U-Boot, and=
 use Yocto built U-Boot by pressing RST + BOOT, wait, release RST, then rel=
ease BOOT.=C2=A0 Boot flow will use all boot bits from the SD card with thi=
s approach.</div></div>3. Update `<a href=3D"http://linux-bb.org_git.bb" ta=
rget=3D"_blank">linux-bb.org_git.bb</a>` to use tip of tree:<br><div></div>=
<div><div style=3D"color:rgb(204,204,204);background-color:rgb(31,31,31);fo=
nt-family:&quot;Droid Sans Mono&quot;,&quot;monospace&quot;,monospace;font-=
weight:normal;font-size:14px;line-height:19px;white-space:pre-wrap"><div><s=
pan style=3D"color:rgb(106,153,85)"># 5.10.168 version for 32-bit</span></d=
iv><div><span style=3D"color:rgb(156,220,254)">SRCREV:armv7a</span><span st=
yle=3D"color:rgb(204,204,204)"> </span><span style=3D"color:rgb(212,212,212=
)">=3D</span><span style=3D"color:rgb(204,204,204)"> </span><span style=3D"=
color:rgb(206,145,120)">&quot;0f40ca5e749e9176ad4ea30c68be4fb2340647db&quot=
;</span></div><div><span style=3D"color:rgb(156,220,254)">PV:armv7a</span><=
span style=3D"color:rgb(204,204,204)"> </span><span style=3D"color:rgb(212,=
212,212)">=3D</span><span style=3D"color:rgb(204,204,204)"> </span><span st=
yle=3D"color:rgb(206,145,120)">&quot;5.10.168+git</span><span style=3D"colo=
r:rgb(86,156,214)">${SRCPV}</span><span style=3D"color:rgb(206,145,120)">&q=
uot;</span></div><div><span style=3D"color:rgb(156,220,254)">BRANCH:armv7a<=
/span><span style=3D"color:rgb(204,204,204)"> </span><span style=3D"color:r=
gb(212,212,212)">=3D</span><span style=3D"color:rgb(204,204,204)"> </span><=
span style=3D"color:rgb(206,145,120)">&quot;5.10.168-ti-r71&quot;</span></d=
iv><br><div><span style=3D"color:rgb(106,153,85)"># 5.10.168 version for 64=
-bit</span></div><div><span style=3D"color:rgb(156,220,254)">SRCREV:aarch64=
</span><span style=3D"color:rgb(204,204,204)"> </span><span style=3D"color:=
rgb(212,212,212)">=3D</span><span style=3D"color:rgb(204,204,204)"> </span>=
<span style=3D"color:rgb(206,145,120)">&quot;ac2750dbf3a3b9078feff995e6754d=
5c5f609c19&quot;</span></div><div><span style=3D"color:rgb(156,220,254)">PV=
:aarch64</span><span style=3D"color:rgb(204,204,204)"> </span><span style=
=3D"color:rgb(212,212,212)">=3D</span><span style=3D"color:rgb(204,204,204)=
"> </span><span style=3D"color:rgb(206,145,120)">&quot;5.10.168+git</span><=
span style=3D"color:rgb(86,156,214)">${SRCPV}</span><span style=3D"color:rg=
b(206,145,120)">&quot;</span></div><div><span style=3D"color:rgb(156,220,25=
4)">BRANCH:aarch64</span><span style=3D"color:rgb(204,204,204)"> </span><sp=
an style=3D"color:rgb(212,212,212)">=3D</span><span style=3D"color:rgb(204,=
204,204)"> </span><span style=3D"color:rgb(206,145,120)">&quot;v5.10.168-ti=
-arm64-r110&quot;</span></div><br><br></div></div><div><br></div><div>Updat=
ing kernel has no impact on kernel panic:<br><br>[ =C2=A0 =C2=A06.621063] p=
vrsrvkm: loading out-of-tree module taints kernel.<br>[ =C2=A0 =C2=A06.6375=
10] PVR_K: =C2=A0251: Device: 4e20000000.gpu<br>[ =C2=A0 =C2=A06.642337] SE=
rror Interrupt on CPU0, code 0xbf000000 -- SError<br>[ =C2=A0 =C2=A06.64233=
9] CPU: 0 PID: 251 Comm: systemd-udevd Tainted: G =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 O =C2=A0 =C2=A0 =C2=A05.10.168+ #1<br>[ =C2=A0 =C2=A06.642340] H=
ardware name: BeagleBoard.org BeagleBone AI-64 (DT)<br>[ =C2=A0 =C2=A06.642=
341] pstate: 60000005 (nZCv daif -PAN -UAO -TCO BTYPE=3D--)<br>[ =C2=A0 =C2=
=A06.642343] pc : _RGXReadBVNCFromReg.isra.0+0x20/0x140 [pvrsrvkm]<br>[ =C2=
=A0 =C2=A06.642343] lr : RGXBvncInitialiseConfiguration+0x274/0x9c0 [pvrsrv=
km]<br>[ =C2=A0 =C2=A06.642344] sp : ffff8000143db740<br>[ =C2=A0 =C2=A06.6=
42345] x29: ffff8000143db740 x28: ffff8000091e4548 <br>[ =C2=A0 =C2=A06.642=
349] x27: 0000000000000000 x26: ffff8000143db7a8 <br>[ =C2=A0 =C2=A06.64235=
1] x25: ffff0008132da000 x24: ffff000813c741a0 <br>[ =C2=A0 =C2=A06.642353]=
 x23: 0000000000000000 x22: ffff8000091ed000 <br>[ =C2=A0 =C2=A06.642355] x=
21: ffff000813c74008 x20: ffff8000091947c0 <br>[ =C2=A0 =C2=A06.642357] x19=
: 0000000000000000 x18: ffff800009142e74 <br>[ =C2=A0 =C2=A06.642359] x17: =
000000ffc0000000 x16: ffff8000091431e0 <br>[ =C2=A0 =C2=A06.642361] x15: ff=
ff800009142e60 x14: ffff800009140dd0 <br>[ =C2=A0 =C2=A06.642363] x13: ffff=
80000914c124 x12: 0000000000000000 <br>[ =C2=A0 =C2=A06.642365] x11: ffff00=
0813c74008 x10: 0000000000000020 <br>[ =C2=A0 =C2=A06.642367] x9 : 00000000=
00000000 x8 : 0000000000000024 <br>[ =C2=A0 =C2=A06.642369] x7 : 0000000000=
000000 x6 : ffff800012500000 <br>[ =C2=A0 =C2=A06.642371] x5 : ffff8000143d=
b7b0 x4 : ffff8000143db7ac <br>[ =C2=A0 =C2=A06.642373] x3 : ffff8000143db7=
a8 x2 : ffff8000143db7a4 <br>[ =C2=A0 =C2=A06.642375] x1 : 0000000000000000=
 x0 : ffff000813c74008 <br>[ =C2=A0 =C2=A06.642377] Kernel panic - not sync=
ing: Asynchronous SError Interrupt<br></div></div><br></div>
<br>
<br>
<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#17014): <a href=3D"https://lists.yoctoproject.org/g/met=
a-ti/message/17014" rel=3D"noreferrer" target=3D"_blank">https://lists.yoct=
oproject.org/g/meta-ti/message/17014</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/101366039/216=
7248" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/101366039/2167248</a><br>
Group Owner: <a href=3D"mailto:meta-ti%2Bowner@lists.yoctoproject.org" targ=
et=3D"_blank">meta-ti+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-ti/unsub" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/meta-ti/=
unsub</a> [<a href=3D"mailto:joel.winarske@gmail.com" target=3D"_blank">joe=
l.winarske@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000000cf7ef0606f97e83--

