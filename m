Return-Path: <kenny@understoryweather.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4A5B5E00B65; Tue, 27 Jun 2017 10:12:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, HTML_MESSAGE, RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.217.176 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ua0-f176.google.com (mail-ua0-f176.google.com
	[209.85.217.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 97340E00B1B
	for <meta-ti@yoctoproject.org>; Tue, 27 Jun 2017 10:12:13 -0700 (PDT)
Received: by mail-ua0-f176.google.com with SMTP id g40so22610600uaa.3
	for <meta-ti@yoctoproject.org>; Tue, 27 Jun 2017 10:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=understoryweather-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iHLA3mdfcpY4XuqWy1+th52+fD3VhGo1KkPnpwmGgpE=;
	b=mMW5Et1hNOWudRd7OhGX/pCLCEOWNhhLk9Sdxc1wh5WQG9Fm1ABpy1DwRm7CYwU3IV
	hzMrs9H7+63rFxJIuSHQtHKbVvif6Xd25IoVBop3uJHOjH1ed7POcqI58EQHCc8UJoim
	2Y5qMXTn1s5ly57gHp3rqzeZ6Iy7pBit6tGAKaghalnZq706GJVMxW9Nrw2A7es3Zyvt
	KZGcnXYauWZGRfqjtxxBkMqbvCpTHTGD6JGXOZcEWP5ucNoBS5dkTxj4RanUh0prpc/l
	6yOTho2SSra7UtPYuJA1KNbrtTnlxIJlHltArxU3GZWFILweV1/UJJmQTszt79QLykSd
	sh3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iHLA3mdfcpY4XuqWy1+th52+fD3VhGo1KkPnpwmGgpE=;
	b=nkIJNp0aNt/PZPW454cP6romZ8Pki7VkfMwD8VHV39mGmYRGsq/xrhUquNAdiov1Ww
	5z+fvV+nfD6OXy/4o7O5gLpEDf8LMi1a+Zg/RglgGdySHdpUPUUcpC/5cm5R5pBzHRFd
	oojBSDF8dJTSKGeeaILP+4y3hGZKXO3AgkQvfPTbfJC743s8E8xINvHM+ZYx76y2htA/
	2IywoPV8TH25yh+3E0+rL+toAEUk2dXnaOB6sjNh+QGuT22a4OJifMjHL0A1snWI0DMo
	Hob7v5XIeEShUCQ0JnEZZPQJp8NO99/zsfo+7i7Eaj1pNj4ulIMGMu0rEhHoFo+OTuDO
	OCNw==
X-Gm-Message-State: AKS2vOyCKSGxO6Ww0yfen2oyCsmF/bEw1enmbl0C3kFpw+GahVMxA78V
	YX3lT484qAwJwzOFgnFJpEUsYW2IaG8Z
X-Received: by 10.176.71.19 with SMTP id h19mr3809648uac.138.1498583532624;
	Tue, 27 Jun 2017 10:12:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.120.11 with HTTP; Tue, 27 Jun 2017 10:12:12 -0700 (PDT)
In-Reply-To: <20170627162214.GH14665@edge>
References: <CAPtqgUwJnmq+TNdrr7odqrpfwsxE8Z=c8GKnNez3maf6wBUupw@mail.gmail.com>
	<20170626185315.GF14665@edge>
	<CAPtqgUzXj_EyGbSWFNxsEyGwBKSH2PV+d7RsvrzPJ_DuGyXVzA@mail.gmail.com>
	<20170627162214.GH14665@edge>
From: Kenny Koller <kenny@understoryweather.com>
Date: Tue, 27 Jun 2017 10:12:12 -0700
Message-ID: <CAPtqgUyyRVCsB+ie8Tif6DV7ak-V58ZdoDoED1RBtkTpFseSgA@mail.gmail.com>
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
X-List-Received-Date: Tue, 27 Jun 2017 17:12:16 -0000
Content-Type: multipart/alternative; boundary="f403045f08ce20fb320552f42b91"

--f403045f08ce20fb320552f42b91
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 27, 2017 at 9:22 AM, Denys Dmytriyenko <denys@ti.com> wrote:

> Well, meta-ti is quite active and is current. If by current you mean "pyro"
> branch, then it's not an indication and there was an explanation on the
> list.
>

Yes. I see the activity on this list (no offense meant). New to the list so
probably missed any explanation.


>
> But in general, if you are not using meta-ti layer, why are you posting
> error
> messages to meta-ti list?
>

Because it's not clear which layers are required for the Beaglebone build
(as I mention in my previous response). It occurred to me that perhaps
meta-ti must be included to build the bootloaders. As far as I can tell
there is no explicit mention of which layers are required. I think the
answer is that Poky includes everything that is required but my build
failed for a reason that was unclear.

I can hop off this list if it has nothing to do with the Beaglebone
processor.


>
>
> On Tue, Jun 27, 2017 at 04:51:29AM +0000, Kenny Koller wrote:
> > I'm not sure if I should be using it. When I look at the meta-ti
> repository
> > it doesn't seem current with the Poky releases. Furthermore it seems that
> > meta-yocto-bsp contains recipes for Beaglebone. It's not clear to me
> which
> > layer has a recipe for Das U-Boot.
> >
> > All I did was clone Poky. Checkout Pyro. Edited my local.conf to
> > MACHINE='beaglebone'. And `bitbake core-image-minimal`.
> >
> > On Mon, Jun 26, 2017 at 11:53 AM Denys Dmytriyenko <denys@ti.com> wrote:
> >
> > > Do you use meta-ti layer?
> > >
> > >
> > > On Sat, Jun 24, 2017 at 02:50:32AM +0000, Kenny Koller wrote:
> > > > Hi,
> > > >
> > > > I'm using 2.3 to build the minimal Beaglebone Black images.
> > > >
> > > > I issue the following and get the error below. Is the warning
> regarding a
> > > > missing bootloader config the issue?
> > > >
> > > > Thanks,
> > > >
> > > > Kenny
> > > >
> > > > $ bitbake core-image-minimal
> > > >
> > > > | INFO: Creating image(s)...
> > > > |
> > > > | WARNING: bootloader config not specified, using defaults
> > > > |
> > > > | ERROR: _exec_cmd: install -m 0644 -D
> > > > /home/ubuntu/yocto/poky/build/tmp/deploy/images/beaglebone/
> u-boot.img
> > > >
> > > /home/ubuntu/yocto/poky/build/tmp/work/beaglebone-poky-
> linux-gnueabi/core-image-minimal/1.0-r0/deploy-core-
> image-minimal-image-complete/core-image-minimal-beaglebone-
> 20170624014756/tmp.wic.khxryxga/boot/u-boot.img
> > > > returned '1' instead of 0
> > > > | output: install: cannot stat
> > > > '/home/ubuntu/yocto/poky/build/tmp/deploy/images/
> beaglebone/u-boot.img':
> > > No
> > > > such file or directory
> > > > |
> > > > | WARNING: exit code 1 from a shell command.
> > > > | ERROR: Function failed: do_image_wic (log file is located at
> > > >
> > > /home/ubuntu/yocto/poky/build/tmp/work/beaglebone-poky-
> linux-gnueabi/core-image-minimal/1.0-r0/temp/log.do_image_wic.12719)
> > > > ERROR: Task
> > > > (/home/ubuntu/yocto/poky/meta/recipes-core/images/core-
> image-minimal.bb:
> > > do_image_wic)
> > > > failed with exit code '1'
> > > > NOTE: Tasks Summary: Attempted 2263 tasks of which 2252 didn't need
> to be
> > > > rerun and 1 failed.
> > > >
> > > > Summary: 1 task failed:
> > > >   /home/ubuntu/yocto/poky/meta/recipes-core/images/core-
> image-minimal.bb
> > > :
> > > > do_image_wic
> > > > Summary: There was 1 ERROR message shown, returning a non-zero exit
> code.
> > >
> > > > --
> > > > _______________________________________________
> > > > meta-ti mailing list
> > > > meta-ti@yoctoproject.org
> > > > https://lists.yoctoproject.org/listinfo/meta-ti
> > >
> > >
>

--f403045f08ce20fb320552f42b91
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Jun 27, 2017 at 9:22 AM, Denys Dmytriyenko <span dir=3D"ltr">&l=
t;<a href=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">Well, meta-ti is quite active=
 and is current. If by current you mean &quot;pyro&quot;<br>
branch, then it&#39;s not an indication and there was an explanation on the=
 list.<br></blockquote><div><br></div><div>Yes. I see the activity on this =
list (no offense meant). New to the list so probably missed any explanation=
.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
But in general, if you are not using meta-ti layer, why are you posting err=
or<br>
messages to meta-ti list?<br></blockquote><div><br></div><div>Because it&#3=
9;s not clear which layers are required for the Beaglebone build (as I ment=
ion in my previous response). It occurred to me that perhaps meta-ti must b=
e included to build the bootloaders. As far as I can tell there is no expli=
cit mention of which layers are required. I think the answer is that Poky i=
ncludes everything that is required but my build failed for a reason that w=
as unclear.</div><div><br></div><div>I can hop off this list if it has noth=
ing to do with the Beaglebone processor.</div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">
<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
On Tue, Jun 27, 2017 at 04:51:29AM +0000, Kenny Koller wrote:<br>
&gt; I&#39;m not sure if I should be using it. When I look at the meta-ti r=
epository<br>
&gt; it doesn&#39;t seem current with the Poky releases. Furthermore it see=
ms that<br>
&gt; meta-yocto-bsp contains recipes for Beaglebone. It&#39;s not clear to =
me which<br>
&gt; layer has a recipe for Das U-Boot.<br>
&gt;<br>
&gt; All I did was clone Poky. Checkout Pyro. Edited my local.conf to<br>
&gt; MACHINE=3D&#39;beaglebone&#39;. And `bitbake core-image-minimal`.<br>
&gt;<br>
&gt; On Mon, Jun 26, 2017 at 11:53 AM Denys Dmytriyenko &lt;<a href=3D"mail=
to:denys@ti.com">denys@ti.com</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; Do you use meta-ti layer?<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; On Sat, Jun 24, 2017 at 02:50:32AM +0000, Kenny Koller wrote:<br>
&gt; &gt; &gt; Hi,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I&#39;m using 2.3 to build the minimal Beaglebone Black imag=
es.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I issue the following and get the error below. Is the warnin=
g regarding a<br>
&gt; &gt; &gt; missing bootloader config the issue?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Thanks,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Kenny<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; $ bitbake core-image-minimal<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; | INFO: Creating image(s)...<br>
&gt; &gt; &gt; |<br>
&gt; &gt; &gt; | WARNING: bootloader config not specified, using defaults<b=
r>
&gt; &gt; &gt; |<br>
&gt; &gt; &gt; | ERROR: _exec_cmd: install -m 0644 -D<br>
&gt; &gt; &gt; /home/ubuntu/yocto/poky/build/<wbr>tmp/deploy/images/beagleb=
one/<wbr>u-boot.img<br>
&gt; &gt; &gt;<br>
&gt; &gt; /home/ubuntu/yocto/poky/build/<wbr>tmp/work/beaglebone-poky-<wbr>=
linux-gnueabi/core-image-<wbr>minimal/1.0-r0/deploy-core-<wbr>image-minimal=
-image-complete/<wbr>core-image-minimal-beaglebone-<wbr>20170624014756/tmp.=
wic.<wbr>khxryxga/boot/u-boot.img<br>
&gt; &gt; &gt; returned &#39;1&#39; instead of 0<br>
&gt; &gt; &gt; | output: install: cannot stat<br>
&gt; &gt; &gt; &#39;/home/ubuntu/yocto/poky/<wbr>build/tmp/deploy/images/<w=
br>beaglebone/u-boot.img&#39;:<br>
&gt; &gt; No<br>
&gt; &gt; &gt; such file or directory<br>
&gt; &gt; &gt; |<br>
&gt; &gt; &gt; | WARNING: exit code 1 from a shell command.<br>
&gt; &gt; &gt; | ERROR: Function failed: do_image_wic (log file is located =
at<br>
&gt; &gt; &gt;<br>
&gt; &gt; /home/ubuntu/yocto/poky/build/<wbr>tmp/work/beaglebone-poky-<wbr>=
linux-gnueabi/core-image-<wbr>minimal/1.0-r0/temp/log.do_<wbr>image_wic.127=
19)<br>
&gt; &gt; &gt; ERROR: Task<br>
&gt; &gt; &gt; (/home/ubuntu/yocto/poky/meta/<wbr>recipes-core/images/<a hr=
ef=3D"http://core-image-minimal.bb" rel=3D"noreferrer" target=3D"_blank">co=
re-<wbr>image-minimal.bb</a>:<br>
&gt; &gt; do_image_wic)<br>
&gt; &gt; &gt; failed with exit code &#39;1&#39;<br>
&gt; &gt; &gt; NOTE: Tasks Summary: Attempted 2263 tasks of which 2252 didn=
&#39;t need to be<br>
&gt; &gt; &gt; rerun and 1 failed.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Summary: 1 task failed:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0/home/ubuntu/yocto/poky/meta/<wbr>recipes-core/i=
mages/<a href=3D"http://core-image-minimal.bb" rel=3D"noreferrer" target=3D=
"_blank">core-<wbr>image-minimal.bb</a><br>
&gt; &gt; :<br>
&gt; &gt; &gt; do_image_wic<br>
&gt; &gt; &gt; Summary: There was 1 ERROR message shown, returning a non-ze=
ro exit code.<br>
&gt; &gt;<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; ______________________________<wbr>_________________<br>
&gt; &gt; &gt; meta-ti mailing list<br>
&gt; &gt; &gt; <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctopro=
ject.org</a><br>
&gt; &gt; &gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" =
rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/li=
stinfo/meta-ti</a><br>
&gt; &gt;<br>
&gt; &gt;<br>
</div></div></blockquote></div><br></div></div>

--f403045f08ce20fb320552f42b91--
