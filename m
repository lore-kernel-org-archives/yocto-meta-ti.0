Return-Path: <otavio.salvador@gmail.com>
Received: from mail-bw0-f48.google.com (mail-bw0-f48.google.com
	[209.85.214.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 24CA5E005B2
	for <meta-ti@yoctoproject.org>; Mon,  5 Dec 2011 03:39:45 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by bkbzs8 with SMTP id zs8so6613908bkb.35
	for <meta-ti@yoctoproject.org>; Mon, 05 Dec 2011 03:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=IqR1iNaBD0fHrJzOh1IOEyUP7rxyTuuSAccl/C1+/XA=;
	b=I6/HIYSpSSsJKMozV3bLwoILm2AR83GuOfNQpaf8zFvi2zLmnp6RdoHCt6mMZXe+uc
	f7/jXS283VpplxogYgSM9XdaEGda0yusr69q/i5w/N6mCfUMVWGoC813vTDlC4qUV9xY
	FEJSt5HB+A5dByEIZzT1fPH5mOZJ59TVrPgN4=
MIME-Version: 1.0
Received: by 10.205.127.9 with SMTP id gy9mr1962110bkc.67.1323085184625; Mon,
	05 Dec 2011 03:39:44 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.54.74 with HTTP; Mon, 5 Dec 2011 03:39:44 -0800 (PST)
In-Reply-To: <CDEAD2BF-A97E-4CB4-AC24-C1C79C37B75D@dominion.thruhere.net>
References: <cover.1322570446.git.otavio@ossystems.com.br>
	<ee2873ddeae5a79375823882a15da057536e2574.1322570446.git.otavio@ossystems.com.br>
	<CAP9ODKrAZudP6NLcuMk1-Sx7xphW-9Q_CrD0osj94th+_outkg@mail.gmail.com>
	<4EC9DF51-D28A-440F-889F-CC9EDCEA2530@dominion.thruhere.net>
	<4ED4DEF2.2000705@ti.com>
	<CAP9ODKrpdQoT-1v75X21p0E4rujj_Sg8wR3QDXW6kgPHWJEjgw@mail.gmail.com>
	<F00F7FDA-EEA8-47BD-AE07-52A4EFA8C078@dominion.thruhere.net>
	<4E93189F-8970-4235-AC37-4712652FD449@dominion.thruhere.net>
	<CAP9ODKpFT7sYS7scbVE1_EY+Qx5F9QcuV0jXCHfq5Kvk+qpjvg@mail.gmail.com>
	<CDEAD2BF-A97E-4CB4-AC24-C1C79C37B75D@dominion.thruhere.net>
Date: Mon, 5 Dec 2011 09:39:44 -0200
X-Google-Sender-Auth: 9iBFGR17IM5-VK70e-ZqGQ5XvxY
Message-ID: <CAP9ODKqvBccdQJuk0mf+ZmzMivsVSLi86cYh72DyRb1-SAWO3w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v2 1/3] sdcard_image: rewrote to avoid using loopback and mount/unmount
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Dec 2011 11:39:46 -0000
Content-Type: multipart/alternative; boundary=001517475c106fecee04b356c6b0

--001517475c106fecee04b356c6b0
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Dec 5, 2011 at 09:30, Koen Kooi <koen@dominion.thruhere.net> wrote:

> Op 29 nov. 2011, om 18:51 heeft Otavio Salvador het volgende geschreven:
> > On Tue, Nov 29, 2011 at 15:48, Koen Kooi <koen@dominion.thruhere.net>
> wrote:
> > mkfs.vfat keeps segfaulting at different points, I'll try to find out
> why.
> >
> > It works fine here.
> >
> > Maybe a change in your layer?
>
> I did some more tests (MACHINE=beaglebone bitbake cloud9-image) and with
> your patches mkfs.vfat segfaults, without the patches it works. I don't
> know why that is.
> I do want to get rid of the loopdevices, so if other people on this list
> can test these patches as well...
>

I will try to reproduce your issue here.

I didn't test with cloud9-image but one image from us that is a small one.
Will try this case and see if I can reproduce it.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--001517475c106fecee04b356c6b0
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Mon, Dec 5, 2011 at 09:30, Koen Kooi <span di=
r=3D"ltr">&lt;<a href=3D"mailto:koen@dominion.thruhere.net">koen@dominion.t=
hruhere.net</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex;">
Op 29 nov. 2011, om 18:51 heeft Otavio Salvador het volgende geschreven:<br=
>
<div class=3D"im">&gt; On Tue, Nov 29, 2011 at 15:48, Koen Kooi &lt;<a href=
=3D"mailto:koen@dominion.thruhere.net">koen@dominion.thruhere.net</a>&gt; w=
rote:<br>
&gt; mkfs.vfat keeps segfaulting at different points, I&#39;ll try to find =
out why.<br>
&gt;<br>
&gt; It works fine here.<br>
&gt;<br>
&gt; Maybe a change in your layer?<br>
<br>
</div>I did some more tests (MACHINE=3Dbeaglebone bitbake cloud9-image) and=
 with your patches mkfs.vfat segfaults, without the patches it works. I don=
&#39;t know why that is.<br>
I do want to get rid of the loopdevices, so if other people on this list ca=
n test these patches as well...<br></blockquote><div><br></div><div>I will =
try to reproduce your issue here.</div><div><br></div><div>I didn&#39;t tes=
t with cloud9-image but one image from us that is a small one. Will try thi=
s case and see if I can reproduce it.</div>
<div>=A0</div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio=
@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=
=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com=
.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--001517475c106fecee04b356c6b0--
