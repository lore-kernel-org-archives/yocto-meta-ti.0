Return-Path: <andreprado88@gmail.com>
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 75EFCE00509
	for <meta-ti@yoctoproject.org>; Mon, 27 Jan 2014 09:27:21 -0800 (PST)
Received: by mail-la0-f50.google.com with SMTP id ec20so4808929lab.9
	for <meta-ti@yoctoproject.org>; Mon, 27 Jan 2014 09:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=+ky7bqBsUcxkquif8SdJrb15sZoNuLUhQJOMoh6ukqI=;
	b=orMQNBG7Izcd10MC1TqeFXBo8YXVE8Km4cziHPWtvhaAStz5zXN4Abwv6lTnIgmCue
	vIB7uBJVdT5Opy3ikxZcVcbqILIJE7vXnyGvDcDrffGw9iHUSQb/nNMSn+3ci8/fHkZ+
	FVOFbGMulTW31pWU/iGsrnPFe+tk+47TrcPDQWGFj4NYhlU0kiX07dBuWRKNuPnzqdIk
	4MiN3jIK2peW0mqiw3z3MUqyLVnZLGI4Qpk5tef9z5/LDEI79kPiccCqNdPOJc798xnv
	N77jzSXciL67lKklKkwJe/6B8InENEyVeJargcCCnPlY4WOnAfPZKfQkqSaDOUnsB1Ih
	JU7w==
MIME-Version: 1.0
X-Received: by 10.112.92.112 with SMTP id cl16mr17163172lbb.15.1390843640192; 
	Mon, 27 Jan 2014 09:27:20 -0800 (PST)
Received: by 10.112.252.36 with HTTP; Mon, 27 Jan 2014 09:27:20 -0800 (PST)
In-Reply-To: <20140127172626.GH6814@edge>
References: <CAG=2wZcTH-doyKGPCjLT+9K2R_bZTZUz1cz39BVX9WQfXnjSaQ@mail.gmail.com>
	<20140127154500.GA30525@edge>
	<CAG=2wZefN9YGvu0r624rb7nDfUYr5=Rn1hV3HCDm2xdkUeKi+A@mail.gmail.com>
	<20140127172626.GH6814@edge>
Date: Mon, 27 Jan 2014 15:27:20 -0200
Message-ID: <CAG=2wZfHf=4SBf1=oOY4i+PTxf_W4ryE8uAuQ0rS9Ds9jhdVPQ@mail.gmail.com>
From: =?ISO-8859-1?Q?Andr=E9_Prado?= <andreprado88@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: Trying to build for BBB but can't fetch linux-ti-staging-3.12.8
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
X-List-Received-Date: Mon, 27 Jan 2014 17:27:22 -0000
Content-Type: multipart/alternative; boundary=001a11336c561ca1a804f0f7055d

--001a11336c561ca1a804f0f7055d
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Haven't tried yet, can you suggest me one so i can test it?


On Mon, Jan 27, 2014 at 3:26 PM, Denys Dmytriyenko <denys@ti.com> wrote:

> On Mon, Jan 27, 2014 at 02:41:48PM -0200, Andr=E9 Prado wrote:
> > Hey Denys thanks for the feedback, however i've tried to let my compute=
r
> on
> > for 2 days and the instruction do_fetch is still there.
> > Anything i could do?
>
> Do you have issues building any other recipe that clones from a git tree?
>
>
> > On Mon, Jan 27, 2014 at 1:45 PM, Denys Dmytriyenko <denys@ti.com> wrote=
:
> >
> > > On Sat, Jan 25, 2014 at 10:25:54PM -0200, Andr=E9 Prado wrote:
> > > > Hello i am trying to build a Yocto image for the Beaglebone black
> but i
> > > am
> > > > not having any success.
> > > >
> > > > This task keeps running for ever: linux-ti-staging-3.12.8-r21a+
> > > > gitrAUTOINC+af17c0c3a9 do_fetch
> > >
> > > Most probably it's just cloning the git tree, which could take some
> time.
> > >
> > >
> > > > I've runned this: it clone git://
> > > > git.ti.com/ti-linux-kernel/ti-linux-kernel.git with success.
> > > >
> > > > bitbake linux-ti-staging -c cleansstate returns me this:
> > > > http://pastebin.com/eAvJvTUU
> > > >
> > > > bitbake -v linux-ti-staging -c fetch returns me this:
> > > > http://pastebin.com/5RaRPeV9
> > >
> > > There seems to be some kind of exception in bitbake...
> > >
> > >
> > > > build/tmp/work/beaglebone-
> > > >
> > >
> poky-linux-gnueabi/linux-ti-staging/3.12.8-r21a+gitrAUTOINC+af17c0c3a9/te=
mp/log.do_fetch
> > > > returns me this:
> > > > http://pastebin.com/AmptCBFw
> > > >
> > > > DEBUG: Mirror fetch failure for url
> > > >
> > >
> http://downloads.yoctoproject.org/mirror/sources/git2_git.ti.com.ti-linux=
-kernel.ti-linux-kernel.git.tar.gz(original
> > > > url: git://
> > > >
> > >
> git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=3Dgit;branch=3Dti=
-linux-3.12.y
> > > > )
> > >
> > > And this just means there are no mirrors with this file, which is
> > > expected, as
> > > it's a live git repository.
> > >
> > > --
> > > Denys
> > >
> >
> >
> >
> > --
> > Att
> > Andr=E9
>



--=20
Att
Andr=E9

--001a11336c561ca1a804f0f7055d
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Haven&#39;t tried yet, can you suggest me one so i can tes=
t it?<br></div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote=
">On Mon, Jan 27, 2014 at 3:26 PM, Denys Dmytriyenko <span dir=3D"ltr">&lt;=
<a href=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.com</a>&gt;</spa=
n> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Mon, Jan 27, 2014 at 02=
:41:48PM -0200, Andr=E9 Prado wrote:<br>
&gt; Hey Denys thanks for the feedback, however i&#39;ve tried to let my co=
mputer on<br>
&gt; for 2 days and the instruction do_fetch is still there.<br>
&gt; Anything i could do?<br>
<br>
</div>Do you have issues building any other recipe that clones from a git t=
ree?<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
&gt; On Mon, Jan 27, 2014 at 1:45 PM, Denys Dmytriyenko &lt;<a href=3D"mail=
to:denys@ti.com">denys@ti.com</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; On Sat, Jan 25, 2014 at 10:25:54PM -0200, Andr=E9 Prado wrote:<br=
>
&gt; &gt; &gt; Hello i am trying to build a Yocto image for the Beaglebone =
black but i<br>
&gt; &gt; am<br>
&gt; &gt; &gt; not having any success.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; This task keeps running for ever: linux-ti-staging-3.12.8-r2=
1a+<br>
&gt; &gt; &gt; gitrAUTOINC+af17c0c3a9 do_fetch<br>
&gt; &gt;<br>
&gt; &gt; Most probably it&#39;s just cloning the git tree, which could tak=
e some time.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt; I&#39;ve runned this: it clone git://<br>
&gt; &gt; &gt; <a href=3D"http://git.ti.com/ti-linux-kernel/ti-linux-kernel=
.git" target=3D"_blank">git.ti.com/ti-linux-kernel/ti-linux-kernel.git</a> =
with success.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; bitbake linux-ti-staging -c cleansstate returns me this:<br>
&gt; &gt; &gt; <a href=3D"http://pastebin.com/eAvJvTUU" target=3D"_blank">h=
ttp://pastebin.com/eAvJvTUU</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; bitbake -v linux-ti-staging -c fetch returns me this:<br>
&gt; &gt; &gt; <a href=3D"http://pastebin.com/5RaRPeV9" target=3D"_blank">h=
ttp://pastebin.com/5RaRPeV9</a><br>
&gt; &gt;<br>
&gt; &gt; There seems to be some kind of exception in bitbake...<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt; build/tmp/work/beaglebone-<br>
&gt; &gt; &gt;<br>
&gt; &gt; poky-linux-gnueabi/linux-ti-staging/3.12.8-r21a+gitrAUTOINC+af17c=
0c3a9/temp/log.do_fetch<br>
&gt; &gt; &gt; returns me this:<br>
&gt; &gt; &gt; <a href=3D"http://pastebin.com/AmptCBFw" target=3D"_blank">h=
ttp://pastebin.com/AmptCBFw</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; DEBUG: Mirror fetch failure for url<br>
&gt; &gt; &gt;<br>
&gt; &gt; <a href=3D"http://downloads.yoctoproject.org/mirror/sources/git2_=
git.ti.com.ti-linux-kernel.ti-linux-kernel.git.tar.gz(original" target=3D"_=
blank">http://downloads.yoctoproject.org/mirror/sources/git2_git.ti.com.ti-=
linux-kernel.ti-linux-kernel.git.tar.gz(original</a><br>

&gt; &gt; &gt; url: git://<br>
&gt; &gt; &gt;<br>
&gt; &gt; <a href=3D"http://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;=
protocol=3Dgit;branch=3Dti-linux-3.12.y" target=3D"_blank">git.ti.com/ti-li=
nux-kernel/ti-linux-kernel.git;protocol=3Dgit;branch=3Dti-linux-3.12.y</a><=
br>
&gt; &gt; &gt; )<br>
&gt; &gt;<br>
&gt; &gt; And this just means there are no mirrors with this file, which is=
<br>
&gt; &gt; expected, as<br>
&gt; &gt; it&#39;s a live git repository.<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; Denys<br>
&gt; &gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Att<br>
&gt; Andr=E9<br>
</div></div></blockquote></div><br><br clear=3D"all"><br>-- <br>Att<br>Andr=
=E9
</div>

--001a11336c561ca1a804f0f7055d--
