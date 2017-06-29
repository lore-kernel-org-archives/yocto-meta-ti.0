Return-Path: <kenny@understoryweather.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5C8FAE00BDC; Wed, 28 Jun 2017 17:08:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, HTML_MESSAGE, RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.213.50 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-vk0-f50.google.com (mail-vk0-f50.google.com
	[209.85.213.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CB400E00BD5
	for <meta-ti@yoctoproject.org>; Wed, 28 Jun 2017 17:08:40 -0700 (PDT)
Received: by mail-vk0-f50.google.com with SMTP id r125so41928779vkf.1
	for <meta-ti@yoctoproject.org>; Wed, 28 Jun 2017 17:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=understoryweather-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=s/Mo5fnINpcwHNYLbfmdK345EG5Jp1ffEoR+2rkyeBQ=;
	b=sfQh3FYO+pG8EJ/JRjW/+8Gz3hqYAXeF7BEOYOTIxQuQKzMN2GCw70B2jgU/jRLWJZ
	VdhS672cFiV3E/iURYk1SUTTk0qINStlIhRqV3y7jWRydHw/QYkoCY9UpAwHQ3hzXC8L
	Bd9ogRKvuaW5EA8q6k/L+c7AbIHxHfZ+yu7jsPOY60f6A5YcK3Mn+9g9fqbGS7aXyel7
	C5S+fu2mDhjczZp0XvLpb3RZGaSjj/9eYPHhuKtT6aBVatLrRaBvCZUPHKaX0K8ZQlun
	OaCcGQAFzC2VrYeQLrtAEBpcXYaKZLkvtQeD1l/KG1wow1O4sbLRhrgrRwcZ2t9UtBZ/
	HHlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=s/Mo5fnINpcwHNYLbfmdK345EG5Jp1ffEoR+2rkyeBQ=;
	b=nwJQubg+niXB7MnAAQXLe7dmcUkNg2be1D5xh8+6tWkU7RKwxkeu7UqMufmKGTQDDy
	TPTSMZOhLx5OnC8XLz9rFvxokY970I1mkDSqja2DejeyT0N03DrqlnczGuY06P1avCah
	hfjUJ+0KVbdtiWrKpRGr9qWzA0ZVTVvOUTEXca/nlYj/886njzyN8uMXSraVxuQLX7Uq
	OLLAscWXakpWrv8EOLbPCdRMx18VZZMeDJFB4t6x9NE15AZVrd6TznrciHttam09+Nuc
	KWfZOLPEJPeh3HzT92T5wC5nn32u1kqkUlM9WbY/phEuoBQn17nbJufQfsC7V743GGwF
	bqmw==
X-Gm-Message-State: AKS2vOyYTrlz52A6wu9ALN/w64mBdvr/ZclRxWWuhL/tGJxqMZ9LEP00
	nRxUQfzYQvP1fulq75XfEjvibF9shDYk
X-Received: by 10.31.110.71 with SMTP id j68mr6974619vkc.72.1498694919666;
	Wed, 28 Jun 2017 17:08:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAPtqgUwJnmq+TNdrr7odqrpfwsxE8Z=c8GKnNez3maf6wBUupw@mail.gmail.com>
	<20170626185315.GF14665@edge>
	<CAPtqgUzXj_EyGbSWFNxsEyGwBKSH2PV+d7RsvrzPJ_DuGyXVzA@mail.gmail.com>
	<20170627162214.GH14665@edge>
	<CAPtqgUyyRVCsB+ie8Tif6DV7ak-V58ZdoDoED1RBtkTpFseSgA@mail.gmail.com>
	<20170627174450.GJ14665@edge>
	<CAPtqgUwA+BJ09ywinOMVgAc-WT0621-SZLfiajK1QOVQvSwyBg@mail.gmail.com>
In-Reply-To: <CAPtqgUwA+BJ09ywinOMVgAc-WT0621-SZLfiajK1QOVQvSwyBg@mail.gmail.com>
From: Kenny Koller <kenny@understoryweather.com>
Date: Thu, 29 Jun 2017 00:08:29 +0000
Message-ID: <CAPtqgUxroso8jeUdDi+K-4nPDjvC=7ygYz1Nz5bfSPdYPmQ7fw@mail.gmail.com>
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
X-List-Received-Date: Thu, 29 Jun 2017 00:08:42 -0000
Content-Type: multipart/alternative; boundary="94eb2c1437fe5053b505530e1ab5"

--94eb2c1437fe5053b505530e1ab5
Content-Type: text/plain; charset="UTF-8"

Hi Denys,

My build issues were because of too little RAM. I fired up a much more
powerful AWS instance and built everything to completion in 40 minutes.

To use meta-ti: Just add to bblayers.conf and remove meta-yocto-bsp?

On Wed, Jun 28, 2017 at 9:20 AM Kenny Koller <kenny@understoryweather.com>
wrote:

> Thanks Denys. I read through the links and even your slides via the
> "yumminess" post on Yocto. Thanks for all the good work.
>
> I feel like I should be building against meta-ti. This is for an actual
> remote product (no GUI) with several hundred instances and I'm trying to
> build a small distro that has just what I need. What exists is a hybrid of
> two debian releases and a backported kernel and I'd like to get that under
> control.
>
> Your post clarifies the layers but if I want to use meta-ti with
> Poky/Morty (presumably the correct choice) what must I do? Also this link
> <https://www.yoctoproject.org/product/meta-ti-bsp-layer> suggests that
> meta-ti is compatible with Yocto 1.6. I assume that's just outdated
> information..
>
> This link <http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/about/>
> suggests that the layer depends on openembedded-core. Is this true or is
> this now folded in to Poky?
>
> I'm beginning to work on a new hardware design that integrates one of the
> TI Cortex-A solutions on to a single board (rather than the Beaglebone
> black mated to our board) so I'm motivated to sort all of this out.
>
> Best regards,
>
> Kenny
>
> On Tue, Jun 27, 2017 at 10:44 AM Denys Dmytriyenko <denys@ti.com> wrote:
>
>> On Tue, Jun 27, 2017 at 10:12:12AM -0700, Kenny Koller wrote:
>> > On Tue, Jun 27, 2017 at 9:22 AM, Denys Dmytriyenko <denys@ti.com>
>> wrote:
>> >
>> > > Well, meta-ti is quite active and is current. If by current you mean
>> "pyro"
>> > > branch, then it's not an indication and there was an explanation on
>> the
>> > > list.
>> >
>> > Yes. I see the activity on this list (no offense meant). New to the
>> list so
>> > probably missed any explanation.
>>
>> Activity in git:
>> http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/
>>
>> Reply to "pyro" branch question:
>> https://lists.yoctoproject.org/pipermail/meta-ti/2017-June/010023.html
>>
>>
>> > > But in general, if you are not using meta-ti layer, why are you
>> posting
>> > > error
>> > > messages to meta-ti list?
>> >
>> > Because it's not clear which layers are required for the Beaglebone
>> build
>> > (as I mention in my previous response). It occurred to me that perhaps
>> > meta-ti must be included to build the bootloaders. As far as I can tell
>> > there is no explicit mention of which layers are required. I think the
>> > answer is that Poky includes everything that is required but my build
>> > failed for a reason that was unclear.
>>
>> Some time ago I gave this explanation of layers for BeagleBone:
>> https://lists.yoctoproject.org/pipermail/yocto/2014-October/021819.html
>>
>> Most of that still stands today and both meta-ti and meta-yocto-bsp
>> provide
>> own versions of u-boot.
>>
>>
>> > I can hop off this list if it has nothing to do with the Beaglebone
>> > processor.
>>
>> meta-ti has everything to do with BeagleBone, but you are not using it.
>> You
>> are using meta-yocto-bsp - it does provide upstream versions of u-boot
>> and the
>> linux kernel and normally just works for BeagleBone. What the exact issue
>> with
>> "pyro" in your case, I'm not sure.
>>
>> --
>> Denys
>>
>>
>> > > On Tue, Jun 27, 2017 at 04:51:29AM +0000, Kenny Koller wrote:
>> > > > I'm not sure if I should be using it. When I look at the meta-ti
>> > > repository
>> > > > it doesn't seem current with the Poky releases. Furthermore it
>> seems that
>> > > > meta-yocto-bsp contains recipes for Beaglebone. It's not clear to me
>> > > which
>> > > > layer has a recipe for Das U-Boot.
>> > > >
>> > > > All I did was clone Poky. Checkout Pyro. Edited my local.conf to
>> > > > MACHINE='beaglebone'. And `bitbake core-image-minimal`.
>> > > >
>> > > > On Mon, Jun 26, 2017 at 11:53 AM Denys Dmytriyenko <denys@ti.com>
>> wrote:
>> > > >
>> > > > > Do you use meta-ti layer?
>> > > > >
>> > > > >
>> > > > > On Sat, Jun 24, 2017 at 02:50:32AM +0000, Kenny Koller wrote:
>> > > > > > Hi,
>> > > > > >
>> > > > > > I'm using 2.3 to build the minimal Beaglebone Black images.
>> > > > > >
>> > > > > > I issue the following and get the error below. Is the warning
>> > > regarding a
>> > > > > > missing bootloader config the issue?
>> > > > > >
>> > > > > > Thanks,
>> > > > > >
>> > > > > > Kenny
>> > > > > >
>> > > > > > $ bitbake core-image-minimal
>> > > > > >
>> > > > > > | INFO: Creating image(s)...
>> > > > > > |
>> > > > > > | WARNING: bootloader config not specified, using defaults
>> > > > > > |
>> > > > > > | ERROR: _exec_cmd: install -m 0644 -D
>> > > > > > /home/ubuntu/yocto/poky/build/tmp/deploy/images/beaglebone/
>> > > u-boot.img
>> > > > > >
>> > > > > /home/ubuntu/yocto/poky/build/tmp/work/beaglebone-poky-
>> > > linux-gnueabi/core-image-minimal/1.0-r0/deploy-core-
>> > > image-minimal-image-complete/core-image-minimal-beaglebone-
>> > > 20170624014756/tmp.wic.khxryxga/boot/u-boot.img
>> > > > > > returned '1' instead of 0
>> > > > > > | output: install: cannot stat
>> > > > > > '/home/ubuntu/yocto/poky/build/tmp/deploy/images/
>> > > beaglebone/u-boot.img':
>> > > > > No
>> > > > > > such file or directory
>> > > > > > |
>> > > > > > | WARNING: exit code 1 from a shell command.
>> > > > > > | ERROR: Function failed: do_image_wic (log file is located at
>> > > > > >
>> > > > > /home/ubuntu/yocto/poky/build/tmp/work/beaglebone-poky-
>> > > linux-gnueabi/core-image-minimal/1.0-r0/temp/log.do_image_wic.12719)
>> > > > > > ERROR: Task
>> > > > > > (/home/ubuntu/yocto/poky/meta/recipes-core/images/core-
>> > > image-minimal.bb:
>> > > > > do_image_wic)
>> > > > > > failed with exit code '1'
>> > > > > > NOTE: Tasks Summary: Attempted 2263 tasks of which 2252 didn't
>> need
>> > > to be
>> > > > > > rerun and 1 failed.
>> > > > > >
>> > > > > > Summary: 1 task failed:
>> > > > > >   /home/ubuntu/yocto/poky/meta/recipes-core/images/core-
>> > > image-minimal.bb
>> > > > > :
>> > > > > > do_image_wic
>> > > > > > Summary: There was 1 ERROR message shown, returning a non-zero
>> exit
>> > > code.
>> > > > >
>> > > > > > --
>> > > > > > _______________________________________________
>> > > > > > meta-ti mailing list
>> > > > > > meta-ti@yoctoproject.org
>> > > > > > https://lists.yoctoproject.org/listinfo/meta-ti
>> > > > >
>> > > > >
>> > >
>>
>

--94eb2c1437fe5053b505530e1ab5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Denys,<div><br></div><div>My build issues were because =
of too little RAM. I fired up a much more powerful AWS instance and built e=
verything to completion in 40 minutes.</div><div><br></div><div>To use meta=
-ti: Just add to bblayers.conf and remove meta-yocto-bsp?</div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr">On Wed, Jun 28, 2017 at 9:20 AM K=
enny Koller &lt;<a href=3D"mailto:kenny@understoryweather.com">kenny@unders=
toryweather.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div=
 dir=3D"ltr">Thanks Denys. I read through the links and even your slides vi=
a the &quot;yumminess&quot; post on Yocto. Thanks for all the good work.<di=
v><br></div><div>I feel like I should be building against meta-ti. This is =
for an actual remote product (no GUI) with several hundred instances and I&=
#39;m trying to build a small distro that has just what I need. What exists=
 is a hybrid of two debian releases and a backported kernel and I&#39;d lik=
e to get that under control.<br></div><div><br></div><div>Your post clarifi=
es the layers but if I want to use meta-ti with Poky/Morty (presumably the =
correct choice) what must I do? Also <a href=3D"https://www.yoctoproject.or=
g/product/meta-ti-bsp-layer" target=3D"_blank">this link</a> suggests that =
meta-ti is compatible with Yocto 1.6. I assume that&#39;s just outdated inf=
ormation..</div><div><br></div><div><a href=3D"http://git.yoctoproject.org/=
cgit/cgit.cgi/meta-ti/about/" target=3D"_blank">This link</a> suggests that=
 the layer depends on openembedded-core. Is this true or is this now folded=
 in to Poky?</div><div><br></div><div>I&#39;m beginning to work on a new ha=
rdware design that integrates one of the TI Cortex-A solutions on to a sing=
le board (rather than the Beaglebone black mated to our board) so I&#39;m m=
otivated to sort all of this out.</div><div><br></div><div>Best regards,</d=
iv><div><br></div><div>Kenny</div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr">On Tue, Jun 27, 2017 at 10:44 AM Denys Dmytriyenko &lt;<a href=
=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">On Tue, Jun 27, 2017 at 10:12:12AM -070=
0, Kenny Koller wrote:<br>
&gt; On Tue, Jun 27, 2017 at 9:22 AM, Denys Dmytriyenko &lt;<a href=3D"mail=
to:denys@ti.com" target=3D"_blank">denys@ti.com</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; Well, meta-ti is quite active and is current. If by current you m=
ean &quot;pyro&quot;<br>
&gt; &gt; branch, then it&#39;s not an indication and there was an explanat=
ion on the<br>
&gt; &gt; list.<br>
&gt;<br>
&gt; Yes. I see the activity on this list (no offense meant). New to the li=
st so<br>
&gt; probably missed any explanation.<br>
<br>
Activity in git:<br>
<a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/" rel=3D"noref=
errer" target=3D"_blank">http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/=
</a><br>
<br>
Reply to &quot;pyro&quot; branch question:<br>
<a href=3D"https://lists.yoctoproject.org/pipermail/meta-ti/2017-June/01002=
3.html" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org=
/pipermail/meta-ti/2017-June/010023.html</a><br>
<br>
<br>
&gt; &gt; But in general, if you are not using meta-ti layer, why are you p=
osting<br>
&gt; &gt; error<br>
&gt; &gt; messages to meta-ti list?<br>
&gt;<br>
&gt; Because it&#39;s not clear which layers are required for the Beaglebon=
e build<br>
&gt; (as I mention in my previous response). It occurred to me that perhaps=
<br>
&gt; meta-ti must be included to build the bootloaders. As far as I can tel=
l<br>
&gt; there is no explicit mention of which layers are required. I think the=
<br>
&gt; answer is that Poky includes everything that is required but my build<=
br>
&gt; failed for a reason that was unclear.<br>
<br>
Some time ago I gave this explanation of layers for BeagleBone:<br>
<a href=3D"https://lists.yoctoproject.org/pipermail/yocto/2014-October/0218=
19.html" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/pipermail/yocto/2014-October/021819.html</a><br>
<br>
Most of that still stands today and both meta-ti and meta-yocto-bsp provide=
<br>
own versions of u-boot.<br>
<br>
<br>
&gt; I can hop off this list if it has nothing to do with the Beaglebone<br=
>
&gt; processor.<br>
<br>
meta-ti has everything to do with BeagleBone, but you are not using it. You=
<br>
are using meta-yocto-bsp - it does provide upstream versions of u-boot and =
the<br>
linux kernel and normally just works for BeagleBone. What the exact issue w=
ith<br>
&quot;pyro&quot; in your case, I&#39;m not sure.<br>
<br>
--<br>
Denys<br>
<br>
<br>
&gt; &gt; On Tue, Jun 27, 2017 at 04:51:29AM +0000, Kenny Koller wrote:<br>
&gt; &gt; &gt; I&#39;m not sure if I should be using it. When I look at the=
 meta-ti<br>
&gt; &gt; repository<br>
&gt; &gt; &gt; it doesn&#39;t seem current with the Poky releases. Furtherm=
ore it seems that<br>
&gt; &gt; &gt; meta-yocto-bsp contains recipes for Beaglebone. It&#39;s not=
 clear to me<br>
&gt; &gt; which<br>
&gt; &gt; &gt; layer has a recipe for Das U-Boot.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; All I did was clone Poky. Checkout Pyro. Edited my local.con=
f to<br>
&gt; &gt; &gt; MACHINE=3D&#39;beaglebone&#39;. And `bitbake core-image-mini=
mal`.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Mon, Jun 26, 2017 at 11:53 AM Denys Dmytriyenko &lt;<a hr=
ef=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.com</a>&gt; wrote:<br=
>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Do you use meta-ti layer?<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Sat, Jun 24, 2017 at 02:50:32AM +0000, Kenny Koller =
wrote:<br>
&gt; &gt; &gt; &gt; &gt; Hi,<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; I&#39;m using 2.3 to build the minimal Beaglebone =
Black images.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; I issue the following and get the error below. Is =
the warning<br>
&gt; &gt; regarding a<br>
&gt; &gt; &gt; &gt; &gt; missing bootloader config the issue?<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Thanks,<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Kenny<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; $ bitbake core-image-minimal<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; | INFO: Creating image(s)...<br>
&gt; &gt; &gt; &gt; &gt; |<br>
&gt; &gt; &gt; &gt; &gt; | WARNING: bootloader config not specified, using =
defaults<br>
&gt; &gt; &gt; &gt; &gt; |<br>
&gt; &gt; &gt; &gt; &gt; | ERROR: _exec_cmd: install -m 0644 -D<br>
&gt; &gt; &gt; &gt; &gt; /home/ubuntu/yocto/poky/build/tmp/deploy/images/be=
aglebone/<br>
&gt; &gt; u-boot.img<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; /home/ubuntu/yocto/poky/build/tmp/work/beaglebone-poky-=
<br>
&gt; &gt; linux-gnueabi/core-image-minimal/1.0-r0/deploy-core-<br>
&gt; &gt; image-minimal-image-complete/core-image-minimal-beaglebone-<br>
&gt; &gt; 20170624014756/tmp.wic.khxryxga/boot/u-boot.img<br>
&gt; &gt; &gt; &gt; &gt; returned &#39;1&#39; instead of 0<br>
&gt; &gt; &gt; &gt; &gt; | output: install: cannot stat<br>
&gt; &gt; &gt; &gt; &gt; &#39;/home/ubuntu/yocto/poky/build/tmp/deploy/imag=
es/<br>
&gt; &gt; beaglebone/u-boot.img&#39;:<br>
&gt; &gt; &gt; &gt; No<br>
&gt; &gt; &gt; &gt; &gt; such file or directory<br>
&gt; &gt; &gt; &gt; &gt; |<br>
&gt; &gt; &gt; &gt; &gt; | WARNING: exit code 1 from a shell command.<br>
&gt; &gt; &gt; &gt; &gt; | ERROR: Function failed: do_image_wic (log file i=
s located at<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; /home/ubuntu/yocto/poky/build/tmp/work/beaglebone-poky-=
<br>
&gt; &gt; linux-gnueabi/core-image-minimal/1.0-r0/temp/log.do_image_wic.127=
19)<br>
&gt; &gt; &gt; &gt; &gt; ERROR: Task<br>
&gt; &gt; &gt; &gt; &gt; (/home/ubuntu/yocto/poky/meta/recipes-core/images/=
core-<br>
&gt; &gt; <a href=3D"http://image-minimal.bb" rel=3D"noreferrer" target=3D"=
_blank">image-minimal.bb</a>:<br>
&gt; &gt; &gt; &gt; do_image_wic)<br>
&gt; &gt; &gt; &gt; &gt; failed with exit code &#39;1&#39;<br>
&gt; &gt; &gt; &gt; &gt; NOTE: Tasks Summary: Attempted 2263 tasks of which=
 2252 didn&#39;t need<br>
&gt; &gt; to be<br>
&gt; &gt; &gt; &gt; &gt; rerun and 1 failed.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Summary: 1 task failed:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0/home/ubuntu/yocto/poky/meta/recipes-c=
ore/images/core-<br>
&gt; &gt; <a href=3D"http://image-minimal.bb" rel=3D"noreferrer" target=3D"=
_blank">image-minimal.bb</a><br>
&gt; &gt; &gt; &gt; :<br>
&gt; &gt; &gt; &gt; &gt; do_image_wic<br>
&gt; &gt; &gt; &gt; &gt; Summary: There was 1 ERROR message shown, returnin=
g a non-zero exit<br>
&gt; &gt; code.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; &gt; _______________________________________________<br=
>
&gt; &gt; &gt; &gt; &gt; meta-ti mailing list<br>
&gt; &gt; &gt; &gt; &gt; <a href=3D"mailto:meta-ti@yoctoproject.org" target=
=3D"_blank">meta-ti@yoctoproject.org</a><br>
&gt; &gt; &gt; &gt; &gt; <a href=3D"https://lists.yoctoproject.org/listinfo=
/meta-ti" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.o=
rg/listinfo/meta-ti</a><br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt;<br>
</blockquote></div></blockquote></div>

--94eb2c1437fe5053b505530e1ab5--
