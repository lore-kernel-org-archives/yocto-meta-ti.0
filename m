Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qc0-f178.google.com (mail-qc0-f178.google.com
	[209.85.216.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 31524E006B3
	for <meta-ti@yoctoproject.org>; Mon, 10 Feb 2014 09:48:40 -0800 (PST)
Received: by mail-qc0-f178.google.com with SMTP id m20so11244130qcx.9
	for <meta-ti@yoctoproject.org>; Mon, 10 Feb 2014 09:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=znz6zS5vfIzUJGqa8NLnQcflajSaA4aSoUTMimDQx0w=;
	b=s8G70dGbxlu5ldY+u8Ozew5+B6+rEKZd5iaqwtIREz7rOGorAeRAPBkUwhTEr70VqA
	2lEnXA39VMMmU5BqReCzDSiAA9BWiA3kihvaExPdJJqr5jncXT01deAqAVUTYsYgt6CV
	W4FmqxsPaPO2egvf8bH38tPVmfb5b+OcDZeVn4WicfgUN6InPYQHVoa1CnwL9KXt77T7
	gn/5ifi3jhy27DyreFhItnkxSGMOGl0p5wABdkM1IgAsxskdng2iJufSOY3V4Hkg+fQQ
	V/2zECv7LX1fSObLRr50tCj89sD7u0Lq8Cl6iiGz+ZfIxFxnMRQ/95ZB3zZ33XZ2CvHk
	3F6g==
X-Received: by 10.224.162.200 with SMTP id w8mr50114742qax.1.1392054519605;
	Mon, 10 Feb 2014 09:48:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.25.47 with HTTP; Mon, 10 Feb 2014 09:48:19 -0800 (PST)
In-Reply-To: <2080630.Ym40fTraDf@kgy-pc>
References: <1687303.zqgYtDvr2z@kgy-pc>
	<321768C95D21724485BCE784F1BE98473EB8E6DA@DBDE04.ent.ti.com>
	<2080630.Ym40fTraDf@kgy-pc>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Mon, 10 Feb 2014 15:48:19 -0200
Message-ID: <CAMCfZKFvf0oxesWZ54Yj8rthHCS0GTnO-znDBQ1=2M9g-tLUCQ@mail.gmail.com>
To: Kovesdi Gyorgy <kgy@teledigit.eu>
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
X-List-Received-Date: Mon, 10 Feb 2014 17:48:48 -0000
Content-Type: multipart/alternative; boundary=089e0149484626312b04f210f3fd

--089e0149484626312b04f210f3fd
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Folks,

Any update on this?
I'm facing with the same issue.

I'm using poky and meta-ti on dora branch.


Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br

/*long live rock 'n roll*/


On Sat, Aug 10, 2013 at 12:48 PM, Kovesdi Gyorgy <kgy@teledigit.eu> wrote:

> > It appears you are trying to build a drm driver - correct ?
> Yes, i would need a working OpenGL on my Beagleboard-C4 with 3.x kernel.
> (4.05
> works well with 2.6 but crashes with 3.x)
>
> > ________________________________________
> > From: meta-ti-bounces@yoctoproject.org [meta-ti-bounces@yoctoproject.or=
g]
> on
> > behalf of Kovesdi Gyorgy [kgy@teledigit.eu] Sent: Saturday, August 10,
> 2013
> > 4:28 PM
> > To: meta-ti mailing list
> > Subject: [meta-ti] How to compile omap3-sgx-modules_4.09.00.01
> >
> > Hi,
> >
> > I tried to compile recent versions (4.08 or 4.09) of SGX modules for my
> > Beagleboard-C4 using the current Yoctoproject environment (tried Poky,
> > beagleboard-dylan-9.0.0, and Angstrom Linux with the same result).
> >
> > In every case i got this error message:
> > | make[3]: *** No rule to make target
> >
> > `/home/kgy/work/Yocto/poky/build/out/work/beagleboard-poky-linux-
> > gnueabi/omap3-sgx-modules/4.09.00.01-
> >
> r124a/Graphics_SDK_4_09_00_01/GFX_Linux_KM/services4/3rdparty/linux_drm/d=
rm_
> > auth.o', needed by
> > `/home/kgy/work/Yocto/poky/build/out/work/beagleboard-poky-linux-
> > gnueabi/omap3-sgx-modules/4.09.00.01-
> >
> r124a/Graphics_SDK_4_09_00_01/GFX_Linux_KM/services4/3rdparty/linux_drm/d=
rm.
> > o'. Stop.
> >
> > Please help me to compile it!
> >
> > Thanx in advance
> > Gy=F6rgy K=F6vesdi
> >
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>

--089e0149484626312b04f210f3fd
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Folks,<div><br></div><div style>Any update on this?</div><=
div style>I&#39;m facing with the same issue.</div><div style><br></div><di=
v style>I&#39;m using poky and meta-ti on dora branch.</div><div style><br>

</div><div class=3D"gmail_extra"><br clear=3D"all"><div><div dir=3D"ltr"><d=
iv>Regards,</div><div><br></div>--<br>*dS<br>Diego Sueiro<br><br>Administra=
dor do Embarcados<br><a href=3D"http://www.embarcados.com.br" target=3D"_bl=
ank">www.embarcados.com.br</a><br>

<br>/*long live rock &#39;n roll*/</div></div>
<br><br><div class=3D"gmail_quote">On Sat, Aug 10, 2013 at 12:48 PM, Kovesd=
i Gyorgy <span dir=3D"ltr">&lt;<a href=3D"mailto:kgy@teledigit.eu" target=
=3D"_blank">kgy@teledigit.eu</a>&gt;</span> wrote:<br><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">

<div class=3D"im">&gt; It appears you are trying to build a drm driver - co=
rrect ?<br>
</div>Yes, i would need a working OpenGL on my Beagleboard-C4 with 3.x kern=
el. (4.05<br>
works well with 2.6 but crashes with 3.x)<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; ________________________________________<br>
&gt; From: <a href=3D"mailto:meta-ti-bounces@yoctoproject.org">meta-ti-boun=
ces@yoctoproject.org</a> [<a href=3D"mailto:meta-ti-bounces@yoctoproject.or=
g">meta-ti-bounces@yoctoproject.org</a>] on<br>
&gt; behalf of Kovesdi Gyorgy [<a href=3D"mailto:kgy@teledigit.eu">kgy@tele=
digit.eu</a>] Sent: Saturday, August 10, 2013<br>
&gt; 4:28 PM<br>
&gt; To: meta-ti mailing list<br>
&gt; Subject: [meta-ti] How to compile omap3-sgx-modules_4.09.00.01<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; I tried to compile recent versions (4.08 or 4.09) of SGX modules for m=
y<br>
&gt; Beagleboard-C4 using the current Yoctoproject environment (tried Poky,=
<br>
&gt; beagleboard-dylan-9.0.0, and Angstrom Linux with the same result).<br>
&gt;<br>
&gt; In every case i got this error message:<br>
&gt; | make[3]: *** No rule to make target<br>
&gt;<br>
&gt; `/home/kgy/work/Yocto/poky/build/out/work/beagleboard-poky-linux-<br>
&gt; gnueabi/omap3-sgx-modules/4.09.00.01-<br>
&gt; r124a/Graphics_SDK_4_09_00_01/GFX_Linux_KM/services4/3rdparty/linux_dr=
m/drm_<br>
&gt; auth.o&#39;, needed by<br>
&gt; `/home/kgy/work/Yocto/poky/build/out/work/beagleboard-poky-linux-<br>
&gt; gnueabi/omap3-sgx-modules/4.09.00.01-<br>
&gt; r124a/Graphics_SDK_4_09_00_01/GFX_Linux_KM/services4/3rdparty/linux_dr=
m/drm.<br>
&gt; o&#39;. Stop.<br>
&gt;<br>
&gt; Please help me to compile it!<br>
&gt;<br>
&gt; Thanx in advance<br>
&gt; Gy=F6rgy K=F6vesdi<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; meta-ti mailing list<br>
&gt; <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</=
a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" target=3D"=
_blank">https://lists.yoctoproject.org/listinfo/meta-ti</a><br>
_______________________________________________<br>
meta-ti mailing list<br>
<a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</a><br=
>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" target=3D"_blan=
k">https://lists.yoctoproject.org/listinfo/meta-ti</a><br>
</div></div></blockquote></div><br></div></div>

--089e0149484626312b04f210f3fd--
