Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D8725E002F9
	for <meta-ti@yoctoproject.org>; Fri, 16 Aug 2013 15:00:09 -0700 (PDT)
Received: by mail-ie0-f182.google.com with SMTP id tp5so4327830ieb.41
	for <meta-ti@yoctoproject.org>; Fri, 16 Aug 2013 15:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=fSKHMx5TR7+NcRbYIZkuGMlateH9TbSXlpGIctWiD9I=;
	b=aTrtlE6VgZRBBdFiJIVtifiak/ZxAmLLeR61C0bkXFnt25362g7tZAOoT3hrFmCJVL
	9/suyp7jXpNi1dqkfSmS/6LrxpkDMF5ZCP2F3xK98foJyn4qnm90vpR6oZ59l689mPqF
	GvG8YFYtEUvv4poQl78N2l6uF7d9wkIZVQKvkB45F3wF41SzunnsGfSKxaBU2tdfoyuM
	GC/VU3ol30BY/asrD1Ieyn44q81KhXWK/mrlEFUvU0zwVucXeeg15crNDLBP+WKdi95i
	6aLZ8lvM6qtK66W41zGNP3OuAu9BGSJ6FeDNZNl/NhsTafb0QiUu26Zb8AvQRaQzF+dh
	dS8A==
X-Received: by 10.50.77.80 with SMTP id q16mr734386igw.3.1376690409622; Fri,
	16 Aug 2013 15:00:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.216.195 with HTTP; Fri, 16 Aug 2013 14:59:38 -0700 (PDT)
In-Reply-To: <CAFZh4h8ncW+-UskiqTAOSXFyDvN5Rc+bnj=ykGfXRZYPRbbgrA@mail.gmail.com>
References: <CAFZh4h_683cetV7QjyVgBcsJ9Seooy5wiE8R-fU9L+sqJanU4g@mail.gmail.com>
	<CAFZh4h8gDV9r6PzrANuj4ZWJCnpibh5DtK4OmoYqwO_vAdY-_g@mail.gmail.com>
	<CAFZh4h8ncW+-UskiqTAOSXFyDvN5Rc+bnj=ykGfXRZYPRbbgrA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 16 Aug 2013 14:59:38 -0700
Message-ID: <CAMKF1sqb8smKgKM8wCyb5cbcdcbqphBBi0dhsZHo9j_-MMeUqg@mail.gmail.com>
To: Brian Hutchinson <b.hutchman@gmail.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Stumped. Can't get 2.6.37 TI kernel to boot when built with toolchain from denzil or Linaro gcc-linaro-arm-linux-gnueabihf-4.8-2013.07-1_linux/
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
X-List-Received-Date: Fri, 16 Aug 2013 22:00:15 -0000
Content-Type: multipart/alternative; boundary=047d7bdc1238d4d49204e417b60b

--047d7bdc1238d4d49204e417b60b
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2013 at 2:46 PM, Brian Hutchinson <b.hutchman@gmail.com>wro=
te:

> ... and I get a similar udev message that started me down this road in th=
e
> first place but at least this time it is a little more helpful.  Looks li=
ke
> I need to run down inotify support now:
>
> Starting udev
> <30>udevd[81]: starting version 182
> udevd[81]: inotify_init failed: Function not implemented
>
> udevd[81]: error initializing inotify
>
>
=E2=80=8Buse linux-libc-headers from 2.6.37 as well and not the 3.8 or what=
ever is
default on OE-Core branch that you are using.=E2=80=8B




> Regards,
>
> Brian
>
>
>
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>
>

--047d7bdc1238d4d49204e417b60b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:courier =
new,monospace;font-size:small"><br></div><div class=3D"gmail_extra"><br><br=
><div class=3D"gmail_quote">On Fri, Aug 16, 2013 at 2:46 PM, Brian Hutchins=
on <span dir=3D"ltr">&lt;<a href=3D"mailto:b.hutchman@gmail.com" target=3D"=
_blank">b.hutchman@gmail.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr">... and I get a similar ude=
v message that started me down this road in the first place but at least th=
is time it is a little more helpful. =C2=A0Looks like I need to run down in=
otify support now:<div>

<div><br></div>
<div>Starting udev</div><div>&lt;30&gt;udevd[81]: starting version 182</div=
><div>udevd[81]: inotify_init failed: Function not implemented</div><div><b=
r></div><div>udevd[81]: error initializing inotify</div></div><div><br>

</div></div></blockquote><div><br></div><div><div style=3D"font-family:&#39=
;courier new&#39;,monospace;font-size:small" class=3D"gmail_default">=E2=80=
=8Buse linux-libc-headers from 2.6.37 as well and not the 3.8 or whatever i=
s default on OE-Core branch that you are using.=E2=80=8B</div>

<br></div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><d=
iv dir=3D"ltr"><div>
</div><div>Regards,</div><div><br></div><div>Brian</div><div><br></div><div=
 class=3D"gmail_extra"><br></div></div>
<br>_______________________________________________<br>
meta-ti mailing list<br>
<a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</a><br=
>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" target=3D"_blan=
k">https://lists.yoctoproject.org/listinfo/meta-ti</a><br>
<br></blockquote></div><br></div></div>

--047d7bdc1238d4d49204e417b60b--
