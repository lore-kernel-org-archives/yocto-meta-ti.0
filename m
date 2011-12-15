Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 64C58E006DD
	for <meta-ti@yoctoproject.org>; Thu, 15 Dec 2011 07:52:07 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by eaac13 with SMTP id c13so2868210eaa.35
	for <meta-ti@yoctoproject.org>; Thu, 15 Dec 2011 07:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=6GQiOPrDtDnq8qpvWu933MEJcfzAbKMzuBLaqenIHao=;
	b=G/Qge3W2iWyV2GdkS4PKZRpRw2cgxQh1GjLUaIX2e1YPC65LYwvx0hTfPP4VOj4BDr
	A5023uOnn9rxlMBcOCvmeRWRI/h19j2UU/ezK6HjcknsyGhYx6pzpy8jUq4P8tngQi3P
	DIGZOc59c2pPqZWwKekN3vVg/FfZRplANrSP4=
MIME-Version: 1.0
Received: by 10.204.148.75 with SMTP id o11mr1427457bkv.95.1323964325866; Thu,
	15 Dec 2011 07:52:05 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.162.76 with HTTP; Thu, 15 Dec 2011 07:52:05 -0800 (PST)
In-Reply-To: <F61A9010E56D7F4C93A19FD36DAAC3592FA12D@DFLE34.ent.ti.com>
References: <cover.1323961434.git.otavio@ossystems.com.br>
	<5a96447bec084526f7d9397f0a8b80fbbdb265ac.1323961434.git.otavio@ossystems.com.br>
	<F61A9010E56D7F4C93A19FD36DAAC3592FA12D@DFLE34.ent.ti.com>
Date: Thu, 15 Dec 2011 13:52:05 -0200
X-Google-Sender-Auth: zt0xQsSP9NmLFdDmALJl-XZjJ9s
Message-ID: <CAP9ODKpt+Q2mZecuxT-9_AbBCxEKtZLmgsEGdBZ_MKXdNHFbcA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Kridner, Jason" <jdk@ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH v3 1/3] sdcard_image: rewrote to avoid using loopback and mount/unmount
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
X-List-Received-Date: Thu, 15 Dec 2011 15:52:08 -0000
Content-Type: multipart/alternative; boundary=0015175cfb4e56ab8d04b4237785

--0015175cfb4e56ab8d04b4237785
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Dec 15, 2011 at 13:29, Kridner, Jason <jdk@ti.com> wrote:

> Sorry for the top-post.  Using the number of clusters is important to make
> sure that the DOS partitioning is valid.  I'm not confident that we'll end
> up with a whole number of clusters using this method.  Perhaps it isn't
> completely critical, but I'm not 100% comfortable getting rid of it.
>

Parted handles it.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--0015175cfb4e56ab8d04b4237785
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Thu, Dec 15, 2011 at 13:29, Kridner, Jason <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:jdk@ti.com">jdk@ti.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">
Sorry for the top-post. =A0Using the number of clusters is important to mak=
e sure that the DOS partitioning is valid. =A0I&#39;m not confident that we=
&#39;ll end up with a whole number of clusters using this method. =A0Perhap=
s it isn&#39;t completely critical, but I&#39;m not 100% comfortable gettin=
g rid of it.<br>
</blockquote><div><br></div><div>Parted handles it.</div><div>=A0</div></di=
v>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio@ossystems.com.br" =
target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=3D"http://www.ossy=
stems.com.br" target=3D"_blank">http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--0015175cfb4e56ab8d04b4237785--
