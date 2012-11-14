Return-Path: <flavio.alves@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 27A1EE01447
	for <meta-ti@yoctoproject.org>; Tue, 13 Nov 2012 22:19:09 -0800 (PST)
Received: by mail-ie0-f176.google.com with SMTP id k11so127087iea.35
	for <meta-ti@yoctoproject.org>; Tue, 13 Nov 2012 22:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=xd+35iv6hI3DfPJKkJ1V+LuQfQEtzVRYL6D9Cc42MA8=;
	b=luX2tRoNKsPIxMtd0xcQ52Ad0J+CbKBLjfImndim2FLehJpEscwTNp38VO0c7K2+Qu
	eB/dUu13gyHn7e0jV6XKaaLW/dPR+vUOh0ITQRqmBfVAGYO52+1dz/6KGQYkFK5I478b
	MUkJbLHeO5jkN6U6q0o/bZUHEcCNacFS7TXkRI0bXVsTf2b4Y2Nv5/BVYt9Fqs6bbN9u
	hKqZewMnPRvoW+PhNDMfiRkhZo9lnjFCrYEVqeXp5VEYL5+xBS9oWDIK8348khcNuqz0
	nC7HMNY9Vzf896hIrTYDKMa0yCgOXhMZqL1LJrCsdL0IyFMtVHSx/gQut8OheBB693Qf
	1uyg==
MIME-Version: 1.0
Received: by 10.50.152.240 with SMTP id vb16mr862412igb.45.1352873948733; Tue,
	13 Nov 2012 22:19:08 -0800 (PST)
Received: by 10.42.24.212 with HTTP; Tue, 13 Nov 2012 22:19:08 -0800 (PST)
In-Reply-To: <20121114013751.GB13096@edge>
References: <CAFNBfte2-bE2o2XCu_nVUcFXukfbvd5fujvoB59fYZHOWyGtdw@mail.gmail.com>
	<50A26410.5030405@r-finger.com> <20121113152237.GA12650@edge>
	<50A26971.40908@r-finger.com>
	<alpine.DEB.2.02.1211131041310.4591@oneiric>
	<20121113154444.GB12650@edge>
	<CAFNBftf5ACAEFEtLpoVB3b9pc_d1MROgn19NBJmQWX2u362Ucw@mail.gmail.com>
	<50A2C0E8.9030300@r-finger.com>
	<CAFNBftdZC1BUCUA+zonbgkFshzft=ba=BYyTBKFKTXBOo_DVsA@mail.gmail.com>
	<20121114013751.GB13096@edge>
Date: Wed, 14 Nov 2012 04:19:08 -0200
Message-ID: <CAFNBftfKt8gSrDpSrBkPG=4yzrBynSCFEKKPL=hJthgBDSETNQ@mail.gmail.com>
From: Flavio Castro Alves Filho <flavio.alves@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: Help with building gstreamer-ti on beagleboard
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
X-List-Received-Date: Wed, 14 Nov 2012 06:19:09 -0000
Content-Type: multipart/alternative; boundary=e89a8f3ba01b23e1d304ce6e83f2

--e89a8f3ba01b23e1d304ce6e83f2
Content-Type: text/plain; charset=ISO-8859-1

2012/11/13 Denys Dmytriyenko <denys@ti.com>

> On Tue, Nov 13, 2012 at 11:10:31PM -0200, Flavio Castro Alves Filho wrote:
> > 2012/11/13 Tomas Frydrych <tf+lists.yocto@r-finger.com>
> >
> > | make[1]: /arm-poky-linux-gnueabi-gcc: Command not found
>
> ^^^^^^^^^
>
> Yes, some of the recipes in meta-ti still use old TOOLCHAIN_* vars from
> Classic OE, which were set specifically to allow building packages either
> with an internal toolchain or with an external prebuilt one. In OE-Core or
> Yocto/Poky those vars are not set by default, as it's left for the
> distribution to deal with setting up any fancy toolchain business.  You'd
> need to add something like this to your config file:
>
> TOOLCHAIN_PATH ?= "${STAGING_BINDIR_TOOLCHAIN}"
> TOOLCHAIN_SYSPATH ?= "${TOOLCHAIN_PATH}/${TARGET_SYS}"
>
>
Yes. I did that ant it worked. At least for this recipe.


> --
> Denys
>



-- 
Flavio de Castro Alves Filho

flavio.alves@gmail.com
www.linuxembarcado.com
Twitter: http://twitter.com/#!/fraviofii
LinkedIn profile: www.linkedin.com/in/flaviocastroalves

--e89a8f3ba01b23e1d304ce6e83f2
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">2012/11/1=
3 Denys Dmytriyenko <span dir=3D"ltr">&lt;<a href=3D"mailto:denys@ti.com" t=
arget=3D"_blank">denys@ti.com</a>&gt;</span><br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">
On Tue, Nov 13, 2012 at 11:10:31PM -0200, Flavio Castro Alves Filho wrote:<=
br>
<div class=3D"im">&gt; 2012/11/13 Tomas Frydrych &lt;<a href=3D"mailto:tf%2=
Blists.yocto@r-finger.com">tf+lists.yocto@r-finger.com</a>&gt;<br>
&gt;<br>
&gt; | make[1]: /arm-poky-linux-gnueabi-gcc: Command not found<br>
<br>
</div>^^^^^^^^^<br>
<br>
Yes, some of the recipes in meta-ti still use old TOOLCHAIN_* vars from<br>
Classic OE, which were set specifically to allow building packages either<b=
r>
with an internal toolchain or with an external prebuilt one. In OE-Core or<=
br>
Yocto/Poky those vars are not set by default, as it&#39;s left for the<br>
distribution to deal with setting up any fancy toolchain business. =A0You&#=
39;d<br>
need to add something like this to your config file:<br>
<br>
TOOLCHAIN_PATH ?=3D &quot;${STAGING_BINDIR_TOOLCHAIN}&quot;<br>
TOOLCHAIN_SYSPATH ?=3D &quot;${TOOLCHAIN_PATH}/${TARGET_SYS}&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br></font></span></blockquo=
te><div><br>Yes. I did that ant it worked. At least for this recipe.<br>=A0=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">
<span class=3D"HOEnZb"><font color=3D"#888888">
--<br>
Denys<br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br>Flavio de=
 Castro Alves Filho<br><br><a href=3D"mailto:flavio.alves@gmail.com" target=
=3D"_blank">flavio.alves@gmail.com</a><div><a href=3D"http://www.linuxembar=
cado.com" target=3D"_blank">www.linuxembarcado.com</a><br>
Twitter: <a href=3D"http://twitter.com/#!/fraviofii" target=3D"_blank">http=
://twitter.com/#!/fraviofii</a><br></div><div>LinkedIn profile: <a href=3D"=
http://www.linkedin.com/in/flaviocastroalves" target=3D"_blank">www.linkedi=
n.com/in/flaviocastroalves</a></div>
<br>
</div>

--e89a8f3ba01b23e1d304ce6e83f2--
