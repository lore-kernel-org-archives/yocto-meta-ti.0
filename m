Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8ED79E0030F
	for <meta-ti@yoctoproject.org>; Tue,  6 Dec 2011 06:10:42 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by eaal12 with SMTP id l12so6999072eaa.35
	for <meta-ti@yoctoproject.org>; Tue, 06 Dec 2011 06:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=tL/yqIyF/2ze5GjCsFMGkz/oavSBpna6x1AkiMVhKtc=;
	b=XWS6Gojxt+RtO5XGn3PY0cxn/OMnVqrbY3uclIKF0j1EWw/UoVqtD3zEbQhNNCj9hE
	KxiuAVtfmHqfF7klQlRyaxs7D3BIas4rB04GtJH83DgV04l6f9QmoybJS54bmcbFNRZh
	N3i6pe0vjOOdhQ93C6v8z0kPVe3TVjcdjC+TI=
MIME-Version: 1.0
Received: by 10.213.29.141 with SMTP id q13mr2389975ebc.13.1323180641432; Tue,
	06 Dec 2011 06:10:41 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.54.74 with HTTP; Tue, 6 Dec 2011 06:10:41 -0800 (PST)
In-Reply-To: <CAP9ODKqEnA5622xebKPjDAHKckSR+WwWDPqMzxcLs8uj+b3f1w@mail.gmail.com>
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
Date: Tue, 6 Dec 2011 12:10:41 -0200
X-Google-Sender-Auth: yqV4Dun8JXqK3rHS2-T8wZwgMP0
Message-ID: <CAP9ODKpzGkocCG9UX34BCnBkQPCCRYd3Kho49RATA3PQawMT7A@mail.gmail.com>
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
X-List-Received-Date: Tue, 06 Dec 2011 14:10:43 -0000
Content-Type: multipart/alternative; boundary=0015174c33881b35da04b36d0008

--0015174c33881b35da04b36d0008
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Dec 6, 2011 at 11:43, Otavio Salvador <otavio@ossystems.com.br>wrote:

> On Mon, Dec 5, 2011 at 09:59, Koen Kooi <koen@dominion.thruhere.net>wrote:
>
>> ...
>
> my suspicion is that it segfaults on the cloud9-image because we copy over
>> a lot of files into the vfat partition.
>>
>
> This is dependent on how many files are copied onto the fat filesystem.
> This is also dependent on use of -d option that copies a directory onto the
> fs instead of just creating a filesystem.
>

This is a know issue, as shown at
http://bugzilla.pokylinux.org/show_bug.cgi?id=1783

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--0015174c33881b35da04b36d0008
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Tue, Dec 6, 2011 at 11:43, Otavio Salvador <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:otavio@ossystems.com.br">otavio@ossys=
tems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex;">
<div class=3D"gmail_quote">On Mon, Dec 5, 2011 at 09:59, Koen Kooi <span di=
r=3D"ltr">&lt;<a href=3D"mailto:koen@dominion.thruhere.net" target=3D"_blan=
k">koen@dominion.thruhere.net</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">

...</blockquote><div class=3D"im"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">my suspi=
cion is that it segfaults on the cloud9-image because we copy over a lot of=
 files into the vfat partition.<br>

</blockquote><div><br></div></div><div>This is dependent on how many files =
are copied onto the fat filesystem. This is also dependent on use of -d opt=
ion that copies a directory onto the fs instead of just creating a filesyst=
em.</div>
</div></blockquote></div><br>This is a know issue, as shown at=A0<a href=3D=
"http://bugzilla.pokylinux.org/show_bug.cgi?id=3D1783">http://bugzilla.poky=
linux.org/show_bug.cgi?id=3D1783</a><br clear=3D"all"><div><br></div>-- <br=
>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
O.S. Systems<br>
E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio=
@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" target=3D"=
_blank">http://www.ossystems.com.br</a><br>Mobile: +55 53 9981-7854=A0 =A0 =
=A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://projetos.ossystems.com.br" target=
=3D"_blank">http://projetos.ossystems.com.br</a><br>
<br>

--0015174c33881b35da04b36d0008--
