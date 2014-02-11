Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qc0-f171.google.com (mail-qc0-f171.google.com
	[209.85.216.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 28D81E00764
	for <meta-ti@yoctoproject.org>; Tue, 11 Feb 2014 07:04:22 -0800 (PST)
Received: by mail-qc0-f171.google.com with SMTP id n7so13092673qcx.16
	for <meta-ti@yoctoproject.org>; Tue, 11 Feb 2014 07:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ceauTny6RR9FclxqRct74jwqkLUrEC9RhTkvgC4xhoE=;
	b=rGfAgEZi14SIhEtZBbCKJ7+VfRwFbhEn6JSR51qMCGL2AvPyDG+B7SfoIfnP0QyCsF
	B+kEDzUdtBrm709Wl+dZhDBieJyTFQPKEmzyPrXzBoMKojc27IBMX2PjqrEhYQ/hFvIe
	MN/TZTJdYaFNYRQIOUUIdVEiXKo8/Ew1oHRqe9YxpHRCvex1jthHl6v7QGosHJz2ZX1j
	cq2rfeAw/ZjGU4a1TsCpr1Mzzh2wX4KY3jD2RE83Gm8GZpDig35tezTQSLhHhsTbMc+C
	pd4oMHvVgYBvBx2K+80HsguMUONbghgGAPy0yKpSs5y6waCEel9hDf0eJNYbo3xLI/KG
	IRzQ==
X-Received: by 10.140.31.75 with SMTP id e69mr55123417qge.76.1392131060641;
	Tue, 11 Feb 2014 07:04:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.25.47 with HTTP; Tue, 11 Feb 2014 07:04:00 -0800 (PST)
In-Reply-To: <CAMCfZKFy-UYxZ+ENv0_U0ii+RLdScMthAPFhzK-2PhPZvg-3ZA@mail.gmail.com>
References: <1687303.zqgYtDvr2z@kgy-pc>
	<321768C95D21724485BCE784F1BE98473EB8E6DA@DBDE04.ent.ti.com>
	<2080630.Ym40fTraDf@kgy-pc>
	<CAMCfZKFvf0oxesWZ54Yj8rthHCS0GTnO-znDBQ1=2M9g-tLUCQ@mail.gmail.com>
	<20140211144551.GF3131@edge>
	<CAMCfZKHbrQR_1Htcxv5Xgg43yoLTJTyzu8=4CpWiO9-meB1Z5A@mail.gmail.com>
	<20140211145214.GH3131@edge>
	<CAMCfZKFy-UYxZ+ENv0_U0ii+RLdScMthAPFhzK-2PhPZvg-3ZA@mail.gmail.com>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Tue, 11 Feb 2014 13:04:00 -0200
Message-ID: <CAMCfZKFexQe8-WSy-43Gp=8Tks=y+i3hkWGmaLe5wdPAdQj89Q@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: How to compile omap3-sgx-modules_4.09.00.01
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
X-List-Received-Date: Tue, 11 Feb 2014 15:04:23 -0000
Content-Type: multipart/alternative; boundary=001a113a96ca59c2a304f222c5bd

--001a113a96ca59c2a304f222c5bd
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Adding these line on beaglebone.conf still builds 4.09.00.01 version:
PREFERRED_VERSION_libgles-omap3 =3D "5.01.00.01"
PREFERRED_VERSION_omap3-sgx-modules =3D "5.01.00.01"

Some outputs:

NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item
libgles-omap3-dev)
NOTE: versions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.00.02
4.09.00.01
 NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for
item libgles-omap3)
NOTE: versions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.00.02
4.09.00.01
NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item
libgles-omap3-flipwsegl-es3)
NOTE: versions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.00.02
4.09.00.01
NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item
libgles-omap3-flipwsegl-es5)
NOTE: versions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.00.02
4.09.00.01
NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item
libgles-omap3-flipwsegl-es6)
NOTE: versions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.00.02
4.09.00.01
NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item
libgles-omap3-flipwsegl-es8)
NOTE: versions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.00.02
4.09.00.01
NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item
libgles-omap3-flipwsegl-es9)
NOTE: versions of libgles-omap3 available: 4.09.00.01
NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item
libgles-omap3-linuxfbwsegl-es3)
NOTE: versions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.00.02
4.09.00.01
NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item
libgles-omap3-linuxfbwsegl-es5)
NOTE: versions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.00.02
4.09.00.01
NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item
libgles-omap3-linuxfbwsegl-es6)
NOTE: versions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.00.02
4.09.00.01
NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item
libgles-omap3-linuxfbwsegl-es8)
NOTE: versions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.00.02
4.09.00.01
NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item
libgles-omap3-linuxfbwsegl-es9)
NOTE: versions of libgles-omap3 available: 4.09.00.01
NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item
libgles-omap3-es3)
NOTE: versions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.00.02
4.09.00.01
NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item
libgles-omap3-es5)
NOTE: versions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.00.02
4.09.00.01
NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item
libgles-omap3-es6)
NOTE: versions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.00.02
4.09.00.01
NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item
libgles-omap3-es8)
NOTE: versions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.00.02
4.09.00.01
NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item
libgles-omap3-es9)
NOTE: versions of libgles-omap3 available: 4.09.00.01
NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item
libgles-omap3-blitwsegl-es3)
NOTE: versions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.00.02
4.09.00.01
NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item
libgles-omap3-blitwsegl-es5)
NOTE: versions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.00.02
4.09.00.01
NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item
libgles-omap3-blitwsegl-es6)
NOTE: versions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.00.02
4.09.00.01
NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item
libgles-omap3-blitwsegl-es8)
NOTE: versions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.00.02
4.09.00.01
NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item
libgles-omap3-blitwsegl-es9)
NOTE: versions of libgles-omap3 available: 4.09.00.01
NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item
libgles-omap3-frontwsegl-es3)
NOTE: versions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.00.02
4.09.00.01
NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item
libgles-omap3-frontwsegl-es5)
NOTE: versions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.00.02
4.09.00.01
NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item
libgles-omap3-frontwsegl-es6)
NOTE: versions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.00.02
4.09.00.01
NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item
libgles-omap3-frontwsegl-es8)
NOTE: versions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.00.02
4.09.00.01
NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item
libgles-omap3-frontwsegl-es9)
NOTE: versions of libgles-omap3 available: 4.09.00.01


Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br

/*long live rock 'n roll*/


On Tue, Feb 11, 2014 at 12:54 PM, Diego Sueiro <diego.sueiro@gmail.com>wrot=
e:

>
> On Tue, Feb 11, 2014 at 12:52 PM, Denys Dmytriyenko <denys@ti.com> wrote:
>
>> PREFERRED_VERSION_blah =3D "ver"
>
>
> Can I add it im my image recipe, or do I need to add it on machine.conf?
> Why the newest version is not selected by default?
>
> Abra=E7os,
>
> --
> *dS
> Diego Sueiro
>
> Administrador do Embarcados
> www.embarcados.com.br
>
> Engenheiro de Controle e Automa=E7=E3o
> UNIVERSIDADE FEDERAL DE ITAJUB=C0
>
>
> /*long live rock 'n roll*/
>

--001a113a96ca59c2a304f222c5bd
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div style>Adding these line on beaglebone.conf still buil=
ds=A04.09.00.01 version:</div><div style><div>PREFERRED_VERSION_libgles-oma=
p3 =3D &quot;5.01.00.01&quot;</div><div>PREFERRED_VERSION_omap3-sgx-modules=
 =3D &quot;5.01.00.01&quot;</div>

<div><br></div><div style>Some outputs:</div><div><br></div></div><div>NOTE=
: preferred version 5.01.00.01 of libgles-omap3 not available (for item lib=
gles-omap3-dev)</div><div>NOTE: versions of libgles-omap3 available: 4.05.0=
0.03 4.08.00.01 4.08.00.02 4.09.00.01</div>

<div>
NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item=
 libgles-omap3)</div><div>NOTE: versions of libgles-omap3 available: 4.05.0=
0.03 4.08.00.01 4.08.00.02 4.09.00.01</div><div>NOTE: preferred version 5.0=
1.00.01 of libgles-omap3 not available (for item libgles-omap3-flipwsegl-es=
3)</div>


<div>NOTE: versions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.=
00.02 4.09.00.01</div><div>NOTE: preferred version 5.01.00.01 of libgles-om=
ap3 not available (for item libgles-omap3-flipwsegl-es5)</div><div>NOTE: ve=
rsions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.00.02 4.09.00=
.01</div>


<div>NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for=
 item libgles-omap3-flipwsegl-es6)</div><div>NOTE: versions of libgles-omap=
3 available: 4.05.00.03 4.08.00.01 4.08.00.02 4.09.00.01</div><div>NOTE: pr=
eferred version 5.01.00.01 of libgles-omap3 not available (for item libgles=
-omap3-flipwsegl-es8)</div>


<div>NOTE: versions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.=
00.02 4.09.00.01</div><div>NOTE: preferred version 5.01.00.01 of libgles-om=
ap3 not available (for item libgles-omap3-flipwsegl-es9)</div><div>NOTE: ve=
rsions of libgles-omap3 available: 4.09.00.01</div>


<div>NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for=
 item libgles-omap3-linuxfbwsegl-es3)</div><div>NOTE: versions of libgles-o=
map3 available: 4.05.00.03 4.08.00.01 4.08.00.02 4.09.00.01</div><div>

NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item=
 libgles-omap3-linuxfbwsegl-es5)</div>
<div>NOTE: versions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.=
00.02 4.09.00.01</div><div>NOTE: preferred version 5.01.00.01 of libgles-om=
ap3 not available (for item libgles-omap3-linuxfbwsegl-es6)</div><div>

NOTE: versions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.00.02=
 4.09.00.01</div>
<div>NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for=
 item libgles-omap3-linuxfbwsegl-es8)</div><div>NOTE: versions of libgles-o=
map3 available: 4.05.00.03 4.08.00.01 4.08.00.02 4.09.00.01</div><div>

NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for item=
 libgles-omap3-linuxfbwsegl-es9)</div>
<div>NOTE: versions of libgles-omap3 available: 4.09.00.01</div><div>NOTE: =
preferred version 5.01.00.01 of libgles-omap3 not available (for item libgl=
es-omap3-es3)</div><div>NOTE: versions of libgles-omap3 available: 4.05.00.=
03 4.08.00.01 4.08.00.02 4.09.00.01</div>


<div>NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for=
 item libgles-omap3-es5)</div><div>NOTE: versions of libgles-omap3 availabl=
e: 4.05.00.03 4.08.00.01 4.08.00.02 4.09.00.01</div><div>NOTE: preferred ve=
rsion 5.01.00.01 of libgles-omap3 not available (for item libgles-omap3-es6=
)</div>


<div>NOTE: versions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.=
00.02 4.09.00.01</div><div>NOTE: preferred version 5.01.00.01 of libgles-om=
ap3 not available (for item libgles-omap3-es8)</div><div>NOTE: versions of =
libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.00.02 4.09.00.01</div>


<div>NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for=
 item libgles-omap3-es9)</div><div>NOTE: versions of libgles-omap3 availabl=
e: 4.09.00.01</div><div>NOTE: preferred version 5.01.00.01 of libgles-omap3=
 not available (for item libgles-omap3-blitwsegl-es3)</div>


<div>NOTE: versions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.=
00.02 4.09.00.01</div><div>NOTE: preferred version 5.01.00.01 of libgles-om=
ap3 not available (for item libgles-omap3-blitwsegl-es5)</div><div>NOTE: ve=
rsions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.00.02 4.09.00=
.01</div>


<div>NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for=
 item libgles-omap3-blitwsegl-es6)</div><div>NOTE: versions of libgles-omap=
3 available: 4.05.00.03 4.08.00.01 4.08.00.02 4.09.00.01</div><div>NOTE: pr=
eferred version 5.01.00.01 of libgles-omap3 not available (for item libgles=
-omap3-blitwsegl-es8)</div>


<div>NOTE: versions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.=
00.02 4.09.00.01</div><div>NOTE: preferred version 5.01.00.01 of libgles-om=
ap3 not available (for item libgles-omap3-blitwsegl-es9)</div><div>NOTE: ve=
rsions of libgles-omap3 available: 4.09.00.01</div>


<div>NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for=
 item libgles-omap3-frontwsegl-es3)</div><div>NOTE: versions of libgles-oma=
p3 available: 4.05.00.03 4.08.00.01 4.08.00.02 4.09.00.01</div><div>NOTE: p=
referred version 5.01.00.01 of libgles-omap3 not available (for item libgle=
s-omap3-frontwsegl-es5)</div>


<div>NOTE: versions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.=
00.02 4.09.00.01</div><div>NOTE: preferred version 5.01.00.01 of libgles-om=
ap3 not available (for item libgles-omap3-frontwsegl-es6)</div><div>NOTE: v=
ersions of libgles-omap3 available: 4.05.00.03 4.08.00.01 4.08.00.02 4.09.0=
0.01</div>


<div>NOTE: preferred version 5.01.00.01 of libgles-omap3 not available (for=
 item libgles-omap3-frontwsegl-es8)</div><div>NOTE: versions of libgles-oma=
p3 available: 4.05.00.03 4.08.00.01 4.08.00.02 4.09.00.01</div><div>NOTE: p=
referred version 5.01.00.01 of libgles-omap3 not available (for item libgle=
s-omap3-frontwsegl-es9)</div>


<div>NOTE: versions of libgles-omap3 available: 4.09.00.01</div><div><br></=
div><div class=3D"gmail_extra"><br clear=3D"all"><div><div dir=3D"ltr"><div=
>Regards,</div><div><br></div>--<br>*dS<br>Diego Sueiro<br><br>Administrado=
r do Embarcados<br>

<a href=3D"http://www.embarcados.com.br" target=3D"_blank">www.embarcados.c=
om.br</a><br><br>/*long live rock &#39;n roll*/<br></div></div>
<br><br><div class=3D"gmail_quote">On Tue, Feb 11, 2014 at 12:54 PM, Diego =
Sueiro <span dir=3D"ltr">&lt;<a href=3D"mailto:diego.sueiro@gmail.com" targ=
et=3D"_blank">diego.sueiro@gmail.com</a>&gt;</span> wrote:<br><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Feb 11, 2014 at 12:52 PM, Denys Dmytriyenko <span dir=3D"ltr">&lt;<=
a href=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.com</a>&gt;</span=
> wrote:<br>


<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">PREFERRED_VERSION_blah =3D &quot;ver&quot;</=
blockquote></div><br>Can I add it im my image recipe, or do I need to add i=
t on machine.conf?</div>


<div class=3D"gmail_extra">Why the newest version is not selected by defaul=
t?<br><br clear=3D"all"><div><div dir=3D"ltr"><div>Abra=E7os,</div><div cla=
ss=3D"im"><div><br></div>--<br>*dS<br>Diego Sueiro<br><br>Administrador do =
Embarcados<br>

<a href=3D"http://www.embarcados.com.br" target=3D"_blank">www.embarcados.c=
om.br</a><br>
<br></div>Engenheiro de Controle e Automa=E7=E3o<br>UNIVERSIDADE FEDERAL DE=
 ITAJUB=C0<div class=3D"im"><br><br>/*long live rock &#39;n roll*/</div></d=
iv></div>
</div></div>
</blockquote></div><br></div></div>

--001a113a96ca59c2a304f222c5bd--
