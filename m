Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B3E7C4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 13:25:48 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.20948.1713187545090250501
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 15 Apr 2024 06:25:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=o8Jaqyn8;
 spf=pass (domain: criticallink.com, ip: 209.85.208.175, mailfrom: jcormier@criticallink.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d718ee7344so31532061fa.2
        for <meta-ti@lists.yoctoproject.org>; Mon, 15 Apr 2024 06:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1713187543; x=1713792343; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X+c612oJI/3nCO/lo6V+uGhd6jucwKGKAAV7taRNziI=;
        b=o8Jaqyn8Tpp3G5Z/ACnOKaZS7mywHVOG/K/HXzJ9bf2jhfZxGXZ7cT6Ghb5gisoAjA
         Nk5KxryCbCudWi3nyVfucfyLF2g798R8DZb0Qo2AQSpcX4xmdePLKLLxZnx7kxh4dOof
         s4fAOMEwtUFLjS8eBXMKuu1MJSnpmdZKC/sYeTJo4Ewi+0TRdm93mpXomMltQC8+sfPB
         qNExtVY5jl78kONkhpVHWpD1TVkNNhboIWsDGi9vzdhlmJnILzfk8XXy3nS4SWyXrxjw
         +5uHxOWX+j8drybbG+8bAKwuezZZHzirY3ZaZTOKJtQfyzoQaT0tTRid0hG6zQPCvBss
         TPbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713187543; x=1713792343;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X+c612oJI/3nCO/lo6V+uGhd6jucwKGKAAV7taRNziI=;
        b=Cci7tuSncsozOS5BP2duSNGg00hzMmSCv9tz/gEme4zBWC4II+U62UkPDRzl/xSoYd
         84VB3n2SdDJ2wqNG4uXiEUT7kpztU4z6D1ZBYykMGF2RBNZRurjQ6mxYEMnSl0fTx4X2
         WXEfdg3SgPbJBbLlmOW+kxvi44A7HnLDA8HFppZoO9UYGw4bWZh0kbUA03kus9hQbDGo
         dxIKyM1pFaSrM5MdYBLL35rnd40Ky/HiaKi7JUDsBsERlEHfa7gOqn3wEG6z2pMlbXTy
         C+Vg/yUwbEFsnbXvOaaMEylCC9Lpo6nWseJ/O08redW1bDP+Q8t9mjw73DVK0VOLL0tY
         1AVg==
X-Gm-Message-State: AOJu0Yx+dYa4KinOvN2DwUaY+rpaPn/aWS0rjGxuX/RzRC9vrSlrfoMp
	3zLusYSMUtkmKu5+0/twAYVi1ldPtrE0FdEGAFJ++IhcgDtGtEDTzlHGpQ6rzGi2/UND1aJ5SlI
	ZPlI3rcyrsT9T1vJQxc7Zx/E4OdtDBzeoqWMr
X-Google-Smtp-Source: AGHT+IEvdyexsuIP/Lp0ntL3MU71WC0DIoV7ZluFipNu0nUjhRuwhHsXBGIxRWblNjOpHzeFBCZUa0DeuhBeZZUNQ9Y=
X-Received: by 2002:a2e:8ecc:0:b0:2da:6f70:38b6 with SMTP id
 e12-20020a2e8ecc000000b002da6f7038b6mr2525292ljl.35.1713187543118; Mon, 15
 Apr 2024 06:25:43 -0700 (PDT)
MIME-Version: 1.0
References: <21132769-cb58-44ef-b0d2-2f0ee360dbaa@ti.com> <22488.1713154044174996671@lists.yoctoproject.org>
In-Reply-To: <22488.1713154044174996671@lists.yoctoproject.org>
From: Jon Cormier <jcormier@criticallink.com>
Date: Mon, 15 Apr 2024 09:25:31 -0400
Message-ID: <CADL8D3abQpthViKvaxr24fcncyptG2JszOXyruiD5nwef9rBPQ@mail.gmail.com>
Subject: Re: [meta-ti] yocto linux development for AM3359 ICE development board
To: sasikumar.e@fdss.co.in
Cc: meta-ti@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000f10f820616228ed9"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 15 Apr 2024 13:25:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17568

--000000000000f10f820616228ed9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

335x yocto build instructions:
https://software-dl.ti.com/processor-sdk-linux/esd/AM335X/08_02_00_24/expor=
ts/docs/linux/Overview_Building_the_SDK.html

57x yocto build instructions:
https://software-dl.ti.com/processor-sdk-linux/esd/AM57X/08_02_01_00/export=
s/docs/linux/Overview_Building_the_SDK.html

On Mon, Apr 15, 2024 at 12:07=E2=80=AFAM SasiKumar E via lists.yoctoproject=
.org
<sasikumar.e=3Dfdss.co.in@lists.yoctoproject.org> wrote:

> Hi Praneeth,
> we are starting the design with AM3359 development board but for the fina=
l
> custom board we are intended to design with AM5729 microprocessor, thus T=
I
> provides different SDK for both processors we thought working in yocto wi=
ll
> provide a greater advantage since it does not provide a specific setup fo=
r
> each processor.
> I have done the quick build for QEMU but then switching to machine
> specific the example provided is for altera board and I am going through
> the docs provided by yocto"https://docs.yoctoproject.org/", this is a
> lengthy procedure. if I had any documents relating to implementing the
> yocto in AM3359 boards it would be good.
>
> Thank you
> Sasikumar E
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17567):
> https://lists.yoctoproject.org/g/meta-ti/message/17567
> Mute This Topic: https://lists.yoctoproject.org/mt/105482536/7902621
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [
> jcormier@criticallink.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Jonathan Cormier
Software Engineer

Voice:  315.425.4045 x222



http://www.CriticalLink.com <http://www.criticallink.com/>
6712 Brooklawn Parkway, Syracuse, NY 13211

<https://www.linkedin.com/company/critical-link-llc>
<https://twitter.com/Critical_Link>

--000000000000f10f820616228ed9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>335x yocto build instructions: <a href=3D"https://sof=
tware-dl.ti.com/processor-sdk-linux/esd/AM335X/08_02_00_24/exports/docs/lin=
ux/Overview_Building_the_SDK.html">https://software-dl.ti.com/processor-sdk=
-linux/esd/AM335X/08_02_00_24/exports/docs/linux/Overview_Building_the_SDK.=
html</a></div><div><br></div><div>57x yocto build instructions: <a href=3D"=
https://software-dl.ti.com/processor-sdk-linux/esd/AM57X/08_02_01_00/export=
s/docs/linux/Overview_Building_the_SDK.html">https://software-dl.ti.com/pro=
cessor-sdk-linux/esd/AM57X/08_02_01_00/exports/docs/linux/Overview_Building=
_the_SDK.html</a></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Mon, Apr 15, 2024 at 12:07=E2=80=AFAM SasiKumar E=
 via <a href=3D"http://lists.yoctoproject.org">lists.yoctoproject.org</a> &=
lt;sasikumar.e=3D<a href=3D"mailto:fdss.co.in@lists.yoctoproject.org">fdss.=
co.in@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">Hi Praneeth,<br>
we are starting the design with AM3359 development board but for the final =
custom board we are intended to design with AM5729 microprocessor, thus TI =
provides different SDK for both processors we thought working in yocto will=
 provide a greater advantage since it does not provide a specific setup for=
 each processor.<br>
I have done the quick build for QEMU but then switching to machine specific=
 the example provided is for altera board and I am going through the docs p=
rovided by yocto&quot;<a href=3D"https://docs.yoctoproject.org/" rel=3D"nor=
eferrer" target=3D"_blank">https://docs.yoctoproject.org/</a>&quot;, this i=
s a lengthy procedure. if I had any documents relating to implementing the =
yocto in AM3359 boards it would be good.<br>
<br>
Thank you<br>
Sasikumar E <br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#17567): <a href=3D"https://lists.yoctoproject.org/g/met=
a-ti/message/17567" rel=3D"noreferrer" target=3D"_blank">https://lists.yoct=
oproject.org/g/meta-ti/message/17567</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/105482536/790=
2621" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/105482536/7902621</a><br>
Group Owner: <a href=3D"mailto:meta-ti%2Bowner@lists.yoctoproject.org" targ=
et=3D"_blank">meta-ti+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-ti/unsub" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/meta-ti/=
unsub</a> [<a href=3D"mailto:jcormier@criticallink.com" target=3D"_blank">j=
cormier@criticallink.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div>=
<div dir=3D"ltr"><div>Jonathan Cormier<br>Software Engineer<div><div><div><=
div><br></div><div><div><font color=3D"#000000">Voice:=C2=A0=C2=A0<a value=
=3D"+13154254045">315.425.4045</a>=C2=A0x222</font></div><div><font color=
=3D"#000000"><br></font></div><div><font color=3D"#000000"><img src=3D"http=
s://ci3.googleusercontent.com/mail-sig/AIorK4xk-E6kTWNd5AJHtEUAEcL6C7vYjIUe=
EExuTc6ecDmTEshpkG53r8T5L4geBRI1997uwEiKrqgnopA3"><br></font></div></div></=
div><div><div><font color=3D"#1155cc"><br></font></div><div><a href=3D"http=
://www.criticallink.com/" target=3D"_blank"><font color=3D"#1155cc">http://=
www.CriticalLink.com</font></a><br></div><div>6712 Brooklawn Parkway,=C2=A0=
Syracuse, NY 13211=C2=A0</div></div></div><div><div><br></div><div><font co=
lor=3D"#1155cc"><font color=3D"#1155cc"><a href=3D"https://www.linkedin.com=
/company/critical-link-llc" target=3D"_blank"><img src=3D"https://docs.goog=
le.com/uc?export=3Ddownload&amp;id=3D0B2vNSnu-aYu6OEhHRW9BUFV5WnM&amp;revid=
=3D0B2vNSnu-aYu6RHNZUnhNbFpER1l3emNQY2VoaHA0RDdudWlFPQ"></a>=C2=A0=C2=A0<a =
href=3D"https://twitter.com/Critical_Link" target=3D"_blank"><img alt=3D"" =
src=3D"https://docs.google.com/uc?export=3Ddownload&amp;id=3D0B2vNSnu-aYu6c=
U1yWERrLXE0SnM&amp;revid=3D0B2vNSnu-aYu6b1YrZW1SM0hueVhVS0pPWm1IOXFSc0I3ay9=
jPQ"></a></font></font></div></div></div></div></div></div></div></div></di=
v></div></div></div></div></div>

--000000000000f10f820616228ed9--

