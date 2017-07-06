Return-Path: <antonius.riko@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 019EAE00718; Wed,  5 Jul 2017 17:04:02 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (antonius.riko[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.218.68 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.218.68 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 53EE1E00349
	for <meta-ti@yoctoproject.org>; Wed,  5 Jul 2017 17:03:59 -0700 (PDT)
Received: by mail-oi0-f68.google.com with SMTP id d77so601119oig.1
	for <meta-ti@yoctoproject.org>; Wed, 05 Jul 2017 17:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3lmEGWDAxsbH2kDLrvkZ+HL+nlmIL/IzhrKToScUDh4=;
	b=aiMr0KUmkqJYaTtVG6FHDqfSviy4DauskkYaWyduZkd00KHkkQswhJ2XBdnCbs157P
	SHcLABRbvqY4CC1y/8sydGkbVBaDXpBZQ5vdmHY4MhXnY5n0Xm99PZ/G0ZLfkAttNTLm
	rprO9pVHeD9oMlht7UQO9U2c0FRd80XkldytO5OIjt9mQj0PR69DC4r0AckUboACF8EV
	XyLYHsT4tLuqArElK9DuRM8dRxlvLEr+DlRIcxSDQPIYJptbyvz2+cY1CsTokZcQpgVj
	Ik6pXRoZeBBWbWmnqbHUkZAIzjjJKinidXy6VPp8eiwjl7z0O67k2HXEwYDaQVmx2Lnp
	60Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3lmEGWDAxsbH2kDLrvkZ+HL+nlmIL/IzhrKToScUDh4=;
	b=CAdDQOcs39/FSd+GMn46uNrsMBR7Kd1lh6DIzElpTYTEG+8X6yU8wmqUKdTsw50dvX
	dP3DKDcKIq8GC7BNK4GgZGZUKNX5rghlZiGzZas53cXrdSycnEWAJMyfU7rKytMbWi31
	GVl4gK8Lcw/Kxcrx2CmGyMzf+FiFbWkKX+pApBoTzCSzFQfDfow9t2hbADcd8x5geZLT
	gGAeM3WrUDUFVVZwyoiHndcyJ0jkKQLsmBGuRdFN2n8a/ZVr8T7MhsOwPYxR+vlKSZFD
	vhXN4NbfwGCgKUXGTjRQRteW0v6ZkCWpYee3kgRApOXJdjDTFTBIfx49FpL5IGIPBbe3
	zhZw==
X-Gm-Message-State: AKS2vOx9dusrFuCkItJwKjtEQpy3lz0aP1Aix5sbyj8Y31rm/Ila/IrL
	c0H6nPK89x90RvooNvdmIVSRqM8hdw==
X-Received: by 10.202.237.133 with SMTP id l127mr25419604oih.128.1499299439086;
	Wed, 05 Jul 2017 17:03:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.74.11.219 with HTTP; Wed, 5 Jul 2017 17:03:58 -0700 (PDT)
Received: by 10.74.11.219 with HTTP; Wed, 5 Jul 2017 17:03:58 -0700 (PDT)
In-Reply-To: <CAOCHtYhAihOvX3TRijFyc6ArMtBW23boDrEezVLOW6ECcCqaXg@mail.gmail.com>
References: <bc6ae1fe-32e2-5afe-8d26-0e9b3676cc2b@gmail.com>
	<CAOCHtYhAihOvX3TRijFyc6ArMtBW23boDrEezVLOW6ECcCqaXg@mail.gmail.com>
From: Riko Ho <antonius.riko@gmail.com>
Date: Thu, 6 Jul 2017 08:03:58 +0800
Message-ID: <CAByQQ_r5oVJio+Ze8xE2w8QhLGH0g8QupKaWMRh7FseVgaB7tg@mail.gmail.com>
To: Robert Nelson <robertcnelson@gmail.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: boot/dtbs/4.4.54-ti-r93/am335x-boneblack.dtb
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
X-List-Received-Date: Thu, 06 Jul 2017 00:04:03 -0000
Content-Type: multipart/alternative; boundary="001a113df2de7a906305539ada0f"

--001a113df2de7a906305539ada0f
Content-Type: text/plain; charset="UTF-8"

Dear Meta TI Team Member,

I want to use SPI0 and used kernel from yoc to. I have added SPI0 node
patch on bone*.Black.dts. I ll send later on for verifying. I m not on my
dev computer now.

I can get dev/spidev1.0. did a loopback. It s running. But all 0000. There
s a bug when it was started booting. I ll show you later.
I ve checked the cable. Tested with Debian image, was working.

How can I use meta ti kernel with Linux yocto kernel ? Merging isn't it?
I did menu config on Linux yocto kernel and enable SPI option, was it
right? Or ?

/*******/
Sent by Android 4.4.2,
Regards,
Riko Ho
/*******/
On Jul 6, 2017 1:26 AM, "Robert Nelson" <robertcnelson@gmail.com> wrote:

> On Tue, Jul 4, 2017 at 9:58 PM, Riko Ho <antonius.riko@gmail.com> wrote:
> > Dear meta-ti Team Member,
> >
> > Is it possible that I use this dtb with beagle yocto kernel ? if it is,
> how
> > to do that ?
> >
> > loading /boot/dtbs/4.4.54-ti-r93/am335x-boneblack.dtb
> > --
>
> Riko,
>
> You can try loading that *.dtb with meta-ti's kernel, but it won't use
> the kernel overlay features built-into the *.dtb as the meta-ti tree
> lacks those out-of-tree-in-development-etc overlay patches.
>
> Regards,
>
> --
> Robert Nelson
> https://rcn-ee.com/
>

--001a113df2de7a906305539ada0f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Dear Meta TI Team Member,</p>
<p dir=3D"ltr">I want to use SPI0 and used kernel from yoc to. I have added=
 SPI0 node patch on bone*.Black.dts. I ll send later on for verifying. I m =
not on my dev computer now.</p>
<p dir=3D"ltr">I can get dev/spidev1.0. did a loopback. It s running. But a=
ll 0000. There s a bug when it was started booting. I ll show you later.<br=
>
I ve checked the cable. Tested with Debian image, was working.</p>
<p dir=3D"ltr">How can I use meta ti kernel with Linux yocto kernel ? Mergi=
ng isn&#39;t it?<br>
I did menu config on Linux yocto kernel and enable SPI option, was it right=
? Or ?<br></p>
<p dir=3D"ltr">/*******/<br>
Sent by Android 4.4.2, <br>
Regards, <br>
Riko Ho<br>
/*******/</p>
<div class=3D"gmail_quote">On Jul 6, 2017 1:26 AM, &quot;Robert Nelson&quot=
; &lt;<a href=3D"mailto:robertcnelson@gmail.com">robertcnelson@gmail.com</a=
>&gt; wrote:<br type=3D"attribution"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Tue,=
 Jul 4, 2017 at 9:58 PM, Riko Ho &lt;<a href=3D"mailto:antonius.riko@gmail.=
com">antonius.riko@gmail.com</a>&gt; wrote:<br>
&gt; Dear meta-ti Team Member,<br>
&gt;<br>
&gt; Is it possible that I use this dtb with beagle yocto kernel ? if it is=
, how<br>
&gt; to do that ?<br>
&gt;<br>
&gt; loading /boot/dtbs/4.4.54-ti-r93/<wbr>am335x-boneblack.dtb<br>
&gt; --<br>
<br>
Riko,<br>
<br>
You can try loading that *.dtb with meta-ti&#39;s kernel, but it won&#39;t =
use<br>
the kernel overlay features built-into the *.dtb as the meta-ti tree<br>
lacks those out-of-tree-in-development-etc overlay patches.<br>
<br>
Regards,<br>
<br>
--<br>
Robert Nelson<br>
<a href=3D"https://rcn-ee.com/" rel=3D"noreferrer" target=3D"_blank">https:=
//rcn-ee.com/</a><br>
</blockquote></div>

--001a113df2de7a906305539ada0f--
