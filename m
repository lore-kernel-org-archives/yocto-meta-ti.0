Return-Path: <anshuld@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C465C369CB
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 08:13:15 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.3429.1745395992335752482
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 23 Apr 2025 01:13:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=M6V4r9OK;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: anshuld@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53N8D9601466311
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Apr 2025 03:13:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745395989;
	bh=ZJWOtfWyo8W/kmN0+twe7Wv5K0lf8HHhn6RHIOxf8R8=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=M6V4r9OK06WzqGkzy0tQAiub4L+2FSQh6Jk3AL9kQfJqLL2MyuJQzbDGX1lSEYLzt
	 DBgGKXpATLewIHOxNUVYD23DM6d+qgBj9eyrM9g2nDgtuuUSgh6U3Mdg5pAoNFlV4d
	 whF/lWpTB1W0tEgIN2sKMXUAcVV6IDntD55qMEyA=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53N8D9to011906
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 23 Apr 2025 03:13:09 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 23
 Apr 2025 03:13:09 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 23 Apr 2025 03:13:09 -0500
Received: from localhost (dhcp-172-24-227-250.dhcp.ti.com [172.24.227.250])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53N8D8Rk064494;
	Wed, 23 Apr 2025 03:13:08 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 23 Apr 2025 13:42:53 +0530
Message-ID: <D9DV8GS74GWH.36519WE3YAUTX@ti.com>
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
 <D9C70TMTDU7I.PPZ1VFPEJF5Y@ti.com> <20250422195316.GZ13634@denix.org>
In-Reply-To: <20250422195316.GZ13634@denix.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 23 Apr 2025 08:13:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18496

On Wed Apr 23, 2025 at 1:23 AM IST, Denys Dmytriyenko wrote:
> On Mon, Apr 21, 2025 at 02:31:47PM +0530, Anshul Dalal wrote:
>> On Fri Apr 18, 2025 at 12:07 AM IST, Denys Dmytriyenko wrote:
>> > On Thu, Apr 17, 2025 at 03:18:03PM +0530, Anshul Dalal wrote:
>> >> On Wed Apr 16, 2025 at 8:03 PM IST, Denys Dmytriyenko wrote:
>> >> > On Wed, Apr 16, 2025 at 08:29:13AM +0530, Anshul Dalal wrote:
>> >> >> On Wed Apr 16, 2025 at 5:41 AM IST, Denys Dmytriyenko wrote:
>> >> >> > On Tue, Apr 15, 2025 at 03:06:44PM +0530, Anshul Dalal via lists=
.yoctoproject.org wrote:
>> >> >> >> Falcon boot requires tispl_falcon.bin to be on the same filesys=
tem
>> >> >> >> partition as the fitImage.
>> >> >> >>=20
>> >> >> >> This patch creates a new u-boot package called
>> >> >> >> 'u-boot-ti-staging-falcon' that is included in IMAGE_INSTALL wh=
en
>> >> >> >> ti-falcon is enabled which allows us to deploy the required fil=
es to
>> >> >> >> rootfs.
>> >> >> >>=20
>> >> >> >> Signed-off-by: Anshul Dalal <anshuld@ti.com>
>> >> >> >> ---
>> >> >> >>  meta-ti-bsp/conf/machine/include/ti-falcon.inc |  1 +
>> >> >> >>  meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc   | 11 ++++++++++=
+
>> >> >> >>  2 files changed, 12 insertions(+)
>> >> >> >>=20
>> >> >> >> diff --git a/meta-ti-bsp/conf/machine/include/ti-falcon.inc b/m=
eta-ti-bsp/conf/machine/include/ti-falcon.inc
>> >> >> >> index b571c04d..9f93c683 100644
>> >> >> >> --- a/meta-ti-bsp/conf/machine/include/ti-falcon.inc
>> >> >> >> +++ b/meta-ti-bsp/conf/machine/include/ti-falcon.inc
>> >> >> >> @@ -1,3 +1,4 @@
>> >> >> >> +IMAGE_INSTALL:append =3D " u-boot-ti-staging-falcon"
>> >> >> >
>> >> >> > Why +=3D cannot be used here?
>> >> >> >
>> >> >> >
>> >> >> >>  KERNEL_CLASSES:remove =3D "kernel-fitimage"
>> >> >> >>  KERNEL_CLASSES +=3D "kernel-fitimage-legacyhs"
>> >> >> >>  UBOOT_DTB_LOADADDRESS =3D "0x82000000"
>> >> >> >> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/met=
a-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> >> >> >> index 41d4abdd..76803ae3 100644
>> >> >> >> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> >> >> >> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> >> >> >> @@ -14,6 +14,8 @@ require u-boot-mergeconfig.inc
>> >> >> >> =20
>> >> >> >>  FILESEXTRAPATHS:prepend :=3D "${THISDIR}/u-boot:"
>> >> >> >> =20
>> >> >> >> +FILES:${PN}-falcon =3D "boot/tispl_falcon.bin"
>> >> >> >> +
>> >> >> >>  SUMMARY =3D "u-boot bootloader for TI devices"
>> >> >> >> =20
>> >> >> >>  LICENSE =3D "GPL-2.0-or-later"
>> >> >> >> @@ -373,4 +375,13 @@ do_deploy:append:am62pxx() {
>> >> >> >>  	install -m 0644 ${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz =
${DEPLOYDIR}
>> >> >> >>  }
>> >> >> >> =20
>> >> >> >> +do_install:append:ti-falcon() {
>> >> >> >> +	install -m 0644 ${B}/tispl_falcon.bin ${D}/boot
>> >> >> >> +}
>> >> >> >> +
>> >> >> >> +PACKAGES:prepend:am62xx-evm =3D "${PN}-falcon "
>> >> >> >> +PACKAGES:prepend:am62axx-evm =3D "${PN}-falcon "
>> >> >> >> +PACKAGES:prepend:am62pxx-evm =3D "${PN}-falcon "
>> >> >> >> +PACKAGES:prepend:am62xx-lp-evm =3D "${PN}-falcon "
>> >> >> >
>> >> >> > Shouldn't these be specific to ti-falcon only?
>> >> >> >
>> >> >> >
>> >> >>=20
>> >> >> These are the only supported platforms at the moment, depending on
>> >> >> machine specific overrides allows us to throw an error at the reci=
pe
>> >> >> parsing stage instead of having to wait till the do_install task f=
ails
>> >> >> to copy the non-existent tispl_falcon.bin in case of unsupported
>> >> >> platforms.
>> >> >
>> >> > What happens when you build for am62xx-evm and ti-falcon is not ena=
bled?
>> >> >
>> >>=20
>> >> The ${PN}-falcon package is added to the list of packages but the
>> >> do_package task is never run for u-boot since it's not in
>> >> IMAGES_INSTALL.
>> >
>> > All our platforms have u-boot in EXTRA_IMAGEDEPENDS, which means u-boo=
t gets=20
>> > built and packaged all the time. Moreover, it's common to "bitbake u-b=
oot"
>> >
>>=20
>> Recipes in EXTRA_IMAGEDEPENDS don't provide any packages to rootfs[1],
>> hence why u-boot has no `package` directory when ti-falcon is not set or
>> even before this patch set.
>>=20
>> Therefore having the falcon u-boot package in PACKAGES does not change
>> the build time behaviour until it's added to IMAGES_INSTALL (which is
>> only done when ti-falcon is set).
>>=20
>> In my testing, there is no difference between the work directory for
>> u-boot with ti-falcon unset vs the work directory before this patch
>> set[2].
>>=20
[snip]
>
> You should not rely on this behavior expecting that U-boot will be built,=
 but=20
> not packaged!
>
> In scarthgap, this may be true:
>
> $ MACHINE=3Dam62xx-evm bitbake tisdk-base-image -g
> $ grep '\-> "u-boot-ti-staging.do_package' task-depends.dot
> $
>
> But in walnascar/master, SPDX 3.x functionality for SW Bill of Materials =
is=20
> enabled by default and operates on packages, hence do_package() task will=
 be=20
> called for U-boot:
>

Well in that case, we can use nested overrides using ti-falcon as well
as the machine specific config. Like below:

PACKAGES:prepend:ti-append:am62xx-evm =3D "${PN}-falcon "
PACKAGES:prepend:ti-append:am62axx-evm =3D "${PN}-falcon "
PACKAGES:prepend:ti-append:am62pxx-evm =3D "${PN}-falcon "
PACKAGES:prepend:ti-append:am62xx-lp-evm =3D "${PN}-falcon "

[snip]

