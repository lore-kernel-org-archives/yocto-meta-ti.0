Return-Path: <danny@sizethreestudios.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D415C6379F
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 19:23:32 +0000 (UTC)
Received: from a11-75.smtp-out.amazonses.com (a11-75.smtp-out.amazonses.com [54.240.11.75])
 by mx.groups.io with SMTP id smtpd.web11.23171.1676921001457516050
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 20 Feb 2023 11:23:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sizethreestudios.com header.s=hncifp7bcoz4v46j3w6bdwu2f6yqecfu header.b=b0Be1A5u;
 spf=pass (domain: amazonses.com, ip: 54.240.11.75, mailfrom: 010001867047d1b2-31721e82-3521-47ca-ae8f-58a0571f6a2c-000000@amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hncifp7bcoz4v46j3w6bdwu2f6yqecfu; d=sizethreestudios.com;
	t=1676921000;
	h=Subject:From:To:Date:Mime-Version:Content-Type:In-Reply-To:References:Message-Id;
	bh=VDMLAGc+MDGHKR3lIBRgGgowuSEofixVJMASfjyoP9E=;
	b=b0Be1A5uAvrwlZ8AR5jc3iATGwZj7wIWzEK5YVrW33mKZnsJZg1I0B4HNrBzA+UT
	OOyuYghVcf4xdF+iCS+p3iDiHK8IOkN7HlO6eOULqL5OJLDD2wb6jviYwgKGTc63v/P
	v8lf64WAt6zZgyErNTp8n9rgeMnUeVwPqUBuOSGGzMOEcqDA/ZTlcrqc0/n5EMBqMf8
	+rmVxEnFNaNv/5rGoxze8keBs2dIA4bO3Ne7Uo/xbMaWwMTBlrBXLVRGk1WgUFPNcM3
	ldmu7DQrnRGutK+Zw/LD/N5QXn8XSDWW4K6Gr/w4ncparC2ZWhYpUfk9WAS4z4f6hcj
	mfonIdG1HQ==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=6gbrjpgwjskckoa6a5zn6fwqkn67xbtw; d=amazonses.com; t=1676921000;
	h=Subject:From:To:Date:Mime-Version:Content-Type:In-Reply-To:References:Message-Id:Feedback-ID;
	bh=VDMLAGc+MDGHKR3lIBRgGgowuSEofixVJMASfjyoP9E=;
	b=GOxrYSNeYzm5TUvyhUu0Cwi22ob2I1DvPlMs7dPUEEnQgsCeov0YNMmxoj31xzwt
	J5tDv3JeiZ7mzUBEKUUTQnDIsm8tyoMkO4uDGrJHEY2SxsQ/D/6wt6r1nu+7uuFLwvV
	bcjD8OlvZ1ADZoMRk37wH9EmcZfl0jswaIkU1jQs=
Subject: RE: [meta-ti] [kirkstone] trouble loading device tree overlay
 (beaglebone black, uboot, linux-ti-staging)
From: danny@sizethreestudios.com
To: =?UTF-8?Q?meta-ti=40lists=2Eyoctoproject=2Eorg?=
  <meta-ti@lists.yoctoproject.org>
Date: Mon, 20 Feb 2023 19:23:20 +0000
Mime-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="=_DyYYaFw-61oKGe7BDTpdNyq4TNvmxyuP78WoiCD8+0SmpwY2"
In-Reply-To: <17455D7D8D117D1A.676@lists.yoctoproject.org>
References: <mail.63f2b04b.7701.250da99230589a6c@storage.wm.amazon.com> 
 <17455D7D8D117D1A.676@lists.yoctoproject.org> 
 <mail.63f3c8a7.1a90.5469955d03021a36@storage.wm.amazon.com>
X-Priority: 3 (Normal)
X-Mailer: Amazon WorkMail
Thread-Index: AQHZRLbdz3yPT2FzRKuUv9/wC1Pm6QAp//Lq
Thread-Topic: [meta-ti] [kirkstone] trouble loading device tree overlay
 (beaglebone black, uboot, linux-ti-staging)
X-Wm-Sent-Timestamp: 1676920999
Message-ID: <010001867047d1b2-31721e82-3521-47ca-ae8f-58a0571f6a2c-000000@email.amazonses.com>
Feedback-ID: 1.us-east-1.LF00NED762KFuBsfzrtoqw+Brn/qlF9OYdxWukAhsl8=:AmazonSES
X-SES-Outgoing: 2023.02.20-54.240.11.75
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Feb 2023 19:23:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15883

This is a multi-part message in MIME format. Your mail reader does not
understand MIME message format.
--=_DyYYaFw-61oKGe7BDTpdNyq4TNvmxyuP78WoiCD8+0SmpwY2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Following up on my previous email - this was definitely a problem with th=
e address I was using to load in the overlay from uboot; my hunch is that=
 I was overwriting the loaded base device tree accidentally (offsetting t=
he location of the overlay by `F000` was probably not enough). Now I am a=
ble to successfully execute the `fdt apply` command and it looks like - b=
ased on the output from `fdt print` everything is happy.

Now I am running into a problem within the kernel startup itself; with th=
e overlay loaded I am seeing kernel panic messages in my console and the =
machine fails to boot. I think some relevant bits are:

=C2=A0
```

[=C2=A0=C2=A0=C2=A0 2.514743] tilcdc 4830e000.fb: failed to get functiona=
l clock
[=C2=A0=C2=A0=C2=A0 2.520694] ------------[ cut here ]------------
[=C2=A0=C2=A0=C2=A0 2.525359] WARNING: CPU: 0 PID: 1 at drivers/clk/clk.c=
:4261 tilcdc_fini+0x68/0xbc
[=C2=A0=C2=A0=C2=A0 2.533041] Modules linked in:
[=C2=A0=C2=A0=C2=A0 2.536122] CPU: 0 PID: 1 Comm: swapper Not tainted 5.1=
0.145-g8b51d20b6e #1
[=C2=A0=C2=A0=C2=A0 2.543151] Hardware name: Generic AM33XX (Flattened De=
vice Tree)
[=C2=A0=C2=A0=C2=A0 2.549321] [<c010d818>] (unwind_backtrace) from [<c010=
9e50>] (show_stack+0x10/0x14)
[=C2=A0=C2=A0=C2=A0 2.557115] [<c0109e50>] (show_stack) from [<c0add9f8>]=
 (__warn+0xbc/0x118)
[=C2=A0=C2=A0=C2=A0 2.564130] [<c0add9f8>] (__warn) from [<c0addacc>] (wa=
rn_slowpath_fmt+0x78/0xac)
[=C2=A0=C2=A0=C2=A0 2.571661] [<c0addacc>] (warn_slowpath_fmt) from [<c06=
59404>] (tilcdc_fini+0x68/0xbc)
[=C2=A0=C2=A0=C2=A0 2.579630] [<c0659404>] (tilcdc_fini) from [<c06597a4>=
] (tilcdc_init.constprop.0+0x2ac/0x5bc)
[=C2=A0=C2=A0=C2=A0 2.588293] [<c06597a4>] (tilcdc_init.constprop.0) from=
 [<c0659b04>] (tilcdc_pdev_probe+0x50/0xa8)
[=C2=A0=C2=A0=C2=A0 2.597304] [<c0659b04>] (tilcdc_pdev_probe) from [<c06=
728b8>] (platform_drv_probe+0x48/0x9c)
[=C2=A0=C2=A0=C2=A0 2.605880] [<c06728b8>] (platform_drv_probe) from [<c0=
6706c4>] (really_probe+0xf0/0x49c)
[=C2=A0=C2=A0=C2=A0 2.614106] [<c06706c4>] (really_probe) from [<c0670dc0=
>] (driver_probe_device+0x5c/0xb4)
[=C2=A0=C2=A0=C2=A0 2.622332] [<c0670dc0>] (driver_probe_device) from [<c=
06710b0>] (device_driver_attach+0xa8/0xb0)
[=C2=A0=C2=A0=C2=A0 2.631255] [<c06710b0>] (device_driver_attach) from [<=
c0671110>] (__driver_attach+0x58/0x104)
[=C2=A0=C2=A0=C2=A0 2.639922] [<c0671110>] (__driver_attach) from [<c066e=
560>] (bus_for_each_dev+0x74/0xc0)
[=C2=A0=C2=A0=C2=A0 2.648148] [<c066e560>] (bus_for_each_dev) from [<c066=
fa5c>] (bus_add_driver+0xf8/0x1e8)
[=C2=A0=C2=A0=C2=A0 2.656363] [<c066fa5c>] (bus_add_driver) from [<c0671a=
40>] (driver_register+0x88/0x118)
[=C2=A0=C2=A0=C2=A0 2.664502] [<c0671a40>] (driver_register) from [<c0101=
74c>] (do_one_initcall+0x54/0x1d0)
[=C2=A0=C2=A0=C2=A0 2.672733] [<c010174c>] (do_one_initcall) from [<c0f01=
1b8>] (kernel_init_freeable+0x1b4/0x218)
[=C2=A0=C2=A0=C2=A0 2.681494] [<c0f011b8>] (kernel_init_freeable) from [<=
c0aec0b8>] (kernel_init+0x8/0x118)
[=C2=A0=C2=A0=C2=A0 2.689723] [<c0aec0b8>] (kernel_init) from [<c0100148>=
] (ret_from_fork+0x14/0x2c)
[=C2=A0=C2=A0=C2=A0 2.697323] Exception stack(0xc1861fb0 to 0xc1861ff8)
[=C2=A0=C2=A0=C2=A0 2.702406] 1fa0:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 00000000 00000000 00000000 00000000
[=C2=A0=C2=A0=C2=A0 2.710630] 1fc0: 00000000 00000000 00000000 00000000 0=
0000000 00000000 00000000 00000000
[=C2=A0=C2=A0=C2=A0 2.718890] 1fe0: 00000000 00000000 00000000 00000000 0=
0000013 00000000
[=C2=A0=C2=A0=C2=A0 2.725544] ---[ end trace 622da960c249401c ]---

```

=C2=A0
and

=C2=A0
```

[=C2=A0=C2=A0=C2=A0 3.485229] VFS: Cannot open root device "mmcblk1p2" or=
 unknown-block(0,0): error -6
[=C2=A0=C2=A0=C2=A0 3.493753] Please append a correct "root=3D" boot opti=
on; here are the available partitions:
[=C2=A0=C2=A0=C2=A0 3.502578] 0100=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 65536 ram0
[=C2=A0=C2=A0=C2=A0 3.502617]=C2=A0 (driver=3F)
[=C2=A0=C2=A0=C2=A0 3.508938] 0101=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 65536 ram1
[=C2=A0=C2=A0=C2=A0 3.508975]=C2=A0 (driver=3F)
[=C2=A0=C2=A0=C2=A0 3.515173] 0102=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 65536 ram2
[=C2=A0=C2=A0=C2=A0 3.515178]=C2=A0 (driver=3F)
[=C2=A0=C2=A0=C2=A0 3.521390] 0103=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 65536 ram3
[=C2=A0=C2=A0=C2=A0 3.521395]=C2=A0 (driver=3F)
[=C2=A0=C2=A0=C2=A0 3.527618] 0104=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 65536 ram4
[=C2=A0=C2=A0=C2=A0 3.527624]=C2=A0 (driver=3F)
[=C2=A0=C2=A0=C2=A0 3.533817] 0105=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 65536 ram5
[=C2=A0=C2=A0=C2=A0 3.533823]=C2=A0 (driver=3F)
[=C2=A0=C2=A0=C2=A0 3.540033] 0106=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 65536 ram6
[=C2=A0=C2=A0=C2=A0 3.540039]=C2=A0 (driver=3F)
[=C2=A0=C2=A0=C2=A0 3.546226] 0107=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 65536 ram7
[=C2=A0=C2=A0=C2=A0 3.546231]=C2=A0 (driver=3F)
[=C2=A0=C2=A0=C2=A0 3.552440] 0108=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 65536 ram8
[=C2=A0=C2=A0=C2=A0 3.552446]=C2=A0 (driver=3F)
[=C2=A0=C2=A0=C2=A0 3.558631] 0109=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 65536 ram9
[=C2=A0=C2=A0=C2=A0 3.558637]=C2=A0 (driver=3F)
[=C2=A0=C2=A0=C2=A0 3.564831] 010a=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 65536 ram10
[=C2=A0=C2=A0=C2=A0 3.564836]=C2=A0 (driver=3F)
[=C2=A0=C2=A0=C2=A0 3.571131] 010b=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 65536 ram11
[=C2=A0=C2=A0=C2=A0 3.571137]=C2=A0 (driver=3F)
[=C2=A0=C2=A0=C2=A0 3.577414] 010c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 65536 ram12
[=C2=A0=C2=A0=C2=A0 3.577419]=C2=A0 (driver=3F)
[=C2=A0=C2=A0=C2=A0 3.583712] 010d=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 65536 ram13
[=C2=A0=C2=A0=C2=A0 3.583718]=C2=A0 (driver=3F)
[=C2=A0=C2=A0=C2=A0 3.590102] 010e=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 65536 ram14
[=C2=A0=C2=A0=C2=A0 3.590106]=C2=A0 (driver=3F)
[=C2=A0=C2=A0=C2=A0 3.596319] 010f=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 65536 ram15
[=C2=A0=C2=A0=C2=A0 3.596322]=C2=A0 (driver=3F)
[=C2=A0=C2=A0=C2=A0 3.602579] Kernel panic - not syncing: VFS: Unable to =
mount root fs on unknown-block(0,0)
[=C2=A0=C2=A0=C2=A0 3.610889] ---[ end Kernel panic - not syncing: VFS: U=
nable to mount root fs on unknown-block(0,0) ]---

```

=C2=A0
My hope here is that the second error - being "unable to mount root fs" -=
 is being caused by earlier problems (I'm not sure why adding an overlay =
would result in the kernel being unable to mount `mmcblk1p2`). I am curre=
ntly trying to see if I can get more debug output from the kernel to help=
 understand what is happening in the first error.

=C2=A0
I've uploaded a full log of the output here - https://gist.github.com/dad=
leyy/6512800f7a52a3ef9923557e05954403

-----Original message-----
From: Danny Hadley via lists.yoctoproject.org
Sent: Sunday, February 19 2023, 6:27 pm
To: meta-ti@lists.yoctoproject.org
Subject: [meta-ti] [kirkstone] trouble loading device tree overlay (beagl=
ebone black, uboot, linux-ti-staging)
=C2=A0
Hello - I'd like to start by saying thanks gain to all for the continued =
work on this project!

=C2=A0
I'm reaching out again for help on my beaglebone + yocto project. I feel =
like I am really close to a functional implementation, but I am now stuck=
 on getting my LCD screen to render anything (for reference, I am using o=
ne of these - https://4dsystems.com.au/4dcape-43). My hunch is that I nee=
d to enable the device tree overlay for the cape.

=C2=A0
I've spend a few days poking around, and have a recipe in my yocto projec=
t that compiles the overlay files from this repo - https://github.com/bea=
gleboard/bb.org-overlays.=C2=A0 At this point, I have a bunch of compiled=
 `.dtbo` files both being written to the `DEPLOY_DIR_IMAGE` and the boot =
partition of my wic file which is exciting (my guess is I am specifically=
 interested in this one - https://github.com/beagleboard/bb.org-overlays/=
blob/master/src/arm/BB-BONE-4D4C-01-00A1.dts).=C2=A0

=C2=A0
The current hurdle I am facing is that when I attempt to apply the overla=
y from my u-boot script - running `fdt apply ...` prints the following er=
ror to the console:

=C2=A0
```

failed on fdt_overlay_apply(): FDT_ERR_BADSTRUCTURE
base fdt does did not have a /__symbols__ node

make sure you've compiled with -@

```

=C2=A0
That error seems pretty clear but I'm still seeing it after subsequently =
adding `KERNEL_DTB_OVERLAY_SUPPORT =3D "1"` to a bbappend file for `linux=
-ti-staging_%`. I have dumped the contents of my fdt file (am335x-bonebla=
ck.dtb) using `fdtdump` and it looks like there is a `__symbols__` entry.=
 This was also the case when manually running `fdt print` from a u-boot p=
rompt and saving the output to a logfile through `screen`.

=C2=A0
I've uploaded the full device tree output from `fdt print` to this gist: =
https://gist.github.com/dadleyy/7926873ab60e9c9b5b5b02cb44e1e70b

=C2=A0
I've also been reading the u-boot docs here - https://u-boot.readthedocs.=
io/en/latest/usage/fdt_overlays.html

and this blog post from 2018 - https://irq5.io/2018/07/24/boot-time-devic=
e-tree-overlays-with-u-boot/

=C2=A0
My guess is that I am doing something wrong with the length and/or addres=
s of the fdt file or the overlay I am trying to use. I would be happy to =
provide any additional information, and any assistance is really apprecia=
ted!

=C2=A0
Thanks,

- Danny


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

Links: You receive all messages sent to this group.

View/Reply Online (#15880): https://lists.yoctoproject.org/g/meta-ti/mess=
age/15880

Mute This Topic: https://lists.yoctoproject.org/mt/97076057/7473053

Group Owner: meta-ti+owner@lists.yoctoproject.org

Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [danny@sizeth=
reestudios.com]

-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-






--=_DyYYaFw-61oKGe7BDTpdNyq4TNvmxyuP78WoiCD8+0SmpwY2
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML><html>
<head>
<meta name=3D"Generator" content=3D"Amazon WorkMail v3.1.1408.0">
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">=

<title>RE: [meta-ti] [kirkstone] trouble loading device tree overlay (bea=
glebone black, uboot, linux-ti-staging)</title>
</head>
<body>
<html><head></head><body><p style=3D"font-family: Arial, Tahoma, Helvetic=
a, sans-serif; font-size: small; margin: 0px;">Following up on my previou=
s email - this was definitely a problem with the address I was using to l=
oad in the overlay from uboot; my hunch is that I was overwriting the loa=
ded base device tree accidentally (offsetting the location of the overlay=
 by `F000` was probably not enough). Now I am able to successfully execut=
e the `fdt apply` command and it looks like - based on the output from `f=
dt print` everything is happy.<br><br>Now I am running into a problem wit=
hin the kernel startup itself; with the overlay loaded I am seeing kernel=
 panic messages in my console and the machine fails to boot. I think some=
 relevant bits are:</p><p style=3D"font-family: Arial, Tahoma, Helvetica,=
 sans-serif; font-size: small; margin: 0px;">&nbsp;</p><p style=3D"font-f=
amily: Arial, Tahoma, Helvetica, sans-serif; font-size: small; margin: 0p=
x;">```</p><p style=3D"font-family: Arial, Tahoma, Helvetica, sans-serif;=
 font-size: small; margin: 0px;"><font face=3D"Courier New, Courier, mono=
space">[&nbsp;&nbsp;&nbsp; 2.514743] tilcdc 4830e000.fb: failed to get fu=
nctional clock<br>[&nbsp;&nbsp;&nbsp; 2.520694] ------------[ cut here ]-=
-----------<br>[&nbsp;&nbsp;&nbsp; 2.525359] WARNING: CPU: 0 PID: 1 at dr=
ivers/clk/clk.c:4261 tilcdc_fini+0x68/0xbc<br>[&nbsp;&nbsp;&nbsp; 2.53304=
1] Modules linked in:<br>[&nbsp;&nbsp;&nbsp; 2.536122] CPU: 0 PID: 1 Comm=
: swapper Not tainted 5.10.145-g8b51d20b6e #1<br>[&nbsp;&nbsp;&nbsp; 2.54=
3151] Hardware name: Generic AM33XX (Flattened Device Tree)<br>[&nbsp;&nb=
sp;&nbsp; 2.549321] [&lt;c010d818&gt;] (unwind_backtrace) from [&lt;c0109=
e50&gt;] (show_stack+0x10/0x14)<br>[&nbsp;&nbsp;&nbsp; 2.557115] [&lt;c01=
09e50&gt;] (show_stack) from [&lt;c0add9f8&gt;] (__warn+0xbc/0x118)<br>[&=
nbsp;&nbsp;&nbsp; 2.564130] [&lt;c0add9f8&gt;] (__warn) from [&lt;c0addac=
c&gt;] (warn_slowpath_fmt+0x78/0xac)<br>[&nbsp;&nbsp;&nbsp; 2.571661] [&l=
t;c0addacc&gt;] (warn_slowpath_fmt) from [&lt;c0659404&gt;] (tilcdc_fini+=
0x68/0xbc)<br>[&nbsp;&nbsp;&nbsp; 2.579630] [&lt;c0659404&gt;] (tilcdc_fi=
ni) from [&lt;c06597a4&gt;] (tilcdc_init.constprop.0+0x2ac/0x5bc)<br>[&nb=
sp;&nbsp;&nbsp; 2.588293] [&lt;c06597a4&gt;] (tilcdc_init.constprop.0) fr=
om [&lt;c0659b04&gt;] (tilcdc_pdev_probe+0x50/0xa8)<br>[&nbsp;&nbsp;&nbsp=
; 2.597304] [&lt;c0659b04&gt;] (tilcdc_pdev_probe) from [&lt;c06728b8&gt;=
] (platform_drv_probe+0x48/0x9c)<br>[&nbsp;&nbsp;&nbsp; 2.605880] [&lt;c0=
6728b8&gt;] (platform_drv_probe) from [&lt;c06706c4&gt;] (really_probe+0x=
f0/0x49c)<br>[&nbsp;&nbsp;&nbsp; 2.614106] [&lt;c06706c4&gt;] (really_pro=
be) from [&lt;c0670dc0&gt;] (driver_probe_device+0x5c/0xb4)<br>[&nbsp;&nb=
sp;&nbsp; 2.622332] [&lt;c0670dc0&gt;] (driver_probe_device) from [&lt;c0=
6710b0&gt;] (device_driver_attach+0xa8/0xb0)<br>[&nbsp;&nbsp;&nbsp; 2.631=
255] [&lt;c06710b0&gt;] (device_driver_attach) from [&lt;c0671110&gt;] (_=
_driver_attach+0x58/0x104)<br>[&nbsp;&nbsp;&nbsp; 2.639922] [&lt;c0671110=
&gt;] (__driver_attach) from [&lt;c066e560&gt;] (bus_for_each_dev+0x74/0x=
c0)<br>[&nbsp;&nbsp;&nbsp; 2.648148] [&lt;c066e560&gt;] (bus_for_each_dev=
) from [&lt;c066fa5c&gt;] (bus_add_driver+0xf8/0x1e8)<br>[&nbsp;&nbsp;&nb=
sp; 2.656363] [&lt;c066fa5c&gt;] (bus_add_driver) from [&lt;c0671a40&gt;]=
 (driver_register+0x88/0x118)<br>[&nbsp;&nbsp;&nbsp; 2.664502] [&lt;c0671=
a40&gt;] (driver_register) from [&lt;c010174c&gt;] (do_one_initcall+0x54/=
0x1d0)<br>[&nbsp;&nbsp;&nbsp; 2.672733] [&lt;c010174c&gt;] (do_one_initca=
ll) from [&lt;c0f011b8&gt;] (kernel_init_freeable+0x1b4/0x218)<br>[&nbsp;=
&nbsp;&nbsp; 2.681494] [&lt;c0f011b8&gt;] (kernel_init_freeable) from [&l=
t;c0aec0b8&gt;] (kernel_init+0x8/0x118)<br>[&nbsp;&nbsp;&nbsp; 2.689723] =
[&lt;c0aec0b8&gt;] (kernel_init) from [&lt;c0100148&gt;] (ret_from_fork+0=
x14/0x2c)<br>[&nbsp;&nbsp;&nbsp; 2.697323] Exception stack(0xc1861fb0 to =
0xc1861ff8)<br>[&nbsp;&nbsp;&nbsp; 2.702406] 1fa0:&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 00000000 00000000 0000000=
0 00000000<br>[&nbsp;&nbsp;&nbsp; 2.710630] 1fc0: 00000000 00000000 00000=
000 00000000 00000000 00000000 00000000 00000000<br>[&nbsp;&nbsp;&nbsp; 2=
=2E718890] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000<br=
>[&nbsp;&nbsp;&nbsp; 2.725544] ---[ end trace 622da960c249401c ]---</font=
></p><p style=3D"font-family: Arial, Tahoma, Helvetica, sans-serif; font-=
size: small; margin: 0px;">```</p><p style=3D"font-family: Arial, Tahoma,=
 Helvetica, sans-serif; font-size: small; margin: 0px;">&nbsp;</p><p styl=
e=3D"font-family: Arial, Tahoma, Helvetica, sans-serif; font-size: small;=
 margin: 0px;">and</p><p style=3D"font-family: Arial, Tahoma, Helvetica, =
sans-serif; font-size: small; margin: 0px;">&nbsp;</p><p style=3D"font-fa=
mily: Arial, Tahoma, Helvetica, sans-serif; font-size: small; margin: 0px=
;">```</p><p style=3D"font-family: Arial, Tahoma, Helvetica, sans-serif; =
font-size: small; margin: 0px;"><font face=3D"Courier New, Courier, monos=
pace">[&nbsp;&nbsp;&nbsp; 3.485229] VFS: Cannot open root device "mmcblk1=
p2" or unknown-block(0,0): error -6<br>[&nbsp;&nbsp;&nbsp; 3.493753] Plea=
se append a correct "root=3D" boot option; here are the available partiti=
ons:<br>[&nbsp;&nbsp;&nbsp; 3.502578] 0100&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 65536 ram0<br>[&nbsp;&nbsp;&nbsp; 3.502617]=
&nbsp; (driver=3F)<br>[&nbsp;&nbsp;&nbsp; 3.508938] 0101&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 65536 ram1<br>[&nbsp;&nbsp;&n=
bsp; 3.508975]&nbsp; (driver=3F)<br>[&nbsp;&nbsp;&nbsp; 3.515173] 0102&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 65536 ram2<br>[=
&nbsp;&nbsp;&nbsp; 3.515178]&nbsp; (driver=3F)<br>[&nbsp;&nbsp;&nbsp; 3.5=
21390] 0103&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6=
5536 ram3<br>[&nbsp;&nbsp;&nbsp; 3.521395]&nbsp; (driver=3F)<br>[&nbsp;&n=
bsp;&nbsp; 3.527618] 0104&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; 65536 ram4<br>[&nbsp;&nbsp;&nbsp; 3.527624]&nbsp; (driver=3F=
)<br>[&nbsp;&nbsp;&nbsp; 3.533817] 0105&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; 65536 ram5<br>[&nbsp;&nbsp;&nbsp; 3.533823]&nb=
sp; (driver=3F)<br>[&nbsp;&nbsp;&nbsp; 3.540033] 0106&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 65536 ram6<br>[&nbsp;&nbsp;&nbsp=
; 3.540039]&nbsp; (driver=3F)<br>[&nbsp;&nbsp;&nbsp; 3.546226] 0107&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 65536 ram7<br>[&nb=
sp;&nbsp;&nbsp; 3.546231]&nbsp; (driver=3F)<br>[&nbsp;&nbsp;&nbsp; 3.5524=
40] 0108&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6553=
6 ram8<br>[&nbsp;&nbsp;&nbsp; 3.552446]&nbsp; (driver=3F)<br>[&nbsp;&nbsp=
;&nbsp; 3.558631] 0109&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; 65536 ram9<br>[&nbsp;&nbsp;&nbsp; 3.558637]&nbsp; (driver=3F)<b=
r>[&nbsp;&nbsp;&nbsp; 3.564831] 010a&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; 65536 ram10<br>[&nbsp;&nbsp;&nbsp; 3.564836]&nbsp=
; (driver=3F)<br>[&nbsp;&nbsp;&nbsp; 3.571131] 010b&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 65536 ram11<br>[&nbsp;&nbsp;&nbsp;=
 3.571137]&nbsp; (driver=3F)<br>[&nbsp;&nbsp;&nbsp; 3.577414] 010c&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 65536 ram12<br>[&nb=
sp;&nbsp;&nbsp; 3.577419]&nbsp; (driver=3F)<br>[&nbsp;&nbsp;&nbsp; 3.5837=
12] 010d&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6553=
6 ram13<br>[&nbsp;&nbsp;&nbsp; 3.583718]&nbsp; (driver=3F)<br>[&nbsp;&nbs=
p;&nbsp; 3.590102] 010e&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; 65536 ram14<br>[&nbsp;&nbsp;&nbsp; 3.590106]&nbsp; (driver=3F)=
<br>[&nbsp;&nbsp;&nbsp; 3.596319] 010f&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; 65536 ram15<br>[&nbsp;&nbsp;&nbsp; 3.596322]&nb=
sp; (driver=3F)<br>[&nbsp;&nbsp;&nbsp; 3.602579] Kernel panic - not synci=
ng: VFS: Unable to mount root fs on unknown-block(0,0)<br>[&nbsp;&nbsp;&n=
bsp; 3.610889] ---[ end Kernel panic - not syncing: VFS: Unable to mount =
root fs on unknown-block(0,0) ]---</font></p><p style=3D"font-family: Ari=
al, Tahoma, Helvetica, sans-serif; font-size: small; margin: 0px;">```</p=
><p style=3D"font-family: Arial, Tahoma, Helvetica, sans-serif; font-size=
: small; margin: 0px;">&nbsp;</p><p style=3D"font-family: Arial, Tahoma, =
Helvetica, sans-serif; font-size: small; margin: 0px;">My hope here is th=
at the second error - being "unable to mount root fs" - is being caused b=
y earlier problems (I'm not sure why adding an overlay would result in th=
e kernel being unable to mount `mmcblk1p2`). I am currently trying to see=
 if I can get more debug output from the kernel to help understand what i=
s happening in the first error.</p><p style=3D"font-family: Arial, Tahoma=
, Helvetica, sans-serif; font-size: small; margin: 0px;">&nbsp;</p><p sty=
le=3D"font-family: Arial, Tahoma, Helvetica, sans-serif; font-size: small=
; margin: 0px;">I've uploaded a full log of the output here - https://gis=
t.github.com/dadleyy/6512800f7a52a3ef9923557e05954403</p><blockquote styl=
e=3D"border-left: 2px solid rgb(176, 176, 183); margin-left: 5px; margin-=
right: 0px; padding-left: 5px;">-----Original message-----<br><strong>Fro=
m:</strong> Danny Hadley via lists.yoctoproject.org<br><strong>Sent:</str=
ong> Sunday, February 19 2023, 6:27 pm<br><strong>To:</strong> meta-ti@li=
sts.yoctoproject.org<br><strong>Subject:</strong> [meta-ti] [kirkstone] t=
rouble loading device tree overlay (beaglebone black, uboot, linux-ti-sta=
ging)<br>&nbsp;<p style=3D"font-family: Arial, Tahoma, Helvetica, sans-se=
rif; font-size: small; margin: 0px;">Hello - I'd like to start by saying =
thanks gain to all for the continued work on this project!</p><p style=3D=
"font-family: Arial, Tahoma, Helvetica, sans-serif; font-size: small; mar=
gin: 0px;">&nbsp;</p><p style=3D"font-family: Arial, Tahoma, Helvetica, s=
ans-serif; font-size: small; margin: 0px;">I'm reaching out again for hel=
p on my beaglebone + yocto project. I feel like I am really close to a fu=
nctional implementation, but I am now stuck on getting my LCD screen to r=
ender anything (for reference, I am using one of these - https://4dsystem=
s.com.au/4dcape-43). My hunch is that I need to enable the device tree ov=
erlay for the cape.</p><p style=3D"font-family: Arial, Tahoma, Helvetica,=
 sans-serif; font-size: small; margin: 0px;">&nbsp;</p><p style=3D"font-f=
amily: Arial, Tahoma, Helvetica, sans-serif; font-size: small; margin: 0p=
x;">I've spend a few days poking around, and have a recipe in my yocto pr=
oject that compiles the overlay files from this repo - <a title=3D"This e=
xternal link opens in a new window" href=3D"https://github.com/beagleboar=
d/bb.org-overlays.">https://github.com/beagleboard/bb.org-overlays.</a>&n=
bsp; At this point, I have a bunch of compiled `.dtbo` files both being w=
ritten to the `DEPLOY_DIR_IMAGE` and the boot partition of my wic file wh=
ich is exciting (my guess is I am specifically interested in this one - <=
a title=3D"This external link opens in a new window" href=3D"https://gith=
ub.com/beagleboard/bb.org-overlays/blob/master/src/arm/BB-BONE-4D4C-01-00=
A1.dts).">https://github.com/beagleboard/bb.org-overlays/blob/master/src/=
arm/BB-BONE-4D4C-01-00A1.dts)</a>.&nbsp;</p><p style=3D"font-family: Aria=
l, Tahoma, Helvetica, sans-serif; font-size: small; margin: 0px;">&nbsp;<=
/p><p style=3D"font-family: Arial, Tahoma, Helvetica, sans-serif; font-si=
ze: small; margin: 0px;">The current hurdle I am facing is that when I at=
tempt to apply the overlay from my u-boot script - running `fdt apply ...=
` prints the following error to the console:</p><p style=3D"font-family: =
Arial, Tahoma, Helvetica, sans-serif; font-size: small; margin: 0px;">&nb=
sp;</p><p style=3D"font-family: Arial, Tahoma, Helvetica, sans-serif; fon=
t-size: small; margin: 0px;">```</p><table class=3D"highlight tab-size js=
-file-line-container js-code-nav-container js-tagsearch-file"><tbody><tr>=
<td id=3D"file-error-txt-LC1" class=3D"blob-code blob-code-inner js-file-=
line">failed on fdt_overlay_apply(): FDT_ERR_BADSTRUCTURE</td></tr><tr></=
tr></tbody></table><table class=3D"highlight tab-size js-file-line-contai=
ner js-code-nav-container js-tagsearch-file"><tbody><tr><td id=3D"file-er=
ror-txt-LC2" class=3D"blob-code blob-code-inner js-file-line">base fdt do=
es did not have a /__symbols__ node</td></tr><tr></tr></tbody></table><p =
style=3D"font-family: Arial, Tahoma, Helvetica, sans-serif; font-size: sm=
all; margin: 0px;">make sure you've compiled with -@</p><p style=3D"font-=
family: Arial, Tahoma, Helvetica, sans-serif; font-size: small; margin: 0=
px;">```</p><p style=3D"font-family: Arial, Tahoma, Helvetica, sans-serif=
; font-size: small; margin: 0px;">&nbsp;</p><p style=3D"font-family: Aria=
l, Tahoma, Helvetica, sans-serif; font-size: small; margin: 0px;">That er=
ror seems pretty clear but I'm still seeing it after subsequently adding =
`KERNEL_DTB_OVERLAY_SUPPORT =3D "1"` to a bbappend file for `linux-ti-sta=
ging_%`. I have dumped the contents of my fdt file (am335x-boneblack.dtb)=
 using `fdtdump` and it looks like there is a `__symbols__` entry. This w=
as also the case when manually running `fdt print` from a u-boot prompt a=
nd saving the output to a logfile through `screen`.</p><p style=3D"font-f=
amily: Arial, Tahoma, Helvetica, sans-serif; font-size: small; margin: 0p=
x;">&nbsp;</p><p style=3D"font-family: Arial, Tahoma, Helvetica, sans-ser=
if; font-size: small; margin: 0px;">I've uploaded the full device tree ou=
tput from `fdt print` to this gist: <a title=3D"This external link opens =
in a new window" href=3D"https://gist.github.com/dadleyy/7926873ab60e9c9b=
5b5b02cb44e1e70b">https://gist.github.com/dadleyy/7926873ab60e9c9b5b5b02c=
b44e1e70b</a></p><p style=3D"font-family: Arial, Tahoma, Helvetica, sans-=
serif; font-size: small; margin: 0px;">&nbsp;</p><p style=3D"font-family:=
 Arial, Tahoma, Helvetica, sans-serif; font-size: small; margin: 0px;">I'=
ve also been reading the u-boot docs here - <a title=3D"This external lin=
k opens in a new window" href=3D"https://u-boot.readthedocs.io/en/latest/=
usage/fdt_overlays.html">https://u-boot.readthedocs.io/en/latest/usage/fd=
t_overlays.html</a></p><p style=3D"font-family: Arial, Tahoma, Helvetica,=
 sans-serif; font-size: small; margin: 0px;">and this blog post from 2018=
 - https://irq5.io/2018/07/24/boot-time-device-tree-overlays-with-u-boot/=
</p><p style=3D"font-family: Arial, Tahoma, Helvetica, sans-serif; font-s=
ize: small; margin: 0px;">&nbsp;</p><p style=3D"font-family: Arial, Tahom=
a, Helvetica, sans-serif; font-size: small; margin: 0px;">My <em>guess</e=
m> is that I am doing something wrong with the length and/or address of t=
he fdt file or the overlay I am trying to use. I would be happy to provid=
e any additional information, and any assistance is really appreciated!</=
p><p style=3D"font-family: Arial, Tahoma, Helvetica, sans-serif; font-siz=
e: small; margin: 0px;">&nbsp;</p><p style=3D"font-family: Arial, Tahoma,=
 Helvetica, sans-serif; font-size: small; margin: 0px;">Thanks,</p><p sty=
le=3D"font-family: Arial, Tahoma, Helvetica, sans-serif; font-size: small=
; margin: 0px;">- Danny</p><pre>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-

Links: You receive all messages sent to this group.

View/Reply Online (#15880): https://lists.yoctoproject.org/g/meta-ti/mess=
age/15880

Mute This Topic: https://lists.yoctoproject.org/mt/97076057/7473053

Group Owner: meta-ti+owner@lists.yoctoproject.org

Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [danny@sizeth=
reestudios.com]

-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



</pre></blockquote></body></html>
</body>
</html>
--=_DyYYaFw-61oKGe7BDTpdNyq4TNvmxyuP78WoiCD8+0SmpwY2--

