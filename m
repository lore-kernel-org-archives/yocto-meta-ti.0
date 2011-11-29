Return-Path: <otavio.salvador@gmail.com>
Received: from mail-fx0-f48.google.com (mail-fx0-f48.google.com
	[209.85.161.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 34FCCE0072A
	for <meta-ti@yoctoproject.org>; Tue, 29 Nov 2011 09:51:50 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by faao14 with SMTP id o14so1527161faa.35
	for <meta-ti@yoctoproject.org>; Tue, 29 Nov 2011 09:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=phDNwZRXvGj/Kp5x9gZNRCxGi4aszwczMf/9x3SvHUs=;
	b=nchfjdlU7Kqm2htJGYpwK870zgIB/7hgW5vR9kAs+WKfgMQfR4efGAZcNaFoL/wBKb
	FTyyzzCCQpLgLpg9Rz/PlQKRSba9OIFe1kvgikS5InD1wZTkL1EICj77/7eobaGREld7
	Vk3TO3KZnGdBHZ6DI8oN3VvyUgG8Ggf520WNg=
MIME-Version: 1.0
Received: by 10.204.13.70 with SMTP id b6mr52403920bka.78.1322589109006; Tue,
	29 Nov 2011 09:51:49 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.113.148 with HTTP; Tue, 29 Nov 2011 09:51:48 -0800 (PST)
In-Reply-To: <4E93189F-8970-4235-AC37-4712652FD449@dominion.thruhere.net>
References: <cover.1322570446.git.otavio@ossystems.com.br>
	<ee2873ddeae5a79375823882a15da057536e2574.1322570446.git.otavio@ossystems.com.br>
	<CAP9ODKrAZudP6NLcuMk1-Sx7xphW-9Q_CrD0osj94th+_outkg@mail.gmail.com>
	<4EC9DF51-D28A-440F-889F-CC9EDCEA2530@dominion.thruhere.net>
	<4ED4DEF2.2000705@ti.com>
	<CAP9ODKrpdQoT-1v75X21p0E4rujj_Sg8wR3QDXW6kgPHWJEjgw@mail.gmail.com>
	<F00F7FDA-EEA8-47BD-AE07-52A4EFA8C078@dominion.thruhere.net>
	<4E93189F-8970-4235-AC37-4712652FD449@dominion.thruhere.net>
Date: Tue, 29 Nov 2011 15:51:48 -0200
X-Google-Sender-Auth: _7-fCstdXrNs58PRn-peEFUZgYQ
Message-ID: <CAP9ODKpFT7sYS7scbVE1_EY+Qx5F9QcuV0jXCHfq5Kvk+qpjvg@mail.gmail.com>
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
X-List-Received-Date: Tue, 29 Nov 2011 17:51:50 -0000
Content-Type: multipart/alternative; boundary=00151750da4a06b21004b2e346ab

--00151750da4a06b21004b2e346ab
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Nov 29, 2011 at 15:48, Koen Kooi <koen@dominion.thruhere.net> wrote:

> mkfs.vfat keeps segfaulting at different points, I'll try to find out why.
>

It works fine here.

Maybe a change in your layer?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--00151750da4a06b21004b2e346ab
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Tue, Nov 29, 2011 at 15:48, Koen Kooi <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:koen@dominion.thruhere.net">koen@dominion.=
thruhere.net</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex;">
<div><div class=3D"h5">mkfs.vfat keeps segfaulting at different points, I&#=
39;ll try to find out why.</div></div>
</blockquote></div><div><br></div><div>It works fine here.</div><div><br></=
div><div>Maybe a change in your layer?</div><div><br></div>-- <br>Otavio Sa=
lvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Syste=
ms<br>E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">=
otavio@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" targ=
et=3D"_blank">http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--00151750da4a06b21004b2e346ab--
