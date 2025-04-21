Return-Path: <anshuld@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7DF6C369AB
	for <webhook@archiver.kernel.org>; Mon, 21 Apr 2025 09:02:15 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.11526.1745226126798369789
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Apr 2025 02:02:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=UfylryP0;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: anshuld@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53L922g4870653
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 04:02:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745226122;
	bh=AjGO8Gx63Luzs7zsYoWfoLV2N4eJoV4aXy4xuzEmjs0=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=UfylryP0LQ5bZaOF9MmlYzGNSRQ3CyZXZobdn3C4tPsuiKY13fUMQx+Xo0+OykBaJ
	 jVTiRaWaKBiUWEhoKwysDH4inz9tPcgWPe/mt09YwkuhHbFNcIRcirA5ACe4FrUFL8
	 GDiv2GJDo017toYQNhZZfwKlNPX8SDmnhPJd/m0A=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53L922nY044346
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Apr 2025 04:02:02 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Apr 2025 04:02:02 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Apr 2025 04:02:02 -0500
Received: from localhost (dhcp-172-24-227-250.dhcp.ti.com [172.24.227.250])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53L9211d071568;
	Mon, 21 Apr 2025 04:02:02 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 21 Apr 2025 14:31:47 +0530
Message-ID: <D9C70TMTDU7I.PPZ1VFPEJF5Y@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <vigneshr@ti.com>
Subject: Re: [meta-ti] [master/scarthgap][PATCH v1 3/3] bsp: u-boot: deploy
 tispl_falcon.bin to rootfs
From: Anshul Dalal <anshuld@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250415093645.435281-1-anshuld@ti.com>
 <20250415093645.435281-3-anshuld@ti.com> <20250416001139.GS13634@denix.org>
 <D97Q6HRBD7JQ.1JP7679TFG6S5@ti.com> <20250416143338.GU13634@denix.org>
 <D98TI2BV15SM.2082RK3JAPB97@ti.com> <20250417183728.GY13634@denix.org>
In-Reply-To: <20250417183728.GY13634@denix.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 21 Apr 2025 09:02:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18490

On Fri Apr 18, 2025 at 12:07 AM IST, Denys Dmytriyenko wrote:
> On Thu, Apr 17, 2025 at 03:18:03PM +0530, Anshul Dalal wrote:
>> On Wed Apr 16, 2025 at 8:03 PM IST, Denys Dmytriyenko wrote:
>> > On Wed, Apr 16, 2025 at 08:29:13AM +0530, Anshul Dalal wrote:
>> >> On Wed Apr 16, 2025 at 5:41 AM IST, Denys Dmytriyenko wrote:
>> >> > On Tue, Apr 15, 2025 at 03:06:44PM +0530, Anshul Dalal via lists.yo=
ctoproject.org wrote:
>> >> >> Falcon boot requires tispl_falcon.bin to be on the same filesystem
>> >> >> partition as the fitImage.
>> >> >>=20
>> >> >> This patch creates a new u-boot package called
>> >> >> 'u-boot-ti-staging-falcon' that is included in IMAGE_INSTALL when
>> >> >> ti-falcon is enabled which allows us to deploy the required files =
to
>> >> >> rootfs.
>> >> >>=20
>> >> >> Signed-off-by: Anshul Dalal <anshuld@ti.com>
>> >> >> ---
>> >> >>  meta-ti-bsp/conf/machine/include/ti-falcon.inc |  1 +
>> >> >>  meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc   | 11 +++++++++++
>> >> >>  2 files changed, 12 insertions(+)
>> >> >>=20
>> >> >> diff --git a/meta-ti-bsp/conf/machine/include/ti-falcon.inc b/meta=
-ti-bsp/conf/machine/include/ti-falcon.inc
>> >> >> index b571c04d..9f93c683 100644
>> >> >> --- a/meta-ti-bsp/conf/machine/include/ti-falcon.inc
>> >> >> +++ b/meta-ti-bsp/conf/machine/include/ti-falcon.inc
>> >> >> @@ -1,3 +1,4 @@
>> >> >> +IMAGE_INSTALL:append =3D " u-boot-ti-staging-falcon"
>> >> >
>> >> > Why +=3D cannot be used here?
>> >> >
>> >> >
>> >> >>  KERNEL_CLASSES:remove =3D "kernel-fitimage"
>> >> >>  KERNEL_CLASSES +=3D "kernel-fitimage-legacyhs"
>> >> >>  UBOOT_DTB_LOADADDRESS =3D "0x82000000"
>> >> >> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-t=
i-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> >> >> index 41d4abdd..76803ae3 100644
>> >> >> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> >> >> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> >> >> @@ -14,6 +14,8 @@ require u-boot-mergeconfig.inc
>> >> >> =20
>> >> >>  FILESEXTRAPATHS:prepend :=3D "${THISDIR}/u-boot:"
>> >> >> =20
>> >> >> +FILES:${PN}-falcon =3D "boot/tispl_falcon.bin"
>> >> >> +
>> >> >>  SUMMARY =3D "u-boot bootloader for TI devices"
>> >> >> =20
>> >> >>  LICENSE =3D "GPL-2.0-or-later"
>> >> >> @@ -373,4 +375,13 @@ do_deploy:append:am62pxx() {
>> >> >>  	install -m 0644 ${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${D=
EPLOYDIR}
>> >> >>  }
>> >> >> =20
>> >> >> +do_install:append:ti-falcon() {
>> >> >> +	install -m 0644 ${B}/tispl_falcon.bin ${D}/boot
>> >> >> +}
>> >> >> +
>> >> >> +PACKAGES:prepend:am62xx-evm =3D "${PN}-falcon "
>> >> >> +PACKAGES:prepend:am62axx-evm =3D "${PN}-falcon "
>> >> >> +PACKAGES:prepend:am62pxx-evm =3D "${PN}-falcon "
>> >> >> +PACKAGES:prepend:am62xx-lp-evm =3D "${PN}-falcon "
>> >> >
>> >> > Shouldn't these be specific to ti-falcon only?
>> >> >
>> >> >
>> >>=20
>> >> These are the only supported platforms at the moment, depending on
>> >> machine specific overrides allows us to throw an error at the recipe
>> >> parsing stage instead of having to wait till the do_install task fail=
s
>> >> to copy the non-existent tispl_falcon.bin in case of unsupported
>> >> platforms.
>> >
>> > What happens when you build for am62xx-evm and ti-falcon is not enable=
d?
>> >
>>=20
>> The ${PN}-falcon package is added to the list of packages but the
>> do_package task is never run for u-boot since it's not in
>> IMAGES_INSTALL.
>
> All our platforms have u-boot in EXTRA_IMAGEDEPENDS, which means u-boot g=
ets=20
> built and packaged all the time. Moreover, it's common to "bitbake u-boot=
"
>

Recipes in EXTRA_IMAGEDEPENDS don't provide any packages to rootfs[1],
hence why u-boot has no `package` directory when ti-falcon is not set or
even before this patch set.

Therefore having the falcon u-boot package in PACKAGES does not change
the build time behaviour until it's added to IMAGES_INSTALL (which is
only done when ti-falcon is set).

In my testing, there is no difference between the work directory for
u-boot with ti-falcon unset vs the work directory before this patch
set[2].

[1]:
https://docs.yoctoproject.org/ref-manual/variables.html#term-EXTRA_IMAGEDEP=
ENDS

[2]:
U-boot's work directories:

# before patch set:
build                     image            recipe-sysroot-native  temp
deploy-source-date-epoch  license-destdir  source-date-epoch
deploy-u-boot-ti-staging  pseudo           srcipk-staging
git                       recipe-sysroot   sysroot-destdir

# without ti-falcon:
build                     image            recipe-sysroot-native  temp
deploy-source-date-epoch  license-destdir  source-date-epoch
deploy-u-boot-ti-staging  pseudo           srcipk-staging
git                       recipe-sysroot   sysroot-destdir

# with ti-falcon:
build                     package              recipe-sysroot-native
deploy-ipks               packages-split       source-date-epoch
deploy-source-date-epoch  pkgdata              spdx
deploy-u-boot-ti-staging  pkgdata-pdata-input  srcipk-staging
git                       pkgdata-sysroot      sysroot-destdir
image                     pseudo               temp
license-destdir           recipe-sysroot

---
Regards,
Anshul

>
>> So, the net effect is no change to the u-boot's working directory during
>> the build process. It's only with ti-falcon that the respective
>> packages-split directory is created with u-boot-ti-staging-falcon
>> sub-directory.
>>=20
>> >
>> >> As support for more platforms is added, the list can be expanded unti=
l
>> >> all platforms are supported when we can just have a ti-falcon overrid=
e.


