Return-Path: <kenny@understoryweather.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 520F0E009C2; Mon, 26 Jun 2017 21:51:44 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, HTML_MESSAGE, RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.217.181 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ua0-f181.google.com (mail-ua0-f181.google.com
	[209.85.217.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CBEBAE00524
	for <meta-ti@yoctoproject.org>; Mon, 26 Jun 2017 21:51:41 -0700 (PDT)
Received: by mail-ua0-f181.google.com with SMTP id 70so12224176uau.0
	for <meta-ti@yoctoproject.org>; Mon, 26 Jun 2017 21:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=understoryweather-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=yzdFLJzZ/Rn6H/w8yCbxVvttV77Z24TsXyCxNqwuxZ0=;
	b=Sz6xronrIZujnT3VgSQSN6blCRWfi97KDSs5t3bgec5NlwSAZBB5cwni9Wm8v9/r0d
	SHMrLyqA32oPLEFE14vfAEghRwomsA9ixpteWxthJX/Vb9ZkVfteGXX8FT6HQ8blry7l
	G+pS5K04ZbqNCjKH7bM0Z4NmtWiina5ChXa+AQDmWah5MonNok4/TpM3UWLv03mk0keP
	4jyinfGfNm4hVxx+n2YxCXWyRW5q/gaaXO56JchuHounczKjkBFDJboWa9lbL39xPxko
	6GXgr0rl919Fhn5lO9C6EI6FsBY26MDNQ8qghWE8F9+/XgjeIurEqPkQQFXvLp6DszKr
	+Fig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yzdFLJzZ/Rn6H/w8yCbxVvttV77Z24TsXyCxNqwuxZ0=;
	b=QauU2M+8LIRX57E/HfmHFXd25YrEqI7i1Rhhq6s9/TRViv+pJLfh8/irFLVQMWpMgM
	FsgNek5nv0SCB3stvB810ByXMsU80rEKRwZ15frZ/tsV4DqrkgW30+3xgEIUU8KAv/3z
	CHUcSj42jLXy78y9ftGkGJeFus1fwhh6JlC2WRrAfiUJt9V5oHCGYXSnqJH7uq4u8f2/
	lcw8IWKs4ITwebp9fHopWWg4v2w+mhvHYKdG35WSJeR7oFJqZzC9CHJgYOgFgoRVgQ3F
	uXITUoE84MYEejXHdWVkMU+mmAoTK54YHTCK20vr4eg6+59kSY4lynTI4QQ2na75Fdgj
	FIJg==
X-Gm-Message-State: AKS2vOyNwOaAxJAzGxMWXhEJUsoTkuTXk6LDP4LL4zvMxZCeZdQcdkXs
	1L6eM9no46xTiZuRuRPQfO6lhW60X0J5
X-Received: by 10.176.90.211 with SMTP id x19mr2092984uae.129.1498539100317;
	Mon, 26 Jun 2017 21:51:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAPtqgUwJnmq+TNdrr7odqrpfwsxE8Z=c8GKnNez3maf6wBUupw@mail.gmail.com>
	<20170626185315.GF14665@edge>
In-Reply-To: <20170626185315.GF14665@edge>
From: Kenny Koller <kenny@understoryweather.com>
Date: Tue, 27 Jun 2017 04:51:29 +0000
Message-ID: <CAPtqgUzXj_EyGbSWFNxsEyGwBKSH2PV+d7RsvrzPJ_DuGyXVzA@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: install cannot stat u-boot.img (Pyro)
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
X-List-Received-Date: Tue, 27 Jun 2017 04:51:44 -0000
Content-Type: multipart/alternative; boundary="f403045f85bac1c1ea0552e9d205"

--f403045f85bac1c1ea0552e9d205
Content-Type: text/plain; charset="UTF-8"

I'm not sure if I should be using it. When I look at the meta-ti repository
it doesn't seem current with the Poky releases. Furthermore it seems that
meta-yocto-bsp contains recipes for Beaglebone. It's not clear to me which
layer has a recipe for Das U-Boot.

All I did was clone Poky. Checkout Pyro. Edited my local.conf to
MACHINE='beaglebone'. And `bitbake core-image-minimal`.

On Mon, Jun 26, 2017 at 11:53 AM Denys Dmytriyenko <denys@ti.com> wrote:

> Do you use meta-ti layer?
>
>
> On Sat, Jun 24, 2017 at 02:50:32AM +0000, Kenny Koller wrote:
> > Hi,
> >
> > I'm using 2.3 to build the minimal Beaglebone Black images.
> >
> > I issue the following and get the error below. Is the warning regarding a
> > missing bootloader config the issue?
> >
> > Thanks,
> >
> > Kenny
> >
> > $ bitbake core-image-minimal
> >
> > | INFO: Creating image(s)...
> > |
> > | WARNING: bootloader config not specified, using defaults
> > |
> > | ERROR: _exec_cmd: install -m 0644 -D
> > /home/ubuntu/yocto/poky/build/tmp/deploy/images/beaglebone/u-boot.img
> >
> /home/ubuntu/yocto/poky/build/tmp/work/beaglebone-poky-linux-gnueabi/core-image-minimal/1.0-r0/deploy-core-image-minimal-image-complete/core-image-minimal-beaglebone-20170624014756/tmp.wic.khxryxga/boot/u-boot.img
> > returned '1' instead of 0
> > | output: install: cannot stat
> > '/home/ubuntu/yocto/poky/build/tmp/deploy/images/beaglebone/u-boot.img':
> No
> > such file or directory
> > |
> > | WARNING: exit code 1 from a shell command.
> > | ERROR: Function failed: do_image_wic (log file is located at
> >
> /home/ubuntu/yocto/poky/build/tmp/work/beaglebone-poky-linux-gnueabi/core-image-minimal/1.0-r0/temp/log.do_image_wic.12719)
> > ERROR: Task
> > (/home/ubuntu/yocto/poky/meta/recipes-core/images/core-image-minimal.bb:
> do_image_wic)
> > failed with exit code '1'
> > NOTE: Tasks Summary: Attempted 2263 tasks of which 2252 didn't need to be
> > rerun and 1 failed.
> >
> > Summary: 1 task failed:
> >   /home/ubuntu/yocto/poky/meta/recipes-core/images/core-image-minimal.bb
> :
> > do_image_wic
> > Summary: There was 1 ERROR message shown, returning a non-zero exit code.
>
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
>
>

--f403045f85bac1c1ea0552e9d205
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m not sure if I should be using it. When I look at t=
he meta-ti repository it doesn&#39;t seem current with the Poky releases. F=
urthermore it seems that meta-yocto-bsp contains recipes for Beaglebone. It=
&#39;s not clear to me which layer has a recipe for Das U-Boot.<div><br></d=
iv><div>All I did was clone Poky. Checkout Pyro. Edited my local.conf to MA=
CHINE=3D&#39;beaglebone&#39;. And `bitbake core-image-minimal`.</div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon, Jun 26, 2017 at 11:=
53 AM Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com">denys@ti.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Do you use meta-ti lay=
er?<br>
<br>
<br>
On Sat, Jun 24, 2017 at 02:50:32AM +0000, Kenny Koller wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; I&#39;m using 2.3 to build the minimal Beaglebone Black images.<br>
&gt;<br>
&gt; I issue the following and get the error below. Is the warning regardin=
g a<br>
&gt; missing bootloader config the issue?<br>
&gt;<br>
&gt; Thanks,<br>
&gt;<br>
&gt; Kenny<br>
&gt;<br>
&gt; $ bitbake core-image-minimal<br>
&gt;<br>
&gt; | INFO: Creating image(s)...<br>
&gt; |<br>
&gt; | WARNING: bootloader config not specified, using defaults<br>
&gt; |<br>
&gt; | ERROR: _exec_cmd: install -m 0644 -D<br>
&gt; /home/ubuntu/yocto/poky/build/tmp/deploy/images/beaglebone/u-boot.img<=
br>
&gt; /home/ubuntu/yocto/poky/build/tmp/work/beaglebone-poky-linux-gnueabi/c=
ore-image-minimal/1.0-r0/deploy-core-image-minimal-image-complete/core-imag=
e-minimal-beaglebone-20170624014756/tmp.wic.khxryxga/boot/u-boot.img<br>
&gt; returned &#39;1&#39; instead of 0<br>
&gt; | output: install: cannot stat<br>
&gt; &#39;/home/ubuntu/yocto/poky/build/tmp/deploy/images/beaglebone/u-boot=
.img&#39;: No<br>
&gt; such file or directory<br>
&gt; |<br>
&gt; | WARNING: exit code 1 from a shell command.<br>
&gt; | ERROR: Function failed: do_image_wic (log file is located at<br>
&gt; /home/ubuntu/yocto/poky/build/tmp/work/beaglebone-poky-linux-gnueabi/c=
ore-image-minimal/1.0-r0/temp/log.do_image_wic.12719)<br>
&gt; ERROR: Task<br>
&gt; (/home/ubuntu/yocto/poky/meta/recipes-core/images/core-image-minimal.b=
b:do_image_wic)<br>
&gt; failed with exit code &#39;1&#39;<br>
&gt; NOTE: Tasks Summary: Attempted 2263 tasks of which 2252 didn&#39;t nee=
d to be<br>
&gt; rerun and 1 failed.<br>
&gt;<br>
&gt; Summary: 1 task failed:<br>
&gt;=C2=A0 =C2=A0/home/ubuntu/yocto/poky/meta/recipes-core/images/<a href=
=3D"http://core-image-minimal.bb" rel=3D"noreferrer" target=3D"_blank">core=
-image-minimal.bb</a>:<br>
&gt; do_image_wic<br>
&gt; Summary: There was 1 ERROR message shown, returning a non-zero exit co=
de.<br>
<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; meta-ti mailing list<br>
&gt; <a href=3D"mailto:meta-ti@yoctoproject.org" target=3D"_blank">meta-ti@=
yoctoproject.org</a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" rel=3D"nor=
eferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-ti<=
/a><br>
<br>
</blockquote></div>

--f403045f85bac1c1ea0552e9d205--
