Return-Path: <joel.winarske@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 819CFE92FC9
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 22:04:05 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.28712.1696543444314276702
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Oct 2023 15:04:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ntKW9w9u;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: joel.winarske@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-578b407045bso1147908a12.0
        for <meta-ti@lists.yoctoproject.org>; Thu, 05 Oct 2023 15:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696543443; x=1697148243; darn=lists.yoctoproject.org;
        h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8vErxeJDZ3rNVUBaAA85JP3BBAq1sKzi1TeZm8Dvuuw=;
        b=ntKW9w9uoC1g9NA5tXP0enZUdE1ExgEWmhR1nyl/GX64IwYeXdhhmiHMVC3WdmD6lA
         QpU/+mXvMXtNhTzJsrJ5QbcBBqM1y9sS5PPGDaXKcWusrb1GquWWVuoaONYptpBSJdp8
         NAtQJ6Biab2xNEav8hIk6BP2v+YTNUd1LKnrjjhiaUUaHphrGdV5LuXrG8CX8hv/Nulf
         ziKvs6qJyaLVKpU4qYZ5vwCHg6SqPVfe1Gz3Uo1Co4K/3RUnZ8aPEVyGs2pgLXFXrE+X
         JdaYrVaHCqd53tOfzuHKpHeUTJ+mQJ8SSA4T1cgHIaRyH51FR3JsHW4wuro5ACpWkCmF
         X3mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696543443; x=1697148243;
        h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8vErxeJDZ3rNVUBaAA85JP3BBAq1sKzi1TeZm8Dvuuw=;
        b=mQnZCdfbobcNgpFNMCJXNsh/CzP9G+Hdx3NRwLVvo4bGHRVbW8NzTdw7z3U5QCpieh
         19Re89S/eW+r3jYkgQQug9zMKniGBL3Ms9ohI75WLWQMxj3gMRUrQ/TGjFRiopKBwwT+
         Rea4raExCSyZajiWkubZD6+BqvCYllJYTcOFG6MUj25E5Ww+Y6CzQvs8S+SfjmO4oBkR
         87fP90YJ6i9DjQHqw4oJaXQiWjt7qFMgugNp68JlUFu6t1UWYxNgyt+/F/043JHQeCGh
         4APzRRFOIGb6ZLf7Q4F58XZWBZJkshypKDvQ0b22UuDqPqZBBpMrGMlcY/gUXc4qN+gY
         0qgA==
X-Gm-Message-State: AOJu0YwegLLrwMU/ydnlriQd3ByhzSoQJL+OZW4Zo5mvup+LqM4zx2Y6
	VEpXvrfWz1xY0hlMgT17biVFInl8PPvKinVtGCNDqcwNrD4=
X-Google-Smtp-Source: AGHT+IFqsqG2EC+iW3cQS9Mvk18Tbarvs7KWsth+oBdqZu+XOQcbnTklzuXgRiDgLUXFTyMUWjJTgvB/k4UrMyfCPrk=
X-Received: by 2002:a17:90b:1489:b0:279:2e9a:c425 with SMTP id
 js9-20020a17090b148900b002792e9ac425mr6368715pjb.1.1696543443043; Thu, 05 Oct
 2023 15:04:03 -0700 (PDT)
MIME-Version: 1.0
References: <cJr9.1694721437908350278.lV3S@lists.yoctoproject.org>
 <4944740.qmqfjKhsMY@gryffindor> <1786B4BD16070DE7.17733@lists.yoctoproject.org>
 <1786C15758510F16.1961@lists.yoctoproject.org> <1788393BCE69D553.9831@lists.yoctoproject.org>
 <178B3E94B0590274.3256@lists.yoctoproject.org> <178B4873D9202B54.3256@lists.yoctoproject.org>
In-Reply-To: <178B4873D9202B54.3256@lists.yoctoproject.org>
From: Joel Winarske <joel.winarske@gmail.com>
Date: Thu, 5 Oct 2023 15:03:51 -0700
Message-ID: <CABKMkPJUYWgTeyHPtMtSxmKBsVCjL3E2kYWC5TVwhRvxuGrmpg@mail.gmail.com>
Subject: Re: [meta-ti] [kirkstone] beaglebone-ai64
Cc: meta-ti@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000044ce670606ff4d3a"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 05 Oct 2023 22:04:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17065

--00000000000044ce670606ff4d3a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I just discovered a workaround to my original pvrsrvkm kernel panic.

1. bitbake core-image-weston
2. image SD card with core-image-weston-beaglebone-ai64.wic.xz
3. mount SD card in host and decompress the pvrsrvkm kernel driver:
    cd /lib/modules/5.10.168+/extra
    sudo xz --decompress pvrsrvkm.ko.xz
4. reboot device with updated SD card

(This is with kernel updated to 5.10.168-r111)

On Thu, Oct 5, 2023 at 11:09=E2=80=AFAM Joel Winarske via lists.yoctoprojec=
t.org
<joel.winarske=3Dgmail.com@lists.yoctoproject.org> wrote:

> Nevermind on BeagleBoard-DeviceTree.  I just compared the kernel and Beag=
leBoard-DeviceTree;
> they are at parity.  BeagleBoard-DeviceTree is not needed.  The thing
> that was throwing me off what the older kernel/dt.
>
> I'll submit a patch for rolling the kernel forward.
>
> On Thu, Oct 5, 2023 at 8:08=E2=80=AFAM Joel Winarske via lists.yoctoproje=
ct.org
> <joel.winarske=3Dgmail.com@lists.yoctoproject.org> wrote:
>
>> I'm narrowing in on the issue.
>>
>> I have a BeagleBoard.org OS image release where I can see PowerVR
>> running, and PCIe (WiFi/BT) works:
>> * bbai64-emmc-flasher-debian-11.7-xfce-edgeai-arm64-2023-09-02-10gb.img
>> Rescue option 1 (default image panics when booting with PCIe populated):
>> [    0.000000] Linux version 5.10.168-ti-arm64-r111 (voodoo@AM69-SK-32g-=
01)
>> (gcc (Debian 10.2.1-6) 10.2.1u3
>>
>> These images use a device tree from a different repo than the ti-kernel
>> repo:
>>     kernel: https://github.com/beagleboard/linux.git
>>     dt:
>> https://git.beagleboard.org/beagleboard/BeagleBoard-DeviceTrees
>>
>> Dumping the DT from Yocto linux-bb and BeagleBoard.org the output is not
>> the same.
>>
>> Proposed minimum changes:
>> * add option for BeagleBoard-DeviceTree
>> * update kernel versions in linux-bb
>> * update PowerVR version to match kernel/DT
>>
>> Thoughts?
>>
>> On Mon, Sep 25, 2023 at 11:56=E2=80=AFAM Joel Winarske via lists.yoctopr=
oject.org
>> <joel.winarske=3Dgmail.com@lists.yoctoproject.org> wrote:
>>
>>> Update on issue.
>>>
>>> I can boot a kirkstone core-image-base (headless) without any issue.
>>>
>>> Randolph at TI has indicated the panic is related to an outdated gpu
>>> definition in DT.  The gpu DT def defines two power domains, only one i=
s
>>> required.  I have not yet successfully confirmed this change.
>>>
>>>
>>>
>>> On Wed, Sep 20, 2023 at 5:08=E2=80=AFPM Joel Winarske via lists.yoctopr=
oject.org
>>> <joel.winarske=3Dgmail.com@lists.yoctoproject.org> wrote:
>>>
>>>> Today's limited progress:
>>>>
>>>> 1. U-Boot from eMMC is used by default.  Shipping devices have outdate=
d
>>>> U-Boot.
>>>> 2. Rule out U-Boot, and use Yocto built U-Boot by pressing RST + BOOT,
>>>> wait, release RST, then release BOOT.  Boot flow will use all boot bit=
s
>>>> from the SD card with this approach.
>>>> 3. Update `linux-bb.org_git.bb` to use tip of tree:
>>>> # 5.10.168 version for 32-bit
>>>> SRCREV:armv7a =3D "0f40ca5e749e9176ad4ea30c68be4fb2340647db"
>>>> PV:armv7a =3D "5.10.168+git${SRCPV}"
>>>> BRANCH:armv7a =3D "5.10.168-ti-r71"
>>>>
>>>> # 5.10.168 version for 64-bit
>>>> SRCREV:aarch64 =3D "ac2750dbf3a3b9078feff995e6754d5c5f609c19"
>>>> PV:aarch64 =3D "5.10.168+git${SRCPV}"
>>>> BRANCH:aarch64 =3D "v5.10.168-ti-arm64-r110"
>>>>
>>>>
>>>>
>>>> Updating kernel has no impact on kernel panic:
>>>>
>>>> [    6.621063] pvrsrvkm: loading out-of-tree module taints kernel.
>>>> [    6.637510] PVR_K:  251: Device: 4e20000000.gpu
>>>> [    6.642337] SError Interrupt on CPU0, code 0xbf000000 -- SError
>>>> [    6.642339] CPU: 0 PID: 251 Comm: systemd-udevd Tainted: G
>>>> O      5.10.168+ #1
>>>> [    6.642340] Hardware name: BeagleBoard.org BeagleBone AI-64 (DT)
>>>> [    6.642341] pstate: 60000005 (nZCv daif -PAN -UAO -TCO BTYPE=3D--)
>>>> [    6.642343] pc : _RGXReadBVNCFromReg.isra.0+0x20/0x140 [pvrsrvkm]
>>>> [    6.642343] lr : RGXBvncInitialiseConfiguration+0x274/0x9c0
>>>> [pvrsrvkm]
>>>> [    6.642344] sp : ffff8000143db740
>>>> [    6.642345] x29: ffff8000143db740 x28: ffff8000091e4548
>>>> [    6.642349] x27: 0000000000000000 x26: ffff8000143db7a8
>>>> [    6.642351] x25: ffff0008132da000 x24: ffff000813c741a0
>>>> [    6.642353] x23: 0000000000000000 x22: ffff8000091ed000
>>>> [    6.642355] x21: ffff000813c74008 x20: ffff8000091947c0
>>>> [    6.642357] x19: 0000000000000000 x18: ffff800009142e74
>>>> [    6.642359] x17: 000000ffc0000000 x16: ffff8000091431e0
>>>> [    6.642361] x15: ffff800009142e60 x14: ffff800009140dd0
>>>> [    6.642363] x13: ffff80000914c124 x12: 0000000000000000
>>>> [    6.642365] x11: ffff000813c74008 x10: 0000000000000020
>>>> [    6.642367] x9 : 0000000000000000 x8 : 0000000000000024
>>>> [    6.642369] x7 : 0000000000000000 x6 : ffff800012500000
>>>> [    6.642371] x5 : ffff8000143db7b0 x4 : ffff8000143db7ac
>>>> [    6.642373] x3 : ffff8000143db7a8 x2 : ffff8000143db7a4
>>>> [    6.642375] x1 : 0000000000000000 x0 : ffff000813c74008
>>>> [    6.642377] Kernel panic - not syncing: Asynchronous SError Interru=
pt
>>>>
>>>>
>>>>
>>>>
>>>>
>>>
>>>
>>>
>>
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17062):
> https://lists.yoctoproject.org/g/meta-ti/message/17062
> Mute This Topic: https://lists.yoctoproject.org/mt/101366039/2167248
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [
> joel.winarske@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000044ce670606ff4d3a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>I just discovered a workaround to my origin=
al pvrsrvkm kernel panic.<br><br></div>1. bitbake core-image-weston</div><d=
iv>2. image SD card with core-image-weston-beaglebone-ai64.wic.xz<br></div>=
<div>3. mount SD card in host and decompress the pvrsrvkm kernel driver:<br=
>=C2=A0=C2=A0=C2=A0 cd /lib/modules/5.10.168+/extra<br>=C2=A0=C2=A0=C2=A0 s=
udo xz --decompress pvrsrvkm.ko.xz<br></div><div>4. reboot device with upda=
ted SD card</div><br>(This is with kernel updated to 5.10.168-r111)<br></di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Thu, Oct 5, 2023 at 11:09=E2=80=AFAM Joel Winarske via <a href=3D"http=
://lists.yoctoproject.org">lists.yoctoproject.org</a> &lt;joel.winarske=3D<=
a href=3D"mailto:gmail.com@lists.yoctoproject.org">gmail.com@lists.yoctopro=
ject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><div dir=3D"ltr"><div>Nevermind on <span>BeagleBoard-DeviceTree.=C2=
=A0 I just compared the kernel and </span><span>BeagleBoard-DeviceTree; the=
y are </span><span>at parity.=C2=A0 </span><span>BeagleBoard-DeviceTree is =
not needed.=C2=A0 The thing that was throwing me off what the older kernel/=
dt.<br><br></span></div><span>I&#39;ll submit a patch for rolling the kerne=
l forward.<br></span></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Oct 5, 2023 at 8:08=E2=80=AFAM Joel Winarske v=
ia <a href=3D"http://lists.yoctoproject.org" target=3D"_blank">lists.yoctop=
roject.org</a> &lt;joel.winarske=3D<a href=3D"mailto:gmail.com@lists.yoctop=
roject.org" target=3D"_blank">gmail.com@lists.yoctoproject.org</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"l=
tr"><div>I&#39;m narrowing in on the issue.<br><br>I have a BeagleBoard.org=
 OS image release where I can see PowerVR running, and PCIe (WiFi/BT) works=
:<div>* bbai64-emmc-flasher-debian-11.7-xfce-edgeai-arm64-2023-09-02-10gb.i=
mg<br>Rescue option 1 (default image panics when booting with PCIe populate=
d):<br>[ =C2=A0 =C2=A00.000000] Linux version 5.10.168-ti-arm64-r111 (voodo=
o@AM69-SK-32g-01) (gcc (Debian 10.2.1-6) 10.2.1u3<br></div><div></div><div>=
<br></div><div>These images use a device tree from a different repo than th=
e ti-kernel repo:</div><div></div><div>=C2=A0=C2=A0=C2=A0 kernel: <a href=
=3D"https://github.com/beagleboard/linux.git" target=3D"_blank">https://git=
hub.com/beagleboard/linux.git</a></div><div>=C2=A0=C2=A0=C2=A0 dt:=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a href=3D"https://git.beagleboard.org/be=
agleboard/BeagleBoard-DeviceTrees" target=3D"_blank">https://git.beagleboar=
d.org/beagleboard/BeagleBoard-DeviceTrees</a><br><br>Dumping the DT from Yo=
cto linux-bb and BeagleBoard.org the output is not the same.<br></div><div>=
<br>Proposed minimum changes:<br>* add option for BeagleBoard-DeviceTree<br=
>* update kernel versions in linux-bb<br></div><div>* update PowerVR versio=
n to match kernel/DT<br></div><div><br></div>Thoughts?<br></div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep=
 25, 2023 at 11:56=E2=80=AFAM Joel Winarske via <a href=3D"http://lists.yoc=
toproject.org" target=3D"_blank">lists.yoctoproject.org</a> &lt;joel.winars=
ke=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org" target=3D"_blank">=
gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Update on issue.</di=
v><div><br>I can boot a kirkstone core-image-base (headless) without any=20
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
<br>
<br>
</blockquote></div>
<br>
<br>
<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#17062): <a href=3D"https://lists.yoctoproject.org/g/met=
a-ti/message/17062" rel=3D"noreferrer" target=3D"_blank">https://lists.yoct=
oproject.org/g/meta-ti/message/17062</a><br>
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

--00000000000044ce670606ff4d3a--

