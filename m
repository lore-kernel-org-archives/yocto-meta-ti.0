Return-Path: <anshuld@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDABFC369AB
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 02:59:40 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.10953.1744772371982509039
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 15 Apr 2025 19:59:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=wJ3e23/K;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: anshuld@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53G2xSNX186964
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 21:59:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744772368;
	bh=y7DWxqCU4KsGTDy7jdQ70h0yKi33eBdTBFATXpkuPjM=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=wJ3e23/KeJIl3monV/rQQP3ijnEDBAVdE+B73/3tbIXEQGf2uJRSrm8p8OvOmySkq
	 9i5VdqbjP4eeGVo12KC3K92MoQ2f7oQQO+m8iTGJ1kmR/wiNAOa0ltSp3bzEu0N/JU
	 GvSb3lPPrBQqOF6ZujFcDEXImR+w38T5/4DUQsLY=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53G2xSgH076252
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 15 Apr 2025 21:59:28 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 15
 Apr 2025 21:59:27 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 15 Apr 2025 21:59:27 -0500
Received: from localhost (dhcp-172-24-227-250.dhcp.ti.com [172.24.227.250])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53G2xRdX118889;
	Tue, 15 Apr 2025 21:59:27 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 16 Apr 2025 08:29:13 +0530
Message-ID: <D97Q6HRBD7JQ.1JP7679TFG6S5@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <vigneshr@ti.com>
Subject: Re: [meta-ti] [master/scarthgap][PATCH v1 3/3] bsp: u-boot: deploy
 tispl_falcon.bin to rootfs
From: Anshul Dalal <anshuld@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250415093645.435281-1-anshuld@ti.com>
 <20250415093645.435281-3-anshuld@ti.com> <20250416001139.GS13634@denix.org>
In-Reply-To: <20250416001139.GS13634@denix.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 16 Apr 2025 02:59:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18474

On Wed Apr 16, 2025 at 5:41 AM IST, Denys Dmytriyenko wrote:
> On Tue, Apr 15, 2025 at 03:06:44PM +0530, Anshul Dalal via lists.yoctopro=
ject.org wrote:
>> Falcon boot requires tispl_falcon.bin to be on the same filesystem
>> partition as the fitImage.
>>=20
>> This patch creates a new u-boot package called
>> 'u-boot-ti-staging-falcon' that is included in IMAGE_INSTALL when
>> ti-falcon is enabled which allows us to deploy the required files to
>> rootfs.
>>=20
>> Signed-off-by: Anshul Dalal <anshuld@ti.com>
>> ---
>>  meta-ti-bsp/conf/machine/include/ti-falcon.inc |  1 +
>>  meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc   | 11 +++++++++++
>>  2 files changed, 12 insertions(+)
>>=20
>> diff --git a/meta-ti-bsp/conf/machine/include/ti-falcon.inc b/meta-ti-bs=
p/conf/machine/include/ti-falcon.inc
>> index b571c04d..9f93c683 100644
>> --- a/meta-ti-bsp/conf/machine/include/ti-falcon.inc
>> +++ b/meta-ti-bsp/conf/machine/include/ti-falcon.inc
>> @@ -1,3 +1,4 @@
>> +IMAGE_INSTALL:append =3D " u-boot-ti-staging-falcon"
>
> Why +=3D cannot be used here?
>
>
>>  KERNEL_CLASSES:remove =3D "kernel-fitimage"
>>  KERNEL_CLASSES +=3D "kernel-fitimage-legacyhs"
>>  UBOOT_DTB_LOADADDRESS =3D "0x82000000"
>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/=
recipes-bsp/u-boot/u-boot-ti.inc
>> index 41d4abdd..76803ae3 100644
>> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> @@ -14,6 +14,8 @@ require u-boot-mergeconfig.inc
>> =20
>>  FILESEXTRAPATHS:prepend :=3D "${THISDIR}/u-boot:"
>> =20
>> +FILES:${PN}-falcon =3D "boot/tispl_falcon.bin"
>> +
>>  SUMMARY =3D "u-boot bootloader for TI devices"
>> =20
>>  LICENSE =3D "GPL-2.0-or-later"
>> @@ -373,4 +375,13 @@ do_deploy:append:am62pxx() {
>>  	install -m 0644 ${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${DEPLOYD=
IR}
>>  }
>> =20
>> +do_install:append:ti-falcon() {
>> +	install -m 0644 ${B}/tispl_falcon.bin ${D}/boot
>> +}
>> +
>> +PACKAGES:prepend:am62xx-evm =3D "${PN}-falcon "
>> +PACKAGES:prepend:am62axx-evm =3D "${PN}-falcon "
>> +PACKAGES:prepend:am62pxx-evm =3D "${PN}-falcon "
>> +PACKAGES:prepend:am62xx-lp-evm =3D "${PN}-falcon "
>
> Shouldn't these be specific to ti-falcon only?
>
>

These are the only supported platforms at the moment, depending on
machine specific overrides allows us to throw an error at the recipe
parsing stage instead of having to wait till the do_install task fails
to copy the non-existent tispl_falcon.bin in case of unsupported
platforms.

As support for more platforms is added, the list can be expanded until
all platforms are supported when we can just have a ti-falcon override.

>> +
>>  TOOLCHAIN =3D "gcc"


