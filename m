Return-Path: <b.hutchman@gmail.com>
Received: from mail-ea0-f172.google.com (mail-ea0-f172.google.com
	[209.85.215.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 55597E016F4
	for <meta-ti@yoctoproject.org>; Sun, 13 Oct 2013 17:36:38 -0700 (PDT)
Received: by mail-ea0-f172.google.com with SMTP id r16so3040516ead.17
	for <meta-ti@yoctoproject.org>; Sun, 13 Oct 2013 17:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=UYzqrqM+O2/vn8TAVI/K9285SJPwNdCGkXb/ICPyfk8=;
	b=UUuYxDYW8a8XnB54Ga4AKg2NKACkwmILEJA26BqN7htnRt1cKTkxZ3IQuv0yZPBQIX
	wlo0TkzERrGLpUgsXtKA3uTyEYnrvSVdiABBmJQfp3JJcPXYXoKPpAx/777G9p0xZ2yq
	Uktcn1qZmMqkkdOnWti0/XhC4To6//GYhOLlQIZyI5B+VLBek1L68qKF3cm8LbkmVDFQ
	cyUz7AaP8p5M5H2EzIP2iCbSzU1VWcKIIvVH/OzM1ptWpfA518EIHNhA4iwBvwCprnYC
	q2wUfZ4L/q6KJGUdC5pn7sjAnW+QCGeZw18uu1K2N+ICvKbb7NVFGMIGXRrPbAPu49im
	WyVg==
MIME-Version: 1.0
X-Received: by 10.14.218.197 with SMTP id k45mr51883477eep.32.1381710996521;
	Sun, 13 Oct 2013 17:36:36 -0700 (PDT)
Received: by 10.223.144.205 with HTTP; Sun, 13 Oct 2013 17:36:36 -0700 (PDT)
In-Reply-To: <20131014002057.GD27046@denix.org>
References: <CAFZh4h9H3bTQveLafJY-3rCz-qy=dqhVq36CTqFt4RCPqJWDcQ@mail.gmail.com>
	<20131009180902.GB15357@edge>
	<CAFZh4h8zkeU6JysvkAuHDPMES9NdQFPkbxxXPPcOQwO61r32PQ@mail.gmail.com>
	<20131014002057.GD27046@denix.org>
Date: Sun, 13 Oct 2013 20:36:36 -0400
Message-ID: <CAFZh4h-aqYiZFtvj4n-PpHonUA6M1f2b8xspV7cAffMEEdJJGQ@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Kernel recipe that works with OECore + meta-ti fails with Poky + meta-ti
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
X-List-Received-Date: Mon, 14 Oct 2013 00:36:39 -0000
Content-Type: multipart/alternative; boundary=047d7b603af4214a0504e8a8a946

--047d7b603af4214a0504e8a8a946
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Oct 13, 2013 at 8:20 PM, Denys Dmytriyenko <denys@ti.com> wrote:

> On Wed, Oct 09, 2013 at 03:15:17PM -0400, Brian Hutchinson wrote:
> > The other problem I saw was in OECore, I added the linux-libc-headers for
> > 2.6.37.2 so packages would be built with headers that matched my TI PSP
> > based kernel and I was able to get that to work.
>
> BTW, we do have it in meta-arago-extras, if you want to use it:
>
>
> http://arago-project.org/git/?p=meta-arago.git;a=blob;f=meta-arago-extras/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.bb;hb=HEAD
>

I stole it from somewhere.  It was Khem & Hillman's  patch I believe.

Regards,

Brian

--047d7b603af4214a0504e8a8a946
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On S=
un, Oct 13, 2013 at 8:20 PM, Denys Dmytriyenko <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">
<div class=3D"im">On Wed, Oct 09, 2013 at 03:15:17PM -0400, Brian Hutchinso=
n wrote:<br>
</div><div class=3D"im">&gt; The other problem I saw was in OECore, I added=
 the linux-libc-headers for<br>
&gt; 2.6.37.2 so packages would be built with headers that matched my TI PS=
P<br>
&gt; based kernel and I was able to get that to work.<br>
<br>
</div>BTW, we do have it in meta-arago-extras, if you want to use it:<br>
<br>
<a href=3D"http://arago-project.org/git/?p=3Dmeta-arago.git;a=3Dblob;f=3Dme=
ta-arago-extras/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37=
.2.bb;hb=3DHEAD" target=3D"_blank">http://arago-project.org/git/?p=3Dmeta-a=
rago.git;a=3Dblob;f=3Dmeta-arago-extras/recipes-kernel/linux-libc-headers/l=
inux-libc-headers_2.6.37.2.bb;hb=3DHEAD</a><br>
</blockquote><div><br></div><div>I stole it from somewhere.=A0 It was Khem =
&amp; Hillman&#39;s=A0 patch I believe. <br><br></div><div>Regards,<br><br>=
Brian</div><br></div><br></div></div>

--047d7b603af4214a0504e8a8a946--
