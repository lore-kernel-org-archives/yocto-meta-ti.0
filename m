Return-Path: <apetroaiecristeamihaela@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B9C89E00A1C; Fri, 10 Feb 2017 08:46:19 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (apetroaiecristeamihaela[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.213.48 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-vk0-f48.google.com (mail-vk0-f48.google.com
	[209.85.213.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 47E35E00724
	for <meta-ti@yoctoproject.org>; Fri, 10 Feb 2017 08:46:03 -0800 (PST)
Received: by mail-vk0-f48.google.com with SMTP id t8so29426840vke.3
	for <meta-ti@yoctoproject.org>; Fri, 10 Feb 2017 08:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=p+zO7nXjfP8KHT89JtOvtWlVGYqCs0Cu7WENeTlbZq8=;
	b=LiUQ1sQrbj2We/6i0eoGHVUcV+dxtA74xuxupjU0ufZcLWte2STD53kYjHhGEoTFCW
	+GpzYFl368xsGk87HMIjeXx/0HAHWORM3Zw6Nu8qzOAkdwB3oS/jUMZErWRMOEZz6bz1
	q/c7E2FXEN92/RWs3T0IosozSs5keb8DbdZ720NFaW7bPuMJttqK2xsCHOeYVkWgIdTP
	BVgETpYx4yXlquFZLLKORM31VDHajuMVDCMI77Zur6UddStCoIMdUZxGie9waV/27Zd3
	Eg4YUyLuhgzpz9K9M15+aJwndbTTmyXxBfQjzrcd5o75gEFBlXPzpEktgQ2+QwGy9Ixc
	d48w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=p+zO7nXjfP8KHT89JtOvtWlVGYqCs0Cu7WENeTlbZq8=;
	b=idWGg0TJk2ncQkWu9q303XtPlDda+AijyeihNiGGkGxXglN94qIIdc9ULBU7Y34VXf
	J/Ok1vmmpvgK2WWc7AkwBetpu6ZYxG7n1eEV3Uxd0vR0pVFARiOEOx6Om+9ohdMb4guj
	zuJ7h4GJGJXB8NPIlcNBVPQdTIVAZq7AqhIBxLPLLwFfNDyfJBPMkLSDF8MgxwmaJ+A9
	ZEWgk1Bdn9e7RybFYmeRsHq3DR9L8TFkZXSUHoPaT+C1U3TSkQDAzZOyhLQYRqfglB3H
	lF1hYVc+xLUsYvvrP+4hdRGk0Vv7HWC+Bw6mXV3o84MPh2YLAuIINa20Ki4Ev06A0Dnv
	S0Rg==
X-Gm-Message-State: AMke39k89UhUdmRVLZ8Io424HQs/1hbyx8au7vGEsK0OVCDdLobufGX7fBk1b7ln03sIqxmwSm4Sjc76JkJ3yg==
X-Received: by 10.31.171.205 with SMTP id u196mr4698777vke.22.1486745162749;
	Fri, 10 Feb 2017 08:46:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.103.143.147 with HTTP; Fri, 10 Feb 2017 08:46:02 -0800 (PST)
From: Mihaela Apetroaie-Cristea <apetroaiecristeamihaela@gmail.com>
Date: Fri, 10 Feb 2017 16:46:02 +0000
Message-ID: <CAFKtCfGckvbaw5ULEz4-34XNbs-1Y72fB+HoR1pRZOBkZMkt4g@mail.gmail.com>
To: meta-ti@yoctoproject.org
Subject: failed to build sdimg
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
X-List-Received-Date: Fri, 10 Feb 2017 16:46:19 -0000
Content-Type: multipart/alternative; boundary=001a1143ea104c31c705482fd5b4

--001a1143ea104c31c705482fd5b4
Content-Type: text/plain; charset=UTF-8

Hello,

I am trying to build a Beaglebone image using yocto and the meta-ti layer,
but I am getting the following error:

0+0 records out
0 bytes (0 B) copied, 8.3469e-05 s, 0.0 kB/s
+ mkfs.ext4 -F
/media/mika/new/poky/build3/tmp/work/beaglebone-poky-linux-gnueabi/core-image-minimal/1.0-r0/data.ext4
-d
/media/mika/new/poky/build3/tmp/work/beaglebone-poky-linux-gnueabi/core-image-minimal/1.0-r0/data
mke2fs 1.43 (17-May-2016)
Discarding device blocks:
1024/131072^H^H^H^H^H^H^H^H^H^H^H^H^H
^H^H^H^H^H^H^H^H^H^H^H^H^Hdone
Creating filesystem with 131072 1k blocks and 32768 inodes
Filesystem UUID: 0b7bc83e-79f0-4136-8426-b56ac37f45bf
Superblock backups stored on blocks:
        8193, 24577, 40961, 57345, 73729

Allocating group tables:  0/16^H^H^H^H^H     ^H^H^H^H^Hdone
Writing inode tables:  0/16^H^H^H^H^H     ^H^H^H^H^Hdone
Creating journal (4096 blocks): done
Copying files into the device: done
Writing superblocks and filesystem accounting information:
0/16^H^H^H^H^H     ^H^H^H^H^Hdone

+
wks=/media/mika/new/poky/build3/tmp/work/beaglebone-poky-linux-gnueabi/core-image-minimal/1.0-r0/mender-sdimg.wks
+ rm -f
/media/mika/new/poky/build3/tmp/work/beaglebone-poky-linux-gnueabi/core-image-minimal/1.0-r0/mender-sdimg.wks
+ [ -n  ]
+ [ -n 4194304 ]
+ expr 4194304 / 1024
+ boot_env_align_kb=4096
+ cat
+ cat
+
outimgname=/media/mika/new/poky/build3/tmp/deploy/images/beaglebone/core-image-minimal-beaglebone-20170210153152.sdimg
+
wicout=/media/mika/new/poky/build3/tmp/work/beaglebone-poky-linux-gnueabi/core-image-minimal/1.0-r0/deploy-core-image-minimal-image-complete/core-image-minimal-beaglebone-20170210153152-sdimg
+ BUILDDIR=/media/mika/new/poky/build3 wic create
/media/mika/new/poky/build3/tmp/work/beaglebone-poky-linux-gnueabi/core-image-minimal/1.0-r0/mender-sdimg.wks
--vars /media/mika/new/poky/build3/tmp/sysroots/beaglebone/imgdata/ $
Warning: bootloader config not specified, using defaults
Error: Malformed boot file entry: u-boot.bin;
Checking basic build environment...
Done.

Creating image(s)...

+ bb_exit_handler
+ ret=1
+ echo WARNING: exit code 1 from a shell command.
WARNING: exit code 1 from a shell command.
+ exit 1
ERROR: Function failed: do_image_sdimg (log file is located at
/media/mika/new/poky/build3/tmp/work/beaglebone-poky-linux-gnueabi/core-image-minimal/1.0-r0/temp/log.do_image_sdimg.32746)


I am building the image on a Debian Jessie VM, metat-ti and poky are both
morty up to date.

Thanks,

Mihaela

--001a1143ea104c31c705482fd5b4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hello, <br><br></div>I am trying to build a=
 Beaglebone image using yocto and the meta-ti layer, but I am getting the f=
ollowing error:<br><br>0+0 records out<br>0 bytes (0 B) copied, 8.3469e-05 =
s, 0.0 kB/s<br>+ mkfs.ext4 -F /media/mika/new/poky/build3/tmp/work/beaglebo=
ne-poky-linux-gnueabi/core-image-minimal/1.0-r0/data.ext4 -d /media/mika/ne=
w/poky/build3/tmp/work/beaglebone-poky-linux-gnueabi/core-image-minimal/1.0=
-r0/data<br>mke2fs 1.43 (17-May-2016)<br>Discarding device blocks:=C2=A0=C2=
=A0 1024/131072^H^H^H^H^H^H^H^H^H^H^H^H^H=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^H^H^H^H^H^H^H^H^H^H^H^H^Hdone<br>C=
reating filesystem with 131072 1k blocks and 32768 inodes<br>Filesystem UUI=
D: 0b7bc83e-79f0-4136-8426-b56ac37f45bf<br>Superblock backups stored on blo=
cks:<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8193, 24577, 40961, 5734=
5, 73729<br><br>Allocating group tables:=C2=A0 0/16^H^H^H^H^H=C2=A0=C2=A0=
=C2=A0=C2=A0 ^H^H^H^H^Hdone<br>Writing inode tables:=C2=A0 0/16^H^H^H^H^H=
=C2=A0=C2=A0=C2=A0=C2=A0 ^H^H^H^H^Hdone<br>Creating journal (4096 blocks): =
done<br>Copying files into the device: done<br>Writing superblocks and file=
system accounting information:=C2=A0 0/16^H^H^H^H^H=C2=A0=C2=A0=C2=A0=C2=A0=
 ^H^H^H^H^Hdone<br><br>+ wks=3D/media/mika/new/poky/build3/tmp/work/beagleb=
one-poky-linux-gnueabi/core-image-minimal/1.0-r0/mender-sdimg.wks<br>+ rm -=
f /media/mika/new/poky/build3/tmp/work/beaglebone-poky-linux-gnueabi/core-i=
mage-minimal/1.0-r0/mender-sdimg.wks<br>+ [ -n=C2=A0 ]<br>+ [ -n 4194304 ]<=
br>+ expr 4194304 / 1024<br>+ boot_env_align_kb=3D4096<br>+ cat<br>+ cat<br=
>+ outimgname=3D/media/mika/new/poky/build3/tmp/deploy/images/beaglebone/co=
re-image-minimal-beaglebone-20170210153152.sdimg<br>+ wicout=3D/media/mika/=
new/poky/build3/tmp/work/beaglebone-poky-linux-gnueabi/core-image-minimal/1=
.0-r0/deploy-core-image-minimal-image-complete/core-image-minimal-beaglebon=
e-20170210153152-sdimg<br>+ BUILDDIR=3D/media/mika/new/poky/build3 wic crea=
te /media/mika/new/poky/build3/tmp/work/beaglebone-poky-linux-gnueabi/core-=
image-minimal/1.0-r0/mender-sdimg.wks --vars /media/mika/new/poky/build3/tm=
p/sysroots/beaglebone/imgdata/ $<br>Warning: bootloader config not specifie=
d, using defaults<br>Error: Malformed boot file entry: u-boot.bin;<br>Check=
ing basic build environment...<br>Done.<br><br>Creating image(s)...<br><br>=
+ bb_exit_handler<br>+ ret=3D1<br>+ echo WARNING: exit code 1 from a shell =
command.<br>WARNING: exit code 1 from a shell command.<br>+ exit 1<br>ERROR=
: Function failed: do_image_sdimg (log file is located at /media/mika/new/p=
oky/build3/tmp/work/beaglebone-poky-linux-gnueabi/core-image-minimal/1.0-r0=
/temp/log.do_image_sdimg.32746)<br><br><br></div>I am building the image on=
 a Debian Jessie VM, metat-ti and poky are both morty up to date.<br><br></=
div>Thanks,<br><div><div><br clear=3D"all"></div><div>Mihaela<br></div></di=
v></div>

--001a1143ea104c31c705482fd5b4--
