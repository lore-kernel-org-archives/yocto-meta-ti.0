Return-Path: <anshuld@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1643C369B2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 09:48:26 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.4909.1744883302647782633
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 17 Apr 2025 02:48:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=KvzCoTXm;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: anshuld@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53H9mJIa598746
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 04:48:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744883299;
	bh=dVsFpc7SVHRcqiBgRPh72/cEx3bXhV4BUee/gIdoTR0=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=KvzCoTXmQqqwHuyNDg4A2abevp/aKcBO3ZHHmsdYVyzKvc00i2BEgMY3gD5P7TUzn
	 VOHCyEvA2I2nMW6uwG4bcY9h1qC9WeT3DoACSRqN5GvGpCVUBYETVdEIxYEN3UFoIs
	 amMvnYuzk9oOvxLVvHXV53al+sa6VYZDbxT2uJcA=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53H9mJaY001609
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Apr 2025 04:48:19 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 04:48:18 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 04:48:18 -0500
Received: from localhost (dhcp-172-24-227-250.dhcp.ti.com [172.24.227.250])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53H9mIsb114193;
	Thu, 17 Apr 2025 04:48:18 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 17 Apr 2025 15:18:03 +0530
Message-ID: <D98TI2BV15SM.2082RK3JAPB97@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <vigneshr@ti.com>
Subject: Re: [meta-ti] [master/scarthgap][PATCH v1 3/3] bsp: u-boot: deploy
 tispl_falcon.bin to rootfs
From: Anshul Dalal <anshuld@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250415093645.435281-1-anshuld@ti.com>
 <20250415093645.435281-3-anshuld@ti.com> <20250416001139.GS13634@denix.org>
 <D97Q6HRBD7JQ.1JP7679TFG6S5@ti.com> <20250416143338.GU13634@denix.org>
In-Reply-To: <20250416143338.GU13634@denix.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 17 Apr 2025 09:48:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18478

On Wed Apr 16, 2025 at 8:03 PM IST, Denys Dmytriyenko wrote:
> On Wed, Apr 16, 2025 at 08:29:13AM +0530, Anshul Dalal wrote:
>> On Wed Apr 16, 2025 at 5:41 AM IST, Denys Dmytriyenko wrote:
>> > On Tue, Apr 15, 2025 at 03:06:44PM +0530, Anshul Dalal via lists.yocto=
project.org wrote:
>> >> Falcon boot requires tispl_falcon.bin to be on the same filesystem
>> >> partition as the fitImage.
>> >>=20
>> >> This patch creates a new u-boot package called
>> >> 'u-boot-ti-staging-falcon' that is included in IMAGE_INSTALL when
>> >> ti-falcon is enabled which allows us to deploy the required files to
>> >> rootfs.
>> >>=20
>> >> Signed-off-by: Anshul Dalal <anshuld@ti.com>
>> >> ---
>> >>  meta-ti-bsp/conf/machine/include/ti-falcon.inc |  1 +
>> >>  meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc   | 11 +++++++++++
>> >>  2 files changed, 12 insertions(+)
>> >>=20
>> >> diff --git a/meta-ti-bsp/conf/machine/include/ti-falcon.inc b/meta-ti=
-bsp/conf/machine/include/ti-falcon.inc
>> >> index b571c04d..9f93c683 100644
>> >> --- a/meta-ti-bsp/conf/machine/include/ti-falcon.inc
>> >> +++ b/meta-ti-bsp/conf/machine/include/ti-falcon.inc
>> >> @@ -1,3 +1,4 @@
>> >> +IMAGE_INSTALL:append =3D " u-boot-ti-staging-falcon"
>> >
>> > Why +=3D cannot be used here?
>> >
>> >
>> >>  KERNEL_CLASSES:remove =3D "kernel-fitimage"
>> >>  KERNEL_CLASSES +=3D "kernel-fitimage-legacyhs"
>> >>  UBOOT_DTB_LOADADDRESS =3D "0x82000000"
>> >> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-b=
sp/recipes-bsp/u-boot/u-boot-ti.inc
>> >> index 41d4abdd..76803ae3 100644
>> >> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> >> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> >> @@ -14,6 +14,8 @@ require u-boot-mergeconfig.inc
>> >> =20
>> >>  FILESEXTRAPATHS:prepend :=3D "${THISDIR}/u-boot:"
>> >> =20
>> >> +FILES:${PN}-falcon =3D "boot/tispl_falcon.bin"
>> >> +
>> >>  SUMMARY =3D "u-boot bootloader for TI devices"
>> >> =20
>> >>  LICENSE =3D "GPL-2.0-or-later"
>> >> @@ -373,4 +375,13 @@ do_deploy:append:am62pxx() {
>> >>  	install -m 0644 ${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${DEPL=
OYDIR}
>> >>  }
>> >> =20
>> >> +do_install:append:ti-falcon() {
>> >> +	install -m 0644 ${B}/tispl_falcon.bin ${D}/boot
>> >> +}
>> >> +
>> >> +PACKAGES:prepend:am62xx-evm =3D "${PN}-falcon "
>> >> +PACKAGES:prepend:am62axx-evm =3D "${PN}-falcon "
>> >> +PACKAGES:prepend:am62pxx-evm =3D "${PN}-falcon "
>> >> +PACKAGES:prepend:am62xx-lp-evm =3D "${PN}-falcon "
>> >
>> > Shouldn't these be specific to ti-falcon only?
>> >
>> >
>>=20
>> These are the only supported platforms at the moment, depending on
>> machine specific overrides allows us to throw an error at the recipe
>> parsing stage instead of having to wait till the do_install task fails
>> to copy the non-existent tispl_falcon.bin in case of unsupported
>> platforms.
>
> What happens when you build for am62xx-evm and ti-falcon is not enabled?
>

The ${PN}-falcon package is added to the list of packages but the
do_package task is never run for u-boot since it's not in
IMAGES_INSTALL.

So, the net effect is no change to the u-boot's working directory during
the build process. It's only with ti-falcon that the respective
packages-split directory is created with u-boot-ti-staging-falcon
sub-directory.

>
>> As support for more platforms is added, the list can be expanded until
>> all platforms are supported when we can just have a ti-falcon override.


