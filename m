Return-Path: <anshuld@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D02A4C369AB
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 03:02:00 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.10874.1744772510942179202
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 15 Apr 2025 20:01:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=khSJwBYE;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: anshuld@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53G31lFE2644098
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 22:01:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744772507;
	bh=sZ1CuPhqGcwoR0a/cZc6PR9XuPQtEo6VDeqWtkeFKzY=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=khSJwBYED7ESYZvL0AZyNCFjlWJM+3Zb13rODuODgcKjqlR/Vsjv4AhcxZ2zqFRIf
	 0Od3eMTzJRqHZKvfpGBN4vTErd3mOKAvoxH5AvPBdkF94kqntlhsCwc7SO5MwsYmdC
	 lOG28w6ysXOTq+gDlM1USSpstByk8u9SNPztzZSk=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53G31lu3043116
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 15 Apr 2025 22:01:47 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 15
 Apr 2025 22:01:46 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 15 Apr 2025 22:01:46 -0500
Received: from localhost (dhcp-172-24-227-250.dhcp.ti.com [172.24.227.250])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53G31kTx003657;
	Tue, 15 Apr 2025 22:01:46 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 16 Apr 2025 08:31:32 +0530
Message-ID: <D97Q89MR7C3E.2JBAPWQNXXO5E@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <vigneshr@ti.com>
Subject: Re: [meta-ti] [master/scarthgap][PATCH v1 2/3] bsp: conf: machine:
 add ti-falcon.inc
From: Anshul Dalal <anshuld@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250415093645.435281-1-anshuld@ti.com>
 <20250415093645.435281-2-anshuld@ti.com> <20250416001345.GT13634@denix.org>
In-Reply-To: <20250416001345.GT13634@denix.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 16 Apr 2025 03:02:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18475

On Wed Apr 16, 2025 at 5:43 AM IST, Denys Dmytriyenko wrote:
> On Tue, Apr 15, 2025 at 03:06:43PM +0530, Anshul Dalal via lists.yoctopro=
ject.org wrote:
>> ti-falcon.inc configures the following things for enabling falcon boot:
>>=20
>> 1. Change fitImage class to kernel-fitimage-legacyhs
>> 2. Update kernel and dtb address for falcon boot
>> 3. Disable kernel compression
>>=20
>> Signed-off-by: Anshul Dalal <anshuld@ti.com>
>> ---
>>  meta-ti-bsp/conf/machine/include/k3.inc        | 4 ++++
>>  meta-ti-bsp/conf/machine/include/ti-falcon.inc | 5 +++++
>>  2 files changed, 9 insertions(+)
>>  create mode 100644 meta-ti-bsp/conf/machine/include/ti-falcon.inc
>>=20
>> diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/=
machine/include/k3.inc
>> index ea6a5028..329ac037 100644
>> --- a/meta-ti-bsp/conf/machine/include/k3.inc
>> +++ b/meta-ti-bsp/conf/machine/include/k3.inc
>> @@ -56,3 +56,7 @@ TI_WKS_BOOTLOADER_APPEND ?=3D ""
>>  do_image_wic[depends] +=3D "virtual/bootloader:do_deploy"
>> =20
>>  SERIAL_CONSOLES =3D "115200;ttyS0 115200;ttyS2"
>> +
>> +FALCON_INCLUDE:ti-falcon =3D "conf/machine/include/ti-falcon.inc"
>
> Where and how ti-falcon override is being defined/set?
>

It's a DISTROOVERRIDE set in local.conf as follows:

DISTROOVERRIDES:append =3D ":ti-falcon"

>
>> +require ${FALCON_INCLUDE}
>> diff --git a/meta-ti-bsp/conf/machine/include/ti-falcon.inc b/meta-ti-bs=
p/conf/machine/include/ti-falcon.inc
>> new file mode 100644
>> index 00000000..b571c04d
>> --- /dev/null
>> +++ b/meta-ti-bsp/conf/machine/include/ti-falcon.inc
>> @@ -0,0 +1,5 @@
>> +KERNEL_CLASSES:remove =3D "kernel-fitimage"
>> +KERNEL_CLASSES +=3D "kernel-fitimage-legacyhs"
>> +UBOOT_DTB_LOADADDRESS =3D "0x82000000"
>> +UBOOT_LOADADDRESS =3D "0x82200000"
>> +FIT_KERNEL_COMP_ALG =3D "none"


