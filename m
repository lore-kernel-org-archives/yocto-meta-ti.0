Return-Path: <andreprado88@gmail.com>
Received: from mail-la0-f46.google.com (mail-la0-f46.google.com
	[209.85.215.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EF7CBE00461
	for <meta-ti@yoctoproject.org>; Sat, 25 Jan 2014 16:25:56 -0800 (PST)
Received: by mail-la0-f46.google.com with SMTP id b8so3554334lan.19
	for <meta-ti@yoctoproject.org>; Sat, 25 Jan 2014 16:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=ZNHUEmmYv3ZbqorLI8zzV8X6FY4/996v/x1uM3HXPcI=;
	b=q/s+0lH6z5yJO6NAcAWwBs9dThrOIdpN/tkbozYWRksaHq/C0hQErc5rcODRlD+rBF
	TZrbpfRFQDS8DH7PVThDuAIJbmWEjXBzsyBqy06UhkfGFJyN67+qmekqcpSbeVfvsNCC
	mld187lq+RWdlKLmBkVzoe5mHOYEc4i5XuEH15D/aPZoCtOElnJdAnzmnuGg0cfpkJid
	/DOgil/isfI80xJO407loKDpTWRr4z7v6d/DkZ6OujoG9DEJCsGXuhzetKJMMUfSbOgN
	QqEJ3B3ULo3ixion4G8q/s4Y+y8Hux+wtUrWKqQB5v0w1EWdL4Xi+GGWcWDphs62O8CO
	6lCg==
MIME-Version: 1.0
X-Received: by 10.112.188.135 with SMTP id ga7mr12858195lbc.5.1390695954500;
	Sat, 25 Jan 2014 16:25:54 -0800 (PST)
Received: by 10.112.252.36 with HTTP; Sat, 25 Jan 2014 16:25:54 -0800 (PST)
Date: Sat, 25 Jan 2014 22:25:54 -0200
Message-ID: <CAG=2wZcTH-doyKGPCjLT+9K2R_bZTZUz1cz39BVX9WQfXnjSaQ@mail.gmail.com>
From: =?ISO-8859-1?Q?Andr=E9_Prado?= <andreprado88@gmail.com>
To: meta-ti@yoctoproject.org
Subject: Trying to build for BBB but can't fetch linux-ti-staging-3.12.8
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
X-List-Received-Date: Sun, 26 Jan 2014 00:26:03 -0000
Content-Type: multipart/alternative; boundary=001a11c367ae5bd2fb04f0d4a2cb

--001a11c367ae5bd2fb04f0d4a2cb
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello i am trying to build a Yocto image for the Beaglebone black but i am
not having any success.

This task keeps running for ever: linux-ti-staging-3.12.8-r21a+
gitrAUTOINC+af17c0c3a9 do_fetch

I've runned this: it clone git://
git.ti.com/ti-linux-kernel/ti-linux-kernel.git with success.

bitbake linux-ti-staging -c cleansstate returns me this:
http://pastebin.com/eAvJvTUU

bitbake -v linux-ti-staging -c fetch returns me this:
http://pastebin.com/5RaRPeV9
build/tmp/work/beaglebone-
poky-linux-gnueabi/linux-ti-staging/3.12.8-r21a+gitrAUTOINC+af17c0c3a9/temp=
/log.do_fetch
returns me this:
http://pastebin.com/AmptCBFw

DEBUG: Mirror fetch failure for url
http://downloads.yoctoproject.org/mirror/sources/git2_git.ti.com.ti-linux-k=
ernel.ti-linux-kernel.git.tar.gz(original
url: git://
git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=3Dgit;branch=3Dti-l=
inux-3.12.y
)

I am running Ubuntu 12.0.4 32 bits on Virtual Box.


--=20
Att
Andr=E9

--001a11c367ae5bd2fb04f0d4a2cb
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello i am trying to build a Yocto image for the Beag=
lebone black but i am not having any success. <br></div><br>This task keeps=
 running for ever: linux-ti-staging-3.12.8-r21a+<div>gitrAUTOINC+af17c0c3a9=
 do_fetch<br>
<br></div><div>I&#39;ve runned this: it clone=A0git://<a href=3D"http://git=
.ti.com/ti-linux-kernel/ti-linux-kernel.git" target=3D"_blank">git.ti.com/t=
i-linux-kernel/ti-linux-kernel.git</a> with success.<br><br>bitbake linux-t=
i-staging -c cleansstate returns me this: <br>
</div><div><a href=3D"http://pastebin.com/eAvJvTUU">http://pastebin.com/eAv=
JvTUU</a><br></div><div><br>bitbake -v linux-ti-staging -c fetch returns me=
 this: <br></div><div><a href=3D"http://pastebin.com/5RaRPeV9">http://paste=
bin.com/5RaRPeV9</a><br clear=3D"all">
<div>build/tmp/work/beaglebone-<div>poky-linux-gnueabi/linux-ti-staging/<sp=
an style=3D"font-family:arial,sans-serif;font-size:13px">3.12.8-r21a+</span=
><span style=3D"font-family:arial,sans-serif;font-size:13px">gitrAUTOINC+af=
17c0c3a9</span>/temp/log.do_fetch returns me this:<br>
</div><a href=3D"http://pastebin.com/AmptCBFw">http://pastebin.com/AmptCBFw=
</a><br><br>DEBUG: Mirror fetch failure for url=20
<a href=3D"http://downloads.yoctoproject.org/mirror/sources/git2_git.ti.com=
.ti-linux-kernel.ti-linux-kernel.git.tar.gz" target=3D"_blank">http://downl=
oads.yoctoproject.org/mirror/sources/git2_git.ti.com.ti-linux-kernel.ti-lin=
ux-kernel.git.tar.gz</a>
 (original url:=20
git://<a href=3D"http://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;prot=
ocol=3Dgit;branch=3Dti-linux-3.12.y" target=3D"_blank">git.ti.com/ti-linux-=
kernel/ti-linux-kernel.git;protocol=3Dgit;branch=3Dti-linux-3.12.y</a>)<br>=
<br></div>
<div>I am running Ubuntu 12.0.4 32 bits on Virtual Box.<br><br><br></div><d=
iv>-- <br>Att<br>Andr=E9
</div></div></div>

--001a11c367ae5bd2fb04f0d4a2cb--
