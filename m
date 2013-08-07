Return-Path: <bmentink@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 487E9E006E5
	for <meta-ti@yoctoproject.org>; Wed,  7 Aug 2013 15:57:32 -0700 (PDT)
Received: by mail-ie0-f176.google.com with SMTP id 9so596374iec.21
	for <meta-ti@yoctoproject.org>; Wed, 07 Aug 2013 15:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=FwlaPxDo7HMHhKlWL/WD5qNWZ81Xfs9l84NgnQovUac=;
	b=utF+m9Ik5QyZ7ESBrU96YfAZ6z6gtDZYXNScGMrg2WyM7Aiv9jptyK2ixGhUrr+Z5F
	uwrM7RHO1zh88/jvy222RTmiV9NBJszZXgCjgNFHjYT/zq2IoT+9DiAA/83RcTf+SSKU
	vT62KewbkaO1oH5uTPk0zHzW9YtiLq++r8uGPgV8e18UrfVBcI8jbE+y4udU5Q1pIlaP
	1GGvUxpht5Rtsvas3kGslPapVu4xQn7zkPsO4u0EiWR0iGI17yuhzV/oyeCjWpLyfDhI
	e8I3CPbA9XOzZNzbY7pjwA+6vc1k0NcLzRqtGPs6OIo/6fEBqwg5eOc2FpZZgweq/Yz2
	J9eQ==
MIME-Version: 1.0
X-Received: by 10.50.106.102 with SMTP id gt6mr726327igb.46.1375916252418;
	Wed, 07 Aug 2013 15:57:32 -0700 (PDT)
Received: by 10.43.83.9 with HTTP; Wed, 7 Aug 2013 15:57:32 -0700 (PDT)
Message-ID: <CALEed8Ywhz3PEPEGePauXhC6b_-ahzHZSQ+BgJqk+rQMe2yDYQ@mail.gmail.com>
From: Bernard Mentink <bmentink@gmail.com>
To: meta-ti@yoctoproject.org
X-Mailman-Approved-At: Fri, 23 Aug 2013 08:25:19 -0700
Subject: Cannot boot beaglebone image
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
Date: Wed, 07 Aug 2013 22:57:35 -0000
X-Original-Date: Thu, 8 Aug 2013 10:57:32 +1200
X-List-Received-Date: Wed, 07 Aug 2013 22:57:35 -0000
Content-Type: multipart/alternative; boundary=047d7bea4408777ba804e36377dc

--047d7bea4408777ba804e36377dc
Content-Type: text/plain; charset=ISO-8859-1

Hi There,

Very new to Yocto and the Ti BSP so be nice ;-)

I have built the minimal image and created an SD card with the boot and
rootfs partitions ..

I have copied MLO (first), u-boot.img, am335x-bone.dtb, u-boot-spl.bin and
uImage to the "boot" partition.
(I am not sure if the am33xx file or the spl file is necessary ..)
I have un-tar'ed the root filesystem to the "rootfs" partition.

However when I boot this card, all I see on the beaglebone black is 4
lights on continuous ..
There is no serial port over USB to see what is going on, and no ethernet
device shows up, even after including dropbear in the image ..

I am at a loss ... there is no "standard" serial port to see if u-boot is
coming up at all ..

By the way, to sucessfully build meta-ti, I had to add the following line
to my local.conf   ..
BBMASK ?= ".*/meta-ti/recipes-(misc|bsp/formfactor|graphics/mesa)/"

... if I did not do that, the build failed with all the Angstom licencing
rubbish (it should not be in there .... I want a "distro-less" build  ;)

Any help much appreciated.

Cheers,
Bernie

--047d7bea4408777ba804e36377dc
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi There,<div><br></div><div style>Very new to Yocto and t=
he Ti BSP so be nice ;-)</div><div style><br></div><div style>I have built =
the minimal image and created an SD card with the boot and rootfs partition=
s ..</div>
<div style><br></div><div style>I have copied MLO (first), u-boot.img, am33=
5x-bone.dtb, u-boot-spl.bin and uImage to the &quot;boot&quot; partition.</=
div><div style>(I am not sure if the am33xx file or the spl file is necessa=
ry ..)</div>
<div style>I have un-tar&#39;ed the root filesystem to the &quot;rootfs&quo=
t; partition.</div><div style><br></div><div style>However when I boot this=
 card, all I see on the beaglebone black is 4 lights on continuous ..=A0</d=
iv>
<div style>There is no serial port over USB to see what is going on, and no=
 ethernet device shows up, even after including dropbear in the image ..</d=
iv><div style><br></div><div style>I am at a loss ... there is no &quot;sta=
ndard&quot; serial port to see if u-boot is coming up at all ..</div>
<div style><br></div><div style>By the way, to sucessfully build meta-ti, I=
 had to add the following line to my local.conf =A0 ..</div><div style>BBMA=
SK ?=3D &quot;.*/meta-ti/recipes-(misc|bsp/formfactor|graphics/mesa)/&quot;=
</div>
<div style><br></div><div style>... if I did not do that, the build failed =
with all the Angstom licencing rubbish (it should not be in there .... I wa=
nt a &quot;distro-less&quot; build =A0;)</div><div style><br></div><div sty=
le>
Any help much appreciated.</div><div style><br></div><div style>Cheers,</di=
v><div style>Bernie</div></div>

--047d7bea4408777ba804e36377dc--
