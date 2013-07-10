Return-Path: <b.hutchman@gmail.com>
Received: from mail-ob0-f169.google.com (mail-ob0-f169.google.com
	[209.85.214.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 85CBEE00722
	for <meta-ti@yoctoproject.org>; Wed, 10 Jul 2013 10:28:56 -0700 (PDT)
Received: by mail-ob0-f169.google.com with SMTP id up14so8894778obb.14
	for <meta-ti@yoctoproject.org>; Wed, 10 Jul 2013 10:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=uh7rnK5JkhzfHTvdqRHGIKIyRP8MjkWcY5yYiFjfjZw=;
	b=LgA/OD3tI0tkT2Jb4Aa9Y2u8Iawkh9QPfqi8EhxUGETMNIk43g1L2K2ZhZLuIS00yH
	Tag/BxTFh0AnLfazgXt7Hj7OtECRO6pJj1mKvFQeez71XJ0vfh/J722YmJDInWsKwVkT
	2WPZQSSeQIsgUAbk+tWcqfvCR8ygnlWs8RcRkxTeffF5QaOKlmZKu2qI98nMQD439UC8
	OiePdXZCiAHKAj9vYRqv/wdYRMV9S8ywaVVvpvpg3ipvYWp9NlbFQpyha9EvQSraJEDf
	QV4+1ndugZqkCWx/3c4Hx4VSgwLGy+GNlfkcvO+TNjpFocoUJsa/7j7sDHnbflXdrAtf
	vEXA==
MIME-Version: 1.0
X-Received: by 10.60.115.199 with SMTP id jq7mr28490122oeb.19.1373477335698;
	Wed, 10 Jul 2013 10:28:55 -0700 (PDT)
Received: by 10.60.26.225 with HTTP; Wed, 10 Jul 2013 10:28:55 -0700 (PDT)
In-Reply-To: <20130710164618.GD16407@edge>
References: <CAFZh4h8osM3+bExMHS8zP-YU56h=hsSqjRfAC7Vo9Qu1_kze-w@mail.gmail.com>
	<20130710164618.GD16407@edge>
Date: Wed, 10 Jul 2013 13:28:55 -0400
Message-ID: <CAFZh4h_+1hgc9SJ1WrNgDL07Lj7JjwfHZLecf+RrWcVEyeprPQ@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: Which machine type to use for DaVinci DM6446 and TI816x?
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
X-List-Received-Date: Wed, 10 Jul 2013 17:28:57 -0000
Content-Type: multipart/alternative; boundary=089e0115e8e8b3946604e12b9c07

--089e0115e8e8b3946604e12b9c07
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jul 10, 2013 at 12:46 PM, Denys Dmytriyenko <denys@ti.com> wrote:

> On Tue, Jul 09, 2013 at 11:21:13AM -0400, Brian Hutchinson wrote:
> > Hi,
>
> Hey, Brian,
>
> Long time no see!
>
>
> > I have to support DaVinci DM6446, AM1808, OMAP-L138 and C6A816x which has
> > turned into TI816x in later silicon releases.
> >
> > I'm trying to figure out what conf/machine to use for the above SoC's.
> >
> > In Denzil, I see am389x-evm.conf and c6a816x-evm.conf and both include
> the
> > same ti816x.inc file, but I do not see support for this machine in Danny
> or
> > Dylan (unless I'm missing something).  How should I go about using Dylan
> > with the ti816x?
>
> http://thread.gmane.org/gmane.linux.embedded.yocto.meta-ti/1544
>
>
> > For DaVinci DM6446, I don't see an obvious machine type that supports it
> > but I know that the DM6446, AM1808 and OMAP-L138 are all in the same
> ARM926
> > family (da850) so should I be using the am1808-evm.conf for DaVinci
> DM6446?
>
> DM6446 is quite different from OMAP-L138. Both AM180x and DA850 are just
> derivatives of OMAP-L138.
>
> Anyway, DM6446 is no longer supported, as it's a very old platform.
>
>
> > I've always used Arago or Angstrom for DM6446 support in the past and so
> > I'm not sure which .conf I should be using with meta-ti.  My gut says use
> > am1808-evm.conf but I thought I should ask to be sure.
>
> --
> Denys
>

Hey Denys,

Wow, I wasn't expecting support to be dropped.  I'm sure there is still a
bunch of people using it.  I guess I could maybe maintain it if someone
would give pointers on how to go about it.

OK, so how about this ... I use the same u-boot and kernel that I'm
currently using (but built with the same toolchain to build the rootfs ...
meta-toolchain) but use am180x-evm to build the rootfs & packages of other
stuff I need?  I mainly need to have the packages kept relatively up to
date (security patches etc.).

Do you see anything wrong with that approach?  Same ABI right?

Regards,

Brian

--089e0115e8e8b3946604e12b9c07
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2013 at 12:46 PM, Denys Dmytriyenko <span dir=3D"ltr">&lt;<=
a href=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.com</a>&gt;</span=
> wrote:<br><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
On Tue, Jul 09, 2013 at 11:21:13AM -0400, Brian Hutchinson wrote:<br>
&gt; Hi,<br>
<br>
Hey, Brian,<br>
<br>
Long time no see!<br>
<div class=3D"im"><br>
<br>
&gt; I have to support DaVinci DM6446, AM1808, OMAP-L138 and C6A816x which =
has<br>
&gt; turned into TI816x in later silicon releases.<br>
&gt;<br>
&gt; I&#39;m trying to figure out what conf/machine to use for the above So=
C&#39;s.<br>
&gt;<br>
&gt; In Denzil, I see am389x-evm.conf and c6a816x-evm.conf and both include=
 the<br>
&gt; same ti816x.inc file, but I do not see support for this machine in Dan=
ny or<br>
&gt; Dylan (unless I&#39;m missing something). =A0How should I go about usi=
ng Dylan<br>
&gt; with the ti816x?<br>
<br>
</div><a href=3D"http://thread.gmane.org/gmane.linux.embedded.yocto.meta-ti=
/1544" target=3D"_blank">http://thread.gmane.org/gmane.linux.embedded.yocto=
.meta-ti/1544</a><br>
<div class=3D"im"><br>
<br>
&gt; For DaVinci DM6446, I don&#39;t see an obvious machine type that suppo=
rts it<br>
&gt; but I know that the DM6446, AM1808 and OMAP-L138 are all in the same A=
RM926<br>
&gt; family (da850) so should I be using the am1808-evm.conf for DaVinci DM=
6446?<br>
<br>
</div>DM6446 is quite different from OMAP-L138. Both AM180x and DA850 are j=
ust<br>
derivatives of OMAP-L138.<br>
<br>
Anyway, DM6446 is no longer supported, as it&#39;s a very old platform.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
&gt; I&#39;ve always used Arago or Angstrom for DM6446 support in the past =
and so<br>
&gt; I&#39;m not sure which .conf I should be using with meta-ti. =A0My gut=
 says use<br>
&gt; am1808-evm.conf but I thought I should ask to be sure.<br>
<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">--<br>
Denys<br></font></span></blockquote><div><br></div><div>Hey Denys,</div><di=
v><br></div><div>Wow, I wasn&#39;t expecting support to be dropped. =A0I&#3=
9;m sure there is still a bunch of people using it. =A0I guess I could mayb=
e maintain it if someone would give pointers on how to go about it.</div>
<div><br></div><div>OK, so how about this ... I use the same u-boot and ker=
nel that I&#39;m currently using (but built with the same toolchain to buil=
d the rootfs ... meta-toolchain) but use am180x-evm to build the rootfs &am=
p; packages of other stuff I need? =A0I mainly need to have the packages ke=
pt relatively up to date (security patches etc.).=A0</div>
<div><br></div><div>Do you see anything wrong with that approach? =A0Same A=
BI right?</div><div><br></div><div>Regards,</div><div><br></div><div>Brian<=
/div><div><br></div></div><br>

--089e0115e8e8b3946604e12b9c07--
