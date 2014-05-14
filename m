Return-Path: <dfldashgkv@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5D2CFE00B83; Wed, 14 May 2014 05:06:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW,RDNS_NONE autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (shiftee[at]eircom.net)
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.216.169 listed in list.dnswl.org]
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Greylist: delayed 1693 seconds by postgrey-1.32 at yocto-www;
	Wed, 14 May 2014 05:06:24 PDT
Received: from mail-qc0-f169.google.com (unknown [209.85.216.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 015EDE00975
	for <meta-ti@yoctoproject.org>; Wed, 14 May 2014 05:06:24 -0700 (PDT)
Received: by mail-qc0-f169.google.com with SMTP id e16so2617829qcx.0
	for <meta-ti@yoctoproject.org>; Wed, 14 May 2014 05:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:message-id:subject:from:to:content-type;
	bh=6wnYWBFddSfregsZSiGmb3zAtmc1Lfg5b/dsb30N3mY=;
	b=BgERwPV9fRgLRZW+zeg9+LVhRreKXANRAkbXMniVTqWd3AZVPklQAFGrLb3Bzks6UB
	PbfrALTF/RKEAdqnC7eJ89tBlq4R6BThpVo6mAswZ1G5WR7G5hWnhE5rRu6R1AZ/vTgZ
	iwRoH1mSoI2hR/PZvD+DlBBH4jpaWM3LFcuHdy1Caa3aFsB3vOF2D5bhhSl+n+Qqmsmc
	KJtFMMNEq96/zk9TyCDBq9oO/duppB6icXMhzs2kOUMi+qvEdn0aYqBfc5BTkB7QA9Zo
	GKZs/+iZHlxkQU7nz4oRzj3k4aMmfRbkrk4tApEo6bD6nAJXx3utqv4wgHG337q7ZdP8
	V/gA==
MIME-Version: 1.0
X-Received: by 10.140.30.99 with SMTP id c90mr4605196qgc.13.1400067490657;
	Wed, 14 May 2014 04:38:10 -0700 (PDT)
Sender: dfldashgkv@gmail.com
Received: by 10.96.42.39 with HTTP; Wed, 14 May 2014 04:38:10 -0700 (PDT)
Date: Wed, 14 May 2014 12:38:10 +0100
X-Google-Sender-Auth: WGSPwW958F83CwDU_QFVf6EpFgQ
Message-ID: <CAJv4cO2zWjwBKPVe9Xs4zs4F6ynQ6987CEdjsRnzVDkH=oThdw@mail.gmail.com>
From: "Mark O'Donovan" <shiftee@eircom.net>
To: meta-ti@yoctoproject.org
Subject: Beaglebone usb issue after first reboot
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
X-List-Received-Date: Wed, 14 May 2014 12:06:29 -0000
Content-Type: multipart/alternative; boundary=001a113a1ada713b7e04f95a9db8

--001a113a1ada713b7e04f95a9db8
Content-Type: text/plain; charset=UTF-8

Issue:
Beaglebone black detects usb devices on first boot after flashing sd-card.
On subsequent boots it does not.

Setup:
Yocto Project 1.5.1
linux-ti-staging 3.12.17
meta-ti = "dora:990d8f62257029e25fc2b8786155bcf5dc483659"

Using the diff command found here:
http://superuser.com/a/470876

I found the following:
diff -r CLEAN-IMAGE/etc/udev/cache.data BOOTED-IMAGE/etc/udev/cache.data
0a1
> Linux version 3.12.17 (modonovan@changanu) (gcc version 4.8.1 (GCC) ) #3
SMP PREEMPT Thu May 1 14:08:42 IST 2014console=ttyO0,115200n8
root=/dev/mmcblk0p2 ro rootfstype=ext4 rootwaitCharacter devices:1 mem4
/dev/vc/04 tty4 ttyS5 /dev/tty5 /dev/console5 /dev/ptmx7 vcs10 misc13
input29 fb81 video4linux89 i2c90 mtd128 ptm136 pts180 usb188 ttyUSB189
usb_device247 ttySDIO248 usbmon249 ttyO250 watchdog251 ptp252 pps253
media254 rtcBlock devices:1 ramdisk259 blkext7 loop8 sd31 mtdblock65 sd66
sd67 sd68 sd69 sd70 sd71 sd128 sd129 sd130 sd131 sd132 sd133 sd134 sd135
sd179 mmc


Running the following after booting fixes the issue on the next boot:
echo "" > /etc/udev/cache.data

Is this a known issue??

Thanks
Mark

--001a113a1ada713b7e04f95a9db8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span class=3D""><span>Issue:<br>Beaglebone black det=
ects usb devices on first boot after flashing sd-card.<br>On subsequent boo=
ts it does not.<br><br>Setup:<br>Yocto Project 1.5.1<br>linux-ti-staging 3.=
12.17<br>
meta-ti =3D &quot;dora:990d8f62257029e25fc2b8786155bcf5dc483659&quot;<br><b=
r>Using the diff command found here:<br><a href=3D"http://superuser.com/a/4=
70876">http://superuser.com/a/470876</a><br><br>I found the following:<br>d=
iff -r CLEAN-IMAGE/etc/udev/cache.data BOOTED-IMAGE/etc/udev/cache.data<br>
0a1<br>&gt; Linux version 3.12.17 (modonovan@changanu) (gcc version 4.8.1 (=
GCC) ) #3 SMP PREEMPT Thu May 1 14:08:42 IST 2014console=3DttyO0,115200n8 r=
oot=3D/dev/mmcblk0p2 ro rootfstype=3Dext4 rootwaitCharacter devices:1 mem4 =
/dev/vc/04 tty4 ttyS5 /dev/tty5 /dev/console5 /dev/ptmx7 vcs10 misc13 input=
29 fb81 video4linux89 i2c90 mtd128 ptm136 pts180 usb188 ttyUSB189 usb_devic=
e247 ttySDIO248 usbmon249 ttyO250 watchdog251 ptp252 pps253 media254 rtcBlo=
ck devices:1 ramdisk259 blkext7 loop8 sd31 mtdblock65 sd66 sd67 sd68 sd69 s=
d70 sd71 sd128 sd129 sd130 sd131 sd132 sd133 sd134 sd135 sd179 mmc<br>
<br><br>Running the following after booting fixes the issue on the next boo=
t:<br>echo &quot;&quot; &gt; /etc/udev/cache.data<br><br></span></span></di=
v><span class=3D""><span>Is this a known issue??<br><br>Thanks<br>Mark<br>
</span></span><div><span class=3D""><span><br></span></span></div></div>

--001a113a1ada713b7e04f95a9db8--
