Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4D0F5E013B0
	for <meta-ti@yoctoproject.org>; Tue,  2 Jul 2013 12:07:53 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r62J7rYi015201
	for <meta-ti@yoctoproject.org>; Tue, 2 Jul 2013 14:07:53 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r62J7q7H022745
	for <meta-ti@yoctoproject.org>; Tue, 2 Jul 2013 14:07:52 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Tue, 2 Jul 2013 14:07:52 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [master & danny][PATCH 1/2] u-boot-am33x: Update
	am335x	to use latest u-boot for 3.2 kernel
Thread-Index: AQHOd0HZpLqiN2VQeEC/Hi71S8hfGJlRwETQ
Date: Tue, 2 Jul 2013 19:07:52 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015963069F@DLEE11.ent.ti.com>
References: <1372783680-32302-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1372783680-32302-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [master & danny][PATCH 1/2] u-boot-am33x: Update am335x	to use latest u-boot for 3.2 kernel
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
X-List-Received-Date: Tue, 02 Jul 2013 19:07:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Cooper Jr., Franklin
>Sent: Tuesday, July 02, 2013 11:48 AM
>To: meta-ti@yoctoproject.org
>Subject: [meta-ti] [master & danny][PATCH 1/2] u-boot-am33x:
>Update am335x to use latest u-boot for 3.2 kernel
>
>Latest commit includes the following:
>* Add support for Beaglebone Black
>* Add fix for Linaro toolchain to insure NOR and RNDIS works.
>* Add workaround for Errata 1.0.24
>* Enable DDR3 power down for BBB and GP evm.
>
>Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>---
> recipes-bsp/u-boot/u-boot-am33x_2013.01.01.bb |    7 +++----
> 1 files changed, 3 insertions(+), 4 deletions(-)
>
>diff --git a/recipes-bsp/u-boot/u-boot-am33x_2013.01.01.bb
>b/recipes-bsp/u-boot/u-boot-am33x_2013.01.01.bb
>index 19ec34e..cb2e850 100644
>--- a/recipes-bsp/u-boot/u-boot-am33x_2013.01.01.bb
>+++ b/recipes-bsp/u-boot/u-boot-am33x_2013.01.01.bb
>@@ -6,15 +6,14 @@ COMPATIBLE_MACHINE =3D "ti33x"
>
> DEFAULT_PREFERENCE =3D "-1"
>
>-PR =3D "r5+gitr${SRCPV}"
>+PR =3D "r6+gitr${SRCPV}"
>
> SRC_URI =3D "git://git.ti.com/ti-u-boot/ti-u-
>boot.git;protocol=3Dgit;branch=3D${BRANCH}"
>
> # This version of u-boot is meant for 3.2 kernel which doesn't
>support device tree.
>-BRANCH =3D "ti-u-boot-2013.01.01-amsdk-05.07.00.00"
>+BRANCH =3D "ti-u-boot-2013.01.01-amsdk-06.00.00.00"
>
>-# Commit corresponds to tag "v2013.01.01_amsdk-05.07.00.00"
>-SRCREV =3D "8eb15a787c558fee98b0fa2a66ff0849c732edcc"
>+SRCREV =3D "540aa6fbb0c9274bda598f7e8819ed28259cad6b"
>
> # Set the name of the SPL that will built so that it is also
>packaged with u-boot.
> SPL_BINARY =3D "MLO"
>--
>1.7.0.4
>
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti

