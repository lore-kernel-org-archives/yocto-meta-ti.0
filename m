Return-Path: <b.hutchman@gmail.com>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D9380E00747
	for <meta-ti@yoctoproject.org>; Wed, 21 Aug 2013 09:51:54 -0700 (PDT)
Received: by mail-ob0-f174.google.com with SMTP id wd6so1269815obb.5
	for <meta-ti@yoctoproject.org>; Wed, 21 Aug 2013 09:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=iOVRqshYXtLmq69uAssEff5kExh16a1FEVGfJs0///E=;
	b=Hp72qqx7pc3KTetLzDgnP4kVsO7Ru1GjDnjW0xwoqVUOzDKd5JqEUFo8EZhFw1sV4R
	7sfkPkk+DydHs9Fk37PE+p2U85WsUB70+4rxuNSaUgn0lYm9u8fzeg+nkkb7qiN6LWUl
	ed+b6wP0+UQOt3gyj/wBgZL8ZXVKsjUl98boXS02x4y/I4bD7HB0mmrGPzsRFcGF1jw7
	mM8AYdfd865vdzbv3jRxzKVEjOPuzJz7768jQB2q1hCVELJda5hsdsLDNKqrMMjTtcUR
	Ets8XdesGLq9mFX9H1xPeQ9fbhfJJNP31nAbTAw+MrmS8FZS/b+Q2uWgMn/p8HDOfcz/
	vbgw==
MIME-Version: 1.0
X-Received: by 10.182.181.34 with SMTP id dt2mr9095004obc.30.1377103909725;
	Wed, 21 Aug 2013 09:51:49 -0700 (PDT)
Received: by 10.60.142.41 with HTTP; Wed, 21 Aug 2013 09:51:49 -0700 (PDT)
In-Reply-To: <3BD5B47E-982D-4E04-9FF8-276A83B3DFD9@gmail.com>
References: <CAFZh4h_683cetV7QjyVgBcsJ9Seooy5wiE8R-fU9L+sqJanU4g@mail.gmail.com>
	<CAFZh4h8gDV9r6PzrANuj4ZWJCnpibh5DtK4OmoYqwO_vAdY-_g@mail.gmail.com>
	<CAFZh4h8ncW+-UskiqTAOSXFyDvN5Rc+bnj=ykGfXRZYPRbbgrA@mail.gmail.com>
	<CAMKF1sqb8smKgKM8wCyb5cbcdcbqphBBi0dhsZHo9j_-MMeUqg@mail.gmail.com>
	<CAFZh4h-OBDoeWFWpMLng8Uw6HEidMoWJtQvwdP9SjPwaci9O0Q@mail.gmail.com>
	<3BD5B47E-982D-4E04-9FF8-276A83B3DFD9@gmail.com>
Date: Wed, 21 Aug 2013 12:51:49 -0400
Message-ID: <CAFZh4h9EuoLZTX5n+WZ8+1XtakUP+qSxPUVXJzz3bfS0CCXwWA@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Wed, 21 Aug 2013 16:51:55 -0000
Content-Type: multipart/alternative; boundary=089e0122aa245bb09e04e477fd12

--089e0122aa245bb09e04e477fd12
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Aug 21, 2013 at 12:11 AM, Khem Raj <raj.khem@gmail.com> wrote:

>
> Second question.  When I try to bitbake core-image-minimal after adding in
> my kernel (a tar.bz2), it builds but the do_package phase gets errors:
>
>
> arm-oe-linux-gnueabi-objcopy:/home/hutch/oe_core_beagleboard/oe-core/build/tmp-eglibc/work/c6a816x_evm-oe-linux-gnueabi/linux-ti81xx-psp/2.6.37-r0/package/usr/src/kernel/image/usr/src/kernel/scripts/mod/mk_elfconfig:
> File format not recognized
>
>
> what is that file ? can you run it through file cmd and find out what arch
> its targeted for ? if its a host tool then remove it from install location
>
>
I don't know.  I think I'm suffering from this:
https://lists.yoctoproject.org/pipermail/yocto/2012-July/010145.html

... but the commit id doesn't get me anywhere when I try to see what the
fix is.  Looks like when I tared up my kernel the make clean, make
distclean didn't smoke all the bin files in scripts or something and my
bitbake build machine is 64 bit while the machine I originally built the
kernel on is 64 bit but but running 32 bit Ubuntu.  I added the
INHIBIT_PACKAGE_STRIP
= "1" to my .conf and that got me a bit further but then QA gave me a list
of all the things it didn't like so now I'm finding where all of those show
up and deleting them so hopefully that will fix it.

Regards,

Brian

--089e0122aa245bb09e04e477fd12
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Wed, Aug 21, 2013 at 12:11 AM, Khem Raj <span dir=3D"lt=
r">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gma=
il.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gm=
ail_quote">

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div style=3D"word-wrap:break-word"><div><div><blockquote =
type=3D"cite">
<div class=3D"gmail_quote"><div><br></div>
<div>Second question. =A0When I try to bitbake core-image-minimal after add=
ing in my kernel (a tar.bz2), it builds but the do_package phase gets error=
s:</div><div></div></div></blockquote><br></div><div><blockquote type=3D"ci=
te">

<div class=3D"gmail_quote"><div>arm-oe-linux-gnueabi-objcopy:/home/hutch/oe=
_core_beagleboard/oe-core/build/tmp-eglibc/work/c6a816x_evm-oe-linux-gnueab=
i/linux-ti81xx-psp/2.6.37-r0/package/usr/src/kernel/image/usr/src/kernel/sc=
ripts/mod/mk_elfconfig: File format not recognized</div>

</div></blockquote><br></div></div><div>what is that file ? can you run it =
through file cmd and find out what arch its targeted for ? if its a host to=
ol then remove it from install location</div><br></div></blockquote></div>

<br></div><div class=3D"gmail_extra">I don&#39;t know. =A0I think I&#39;m s=
uffering from this:</div><div class=3D"gmail_extra"><a href=3D"https://list=
s.yoctoproject.org/pipermail/yocto/2012-July/010145.html">https://lists.yoc=
toproject.org/pipermail/yocto/2012-July/010145.html</a><br>
</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">... b=
ut the commit id doesn&#39;t get me anywhere when I try to see what the fix=
 is. =A0Looks like when I tared up my kernel the make clean, make distclean=
 didn&#39;t smoke all the bin files in scripts or something and my bitbake =
build machine is 64 bit while the machine I originally built the kernel on =
is 64 bit but but running 32 bit Ubuntu. =A0I added the=A0<span style=3D"co=
lor:rgb(51,51,51);font-family:Consolas,&#39;Liberation Mono&#39;,Courier,mo=
nospace;font-size:12px;line-height:18px;white-space:pre">INHIBIT_PACKAGE_ST=
RIP =3D &quot;1&quot;</span>=A0to my .conf and that got me a bit further bu=
t then QA gave me a list of all the things it didn&#39;t like so now I&#39;=
m finding where all of those show up and deleting them so hopefully that wi=
ll fix it.</div>
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Regards,</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Brian</d=
iv></div>

--089e0122aa245bb09e04e477fd12--
