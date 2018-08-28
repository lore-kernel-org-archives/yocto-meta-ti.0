Return-Path: <leo.e.meza@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7856BE00519; Tue, 28 Aug 2018 07:58:19 -0700 (PDT)
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
	*      [209.85.218.67 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3A7EFE003D9
	for <meta-ti@yoctoproject.org>; Tue, 28 Aug 2018 07:58:18 -0700 (PDT)
Received: by mail-oi0-f67.google.com with SMTP id l82-v6so3334524oih.11
	for <meta-ti@yoctoproject.org>; Tue, 28 Aug 2018 07:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4VNW24NZnEZc3r3Qr8wvL0aOPi8nJx3di5Yyfaeu4aE=;
	b=USBi4mSoqv9VEifiuGM5/Iqv5vwHE8VieazvTvSktIO/t1nhgJQO9fc4L7b4ffRONp
	9rZCnFJ0zAQfKsY+OgKWho4tc3Y2864hhZtYmAYQFy9iLZ9+H5lYVz7XwR8j/mG4lLIr
	EAk5OdPbtMkTG2txrwXjLgIar7qSYGnx/PSNq9hhxCV/FXtidRFKCYKxEYBclC4gXiKj
	/556hxvDSXkrKCYR0BLTFrIgEjtQ23Y4fQx7pABxiQy3w7ufvvSgAyUwZGO8LtAVvwyF
	E6UAgCF6nHHPGZ2rWGgKdNxZrJXAiO09I7cGT+VtPGXrtbRXE8qUMdqc9argYaUaufvg
	vpeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4VNW24NZnEZc3r3Qr8wvL0aOPi8nJx3di5Yyfaeu4aE=;
	b=QYtvqGQZf/hCrqT+1sRpYIjTaFW+rr58c83r17KdpG72fC4SHJXW/UlurUFq3qEmgd
	NBUnvteggfkY5EL4+chqkQvGiGLQNAjwuVC0BsaS9Q6vARdU32X+iz+l92kDzoXLWk+2
	c5y0gbsI642DkKuLawTDKspxz9zg7MFIO3fmwzCJSD8CP4QmTh6YFADfUstGd/loO3kR
	xkeTpov5XxwvzlKSGlw6n2pdwbxTBAlGyMi6PsLlneXuzv9mkUj2Exx902Z/CjxPVkPg
	ke0+Cst6t4/tNkxq5zshunAKcZO5HnhTi6dX7dKMgpoKsBAYZoS6xuZ1LSTC7b8vfNY0
	gHWw==
X-Gm-Message-State: APzg51CMKuTHJATEEk2qlrPeJ7OqW5ha0jpdr4+LdiWSHWJXju4MGbZC
	KxvFuptnqXRizl+D9Qxu9z+VMwzCoSAjLgRjt10=
X-Google-Smtp-Source: ANB0Vdbr9tLx3Q38533S6hGW0z0avSIXNagJ0jCovA1C6aEEIx7Td9eTziQ/2tsUB0I4octD0MKbrKfHheLtZsrXtsc=
X-Received: by 2002:aca:6ac8:: with SMTP id
	f191-v6mr1682929oic.223.1535468295777; 
	Tue, 28 Aug 2018 07:58:15 -0700 (PDT)
MIME-Version: 1.0
References: <CADrbpyyMX+hnshPQN7yVbB1UBdopKiHFD-Nqh=MVqyVohgqYAA@mail.gmail.com>
	<2cf7ae74-ad2e-38b4-bb34-a2cf7c6a97d4@ti.com>
In-Reply-To: <2cf7ae74-ad2e-38b4-bb34-a2cf7c6a97d4@ti.com>
From: Leo Meza <leo.e.meza@gmail.com>
Date: Tue, 28 Aug 2018 07:58:04 -0700
Message-ID: <CADrbpyz6p13T4LeLWzipbm4iUK8cOR6BvyZfDV48CcgyeC6qdA@mail.gmail.com>
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
X-List-Received-Date: Tue, 28 Aug 2018 14:58:19 -0000
Content-Type: multipart/alternative; boundary="00000000000055ed2f0574801281"

--00000000000055ed2f0574801281
Content-Type: text/plain; charset="UTF-8"

Thanks Bill/Denys,

I was getting errors when trying to build with am335x-evm machine, so I
stayed with beaglebone machine since it at least let me complete a build.
I'm still getting the repeating messages at the serial console, here are my
steps, maybe I'm still doing something wrong.
1. Poky is at rocko branch 2731fd3
2. meta-ti is at rocko branch b38fd82
3. Replaced meta-yocto-bsp with meta-ti in bblayers.conf
4. Set MACHINE ?= "beaglebone" in local.conf
5. Build with "bitbake core-image-minimal"
6. sudo cp MLO $BOOT
7. sudo cp u-boot.img $BOOT
8. sudo tar -xf core-image-minimal-beaglebone.tar.xz -C $ROOT
9. sudo cp zImage $ROOT/boot
10. sudo cp am335x-boneblack.dtb $ROOT/boot
11. sudo tar -xvzf modules-beaglebone.tgz -C $ROOT
12. Did not use uEnv.txt and did not change environment variables

Not sure if I did this part right because I don't know what is meant by
"short form *.dtbs":
"Put zImage and the short form *.dtbs in root partitions' /boot dir"

Any further tips/pointers would be appreciated.

Thanks in advance,
Leo

On Thu, Aug 23, 2018 at 6:42 PM William Mills <wmills@ti.com> wrote:

> Leo,
>
> On 08/22/2018 02:18 PM, Leo Meza wrote:
> > I'm learning yocto and was able to easily boot my BBB with a
> > core-image-minimal system using the meta-yocto-bsp layer. However, when
> > I removed that layer and tried with meta-ti, I just see this on the
> > Putty serial console, it repeats over an over:
> >
> > U-Boot SPL 2018.01-g6d540394a4 (Aug 22 2018 - 16:33:01)
> > Trying to boot from MMC1
> > *** Warning - bad CRC, using default environment
> >
>
> I was able to duplicate this result when using meta-ti to build the
> "beaglebone" machine.
>
> TI builds and test the am335x-evm machine for all am335x based boards
> inlcuding beaglebone.  If you switch to this machine you should have
> better luck.
>
> Note that as Denys said elsewhere TI images and default u-boot variable
> settings assume that the kernel is in the root partition not the boot
> partition.  The _path_ in the root partition should be /boot/zImage
>
> The only thing you need in the boot partition is MLO and the u-boot.img.
> If you want to override the u-boot settings you can have a uEnv.txt file
> there.  Also if you save the environment from within u-boot it will end
> up as a file in the boot partition named uboot.env
>
> I notice that the am335x-evm machine does not create a .wic image so you
> will have to assemble the parts from the deploy dir.
> Put MLO and u-boot.img in the boot partition
> untar the rootfs tar ball to the root partition
> Put zImage and the short form *.dtbs in root partitions' /boot dir
> untar the modules tar ball in the root partition.
>
>
> > I'm copying MLO, zImage, u-boot.img, and am335x-boneblack.dtb to the
> > BOOT (1st) partition of my uSD card. Then extracting
> > core-image-minimal-beaglebone.tar.xz -C to the ROOT (2nd) partition of
> > my uSD card. This works fine when using meta-yocto-bsp, but not with
> > meta-ti. So, if anyone can help me understand what the different steps
> > are between using the two different layers, I'd greatly appreciate it.
> > Spent several days trying to figure this out so far.
> >
> > Thanks in advance,
> > Leo
> >
> >
>
> Denys,
>
> The beaglebone machine creates a much smaller MLO (~75K vs 109K) and
> u-boot.img.
> When you boot the image the SPL just spits out the message above over
> and over.  It never gets to u-boot.
>
> To reproduce I started with a clean clone of poky
> added a clean clone of meta-ti
> checked out rocko for both
> . oe-*
> edit conf/bblayers to take out yocto-bsp (for safty sake)
> added meta-ti
> built core-image-minimal for beaglebone machine.
>
> Bill
>

--00000000000055ed2f0574801281
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Bill/Denys,<div><br></div><div>I was getting errors=
 when trying to build with am335x-evm machine, so I stayed with beaglebone =
machine since it at least let me complete a build. I&#39;m still getting th=
e repeating messages at the serial console, here are my steps, maybe I&#39;=
m still doing something wrong.</div><div>1. Poky is at rocko branch=C2=A027=
31fd3</div><div>2. meta-ti is at rocko branch=C2=A0b38fd82</div><div>3. Rep=
laced meta-yocto-bsp with meta-ti in bblayers.conf</div><div>4. Set=C2=A0MA=
CHINE ?=3D &quot;beaglebone&quot; in local.conf</div><div>5. Build with &qu=
ot;bitbake core-image-minimal&quot;</div><div>6. sudo cp MLO $BOOT</div><di=
v>7. sudo cp u-boot.img $BOOT</div><div>8. sudo tar -xf=C2=A0core-image-min=
imal-beaglebone.tar.xz -C $ROOT</div><div>9. sudo cp zImage $ROOT/boot</div=
><div>10. sudo cp am335x-boneblack.dtb $ROOT/boot</div><div>11. sudo tar -x=
vzf modules-beaglebone.tgz -C $ROOT</div><div>12. Did not use uEnv.txt and =
did not change environment variables</div><div><br></div><div>Not sure if I=
 did this part right because I don&#39;t know what is meant by &quot;short =
form *.dtbs&quot;:</div><div>&quot;Put zImage and the short form *.dtbs in =
root partitions&#39; /boot dir&quot;</div><div><br></div><div>Any further t=
ips/pointers would be appreciated.</div><div><br></div><div>Thanks in advan=
ce,</div><div>Leo</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
">On Thu, Aug 23, 2018 at 6:42 PM William Mills &lt;<a href=3D"mailto:wmill=
s@ti.com">wmills@ti.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">Leo,<br>
<br>
On 08/22/2018 02:18 PM, Leo Meza wrote:<br>
&gt; I&#39;m learning yocto and was able to easily boot my BBB with a<br>
&gt; core-image-minimal system using the meta-yocto-bsp layer. However, whe=
n<br>
&gt; I removed that layer and tried with meta-ti, I just see this on the<br=
>
&gt; Putty serial console, it repeats over an over:<br>
&gt; <br>
&gt; U-Boot SPL 2018.01-g6d540394a4 (Aug 22 2018 - 16:33:01)<br>
&gt; Trying to boot from MMC1<br>
&gt; *** Warning - bad CRC, using default environment<br>
&gt; <br>
<br>
I was able to duplicate this result when using meta-ti to build the<br>
&quot;beaglebone&quot; machine.<br>
<br>
TI builds and test the am335x-evm machine for all am335x based boards<br>
inlcuding beaglebone.=C2=A0 If you switch to this machine you should have<b=
r>
better luck.<br>
<br>
Note that as Denys said elsewhere TI images and default u-boot variable<br>
settings assume that the kernel is in the root partition not the boot<br>
partition.=C2=A0 The _path_ in the root partition should be /boot/zImage<br=
>
<br>
The only thing you need in the boot partition is MLO and the u-boot.img.<br=
>
If you want to override the u-boot settings you can have a uEnv.txt file<br=
>
there.=C2=A0 Also if you save the environment from within u-boot it will en=
d<br>
up as a file in the boot partition named uboot.env<br>
<br>
I notice that the am335x-evm machine does not create a .wic image so you<br=
>
will have to assemble the parts from the deploy dir.<br>
Put MLO and u-boot.img in the boot partition<br>
untar the rootfs tar ball to the root partition<br>
Put zImage and the short form *.dtbs in root partitions&#39; /boot dir<br>
untar the modules tar ball in the root partition.<br>
<br>
<br>
&gt; I&#39;m copying MLO, zImage, u-boot.img, and am335x-boneblack.dtb to t=
he<br>
&gt; BOOT (1st) partition of my uSD card. Then extracting<br>
&gt; core-image-minimal-beaglebone.tar.xz -C to the ROOT (2nd) partition of=
<br>
&gt; my uSD card. This works fine when using meta-yocto-bsp, but not with<b=
r>
&gt; meta-ti. So, if anyone can help me understand what the different steps=
<br>
&gt; are between using the two different layers, I&#39;d greatly appreciate=
 it.<br>
&gt; Spent several days trying to figure this out so far.<br>
&gt; <br>
&gt; Thanks in advance,<br>
&gt; Leo<br>
&gt; <br>
&gt; <br>
<br>
Denys,<br>
<br>
The beaglebone machine creates a much smaller MLO (~75K vs 109K) and<br>
u-boot.img.<br>
When you boot the image the SPL just spits out the message above over<br>
and over.=C2=A0 It never gets to u-boot.<br>
<br>
To reproduce I started with a clean clone of poky<br>
added a clean clone of meta-ti<br>
checked out rocko for both<br>
. oe-*<br>
edit conf/bblayers to take out yocto-bsp (for safty sake)<br>
added meta-ti<br>
built core-image-minimal for beaglebone machine.<br>
<br>
Bill<br>
</blockquote></div>

--00000000000055ed2f0574801281--
