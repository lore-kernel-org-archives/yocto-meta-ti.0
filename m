Return-Path: <leo.e.meza@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1D690E009A4; Thu, 30 Aug 2018 14:58:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (leo.e.meza[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.218.65 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AB732E007AD
	for <meta-ti@yoctoproject.org>; Thu, 30 Aug 2018 14:58:08 -0700 (PDT)
Received: by mail-oi0-f65.google.com with SMTP id x197-v6so18262107oix.5
	for <meta-ti@yoctoproject.org>; Thu, 30 Aug 2018 14:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=L8FiJJKzQU6V1+oCvtP+ZT1KJ9v6AzN5nxCrs5NuokM=;
	b=CC3eI3e+MZ3bti2nO87l5AAtrNyM7vsIBmQ9d8yQxvj+hVR/rbV4snr1VJ9oKgqmzj
	C188gbdyxPltTzc0QZGSloPjugdTtxGAnmCLY0VQGYdu8dmPtBw4zSHbnBQ2VWwiaCec
	9lLpQMvJUrI8ARuLUMSOxDUu3WO6RZhYBcC/nfXFuXSYJ2cIMZ8hij5eeuUX6f+mfLRW
	sT5XTiljZA3Y31s9vp8FdeIvURmW2J1Y+V+1aAJxXdTs1OGFJxdl0Stu1I620WZcEiLZ
	RzcyGphu0la+IKhDUlNj9+dMndfnevqXS/8+8JK5ormJzCuRo0D6gMq03EA/NfC6O2SQ
	2z3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=L8FiJJKzQU6V1+oCvtP+ZT1KJ9v6AzN5nxCrs5NuokM=;
	b=oPZPA8BZXdUfTaqjrkcRC/SsDuQd/ljw8eLaf7HDOKXyFXJ2rnuMwsDaKm61RL5Wmk
	1ZJ/5VV3qmsRC3411G1g2UysNVEzKZuDJVAcwxEntj5dDadBIV+GoTLL7w2noi+hzKE4
	cqEKCoD5VmgjYoQyqO74aX8MGsXWNMC9VYvV+Z4zMMamjXzMF1uFUqOkxzXUOgwBIi8B
	4tjkfJofszTmpqkfy9oKmL16qrr2SQNKHT8yVuyczUQDvq+oH9NtZSQahBeWhuVR0a/t
	ubamT0HRCvyYr4cJe1VgExTn4eCX0fkQGfHmwh8WjSspuMYF0P4XtbL2vPqpIj3wQQ9c
	WRWg==
X-Gm-Message-State: APzg51BasEVJWGqqfIF0qxYk27YFVVFFXNWFBPm8ahDx+h61O6KfYOqb
	vj7AMRDscu8ZMlIRJHVHoi+Nlpg79d3VIoT60f4=
X-Google-Smtp-Source: ANB0VdZZeOzilNGp+Mq3l5CfFBz8ZzmmGqyuo3ZVdwJ614Ara7Uo/XFvFQFKGTJ9ts7IuTORMgDA2vejST4ZfxDu0nY=
X-Received: by 2002:aca:3003:: with SMTP id
	w3-v6mr4642617oiw.231.1535666287975; 
	Thu, 30 Aug 2018 14:58:07 -0700 (PDT)
MIME-Version: 1.0
References: <CADrbpyyMX+hnshPQN7yVbB1UBdopKiHFD-Nqh=MVqyVohgqYAA@mail.gmail.com>
	<2cf7ae74-ad2e-38b4-bb34-a2cf7c6a97d4@ti.com>
	<CADrbpyz6p13T4LeLWzipbm4iUK8cOR6BvyZfDV48CcgyeC6qdA@mail.gmail.com>
	<32e4ef4c-28a4-1536-fcc4-3f5834c4b0d2@ti.com>
In-Reply-To: <32e4ef4c-28a4-1536-fcc4-3f5834c4b0d2@ti.com>
From: Leo Meza <leo.e.meza@gmail.com>
Date: Thu, 30 Aug 2018 14:57:57 -0700
Message-ID: <CADrbpyz8OKoQEbvqaJhQ9oNN87OGeEFb74gOow0HYPsn4KaJwA@mail.gmail.com>
To: wmills@ti.com
Cc: meta-ti@yoctoproject.org
Subject: Re: Getting Started with meta-ti "rocko" and beaglebone black (BBB)
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
X-List-Received-Date: Thu, 30 Aug 2018 21:58:10 -0000
Content-Type: multipart/alternative; boundary="00000000000096a2790574ae2bce"

--00000000000096a2790574ae2bce
Content-Type: text/plain; charset="UTF-8"

Bill, thanks again for the reply. I must have had a dirty file because now
I can build just fine with am335x-evm, and I'm now using
core-image-full-cmdline and I'm able to boot and login just fine. I've
created some custom recipes and added ModemManager along with libQMI and
some other stuff. I'm trying to get ModemManager to bring up my 4G LTE
module over the USB connection. It looks like ModemManager isn't getting
started, I'm now trying to figure out how to get SystemD included in my
build and then how to use it to start ModemManager. Making progress now,
slow by steady.
Thanks again for the help,
Leo

On Thu, Aug 30, 2018 at 8:16 AM William Mills <wmills@ti.com> wrote:

>
>
> On 08/28/2018 10:58 AM, Leo Meza wrote:
> > Thanks Bill/Denys,
> >
> > I was getting errors when trying to build with am335x-evm machine,
>
> Can you report what error you had? I tried to reproduce your conditions
> and built and booted core-image-minimal with this machine just fine.
>
> I think solving the issue with am335x-evm is a much better way to go.
>
> > so I
> > stayed with beaglebone machine since it at least let me complete a
> > build. I'm still getting the repeating messages at the serial console,
>
> Yes, I did also with the beaglebone machine.  You are suppose to see the
> banner from SPL (MLO) and then a banner from U-boot (u-boot.img).  The
> fact that we don't see the U-boot banner means U-boot is not getting
> loaded or not running.  (It is resetting and staring over with SPL).
>
> Until you see that U-boot message, what you do with zImage and dtbs is
> irrelevant.
>
> I am not sure what is broken in SPL for the beaglebone configuration.  I
> did take a look and nothing jumped out at me.
> Again am335x-evm works.
>
> > here are my steps, maybe I'm still doing something wrong.
> > 1. Poky is at rocko branch 2731fd3
> > 2. meta-ti is at rocko branch b38fd82
> > 3. Replaced meta-yocto-bsp with meta-ti in bblayers.conf
> > 4. Set MACHINE ?= "beaglebone" in local.conf
> > 5. Build with "bitbake core-image-minimal"
> > 6. sudo cp MLO $BOOT
> > 7. sudo cp u-boot.img $BOOT
> > 8. sudo tar -xf core-image-minimal-beaglebone.tar.xz -C $ROOT
> > 9. sudo cp zImage $ROOT/boot
> > 10. sudo cp am335x-boneblack.dtb $ROOT/boot
> > 11. sudo tar -xvzf modules-beaglebone.tgz -C $ROOT
> > 12. Did not use uEnv.txt and did not change environment variables
> >
> > Not sure if I did this part right because I don't know what is meant by
> > "short form *.dtbs":
> > "Put zImage and the short form *.dtbs in root partitions' /boot dir"
> >
>
> You can copy all the dtbs if you wish. The bootloader used the ones with
> names like am335x-boneblack.dtb and ignores ones like
> zImage-am335x-boneblack.dtb and zImage--4.14.*-am335x-boneblack.dtb.
>
> If you do copy just the short form you need to follow symlinks so you
> actually have the files.
>
> (When I tested beaglebone I just dd the wic image to the SD card.  The
> explict steps above were for am335x-evm since it does not create a wic
> image)
>
> Bill
>
>
> > Any further tips/pointers would be appreciated.
> >
> > Thanks in advance,
> > Leo
> >
> > On Thu, Aug 23, 2018 at 6:42 PM William Mills <wmills@ti.com
> > <mailto:wmills@ti.com>> wrote:
> >
> >     Leo,
> >
> >     On 08/22/2018 02:18 PM, Leo Meza wrote:
> >     > I'm learning yocto and was able to easily boot my BBB with a
> >     > core-image-minimal system using the meta-yocto-bsp layer. However,
> >     when
> >     > I removed that layer and tried with meta-ti, I just see this on the
> >     > Putty serial console, it repeats over an over:
> >     >
> >     > U-Boot SPL 2018.01-g6d540394a4 (Aug 22 2018 - 16:33:01)
> >     > Trying to boot from MMC1
> >     > *** Warning - bad CRC, using default environment
> >     >
> >
> >     I was able to duplicate this result when using meta-ti to build the
> >     "beaglebone" machine.
> >
> >     TI builds and test the am335x-evm machine for all am335x based boards
> >     inlcuding beaglebone.  If you switch to this machine you should have
> >     better luck.
> >
> >     Note that as Denys said elsewhere TI images and default u-boot
> variable
> >     settings assume that the kernel is in the root partition not the boot
> >     partition.  The _path_ in the root partition should be /boot/zImage
> >
> >     The only thing you need in the boot partition is MLO and the
> u-boot.img.
> >     If you want to override the u-boot settings you can have a uEnv.txt
> file
> >     there.  Also if you save the environment from within u-boot it will
> end
> >     up as a file in the boot partition named uboot.env
> >
> >     I notice that the am335x-evm machine does not create a .wic image so
> you
> >     will have to assemble the parts from the deploy dir.
> >     Put MLO and u-boot.img in the boot partition
> >     untar the rootfs tar ball to the root partition
> >     Put zImage and the short form *.dtbs in root partitions' /boot dir
> >     untar the modules tar ball in the root partition.
> >
> >
> >     > I'm copying MLO, zImage, u-boot.img, and am335x-boneblack.dtb to
> the
> >     > BOOT (1st) partition of my uSD card. Then extracting
> >     > core-image-minimal-beaglebone.tar.xz -C to the ROOT (2nd)
> partition of
> >     > my uSD card. This works fine when using meta-yocto-bsp, but not
> with
> >     > meta-ti. So, if anyone can help me understand what the different
> steps
> >     > are between using the two different layers, I'd greatly appreciate
> it.
> >     > Spent several days trying to figure this out so far.
> >     >
> >     > Thanks in advance,
> >     > Leo
> >     >
> >     >
> >
> >     Denys,
> >
> >     The beaglebone machine creates a much smaller MLO (~75K vs 109K) and
> >     u-boot.img.
> >     When you boot the image the SPL just spits out the message above over
> >     and over.  It never gets to u-boot.
> >
> >     To reproduce I started with a clean clone of poky
> >     added a clean clone of meta-ti
> >     checked out rocko for both
> >     . oe-*
> >     edit conf/bblayers to take out yocto-bsp (for safty sake)
> >     added meta-ti
> >     built core-image-minimal for beaglebone machine.
> >
> >     Bill
> >
>

--00000000000096a2790574ae2bce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Bill, thanks again for the reply. I must have had a dirty =
file because now I can build just fine with am335x-evm, and I&#39;m now usi=
ng core-image-full-cmdline and I&#39;m able to boot and login just fine. I&=
#39;ve created some custom recipes and added ModemManager along with libQMI=
 and some other stuff. I&#39;m trying to get ModemManager to bring up my 4G=
 LTE module over the USB connection. It looks like ModemManager isn&#39;t g=
etting started, I&#39;m now trying to figure out how to get SystemD include=
d in my build and then how to use it to start ModemManager. Making progress=
 now, slow by steady.<div>Thanks again for the help,</div><div>Leo</div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu, Aug 30, 2018 at =
8:16 AM William Mills &lt;<a href=3D"mailto:wmills@ti.com">wmills@ti.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
On 08/28/2018 10:58 AM, Leo Meza wrote:<br>
&gt; Thanks Bill/Denys,<br>
&gt; <br>
&gt; I was getting errors when trying to build with am335x-evm machine,<br>
<br>
Can you report what error you had? I tried to reproduce your conditions<br>
and built and booted core-image-minimal with this machine just fine.<br>
<br>
I think solving the issue with am335x-evm is a much better way to go.<br>
<br>
&gt; so I<br>
&gt; stayed with beaglebone machine since it at least let me complete a<br>
&gt; build. I&#39;m still getting the repeating messages at the serial cons=
ole,<br>
<br>
Yes, I did also with the beaglebone machine.=C2=A0 You are suppose to see t=
he<br>
banner from SPL (MLO) and then a banner from U-boot (u-boot.img).=C2=A0 The=
<br>
fact that we don&#39;t see the U-boot banner means U-boot is not getting<br=
>
loaded or not running.=C2=A0 (It is resetting and staring over with SPL).<b=
r>
<br>
Until you see that U-boot message, what you do with zImage and dtbs is<br>
irrelevant.<br>
<br>
I am not sure what is broken in SPL for the beaglebone configuration.=C2=A0=
 I<br>
did take a look and nothing jumped out at me.<br>
Again am335x-evm works.<br>
<br>
&gt; here are my steps, maybe I&#39;m still doing something wrong.<br>
&gt; 1. Poky is at rocko branch=C2=A02731fd3<br>
&gt; 2. meta-ti is at rocko branch=C2=A0b38fd82<br>
&gt; 3. Replaced meta-yocto-bsp with meta-ti in bblayers.conf<br>
&gt; 4. Set=C2=A0MACHINE ?=3D &quot;beaglebone&quot; in local.conf<br>
&gt; 5. Build with &quot;bitbake core-image-minimal&quot;<br>
&gt; 6. sudo cp MLO $BOOT<br>
&gt; 7. sudo cp u-boot.img $BOOT<br>
&gt; 8. sudo tar -xf=C2=A0core-image-minimal-beaglebone.tar.xz -C $ROOT<br>
&gt; 9. sudo cp zImage $ROOT/boot<br>
&gt; 10. sudo cp am335x-boneblack.dtb $ROOT/boot<br>
&gt; 11. sudo tar -xvzf modules-beaglebone.tgz -C $ROOT<br>
&gt; 12. Did not use uEnv.txt and did not change environment variables<br>
&gt; <br>
&gt; Not sure if I did this part right because I don&#39;t know what is mea=
nt by<br>
&gt; &quot;short form *.dtbs&quot;:<br>
&gt; &quot;Put zImage and the short form *.dtbs in root partitions&#39; /bo=
ot dir&quot;<br>
&gt; <br>
<br>
You can copy all the dtbs if you wish. The bootloader used the ones with<br=
>
names like am335x-boneblack.dtb and ignores ones like<br>
zImage-am335x-boneblack.dtb and zImage--4.14.*-am335x-boneblack.dtb.<br>
<br>
If you do copy just the short form you need to follow symlinks so you<br>
actually have the files.<br>
<br>
(When I tested beaglebone I just dd the wic image to the SD card.=C2=A0 The=
<br>
explict steps above were for am335x-evm since it does not create a wic<br>
image)<br>
<br>
Bill<br>
<br>
<br>
&gt; Any further tips/pointers would be appreciated.<br>
&gt; <br>
&gt; Thanks in advance,<br>
&gt; Leo<br>
&gt; <br>
&gt; On Thu, Aug 23, 2018 at 6:42 PM William Mills &lt;<a href=3D"mailto:wm=
ills@ti.com" target=3D"_blank">wmills@ti.com</a><br>
&gt; &lt;mailto:<a href=3D"mailto:wmills@ti.com" target=3D"_blank">wmills@t=
i.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Leo,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 08/22/2018 02:18 PM, Leo Meza wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; I&#39;m learning yocto and was able to easily =
boot my BBB with a<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; core-image-minimal system using the meta-yocto=
-bsp layer. However,<br>
&gt;=C2=A0 =C2=A0 =C2=A0when<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; I removed that layer and tried with meta-ti, I=
 just see this on the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Putty serial console, it repeats over an over:=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; U-Boot SPL 2018.01-g6d540394a4 (Aug 22 2018 - =
16:33:01)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Trying to boot from MMC1<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; *** Warning - bad CRC, using default environme=
nt<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I was able to duplicate this result when using meta=
-ti to build the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;beaglebone&quot; machine.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0TI builds and test the am335x-evm machine for all a=
m335x based boards<br>
&gt;=C2=A0 =C2=A0 =C2=A0inlcuding beaglebone.=C2=A0 If you switch to this m=
achine you should have<br>
&gt;=C2=A0 =C2=A0 =C2=A0better luck.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Note that as Denys said elsewhere TI images and def=
ault u-boot variable<br>
&gt;=C2=A0 =C2=A0 =C2=A0settings assume that the kernel is in the root part=
ition not the boot<br>
&gt;=C2=A0 =C2=A0 =C2=A0partition.=C2=A0 The _path_ in the root partition s=
hould be /boot/zImage<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0The only thing you need in the boot partition is ML=
O and the u-boot.img.<br>
&gt;=C2=A0 =C2=A0 =C2=A0If you want to override the u-boot settings you can=
 have a uEnv.txt file<br>
&gt;=C2=A0 =C2=A0 =C2=A0there.=C2=A0 Also if you save the environment from =
within u-boot it will end<br>
&gt;=C2=A0 =C2=A0 =C2=A0up as a file in the boot partition named uboot.env<=
br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I notice that the am335x-evm machine does not creat=
e a .wic image so you<br>
&gt;=C2=A0 =C2=A0 =C2=A0will have to assemble the parts from the deploy dir=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0Put MLO and u-boot.img in the boot partition<br>
&gt;=C2=A0 =C2=A0 =C2=A0untar the rootfs tar ball to the root partition<br>
&gt;=C2=A0 =C2=A0 =C2=A0Put zImage and the short form *.dtbs in root partit=
ions&#39; /boot dir<br>
&gt;=C2=A0 =C2=A0 =C2=A0untar the modules tar ball in the root partition.<b=
r>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; I&#39;m copying MLO, zImage, u-boot.img, and a=
m335x-boneblack.dtb to the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; BOOT (1st) partition of my uSD card. Then extr=
acting<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; core-image-minimal-beaglebone.tar.xz -C to the=
 ROOT (2nd) partition of<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; my uSD card. This works fine when using meta-y=
octo-bsp, but not with<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; meta-ti. So, if anyone can help me understand =
what the different steps<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; are between using the two different layers, I&=
#39;d greatly appreciate it.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Spent several days trying to figure this out s=
o far.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Thanks in advance,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Leo<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Denys,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0The beaglebone machine creates a much smaller MLO (=
~75K vs 109K) and<br>
&gt;=C2=A0 =C2=A0 =C2=A0u-boot.img.<br>
&gt;=C2=A0 =C2=A0 =C2=A0When you boot the image the SPL just spits out the =
message above over<br>
&gt;=C2=A0 =C2=A0 =C2=A0and over.=C2=A0 It never gets to u-boot.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0To reproduce I started with a clean clone of poky<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0added a clean clone of meta-ti<br>
&gt;=C2=A0 =C2=A0 =C2=A0checked out rocko for both<br>
&gt;=C2=A0 =C2=A0 =C2=A0. oe-*<br>
&gt;=C2=A0 =C2=A0 =C2=A0edit conf/bblayers to take out yocto-bsp (for safty=
 sake)<br>
&gt;=C2=A0 =C2=A0 =C2=A0added meta-ti<br>
&gt;=C2=A0 =C2=A0 =C2=A0built core-image-minimal for beaglebone machine.<br=
>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Bill<br>
&gt; <br>
</blockquote></div>

--00000000000096a2790574ae2bce--
