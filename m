Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47A9AC4708D
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 22:34:23 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.602.1670452461850507817
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 07 Dec 2022 14:34:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=jy++Gz6J;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2B7MYIk6054697;
	Wed, 7 Dec 2022 16:34:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1670452458;
	bh=TL0wc3x/+McewX4Q2QNtvUWjkrVC6ybWy/jsRh5MASU=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=jy++Gz6JCppw1EBRyB7vgFTfI4xNsf8iqJ6TFmLJbdNk1FdJqoiFR8K6JSR4BTTm/
	 shM7ia8weDYEbcdPCIRNT3pZF0aDY0Cx0LZC2j3+zyDNga3sTaNYuGjozTHw03tHsI
	 BTlsa+bRavOrId5jHFUMFowOr80vTEb9pWRtmb/c=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2B7MYIxL111473
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 Dec 2022 16:34:18 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 7
 Dec 2022 16:34:17 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 7 Dec 2022 16:34:17 -0600
Received: from [128.247.81.69] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2B7MYH1t019775;
	Wed, 7 Dec 2022 16:34:17 -0600
Message-ID: <1047cedf-f3ab-b519-63a9-081e8d371480@ti.com>
Date: Wed, 7 Dec 2022 16:34:17 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [meta-ti] [master/kirkstone][PATCH] ti-sci-fw: make dependency on
 meta-ti-extras soft
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
References: <1728C9EC4C3A35F2.13174@lists.yoctoproject.org>
 <20221207222351.GB22689@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20221207222351.GB22689@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 2B7MYIk6054697
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 07 Dec 2022 22:34:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15430


I literally merged this out to master about 30mins ago.


On 12/7/2022 4:23 PM, Denys Dmytriyenko wrote:
> Ping?
>=20
>=20
> On Fri, Nov 18, 2022 at 09:07:49PM +0000, Denys Dmytriyenko wrote:
>> From: Denys Dmytriyenko <denys@konsulko.com>
>>
>> Replace "require" with "include" to load ti-paths.inc and not break
>> parsing when meta-ti-extras is not in the BBLAYERS list.
>>
>> As ti-paths.inc is only needed to define TI_K3_SECDEV_INSTALL_DIR
>> for ti-k3-secdev when TI_SECURE_DEV_PKG_K3 is not set and building
>> for K3 HS platforms. Since ti-k3-secdev resides in meta-ti-extras,
>> the soft dependency will still work fine and give a build error
>> "Nothing PROVIDES 'ti-k3-secdev-native'" when it is needed.
>>
>> Also, since TI_K3_SECDEV_INSTALL_DIR can now be undefined, use
>> d.getVar() to access it ensuring it doesn't break the condition.
>>
>> Reported-by: Daniel D=C3=ADaz <mrchapp@gmail.com>
>> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
>> ---
>>   meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta=
-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>> index e89a6855..c99cd660 100644
>> --- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>> +++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>> @@ -1,5 +1,5 @@
>>   require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>> -require recipes-ti/includes/ti-paths.inc
>> +include recipes-ti/includes/ti-paths.inc
>>  =20
>>   DEPENDS =3D "openssl-native u-boot-mkimage-native dtc-native virtual=
/bootloader"
>>   DEPENDS:remove:am65xx-evm-k3r5 =3D "virtual/bootloader"
>> @@ -20,7 +20,7 @@ COMPATIBLE_MACHINE:aarch64 =3D "null"
>>  =20
>>   PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>  =20
>> -TI_SECURE_DEV_PKG =3D "${@ d.getVar('TI_SECURE_DEV_PKG_K3') or '${TI_=
K3_SECDEV_INSTALL_DIR}' }"
>> +TI_SECURE_DEV_PKG =3D "${@ d.getVar('TI_SECURE_DEV_PKG_K3') or d.getV=
ar('TI_K3_SECDEV_INSTALL_DIR') }"
>>   export TI_SECURE_DEV_PKG
>>  =20
>>   SYSFW_SOC ?=3D "unknown"
>> --=20
>> 2.25.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#15429): https://lists.yoctoproject.org/g/meta-ti/m=
essage/15429
>> Mute This Topic: https://lists.yoctoproject.org/mt/95121729/6551054
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@t=
i.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

