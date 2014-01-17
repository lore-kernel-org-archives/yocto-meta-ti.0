Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 08B2BE0081B
	for <meta-ti@yoctoproject.org>; Fri, 17 Jan 2014 07:07:03 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0HF72sw006289
	for <meta-ti@yoctoproject.org>; Fri, 17 Jan 2014 09:07:02 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0HF71aa002093
	for <meta-ti@yoctoproject.org>; Fri, 17 Jan 2014 09:07:02 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Fri, 17 Jan 2014 09:07:01 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [PATCH] omap-a15: set the UBI_VOLUME to match u-boot default
Thread-Index: AQHPE5Mvn8C67aXwk0W5woS5wUe4SJqJBD9w
Date: Fri, 17 Jan 2014 15:07:00 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015990240C@DLEE11.ent.ti.com>
References: <1389975009-25868-1-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1389975009-25868-1-git-send-email-Chase.Maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] omap-a15: set the UBI_VOLUME to match u-boot default
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
X-List-Received-Date: Fri, 17 Jan 2014 15:07:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: Maupin, Chase
>Sent: Friday, January 17, 2014 10:10 AM
>To: meta-ti@yoctoproject.org
>Cc: Maupin, Chase
>Subject: [PATCH] omap-a15: set the UBI_VOLUME to match u-boot
>default
>
>* By setting the UBI_VOLUME variable the default name for the
>  UBI rootfs will match the default used by u-boot so images
>  built through OpenEmbedded will work with out-of-box u-boot.
>

Of course I mixed up the variable name :( =20

Want a new patch?


>Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
>---
> conf/machine/include/omap-a15.inc |    4 ++++
> 1 files changed, 4 insertions(+), 0 deletions(-)
>
>diff --git a/conf/machine/include/omap-a15.inc
>b/conf/machine/include/omap-a15.inc
>index b0a0e74..dcf973e 100644
>--- a/conf/machine/include/omap-a15.inc
>+++ b/conf/machine/include/omap-a15.inc
>@@ -24,3 +24,7 @@ XSERVER =3D "xserver-xorg \
>            xf86-video-fbdev"
>
> GUI_MACHINE_CLASS =3D "smallscreen"
>+
>+# Use the expected value of the ubifs filesystem's volume name in
>the kernel
>+# and u-boot.
>+UBI_VOLNAME =3D "rootfs"
>--
>1.7.0.4


