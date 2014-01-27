Return-Path: <andreprado88@gmail.com>
Received: from mail-la0-f45.google.com (mail-la0-f45.google.com
	[209.85.215.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 33709E006BC
	for <meta-ti@yoctoproject.org>; Mon, 27 Jan 2014 08:41:50 -0800 (PST)
Received: by mail-la0-f45.google.com with SMTP id b8so4670737lan.18
	for <meta-ti@yoctoproject.org>; Mon, 27 Jan 2014 08:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=JpbOiLlgFdnABRoTu6T+94vtulLZRcAnQ1P1s4sinug=;
	b=dycNpdl+McRLYxdjvnExNwPYNo97ygmmTOabCgSmqKxJAoKAw9OUHZ5XGwKItiXUKA
	PlEwED3Grsi6ohizykWh3D6XfR8JfwSw/+6n0ge/S50f0L6+55kqk4pLko6fkLSRIxv3
	GfBdQOKg1EtG/H0dA/XqUixKafAi8sgQNfcmIJZIGxsjlPa4uWMiKymskQ/4zgmuSO65
	M7S70rkES43fph5CkFoqrRL/yH1I/t18uYidx7gwLnW4qX4zaY6PnQCL7HvN8jKkdCp3
	sJ8AW1nmWS+uQjFYOgiun/+A04+DRM62FQY0IWmiabiZUMdiMQizhkpyXCej+ec9vkP/
	kXvA==
MIME-Version: 1.0
X-Received: by 10.112.188.135 with SMTP id ga7mr17344439lbc.5.1390840908836;
	Mon, 27 Jan 2014 08:41:48 -0800 (PST)
Received: by 10.112.252.36 with HTTP; Mon, 27 Jan 2014 08:41:48 -0800 (PST)
In-Reply-To: <20140127154500.GA30525@edge>
References: <CAG=2wZcTH-doyKGPCjLT+9K2R_bZTZUz1cz39BVX9WQfXnjSaQ@mail.gmail.com>
	<20140127154500.GA30525@edge>
Date: Mon, 27 Jan 2014 14:41:48 -0200
Message-ID: <CAG=2wZefN9YGvu0r624rb7nDfUYr5=Rn1hV3HCDm2xdkUeKi+A@mail.gmail.com>
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
X-List-Received-Date: Mon, 27 Jan 2014 16:41:52 -0000
Content-Type: multipart/alternative; boundary=001a11c367ae4f734004f0f6629a

--001a11c367ae4f734004f0f6629a
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hey Denys thanks for the feedback, however i've tried to let my computer on
for 2 days and the instruction do_fetch is still there.
Anything i could do?

Cheers


On Mon, Jan 27, 2014 at 1:45 PM, Denys Dmytriyenko <denys@ti.com> wrote:

> On Sat, Jan 25, 2014 at 10:25:54PM -0200, Andr=E9 Prado wrote:
> > Hello i am trying to build a Yocto image for the Beaglebone black but i
> am
> > not having any success.
> >
> > This task keeps running for ever: linux-ti-staging-3.12.8-r21a+
> > gitrAUTOINC+af17c0c3a9 do_fetch
>
> Most probably it's just cloning the git tree, which could take some time.
>
>
> > I've runned this: it clone git://
> > git.ti.com/ti-linux-kernel/ti-linux-kernel.git with success.
> >
> > bitbake linux-ti-staging -c cleansstate returns me this:
> > http://pastebin.com/eAvJvTUU
> >
> > bitbake -v linux-ti-staging -c fetch returns me this:
> > http://pastebin.com/5RaRPeV9
>
> There seems to be some kind of exception in bitbake...
>
>
> > build/tmp/work/beaglebone-
> >
> poky-linux-gnueabi/linux-ti-staging/3.12.8-r21a+gitrAUTOINC+af17c0c3a9/te=
mp/log.do_fetch
> > returns me this:
> > http://pastebin.com/AmptCBFw
> >
> > DEBUG: Mirror fetch failure for url
> >
> http://downloads.yoctoproject.org/mirror/sources/git2_git.ti.com.ti-linux=
-kernel.ti-linux-kernel.git.tar.gz(original
> > url: git://
> >
> git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=3Dgit;branch=3Dti=
-linux-3.12.y
> > )
>
> And this just means there are no mirrors with this file, which is
> expected, as
> it's a live git repository.
>
> --
> Denys
>



--=20
Att
Andr=E9

--001a11c367ae4f734004f0f6629a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hey Denys thanks for the feedback, however i&#39=
;ve tried to let my computer on for 2 days and the instruction do_fetch is =
still there.<br></div>Anything i could do?<br><br></div>Cheers<br></div><di=
v class=3D"gmail_extra">
<br><br><div class=3D"gmail_quote">On Mon, Jan 27, 2014 at 1:45 PM, Denys D=
mytriyenko <span dir=3D"ltr">&lt;<a href=3D"mailto:denys@ti.com" target=3D"=
_blank">denys@ti.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">
<div class=3D"im">On Sat, Jan 25, 2014 at 10:25:54PM -0200, Andr=E9 Prado w=
rote:<br>
&gt; Hello i am trying to build a Yocto image for the Beaglebone black but =
i am<br>
&gt; not having any success.<br>
&gt;<br>
&gt; This task keeps running for ever: linux-ti-staging-3.12.8-r21a+<br>
&gt; gitrAUTOINC+af17c0c3a9 do_fetch<br>
<br>
</div>Most probably it&#39;s just cloning the git tree, which could take so=
me time.<br>
<div class=3D"im"><br>
<br>
&gt; I&#39;ve runned this: it clone git://<br>
&gt; <a href=3D"http://git.ti.com/ti-linux-kernel/ti-linux-kernel.git" targ=
et=3D"_blank">git.ti.com/ti-linux-kernel/ti-linux-kernel.git</a> with succe=
ss.<br>
&gt;<br>
&gt; bitbake linux-ti-staging -c cleansstate returns me this:<br>
&gt; <a href=3D"http://pastebin.com/eAvJvTUU" target=3D"_blank">http://past=
ebin.com/eAvJvTUU</a><br>
&gt;<br>
&gt; bitbake -v linux-ti-staging -c fetch returns me this:<br>
&gt; <a href=3D"http://pastebin.com/5RaRPeV9" target=3D"_blank">http://past=
ebin.com/5RaRPeV9</a><br>
<br>
</div>There seems to be some kind of exception in bitbake...<br>
<div class=3D"im"><br>
<br>
&gt; build/tmp/work/beaglebone-<br>
&gt; poky-linux-gnueabi/linux-ti-staging/3.12.8-r21a+gitrAUTOINC+af17c0c3a9=
/temp/log.do_fetch<br>
&gt; returns me this:<br>
&gt; <a href=3D"http://pastebin.com/AmptCBFw" target=3D"_blank">http://past=
ebin.com/AmptCBFw</a><br>
&gt;<br>
&gt; DEBUG: Mirror fetch failure for url<br>
&gt; <a href=3D"http://downloads.yoctoproject.org/mirror/sources/git2_git.t=
i.com.ti-linux-kernel.ti-linux-kernel.git.tar.gz(original" target=3D"_blank=
">http://downloads.yoctoproject.org/mirror/sources/git2_git.ti.com.ti-linux=
-kernel.ti-linux-kernel.git.tar.gz(original</a><br>

&gt; url: git://<br>
</div>&gt; <a href=3D"http://git.ti.com/ti-linux-kernel/ti-linux-kernel.git=
;protocol=3Dgit;branch=3Dti-linux-3.12.y" target=3D"_blank">git.ti.com/ti-l=
inux-kernel/ti-linux-kernel.git;protocol=3Dgit;branch=3Dti-linux-3.12.y</a>=
<br>
&gt; )<br>
<br>
And this just means there are no mirrors with this file, which is expected,=
 as<br>
it&#39;s a live git repository.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Denys<br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br>Att<br>An=
dr=E9
</div>

--001a11c367ae4f734004f0f6629a--
