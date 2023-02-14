Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CDD3C61DA4
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 20:46:08 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.5734.1676407561964667843
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 14 Feb 2023 12:46:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=DyK1eIjx;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31EKk1Rd028646;
	Tue, 14 Feb 2023 14:46:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1676407561;
	bh=I78qwGehYpfKoww4m/4pc3ZkZ9Pyo24vJ2VjZFKu+bM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=DyK1eIjx0CX0r9DaaqO7O/eTB0lBQxzlU5C/jDOfI6jI1apkDoOoOZydNbJ6/viU9
	 hcFJm9m9dTcKodsFvwAenyEWdwpWM0r14eNimIjI9HhBl01y9buNBObjfdrfqS/lh9
	 Db9UocGZ6WB9xvq2JbJcTePavBXgqtWbGGAwjQcM=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31EKk18K022126
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 14 Feb 2023 14:46:01 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 14
 Feb 2023 14:46:00 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 14 Feb 2023 14:46:00 -0600
Received: from [10.249.38.163] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31EKk0m2014827;
	Tue, 14 Feb 2023 14:46:00 -0600
Message-ID: <ca8d0359-93df-4414-f082-c0ff0c906d9f@ti.com>
Date: Tue, 14 Feb 2023 14:46:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [meta-ti] [dunfell,RFC PATCH-V2] conf: machine: j784s4-evm: Add
 support for J784S4 HS-FS
Content-Language: en-US
To: <sabiya.d@mistralsolutions.com>, <denys@ti.com>, <detheridge@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Dasnavis <sabiya.d@ti.com>
References: <20230214154939.340754-1-sabiya.d@ti.com>
 <1743CB8999DA9E8F.6876@lists.yoctoproject.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <1743CB8999DA9E8F.6876@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 31EKk1Rd028646
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 14 Feb 2023 20:46:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15844



On 2/14/2023 14:41, Ryan Eatmon via lists.yoctoproject.org wrote:
>=20
>=20
> On 2/14/2023 9:49, sabiya.d@mistralsolutions.com wrote:
>> From: Dasnavis <sabiya.d@ti.com>
>>
>> Add the basic J784S4 HS-FS configuration.
>> * Add configurations to support both HS-FS and GP keeping GP as defaul=
t.
>> * Add ti-sci-firmware overrides for HS-FS.
>> * Remove evm conf file inclusion in hs-evm conf.
>> * Add j784s4 hs-evm specific config to hs-evm conf.
>>
>> Signed-off-by: Dasnavis Sabiya <sabiya.d@ti.com>
>> Signed-off-by: Dasnavis <sabiya.d@ti.com>
>> ---
>> =C2=A0 conf/machine/j784s4-evm-k3r5-gp.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 21 +++++++++++++++++++++
>> =C2=A0 conf/machine/j784s4-evm-k3r5-sr1-hs-fs.conf | 15 ++++++++++++++=
+
>> =C2=A0 conf/machine/j784s4-evm-k3r5.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>> =C2=A0 conf/machine/j784s4-evm.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 13 ++++++++++---
>> =C2=A0 conf/machine/j784s4-hs-evm-k3r5.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 1 +
>> =C2=A0 conf/machine/j784s4-hs-evm.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 19 ++++++++++++++++++-
>> =C2=A0 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 3 ++-
>> =C2=A0 7 files changed, 68 insertions(+), 5 deletions(-)
>> =C2=A0 create mode 100644 conf/machine/j784s4-evm-k3r5-gp.conf
>> =C2=A0 create mode 100644 conf/machine/j784s4-evm-k3r5-sr1-hs-fs.conf
>>
>> diff --git a/conf/machine/j784s4-evm-k3r5-gp.conf=20
>> b/conf/machine/j784s4-evm-k3r5-gp.conf
>> new file mode 100644
>> index 00000000..b8693655
>> --- /dev/null
>> +++ b/conf/machine/j784s4-evm-k3r5-gp.conf
>> @@ -0,0 +1,21 @@
>> +#@TYPE: Machine
>> +#@NAME: J784S4 GP EVM (R5F)
>> +#@DESCRIPTION: Machine configuration for the TI J784S4 GP EVM (R5F co=
re)
>> +
>> +# Booting GP requires different SYSFW, the rest is handled at runtime
>> +
>> +require conf/machine/include/k3r5.inc
>> +SOC_FAMILY_append =3D ":k3r5-gp"
>> +
>> +SYSFW_SOC =3D "j784s4"
>> +SYSFW_CONFIG =3D "evm"
>> +SYSFW_SUFFIX =3D "gp"
>> +SYSFW_TIBOOT3_SYMLINK =3D "tiboot3.bin"
>> +SYSFW_SYMLINK =3D ""
>=20
> You do not need the SYSFW_SIMLINK =3D "" here.
>=20
>=20
> The rule basically is, if you have SYSFW_TIBOOT3_SYMLINK =3D "", then y=
ou=20
> also need SYSFW_SIMLINK =3D "".

And I can't spell... SYMLINK, not SIMLINK....

>=20
>> +
>> +UBOOT_MACHINE =3D "j784s4_evm_r5_defconfig"
>> +
>> +SPL_BINARY =3D ""
>> +UBOOT_BINARY =3D "u-boot-spl.${UBOOT_SUFFIX}"
>> +UBOOT_IMAGE =3D=20
>> "u-boot-r5spl-gp-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
>> +UBOOT_SYMLINK =3D "u-boot-r5spl-gp.${UBOOT_SUFFIX}"
>> diff --git a/conf/machine/j784s4-evm-k3r5-sr1-hs-fs.conf=20
>> b/conf/machine/j784s4-evm-k3r5-sr1-hs-fs.conf
>> new file mode 100644
>> index 00000000..8c77c910
>> --- /dev/null
>> +++ b/conf/machine/j784s4-evm-k3r5-sr1-hs-fs.conf
>> @@ -0,0 +1,15 @@
>> +#@TYPE: Machine
>> +#@NAME: J784S4 HS-FS EVM (R5F)
>> +#@DESCRIPTION: Machine configuration for the TI J784S4 HS-FS EVM (R5F=
=20
>> core)
>> +
>> +# Booting HS-FS requires different SYSFW, the rest is handled at runt=
ime
>> +
>> +require conf/machine/include/k3r5.inc
>> +SOC_FAMILY_append =3D ":k3r5-sr1-hs-fs"
>> +
>> +SYSFW_SOC =3D "j784s4"
>> +SYSFW_CONFIG =3D "evm"
>> +SYSFW_SUFFIX =3D "hs-fs"
>> +SYSFW_TIBOOT3_SYMLINK =3D ""
>=20
> You do need it here....
>=20
>> +
>> +UBOOT_MACHINE =3D "j784s4_evm_r5_defconfig"
>> diff --git a/conf/machine/j784s4-evm-k3r5.conf=20
>> b/conf/machine/j784s4-evm-k3r5.conf
>> index 04feebc6..3f010797 100644
>> --- a/conf/machine/j784s4-evm-k3r5.conf
>> +++ b/conf/machine/j784s4-evm-k3r5.conf
>> @@ -7,5 +7,6 @@ require conf/machine/include/k3r5.inc
>> =C2=A0 SYSFW_SOC =3D "j784s4"
>> =C2=A0 SYSFW_CONFIG =3D "evm"
>> =C2=A0 SYSFW_SUFFIX =3D "gp"
>> +SYSFW_SYMLINK =3D ""
>=20
> You do not need it here...
>=20
>=20
>> =C2=A0 UBOOT_MACHINE =3D "j784s4_evm_r5_defconfig"
>> diff --git a/conf/machine/j784s4-evm.conf b/conf/machine/j784s4-evm.co=
nf
>> index e892f597..c4548520 100644
>> --- a/conf/machine/j784s4-evm.conf
>> +++ b/conf/machine/j784s4-evm.conf
>> @@ -39,8 +39,15 @@ KERNEL_DEVICETREE =3D " \
>> =C2=A0 UBOOT_MACHINE =3D "j784s4_evm_a72_defconfig"
>> -do_image_wic[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
>> -do_image_tar[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
>> +# Default tiboot3.bin on J784S4 is for GP
>> +BBMULTICONFIG =3D "k3r5-gp"
>> +do_image_wic[mcdepends] =3D "mc::k3r5-gp:ti-sci-fw:do_deploy"
>> +do_image_tar[mcdepends] =3D "mc::k3r5-gp:ti-sci-fw:do_deploy"
>> -TFA_BOARD =3D "j784s4"
>> +# Since default tiboot3.bin on J784S4 is for GP, add a version for=20
>> SR1.0 HS-FS
>> +BBMULTICONFIG +=3D "k3r5-sr1-hs-fs"
>> +IMAGE_BOOT_FILES +=3D " tiboot3-j784s4-hs-fs-evm.bin"
>> +do_image_wic[mcdepends] +=3D "mc::k3r5-sr1-hs-fs:ti-sci-fw:do_deploy"
>> +do_image_tar[mcdepends] +=3D "mc::k3r5-sr1-hs-fs:ti-sci-fw:do_deploy"
>> +TFA_BOARD =3D "j784s4"
>> diff --git a/conf/machine/j784s4-hs-evm-k3r5.conf=20
>> b/conf/machine/j784s4-hs-evm-k3r5.conf
>> index 80a228a0..0f5e69e4 100644
>> --- a/conf/machine/j784s4-hs-evm-k3r5.conf
>> +++ b/conf/machine/j784s4-hs-evm-k3r5.conf
>> @@ -7,5 +7,6 @@ require conf/machine/include/k3r5.inc
>> =C2=A0 SYSFW_SOC =3D "j784s4"
>> =C2=A0 SYSFW_CONFIG =3D "evm"
>> =C2=A0 SYSFW_SUFFIX =3D "hs"
>> +SYSFW_SYMLINK =3D ""
>=20
> You do not need it here either.
>=20
>=20
>> =C2=A0 UBOOT_MACHINE =3D "j784s4_evm_r5_defconfig"
>> diff --git a/conf/machine/j784s4-hs-evm.conf=20
>> b/conf/machine/j784s4-hs-evm.conf
>> index 62357d62..91ef3d6f 100644
>> --- a/conf/machine/j784s4-hs-evm.conf
>> +++ b/conf/machine/j784s4-hs-evm.conf
>> @@ -2,10 +2,27 @@
>> =C2=A0 #@NAME: J784S4 HS EVM
>> =C2=A0 #@DESCRIPTION: Machine configuration for the TI J784S4 HS EVM
>> -require conf/machine/j784s4-evm.conf
>> +require conf/machine/include/j7.inc
>> +
>> +MACHINE_FEATURES +=3D "gpu"
>> +
>> +SERIAL_CONSOLES =3D "115200;ttyS2"
>> +SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
>> +TFA_K3_USART =3D "0x8"
>> +OPTEEMACHINE =3D "k3-j784s4"
>> +OPTEE_K3_USART =3D "0x8"
>> +
>> +KERNEL_DEVICETREE =3D " \
>> +=C2=A0=C2=A0=C2=A0 ti/k3-j784s4-evm.dtb \
>> +"
>> =C2=A0 UBOOT_MACHINE =3D "j784s4_evm_a72_defconfig"
>> +do_image_wic[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
>> +do_image_tar[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
>> +
>> +TFA_BOARD =3D "j784s4"
>> +
>> =C2=A0 SPL_BINARY =3D "tispl.bin_HS"
>> =C2=A0 UBOOT_BINARY =3D "u-boot.img_HS"
>> =C2=A0 UBOOT_SYMLINK =3D "u-boot.img"
>> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb=20
>> b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>> index c5fff3f7..cafb24e6 100644
>> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
>> @@ -36,7 +36,8 @@ SYSFW_PREFIX_j7200-hs-evm-k3r5 =3D "fs"
>> =C2=A0 SYSFW_PREFIX_j721s2-evm-k3r5-gp =3D "fs"
>> =C2=A0 SYSFW_PREFIX_j721s2-evm-k3r5-sr1-hs-fs =3D "fs"
>> =C2=A0 SYSFW_PREFIX_j721s2-hs-evm-k3r5 =3D "fs"
>> -SYSFW_PREFIX_j784s4-evm-k3r5 =3D "fs"
>> +SYSFW_PREFIX_j784s4-evm-k3r5-gp =3D "fs"
>> +SYSFW_PREFIX_j784s4-evm-k3r5-sr1-hs-fs =3D "fs"
>> =C2=A0 SYSFW_PREFIX_j784s4-hs-evm-k3r5 =3D "fs"
>> =C2=A0 SYSFW_PREFIX_am62xx-evm-k3r5-gp =3D "fs"
>> =C2=A0 SYSFW_PREFIX_am62xx-evm-k3r5-hs-se =3D "fs"
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15843): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/15843
> Mute This Topic: https://lists.yoctoproject.org/mt/96962550/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/leave/10828724/65=
51054/1815494134/xyzzy [reatmon@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

