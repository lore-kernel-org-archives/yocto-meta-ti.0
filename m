Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 89E99E0030D
	for <meta-ti@yoctoproject.org>; Thu, 15 Dec 2011 02:47:00 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by eaac13 with SMTP id c13so2450520eaa.35
	for <meta-ti@yoctoproject.org>; Thu, 15 Dec 2011 02:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=2viUw1GX2fpeOZVjftMxjO2iB04YamXngKQJ3+65x84=;
	b=YlxEQ7Si9rOMtAVadX92fl0H4SbLqVmPjfnJkvAaISTTgWWUdHNUEw+bvyUQIn50eB
	t2eDyOtvM3gbpIsT+PeipNEmidteLP+OgPqscwQ+7GHGn54pgZgwGYKTPy92Ja2J0ZWh
	xnU2hJ4UA+JWPzAuLRYdp2djqjckCaW3/qZ8Y=
MIME-Version: 1.0
Received: by 10.205.137.144 with SMTP id io16mr632166bkc.23.1323946018945;
	Thu, 15 Dec 2011 02:46:58 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.162.76 with HTTP; Thu, 15 Dec 2011 02:46:58 -0800 (PST)
In-Reply-To: <6F7036D3-C9F8-4CBA-B7C1-654E2113E9EC@dominion.thruhere.net>
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
	<CAP9ODKqvBccdQJuk0mf+ZmzMivsVSLi86cYh72DyRb1-SAWO3w@mail.gmail.com>
	<7A48A7A4-9B78-4C36-91CB-A02CFB138110@dominion.thruhere.net>
	<CAP9ODKqEnA5622xebKPjDAHKckSR+WwWDPqMzxcLs8uj+b3f1w@mail.gmail.com>
	<CAP9ODKpzGkocCG9UX34BCnBkQPCCRYd3Kho49RATA3PQawMT7A@mail.gmail.com>
	<6F7036D3-C9F8-4CBA-B7C1-654E2113E9EC@dominion.thruhere.net>
Date: Thu, 15 Dec 2011 08:46:58 -0200
X-Google-Sender-Auth: sBjvsEsNWKltC8xe3_PESand4kE
Message-ID: <CAP9ODKrzW6cy=LiPcw62qD_W3=mXKqkW43qNoc2S+aO3y1VMXw@mail.gmail.com>
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
X-List-Received-Date: Thu, 15 Dec 2011 10:47:01 -0000
Content-Type: multipart/alternative; boundary=0015173feb66293c7f04b41f34f8

--0015173feb66293c7f04b41f34f8
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Dec 15, 2011 at 07:19, Koen Kooi <koen@dominion.thruhere.net> wrote:

> > This is a know issue, as shown at
> http://bugzilla.pokylinux.org/show_bug.cgi?id=1783
>
> There's a fix pending for that in OE-core:
> http://patches.openembedded.org/patch/16951/
>
> Could you rebase and resend your patches after that goes in?
>

Yes; IIRC I did minor fixes on this patch after sending it.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--0015173feb66293c7f04b41f34f8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Thu, Dec 15, 2011 at 07:19, Koen Kooi <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:koen@dominion.thruhere.net">koen@dominion.=
thruhere.net</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"im">&gt; This is a know issue, as shown at <a href=3D"http://=
bugzilla.pokylinux.org/show_bug.cgi?id=3D1783" target=3D"_blank">http://bug=
zilla.pokylinux.org/show_bug.cgi?id=3D1783</a><br>
<br>
</div>There&#39;s a fix pending for that in OE-core: <a href=3D"http://patc=
hes.openembedded.org/patch/16951/" target=3D"_blank">http://patches.openemb=
edded.org/patch/16951/</a><br>
<br>
Could you rebase and resend your patches after that goes in?<br></blockquot=
e><div><br></div><div>Yes; IIRC I did minor fixes on this patch after sendi=
ng it.</div><div>=A0</div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>
E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio=
@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" target=3D"=
_blank">http://www.ossystems.com.br</a><br>Mobile: +55 53 9981-7854=A0 =A0 =
=A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://projetos.ossystems.com.br" target=
=3D"_blank">http://projetos.ossystems.com.br</a><br>
<br>

--0015173feb66293c7f04b41f34f8--
