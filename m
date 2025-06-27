Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 646D3C7EE2A
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 19:58:29 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.2192.1751054304418054668
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 27 Jun 2025 12:58:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=mrvAJGkV;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: afd@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55RJwNNx2500320;
	Fri, 27 Jun 2025 14:58:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751054303;
	bh=PhawAV/3xhcx3mBPCKxcVErYj+zHpfOQ7hPGSFzD5vI=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=mrvAJGkVxgTCMGO0zyRIW44Th5yESCSTWbaEsInGBpjOrNCdAF/iTyXfYXCRNDRmT
	 G5b1WNRUSObsiCapVkTj8ncH74Tvh+HpUZVPEu1uUTjOowjjaEewo1NkQTCQ2gpeYe
	 5GhoyVvy2T/R+9q+HRXthQ79mNVyANtp37UFfA+k=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55RJwMTp3546183
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 27 Jun 2025 14:58:22 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 27
 Jun 2025 14:58:22 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 27 Jun 2025 14:58:22 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55RJwMku3360831;
	Fri, 27 Jun 2025 14:58:22 -0500
Message-ID: <b34836f3-ce4d-4fcb-85ab-84efc3efa319@ti.com>
Date: Fri, 27 Jun 2025 14:58:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap/master][PATCH 1/2] meta-ti-bsp: conf:
 machine: Deploy all versions of tiboot3.bin
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20250627193003.575911-1-afd@ti.com>
 <e21803ca-4c27-4b2f-9a66-ba4f10a7453e@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <e21803ca-4c27-4b2f-9a66-ba4f10a7453e@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot03.ext.ti.com id 55RJwNNx2500320
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 27 Jun 2025 19:58:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18713

On 6/27/25 2:45 PM, Ryan Eatmon wrote:
>=20
>=20
> On 6/27/2025 2:30 PM, Andrew Davis wrote:
>> For some version of U-Boot some versions of tiboot3.bin were not
>> available. This has since been fixed and now all versions of U-Boot
>> that are supported here have all versions of tiboot3.bin. Deploy
>> these all here.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>> =C2=A0 meta-ti-bsp/conf/machine/include/j7200.inc |=C2=A0 8 ++------
>> =C2=A0 meta-ti-bsp/conf/machine/include/j721e.inc | 19 +++++++++------=
----
>> =C2=A0 meta-ti-bsp/conf/machine/include/j722s.inc |=C2=A0 5 +----
>> =C2=A0 3 files changed, 12 insertions(+), 20 deletions(-)
>>
>> diff --git a/meta-ti-bsp/conf/machine/include/j7200.inc b/meta-ti-bsp/=
conf/machine/include/j7200.inc
>> index 3cba71b6..e7ab409f 100644
>> --- a/meta-ti-bsp/conf/machine/include/j7200.inc
>> +++ b/meta-ti-bsp/conf/machine/include/j7200.inc
>> @@ -7,14 +7,10 @@ SOC_FAMILY:append =3D ":j7200"
>> =C2=A0 IMAGE_BOOT_FILES +=3D "tiboot3-j7200-gp-evm.bin"
>> =C2=A0 # Since default tiboot3.bin on J7200 is for GP, add a version f=
or SR1.0 HS-FS
>> -IMAGE_SR1_HS_FS_FILES =3D "tiboot3-j7200-hs-fs-evm.bin"
>> -IMAGE_SR1_HS_FS_FILES:bsp-mainline =3D ""
>> -IMAGE_BOOT_FILES +=3D "${IMAGE_SR1_HS_FS_FILES}"
>> +IMAGE_BOOT_FILES +=3D "tiboot3-j7200-hs-fs-evm.bin"
>=20
> Are these files now supported in the current version of the u-boot-ti-m=
ainline_git.bb recipe (2025.04)?=C2=A0 Just checking before I try and tes=
t it out.
>=20

Yes, most of these missing files landed upstream around v2024.07,
u-boot-ti-mainline should be safe.

Andrew

>=20
>> =C2=A0 # Since default tiboot3.bin on J7200 is for GP, add a version f=
or SR1.0 HS-SE
>> -IMAGE_SR1_HS_SE_FILES =3D "tiboot3-j7200-hs-evm.bin"
>> -IMAGE_SR1_HS_SE_FILES:bsp-mainline =3D ""
>> -IMAGE_BOOT_FILES +=3D "${IMAGE_SR1_HS_SE_FILES}"
>> +IMAGE_BOOT_FILES +=3D "tiboot3-j7200-hs-evm.bin"
>> =C2=A0 # Since default tiboot3.bin on J7200 is for GP, add a version f=
or SR2.0 HS-FS
>> =C2=A0 IMAGE_BOOT_FILES +=3D "tiboot3-j7200_sr2-hs-fs-evm.bin"
>> diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/=
conf/machine/include/j721e.inc
>> index 30aa2a69..3a5a9af6 100644
>> --- a/meta-ti-bsp/conf/machine/include/j721e.inc
>> +++ b/meta-ti-bsp/conf/machine/include/j721e.inc
>> @@ -15,22 +15,21 @@ IMAGE_BOOT_FILES +=3D "tiboot3-j721e-gp-evm.bin"
>> =C2=A0 IMAGE_BOOT_FILES +=3D "sysfw-j721e-gp-evm.itb"
>> =C2=A0 # Since default on J721e is for GP, add a version for SR1.1 HS-=
FS
>> -IMAGE_SR1_1_HS_FS_FILES =3D "tiboot3-j721e_sr1_1-hs-fs-evm.bin sysfw-=
j721e_sr1_1-hs-fs-evm.itb"
>> -IMAGE_SR1_1_HS_FS_FILES:bsp-mainline =3D ""
>> -IMAGE_BOOT_FILES +=3D "${IMAGE_SR1_1_HS_FS_FILES}"
>> +IMAGE_BOOT_FILES +=3D "tiboot3-j721e_sr1_1-hs-fs-evm.bin"
>> +IMAGE_BOOT_FILES +=3D "sysfw-j721e_sr1_1-hs-fs-evm.itb"
>> =C2=A0 # Since default on J721e is for GP, add a version for SR1.1 HS-=
SE
>> -IMAGE_SR1_1_HS_SE_FILES =3D "tiboot3-j721e_sr1_1-hs-evm.bin sysfw-j72=
1e_sr1_1-hs-evm.itb"
>> -IMAGE_BOOT_FILES +=3D "${IMAGE_SR1_1_HS_SE_FILES}"
>> +IMAGE_SR1_1_HS_SE_FILES =3D " "
>> +IMAGE_BOOT_FILES +=3D "tiboot3-j721e_sr1_1-hs-evm.bin"
>> +IMAGE_BOOT_FILES +=3D "sysfw-j721e_sr1_1-hs-evm.itb"
>> =C2=A0 # Since default on J721e is for GP, add a version for SR2.0 HS-=
FS
>> -IMAGE_SR2_HS_FS_FILES =3D "tiboot3-j721e_sr2-hs-fs-evm.bin sysfw-j721=
e_sr2-hs-fs-evm.itb"
>> -IMAGE_BOOT_FILES +=3D "${IMAGE_SR2_HS_FS_FILES}"
>> +IMAGE_BOOT_FILES +=3D "tiboot3-j721e_sr2-hs-fs-evm.bin"
>> +IMAGE_BOOT_FILES +=3D "sysfw-j721e_sr2-hs-fs-evm.itb"
>> =C2=A0 # Since default on J721e is for GP, add a version for SR2.0 HS-=
SE
>> -IMAGE_SR2_HS_SE_FILES =3D "tiboot3-j721e_sr2-hs-evm.bin sysfw-j721e_s=
r2-hs-evm.itb"
>> -IMAGE_SR2_HS_SE_FILES:bsp-mainline =3D ""
>> -IMAGE_BOOT_FILES +=3D "${IMAGE_SR2_HS_SE_FILES}"
>> +IMAGE_BOOT_FILES +=3D "tiboot3-j721e_sr2-hs-evm.bin"
>> +IMAGE_BOOT_FILES +=3D "sysfw-j721e_sr2-hs-evm.itb"
>> =C2=A0 TFA_BOARD =3D "generic"
>> diff --git a/meta-ti-bsp/conf/machine/include/j722s.inc b/meta-ti-bsp/=
conf/machine/include/j722s.inc
>> index e0b77d96..d49da340 100644
>> --- a/meta-ti-bsp/conf/machine/include/j722s.inc
>> +++ b/meta-ti-bsp/conf/machine/include/j722s.inc
>> @@ -12,10 +12,7 @@ PREFERRED_PROVIDER_virtual/gpudriver ?=3D "${BSP_RO=
GUE_DRIVER_PROVIDER}"
>> =C2=A0 IMAGE_BOOT_FILES +=3D "tiboot3-j722s-hs-fs-evm.bin"
>> =C2=A0 # Since default tiboot3.bin on J722S is for HS-FS, add a versio=
n for HS-SE
>> -IMAGE_SR1_HS_SE_FILES =3D "tiboot3-j722s-hs-evm.bin"
>> -IMAGE_SR1_HS_SE_FILES:bsp-mainline =3D ""
>> -IMAGE_SR1_HS_SE_FILES:bsp-next =3D ""
>> -IMAGE_BOOT_FILES +=3D "${IMAGE_SR1_HS_SE_FILES}"
>> +IMAGE_BOOT_FILES +=3D "tiboot3-j722s-hs-evm.bin"
>> =C2=A0 TFA_BOARD =3D "lite"
>> =C2=A0 TFA_K3_SYSTEM_SUSPEND =3D "1"
>=20

