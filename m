Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5B559E0030F
	for <meta-ti@yoctoproject.org>; Tue,  6 Dec 2011 05:43:53 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by eeab20 with SMTP id b20so4789253eea.35
	for <meta-ti@yoctoproject.org>; Tue, 06 Dec 2011 05:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=bi429jbE+jT3HYRkPsPp46eOM+KfwpjnCQl3/YKzOCc=;
	b=abAawifqMvsnaquS0ha/9sF2/dvQLTicCsEpsqc7MsL1OJAtE3+xW/Gtz/JQGewg/0
	MW8Q6PkbKJm5KjSmj4iv39qkZvSTsKdpwBT5O/HSfXlMimfkzUF08dJiXGyeRrbEvPl4
	oWZkaxIfrq3JvwdrpmyQ1VTiQ+d36hswm7Xz4=
MIME-Version: 1.0
Received: by 10.14.13.196 with SMTP id b44mr986834eeb.232.1323179030682; Tue,
	06 Dec 2011 05:43:50 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.54.74 with HTTP; Tue, 6 Dec 2011 05:43:50 -0800 (PST)
In-Reply-To: <7A48A7A4-9B78-4C36-91CB-A02CFB138110@dominion.thruhere.net>
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
Date: Tue, 6 Dec 2011 11:43:50 -0200
X-Google-Sender-Auth: YXfuQE8A-IjoxbtODHLB4LDfa-s
Message-ID: <CAP9ODKqEnA5622xebKPjDAHKckSR+WwWDPqMzxcLs8uj+b3f1w@mail.gmail.com>
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
X-List-Received-Date: Tue, 06 Dec 2011 13:43:53 -0000
Content-Type: multipart/alternative; boundary=0016e65b5d8c191b1404b36ca07a

--0016e65b5d8c191b1404b36ca07a
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Dec 5, 2011 at 09:59, Koen Kooi <koen@dominion.thruhere.net> wrote:

> ...

my suspicion is that it segfaults on the cloud9-image because we copy over
> a lot of files into the vfat partition.
>

This is dependent on how many files are copied onto the fat filesystem.
This is also dependent on use of -d option that copies a directory onto the
fs instead of just creating a filesystem.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--0016e65b5d8c191b1404b36ca07a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Mon, Dec 5, 2011 at 09:59, Koen Kooi <span di=
r=3D"ltr">&lt;<a href=3D"mailto:koen@dominion.thruhere.net">koen@dominion.t=
hruhere.net</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex;">
...</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex;">my suspicion is that it seg=
faults on the cloud9-image because we copy over a lot of files into the vfa=
t partition.<br>
</blockquote><div><br></div><div>This is dependent on how many files are co=
pied onto the fat filesystem. This is also dependent on use of -d option th=
at copies a directory onto the fs instead of just creating a filesystem.</d=
iv>
<div>=A0</div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio=
@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=
=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com=
.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--0016e65b5d8c191b1404b36ca07a--
