Return-Path: <joel.winarske@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EABACD54B9
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 18:56:31 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.290.1695668188620507332
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 25 Sep 2023 11:56:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NuK/NdZO;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: joel.winarske@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-690bccb0d8aso5288950b3a.0
        for <meta-ti@lists.yoctoproject.org>; Mon, 25 Sep 2023 11:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695668188; x=1696272988; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E/rHGQsgA3jleIwcIBt5pIjdcOMuSoGsPaFWNQjKS4M=;
        b=NuK/NdZO0AGaTdo26dlpVXL87/xGv7ix4qcOK+CN4Osx9a75RMjlkgCcEDZ55syX6V
         QFzSOOcM8oqD09o027TtGYnyqHSdoHI47fDfS7uEemw1zJcb5v+tX+1WxjyRlNQBVw1E
         A0ailNHJ+PvBsQp8IlsukVDK42nzihGFIHvBaZwerfGk6ZHcNeKz6fhRYi7KPY8Vt0Na
         bVrMgx309RCXBaVCtZAkE2h567+g0xGER2+LvJ0KOXlViCmRoHzzzXJobtLxNlkjm2/u
         Pdh0HKo8FSVjSogLYUsJsgJO+KtlIPa/RLR5oGDhPGGbAq7z8Oj++v+7dz6lFi21wRR+
         vH9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695668188; x=1696272988;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E/rHGQsgA3jleIwcIBt5pIjdcOMuSoGsPaFWNQjKS4M=;
        b=tVEShreyYjms84OpHFyTJkJ5FuWow4Dm2OEBOCpLgYKTk6sZsnoTTiiVtwmOQcfreq
         HUGMiz8pmxknk1nyonR6ISDEYQxUDSXVZweTh+fwNd52NVKeVWPAag0OBeWWsb76NW2H
         Y4TCHw2/YF1F8G0jPm+pa0Rl2ltyH/4AKtkggdHRJGUveyENIqB65APe7Xl3y774MQBw
         +mPen8xYtS8/7OPoH/nvZqrLPWuFif8pP8mZ3wcs3MUU+h5ymHO159pM18WJpEUXiH8p
         BBjiJZ9y4xXqmSALcO/HazU/Ua/gz/Dx0d2VtIwsJhN/iK8Nhv4BszT5N1WCXKi5Ot+E
         hwpg==
X-Gm-Message-State: AOJu0YyudFh9vYpby3AXLfjRE0OQxn/5EX254xxEMrUB8VpGM08pTjar
	qRRVZI9BqmJmo8YrJ4BqmR1UdwJ61c+BtYHEkLU=
X-Google-Smtp-Source: AGHT+IFvCxPaZRz6+5/p4JxtGJuO4tJwvxqAAJpcFTi1yADmQHzzV5h1zQxrqSt+8k2jtHXeKf7Mchd54IdTVlXXsH0=
X-Received: by 2002:a05:6a20:9148:b0:15e:dc75:66af with SMTP id
 x8-20020a056a20914800b0015edc7566afmr3527650pzc.59.1695668187755; Mon, 25 Sep
 2023 11:56:27 -0700 (PDT)
MIME-Version: 1.0
References: <cJr9.1694721437908350278.lV3S@lists.yoctoproject.org>
 <4944740.qmqfjKhsMY@gryffindor> <1786B4BD16070DE7.17733@lists.yoctoproject.org>
 <1786C15758510F16.1961@lists.yoctoproject.org>
In-Reply-To: <1786C15758510F16.1961@lists.yoctoproject.org>
From: Joel Winarske <joel.winarske@gmail.com>
Date: Mon, 25 Sep 2023 11:56:16 -0700
Message-ID: <CABKMkPLQjnJtJXHq=46DvET6do2CZX2xdQYbjiD-xwg0Y49eYw@mail.gmail.com>
Subject: Re: [meta-ti] [kirkstone] beaglebone-ai64
To: joel.winarske@gmail.com
Cc: meta-ti@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000fcf85106063383fc"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 25 Sep 2023 18:56:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17014

--000000000000fcf85106063383fc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Update on issue.

I can boot a kirkstone core-image-base (headless) without any issue.

Randolph at TI has indicated the panic is related to an outdated gpu
definition in DT.  The gpu DT def defines two power domains, only one is
required.  I have not yet successfully confirmed this change.



On Wed, Sep 20, 2023 at 5:08=E2=80=AFPM Joel Winarske via lists.yoctoprojec=
t.org
<joel.winarske=3Dgmail.com@lists.yoctoproject.org> wrote:

> Today's limited progress:
>
> 1. U-Boot from eMMC is used by default.  Shipping devices have outdated
> U-Boot.
> 2. Rule out U-Boot, and use Yocto built U-Boot by pressing RST + BOOT,
> wait, release RST, then release BOOT.  Boot flow will use all boot bits
> from the SD card with this approach.
> 3. Update `linux-bb.org_git.bb` to use tip of tree:
> # 5.10.168 version for 32-bit
> SRCREV:armv7a =3D "0f40ca5e749e9176ad4ea30c68be4fb2340647db"
> PV:armv7a =3D "5.10.168+git${SRCPV}"
> BRANCH:armv7a =3D "5.10.168-ti-r71"
>
> # 5.10.168 version for 64-bit
> SRCREV:aarch64 =3D "ac2750dbf3a3b9078feff995e6754d5c5f609c19"
> PV:aarch64 =3D "5.10.168+git${SRCPV}"
> BRANCH:aarch64 =3D "v5.10.168-ti-arm64-r110"
>
>
>
> Updating kernel has no impact on kernel panic:
>
> [    6.621063] pvrsrvkm: loading out-of-tree module taints kernel.
> [    6.637510] PVR_K:  251: Device: 4e20000000.gpu
> [    6.642337] SError Interrupt on CPU0, code 0xbf000000 -- SError
> [    6.642339] CPU: 0 PID: 251 Comm: systemd-udevd Tainted: G           O
>      5.10.168+ #1
> [    6.642340] Hardware name: BeagleBoard.org BeagleBone AI-64 (DT)
> [    6.642341] pstate: 60000005 (nZCv daif -PAN -UAO -TCO BTYPE=3D--)
> [    6.642343] pc : _RGXReadBVNCFromReg.isra.0+0x20/0x140 [pvrsrvkm]
> [    6.642343] lr : RGXBvncInitialiseConfiguration+0x274/0x9c0 [pvrsrvkm]
> [    6.642344] sp : ffff8000143db740
> [    6.642345] x29: ffff8000143db740 x28: ffff8000091e4548
> [    6.642349] x27: 0000000000000000 x26: ffff8000143db7a8
> [    6.642351] x25: ffff0008132da000 x24: ffff000813c741a0
> [    6.642353] x23: 0000000000000000 x22: ffff8000091ed000
> [    6.642355] x21: ffff000813c74008 x20: ffff8000091947c0
> [    6.642357] x19: 0000000000000000 x18: ffff800009142e74
> [    6.642359] x17: 000000ffc0000000 x16: ffff8000091431e0
> [    6.642361] x15: ffff800009142e60 x14: ffff800009140dd0
> [    6.642363] x13: ffff80000914c124 x12: 0000000000000000
> [    6.642365] x11: ffff000813c74008 x10: 0000000000000020
> [    6.642367] x9 : 0000000000000000 x8 : 0000000000000024
> [    6.642369] x7 : 0000000000000000 x6 : ffff800012500000
> [    6.642371] x5 : ffff8000143db7b0 x4 : ffff8000143db7ac
> [    6.642373] x3 : ffff8000143db7a8 x2 : ffff8000143db7a4
> [    6.642375] x1 : 0000000000000000 x0 : ffff000813c74008
> [    6.642377] Kernel panic - not syncing: Asynchronous SError Interrupt
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16998):
> https://lists.yoctoproject.org/g/meta-ti/message/16998
> Mute This Topic: https://lists.yoctoproject.org/mt/101366039/2167248
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [
> joel.winarske@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000fcf85106063383fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Update on issue.</div><div><br>I can boot a kirkstone=
 core-image-base (headless) without any=20
issue.<br><br></div><div>Randolph at TI has indicated the panic is related =
to an outdated gpu definition in DT.=C2=A0 The gpu DT def defines two power=
 domains, only one is required.=C2=A0 I have not yet successfully confirmed=
 this change.<br><br></div><div><br></div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 20, 2023 at 5:08=E2=
=80=AFPM Joel Winarske via <a href=3D"http://lists.yoctoproject.org">lists.=
yoctoproject.org</a> &lt;joel.winarske=3D<a href=3D"mailto:gmail.com@lists.=
yoctoproject.org">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=
=3D"ltr"><div><div><div>Today&#39;s limited progress:<br><br></div>1. U-Boo=
t from eMMC is used by default.=C2=A0 Shipping devices have outdated U-Boot=
.<br></div><div>2. Rule out U-Boot, and use Yocto built U-Boot by pressing =
RST + BOOT, wait, release RST, then release BOOT.=C2=A0 Boot flow will use =
all boot bits from the SD card with this approach.</div></div>3. Update `<a=
 href=3D"http://linux-bb.org_git.bb" target=3D"_blank">linux-bb.org_git.bb<=
/a>` to use tip of tree:<br><div></div><div><div style=3D"color:rgb(204,204=
,204);background-color:rgb(31,31,31);font-family:&quot;Droid Sans Mono&quot=
;,&quot;monospace&quot;,monospace;font-weight:normal;font-size:14px;line-he=
ight:19px;white-space:pre-wrap"><div><span style=3D"color:rgb(106,153,85)">=
# 5.10.168 version for 32-bit</span></div><div><span style=3D"color:rgb(156=
,220,254)">SRCREV:armv7a</span><span style=3D"color:rgb(204,204,204)"> </sp=
an><span style=3D"color:rgb(212,212,212)">=3D</span><span style=3D"color:rg=
b(204,204,204)"> </span><span style=3D"color:rgb(206,145,120)">&quot;0f40ca=
5e749e9176ad4ea30c68be4fb2340647db&quot;</span></div><div><span style=3D"co=
lor:rgb(156,220,254)">PV:armv7a</span><span style=3D"color:rgb(204,204,204)=
"> </span><span style=3D"color:rgb(212,212,212)">=3D</span><span style=3D"c=
olor:rgb(204,204,204)"> </span><span style=3D"color:rgb(206,145,120)">&quot=
;5.10.168+git</span><span style=3D"color:rgb(86,156,214)">${SRCPV}</span><s=
pan style=3D"color:rgb(206,145,120)">&quot;</span></div><div><span style=3D=
"color:rgb(156,220,254)">BRANCH:armv7a</span><span style=3D"color:rgb(204,2=
04,204)"> </span><span style=3D"color:rgb(212,212,212)">=3D</span><span sty=
le=3D"color:rgb(204,204,204)"> </span><span style=3D"color:rgb(206,145,120)=
">&quot;5.10.168-ti-r71&quot;</span></div><br><div><span style=3D"color:rgb=
(106,153,85)"># 5.10.168 version for 64-bit</span></div><div><span style=3D=
"color:rgb(156,220,254)">SRCREV:aarch64</span><span style=3D"color:rgb(204,=
204,204)"> </span><span style=3D"color:rgb(212,212,212)">=3D</span><span st=
yle=3D"color:rgb(204,204,204)"> </span><span style=3D"color:rgb(206,145,120=
)">&quot;ac2750dbf3a3b9078feff995e6754d5c5f609c19&quot;</span></div><div><s=
pan style=3D"color:rgb(156,220,254)">PV:aarch64</span><span style=3D"color:=
rgb(204,204,204)"> </span><span style=3D"color:rgb(212,212,212)">=3D</span>=
<span style=3D"color:rgb(204,204,204)"> </span><span style=3D"color:rgb(206=
,145,120)">&quot;5.10.168+git</span><span style=3D"color:rgb(86,156,214)">$=
{SRCPV}</span><span style=3D"color:rgb(206,145,120)">&quot;</span></div><di=
v><span style=3D"color:rgb(156,220,254)">BRANCH:aarch64</span><span style=
=3D"color:rgb(204,204,204)"> </span><span style=3D"color:rgb(212,212,212)">=
=3D</span><span style=3D"color:rgb(204,204,204)"> </span><span style=3D"col=
or:rgb(206,145,120)">&quot;v5.10.168-ti-arm64-r110&quot;</span></div><br><b=
r></div></div><div><br></div><div>Updating kernel has no impact on kernel p=
anic:<br><br>[ =C2=A0 =C2=A06.621063] pvrsrvkm: loading out-of-tree module =
taints kernel.<br>[ =C2=A0 =C2=A06.637510] PVR_K: =C2=A0251: Device: 4e2000=
0000.gpu<br>[ =C2=A0 =C2=A06.642337] SError Interrupt on CPU0, code 0xbf000=
000 -- SError<br>[ =C2=A0 =C2=A06.642339] CPU: 0 PID: 251 Comm: systemd-ude=
vd Tainted: G =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O =C2=A0 =C2=A0 =C2=A05.10=
.168+ #1<br>[ =C2=A0 =C2=A06.642340] Hardware name: BeagleBoard.org BeagleB=
one AI-64 (DT)<br>[ =C2=A0 =C2=A06.642341] pstate: 60000005 (nZCv daif -PAN=
 -UAO -TCO BTYPE=3D--)<br>[ =C2=A0 =C2=A06.642343] pc : _RGXReadBVNCFromReg=
.isra.0+0x20/0x140 [pvrsrvkm]<br>[ =C2=A0 =C2=A06.642343] lr : RGXBvncIniti=
aliseConfiguration+0x274/0x9c0 [pvrsrvkm]<br>[ =C2=A0 =C2=A06.642344] sp : =
ffff8000143db740<br>[ =C2=A0 =C2=A06.642345] x29: ffff8000143db740 x28: fff=
f8000091e4548 <br>[ =C2=A0 =C2=A06.642349] x27: 0000000000000000 x26: ffff8=
000143db7a8 <br>[ =C2=A0 =C2=A06.642351] x25: ffff0008132da000 x24: ffff000=
813c741a0 <br>[ =C2=A0 =C2=A06.642353] x23: 0000000000000000 x22: ffff80000=
91ed000 <br>[ =C2=A0 =C2=A06.642355] x21: ffff000813c74008 x20: ffff8000091=
947c0 <br>[ =C2=A0 =C2=A06.642357] x19: 0000000000000000 x18: ffff800009142=
e74 <br>[ =C2=A0 =C2=A06.642359] x17: 000000ffc0000000 x16: ffff8000091431e=
0 <br>[ =C2=A0 =C2=A06.642361] x15: ffff800009142e60 x14: ffff800009140dd0 =
<br>[ =C2=A0 =C2=A06.642363] x13: ffff80000914c124 x12: 0000000000000000 <b=
r>[ =C2=A0 =C2=A06.642365] x11: ffff000813c74008 x10: 0000000000000020 <br>=
[ =C2=A0 =C2=A06.642367] x9 : 0000000000000000 x8 : 0000000000000024 <br>[ =
=C2=A0 =C2=A06.642369] x7 : 0000000000000000 x6 : ffff800012500000 <br>[ =
=C2=A0 =C2=A06.642371] x5 : ffff8000143db7b0 x4 : ffff8000143db7ac <br>[ =
=C2=A0 =C2=A06.642373] x3 : ffff8000143db7a8 x2 : ffff8000143db7a4 <br>[ =
=C2=A0 =C2=A06.642375] x1 : 0000000000000000 x0 : ffff000813c74008 <br>[ =
=C2=A0 =C2=A06.642377] Kernel panic - not syncing: Asynchronous SError Inte=
rrupt<br></div></div><br></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#16998): <a href=3D"https://lists.yoctoproject.org/g/met=
a-ti/message/16998" rel=3D"noreferrer" target=3D"_blank">https://lists.yoct=
oproject.org/g/meta-ti/message/16998</a><br>
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

--000000000000fcf85106063383fc--

