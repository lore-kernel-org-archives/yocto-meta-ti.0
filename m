Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25A82C7EE23
	for <webhook@archiver.kernel.org>; Thu, 18 May 2023 18:07:05 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.2708.1684433214831254184
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 May 2023 11:06:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=hNObq8T8;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34II6rEu057936;
	Thu, 18 May 2023 13:06:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684433213;
	bh=fw2WGRheUGTdwHqQDIpsiVONxglGXFcYuqAEt7pFD2M=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=hNObq8T8xWOPwTxw43aeFvH16uFb/FYTI0RfFP8TnFH2N/Rek0b6bYVu1QYE8AggW
	 J7WJeZjw/OK7j082vqoGvqfraW07EQVIhGTPCc4xyFPNYQ0rpjLJorHesd2oe39srN
	 z9yY8CS2vPFLMm3kUEdp20tvudk4fNPd63MVjdu8=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34II6rjp015146
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 18 May 2023 13:06:53 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 18
 May 2023 13:06:52 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 18 May 2023 13:06:52 -0500
Received: from [128.247.81.69] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34II6q3k055120;
	Thu, 18 May 2023 13:06:52 -0500
Message-ID: <c4084cbb-f5cf-0a97-c5a9-1836c197c717@ti.com>
Date: Thu, 18 May 2023 13:06:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-ti][kirkstone][PATCH v2 2/2] linux-ti-staging: Use vendored
 kernel-devicetree.bbclass
To: Andrew Davis <afd@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>, "Sapp,
 Randolph" <rs@ti.com>
References: <20230518161519.16296-1-reatmon@ti.com>
 <20230518161519.16296-2-reatmon@ti.com>
 <4b3ecd96-44d1-eeeb-7e58-704d4e041bcc@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <4b3ecd96-44d1-eeeb-7e58-704d4e041bcc@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 34II6rEu057936
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 18 May 2023 18:07:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16562



On 5/18/2023 12:45 PM, Andrew Davis wrote:
> On 5/18/23 11:15 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
>> Change over to using the kernel_devicetree_vendor_dtb.bbclass to have
>> the DTBs installed into the same vendored subdirectory that is in the
>> kernel.
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>> v2: - Fixed syntax of "1"
>> =C2=A0=C2=A0=C2=A0=C2=A0 - Fixed name of custom kernel class to match =
the other patch.
>>
>> =C2=A0 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb | 5 ++=
++-
>> =C2=A0 1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb=20
>> b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
>> index cdee548f..7c992ac5 100644
>> --- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
>> @@ -3,7 +3,7 @@ SUMMARY =3D "Linux kernel for TI devices"
>> =C2=A0 LICENSE =3D "GPL-2.0-only"
>> =C2=A0 LIC_FILES_CHKSUM =3D=20
>> "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7e46"
>> -inherit kernel
>> +inherit kernel_vendor_dtb
>> =C2=A0 require recipes-kernel/linux/setup-defconfig.inc
>> =C2=A0 require recipes-kernel/linux/kernel-rdepends.inc
>> @@ -18,6 +18,9 @@ FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-6.1:"
>> =C2=A0 KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT} \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ${EXTRA_DTC_ARGS}"
>> +KERNEL_DTBDEST =3D "${KERNEL_IMAGEDEST}/dtbs"
>=20
> Do we want this to be "dtbs" or "dtb"? Debian uses "dtb" which is the
> far more common distro today and the one we plan to support in the near
> term. I know I used "dtbs" in the U-Boot side patch for this, but I'm
> having second thoughts and it's easy to switch it over in U-Boot..

If debian does dtb then I vote dtb.  I'll submit a V3 with that change=20
and putting the logic in ti-kernel.inc.



> Andrew
>=20
>> +KERNEL_DTBVENDORED =3D "1"
>> +
>> =C2=A0 S =3D "${WORKDIR}/git"
>> =C2=A0 BRANCH =3D "ti-linux-6.1.y"
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#16558):=20
>> https://lists.yoctoproject.org/g/meta-ti/message/16558
>> Mute This Topic: https://lists.yoctoproject.org/mt/98994752/3619733
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe:=20
>> https://lists.yoctoproject.org/g/meta-ti/leave/6695306/3619733/2033773=
410/xyzzy [afd@ti.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

