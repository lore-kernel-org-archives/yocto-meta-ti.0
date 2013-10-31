Return-Path: <skmaillist@gmail.com>
Received: from mail-oa0-f47.google.com (mail-oa0-f47.google.com
	[209.85.219.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 81885E017BB
	for <meta-ti@yoctoproject.org>; Thu, 31 Oct 2013 01:36:45 -0700 (PDT)
Received: by mail-oa0-f47.google.com with SMTP id i1so2758058oag.34
	for <meta-ti@yoctoproject.org>; Thu, 31 Oct 2013 01:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=2iQ28GqieXhT4NYRfjpQmtLHcghSjfknBmx3Nar9pjo=;
	b=GAzR5fffs/BVYzmNZnaJ7x4XgcY8GTOx+0Yl5Xte0u/jPVtNEqwJ4YZrG77j7bx30x
	Kc8LzEHjnAOfRsISkJZuM+NtiD5wQkxEZ2TF71/sUPmz9VmaPIbQby37tZBQcdq2WGR/
	WJk1y/qVkPF5zdeD47tIHJLSt0z9mktPjxaMKml7+SR1mvznvEIvgMxa92dNVZG1XImY
	YJr13Meh1UVu/vRIQsBXZBGckFJWYz3DXRnF061mgNnZLKhQPcyS2FKvKIcWwKHHdzcH
	JRj+sUs3B/JadAQfaAJhi16lHLbAqjS1J/v7FIwKyF3Iq86m4fNekgaiJvI/Y+fcYs4E
	Q/QA==
MIME-Version: 1.0
X-Received: by 10.60.45.65 with SMTP id k1mr1701948oem.48.1383208604460; Thu,
	31 Oct 2013 01:36:44 -0700 (PDT)
Received: by 10.76.114.52 with HTTP; Thu, 31 Oct 2013 01:36:44 -0700 (PDT)
In-Reply-To: <52720EA6.8000108@ti.com>
References: <CAEhSjjtXtwx_Tbi6=_S38h1V5OAvPvShAWA6ehgdUN0htPcFjA@mail.gmail.com>
	<52720EA6.8000108@ti.com>
Date: Thu, 31 Oct 2013 16:36:44 +0800
Message-ID: <CAEhSjjuOZUt=eNH+As_1dGPi_AgPtUrS+GmR2=32Q24qA=TG+g@mail.gmail.com>
From: Kai <skmaillist@gmail.com>
To: Siddharth Heroor <heroor@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: Compile kernel with 4.8 toolchain
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 31 Oct 2013 08:36:45 -0000
Content-Type: multipart/alternative; boundary=089e0141a79c84ed9f04ea0559e6

--089e0141a79c84ed9f04ea0559e6
Content-Type: text/plain; charset=ISO-8859-1

4.8 toolchain is part of customer's requirement.

It seems the kernel with 4.8 toolchain fails at very early stage, have you
met anything like this when you get 4.7 Linaro toolchain work with 3.8.x
kernel? maybe some configurations or build parameters are needed.


On Thu, Oct 31, 2013 at 4:02 PM, Siddharth Heroor <heroor@ti.com> wrote:

>  On 10/31/2013 12:32 PM, Kai wrote:
>
> Hi,
>
>  I am trying to compile linux-ti-glsdk kenel with Linaro 4.8 cross
> compile toolchain, but it cannot boot on OMAP5432 EVM board, no any log
> from serial port, 4.7 version toolchain is OK. Who has been succeeded with
> building glsdk kernel with 4.8 Linaro toolchain?
>
>
> Sorry, we (inside the GLSDK team) haven't tried 4.8 but we have been
> testing with the Linaro 4.7 toolchain only. Any reason for choosing 4.8?
>
>
>  Thanks,
> Kai
>
>
> _______________________________________________
> meta-ti mailing listmeta-ti@yoctoproject.orghttps://lists.yoctoproject.org/listinfo/meta-ti
>
>
>
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>
>

--089e0141a79c84ed9f04ea0559e6
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">4.8 toolchain is part of customer&#39;s requirement.<div><=
br></div><div>It seems the kernel with 4.8 toolchain fails at very early st=
age, have you met anything like this when you get 4.7 Linaro toolchain work=
 with 3.8.x kernel? maybe some configurations or build parameters are neede=
d.</div>
</div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Thu,=
 Oct 31, 2013 at 4:02 PM, Siddharth Heroor <span dir=3D"ltr">&lt;<a href=3D=
"mailto:heroor@ti.com" target=3D"_blank">heroor@ti.com</a>&gt;</span> wrote=
:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">

 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF" text=3D"#000000"><div class=3D"im">
    <div>On 10/31/2013 12:32 PM, Kai wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">Hi,
        <div><br>
        </div>
        <div>I am trying to compile linux-ti-glsdk kenel with Linaro 4.8
          cross compile toolchain, but it cannot boot on OMAP5432 EVM
          board, no any log from serial port, 4.7 version toolchain is
          OK. Who has been succeeded with building glsdk kernel with 4.8
          Linaro toolchain?</div>
      </div>
    </blockquote>
    <br></div>
    Sorry, we (inside the GLSDK team) haven&#39;t tried 4.8 but we have bee=
n
    testing with the Linaro 4.7 toolchain only. Any reason for choosing
    4.8? <br>
    <br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div><br>
        </div>
        <div>Thanks,</div>
        <div>Kai</div>
      </div>
      <br>
      <fieldset></fieldset>
      <br>
      <pre>_______________________________________________
meta-ti mailing list
<a href=3D"mailto:meta-ti@yoctoproject.org" target=3D"_blank">meta-ti@yocto=
project.org</a>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" target=3D"_blan=
k">https://lists.yoctoproject.org/listinfo/meta-ti</a>
</pre>
    </blockquote>
    <br>
  </div>

<br>_______________________________________________<br>
meta-ti mailing list<br>
<a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</a><br=
>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" target=3D"_blan=
k">https://lists.yoctoproject.org/listinfo/meta-ti</a><br>
<br></blockquote></div><br></div>

--089e0141a79c84ed9f04ea0559e6--
