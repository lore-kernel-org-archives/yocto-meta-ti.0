Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59130C6FA86
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 18:28:56 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.234.1662661730197262941
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 08 Sep 2022 11:28:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com
 header.s=ti-com-17q1 header.b=L20Cht2n;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 288ISlnx010020;
	Thu, 8 Sep 2022 13:28:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1662661727;
	bh=F3/douEiLkIy5ATNG3ptm4a8kW3CNN/HMNXjQJAEnzU=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=L20Cht2nA+gNi1pM2At7TqaX5FAOhOrqVI0ytBOCL/w0f8OM0WhUlMcOMQbWdm9CT
	 WVo9iZhP0jrHqCKkhCsBR/oHVZgvIGx84PLNkjyTCIvDXtlpw/txfKam4ywc9nm0fo
	 +XHqdO2b+WbCgJj0AofFBRFQRMWWhvyt2sk/bYlk=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 288ISl63020760
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Sep 2022 13:28:47 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Thu, 8 Sep
 2022 13:28:47 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Thu, 8 Sep 2022 13:28:47 -0500
Received: from [10.249.39.108] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 288ISlB8007204;
	Thu, 8 Sep 2022 13:28:47 -0500
Message-ID: <8d29d8de-0e62-b00b-4317-ecde85471c8d@ti.com>
Date: Thu, 8 Sep 2022 13:28:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [meta-ti][dunfell][PATCH v2 1/2] conf: machine: am64xx-evm:
 Switch to SR2.0 HS-FS build by default
Content-Language: en-US
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        Praneeth Bajjuri <praneeth@ti.com>, Anand Gadiyar <gadiyar@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20220907160315.24535-1-afd@ti.com>
 <1cffb71e-3da4-9f75-af2b-a49d676458c7@ti.com>
 <3f5e2670-d046-4e25-3718-eade9ec35d6f@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <3f5e2670-d046-4e25-3718-eade9ec35d6f@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id
 288ISlnx010020
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 08 Sep 2022 18:28:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15007



On 9/8/2022 11:55, Andrew Davis wrote:
> On 9/8/22 11:51 AM, Andrew Davis wrote:
>> On 9/7/22 11:03 AM, Andrew Davis wrote:
>>> AM64x devices will only be available as SR2.0 HS-FS. Set this as the
>>> default type provided by the SDK. To allow SR2.0 HS-SE to continue to
>>> boot, like we did with GP, we add an extra machine to build SR2.0 HS-=
SE
>>> SYSFW. To use on SR2.0 HS-SE boards simply switch out the SYSFW image=
:
>>>
>>> $ cd /mnt/sd-card/boot
>>> $ mv tiboot3-am64x_sr2-hs-evm.bin tiboot3.bin
>>>
>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>> ---
>>
>> The firmware has been updated in ti-linux-fw, this series can be
>> taken now. Would be good to get this in so we can start auto testing
>> on the SR2.0 HS-FS farm boards. This patch is the final bit to un-gate
>> the 08.04.01 release and a lot of folks are waiting on that :)
>>
>=20
>=20
> Looks like it has made it into dunfell-next. Guessing that just means
> after the auto-builds tonight it gets merged to dunfell, or do
> the auto-builders only work on dunfell?


Tonight's CICD build will pull them in.


> Andrew
>=20
>=20
>> Andrew
>>
>>> =C2=A0 conf/machine/am64xx-evm-k3r5-hs-se.conf=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 14 -------------
>>> =C2=A0 conf/machine/am64xx-evm-k3r5-sr2-hs-fs.conf=C2=A0=C2=A0 | 14 +=
++++++++++++
>>> =C2=A0 conf/machine/am64xx-evm-k3r5-sr2-hs-se.conf=C2=A0=C2=A0 | 20 +=
++++++++++++++++++
>>> =C2=A0 conf/machine/am64xx-evm.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 8 +++++++-
>>> =C2=A0 conf/machine/include/am64xx.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 +++---
>>> =C2=A0 conf/multiconfig/k3r5-sr2-hs-fs.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +++
>>> =C2=A0 .../{k3r5-hs-se.conf =3D> k3r5-sr2-hs-se.conf}=C2=A0 |=C2=A0 2=
 +-
>>> =C2=A0 7 files changed, 48 insertions(+), 19 deletions(-)
>>> =C2=A0 delete mode 100644 conf/machine/am64xx-evm-k3r5-hs-se.conf
>>> =C2=A0 create mode 100644 conf/machine/am64xx-evm-k3r5-sr2-hs-fs.conf
>>> =C2=A0 create mode 100644 conf/machine/am64xx-evm-k3r5-sr2-hs-se.conf
>>> =C2=A0 create mode 100644 conf/multiconfig/k3r5-sr2-hs-fs.conf
>>> =C2=A0 rename conf/multiconfig/{k3r5-hs-se.conf =3D> k3r5-sr2-hs-se.c=
onf} (55%)
>>>
>>> diff --git a/conf/machine/am64xx-evm-k3r5-hs-se.conf=20
>>> b/conf/machine/am64xx-evm-k3r5-hs-se.conf
>>> deleted file mode 100644
>>> index 7cab7d15..00000000
>>> --- a/conf/machine/am64xx-evm-k3r5-hs-se.conf
>>> +++ /dev/null
>>> @@ -1,14 +0,0 @@
>>> -#@TYPE: Machine
>>> -#@NAME: AM64xx HS-SE EVM (R5F)
>>> -#@DESCRIPTION: Machine configuration for the TI AM64xx HS-SE EVM=20
>>> (R5F core)
>>> -
>>> -# Booting HS-SE requires different SYSFW, the rest is handled at=20
>>> runtime
>>> -
>>> -require conf/machine/include/k3r5.inc
>>> -SOC_FAMILY_append =3D ":k3r5-hs-se"
>>> -
>>> -SYSFW_SOC =3D "am64x"
>>> -SYSFW_CONFIG =3D "evm"
>>> -SYSFW_SUFFIX =3D "hs"
>>> -
>>> -UBOOT_MACHINE =3D "am64x_evm_r5_defconfig"
>>> diff --git a/conf/machine/am64xx-evm-k3r5-sr2-hs-fs.conf=20
>>> b/conf/machine/am64xx-evm-k3r5-sr2-hs-fs.conf
>>> new file mode 100644
>>> index 00000000..1139fe4a
>>> --- /dev/null
>>> +++ b/conf/machine/am64xx-evm-k3r5-sr2-hs-fs.conf
>>> @@ -0,0 +1,14 @@
>>> +#@TYPE: Machine
>>> +#@NAME: AM64xx SR2.0 HS-FS EVM (R5F)
>>> +#@DESCRIPTION: Machine configuration for the TI AM64xx SR2.0 HS-FS=20
>>> EVM (R5F core)
>>> +
>>> +# Booting SR2.0 HS-FS requires different SYSFW, the rest is handled=20
>>> at runtime
>>> +
>>> +require conf/machine/include/k3r5.inc
>>> +SOC_FAMILY_append =3D ":k3r5-sr2-hs-fs"
>>> +
>>> +SYSFW_SOC =3D "am64x_sr2"
>>> +SYSFW_CONFIG =3D "evm"
>>> +SYSFW_SUFFIX =3D "hs-fs"
>>> +
>>> +UBOOT_MACHINE =3D "am64x_evm_r5_defconfig"
>>> diff --git a/conf/machine/am64xx-evm-k3r5-sr2-hs-se.conf=20
>>> b/conf/machine/am64xx-evm-k3r5-sr2-hs-se.conf
>>> new file mode 100644
>>> index 00000000..f2aeca6d
>>> --- /dev/null
>>> +++ b/conf/machine/am64xx-evm-k3r5-sr2-hs-se.conf
>>> @@ -0,0 +1,20 @@
>>> +#@TYPE: Machine
>>> +#@NAME: AM64xx SR2.0 HS-SE EVM (R5F)
>>> +#@DESCRIPTION: Machine configuration for the TI AM64xx SR2.0 HS-SE=20
>>> EVM (R5F core)
>>> +
>>> +# Booting SR2.0 HS-SE requires different SYSFW, the rest is handled=20
>>> at runtime
>>> +
>>> +require conf/machine/include/k3r5.inc
>>> +SOC_FAMILY_append =3D ":k3r5-sr2-hs-se"
>>> +
>>> +SYSFW_SOC =3D "am64x_sr2"
>>> +SYSFW_CONFIG =3D "evm"
>>> +SYSFW_SUFFIX =3D "hs"
>>> +SYSFW_TIBOOT3_SYMLINK =3D ""
>>> +
>>> +UBOOT_MACHINE =3D "am64x_evm_r5_defconfig"
>>> +
>>> +SPL_BINARY =3D ""
>>> +UBOOT_BINARY =3D "u-boot-spl.${UBOOT_SUFFIX}"
>>> +UBOOT_IMAGE =3D=20
>>> "u-boot-r5spl-sr2-hs-se-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
>>> +UBOOT_SYMLINK =3D "u-boot-r5spl-sr2-hs-se.${UBOOT_SUFFIX}"
>>> diff --git a/conf/machine/am64xx-evm.conf b/conf/machine/am64xx-evm.c=
onf
>>> index f150f532..d9afb08e 100644
>>> --- a/conf/machine/am64xx-evm.conf
>>> +++ b/conf/machine/am64xx-evm.conf
>>> @@ -6,8 +6,14 @@ require conf/machine/include/am64xx.inc
>>> =C2=A0 UBOOT_MACHINE =3D "am64x_evm_a53_defconfig"
>>> -# Since default tiboot3.bin on AM64x is for HS-SE, add a version for=
 GP
>>> +# Since default tiboot3.bin on AM64x is for SR2.0 HS-FS, add a=20
>>> version for GP
>>> =C2=A0 BBMULTICONFIG +=3D "k3r5-gp"
>>> =C2=A0 IMAGE_BOOT_FILES +=3D " tiboot3-am64x-gp-evm.bin"
>>> =C2=A0 do_image_wic[mcdepends] +=3D "mc::k3r5-gp:ti-sci-fw:do_deploy"
>>> =C2=A0 do_image_tar[mcdepends] +=3D "mc::k3r5-gp:ti-sci-fw:do_deploy"
>>> +
>>> +# Since default tiboot3.bin on AM64x is for SR2.0 HS-FS, add a=20
>>> version for SR2.0 HS-SE
>>> +BBMULTICONFIG +=3D "k3r5-sr2-hs-se"
>>> +IMAGE_BOOT_FILES +=3D " tiboot3-am64x_sr2-hs-evm.bin"
>>> +do_image_wic[mcdepends] +=3D "mc::k3r5-sr2-hs-se:ti-sci-fw:do_deploy=
"
>>> +do_image_tar[mcdepends] +=3D "mc::k3r5-sr2-hs-se:ti-sci-fw:do_deploy=
"
>>> diff --git a/conf/machine/include/am64xx.inc=20
>>> b/conf/machine/include/am64xx.inc
>>> index becc79d4..0b9a3e59 100644
>>> --- a/conf/machine/include/am64xx.inc
>>> +++ b/conf/machine/include/am64xx.inc
>>> @@ -14,9 +14,9 @@ KERNEL_DEVICETREE =3D " \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am642-evm-nand.dtbo \
>>> =C2=A0 "
>>> -BBMULTICONFIG =3D "k3r5-hs-se"
>>> -do_image_wic[mcdepends] =3D "mc::k3r5-hs-se:ti-sci-fw:do_deploy"
>>> -do_image_tar[mcdepends] =3D "mc::k3r5-hs-se:ti-sci-fw:do_deploy"
>>> +BBMULTICONFIG =3D "k3r5-sr2-hs-fs"
>>> +do_image_wic[mcdepends] =3D "mc::k3r5-sr2-hs-fs:ti-sci-fw:do_deploy"
>>> +do_image_tar[mcdepends] =3D "mc::k3r5-sr2-hs-fs:ti-sci-fw:do_deploy"
>>> =C2=A0 TFA_BOARD =3D "lite"
>>> =C2=A0 OPTEEMACHINE =3D "k3-am64x"
>>> diff --git a/conf/multiconfig/k3r5-sr2-hs-fs.conf=20
>>> b/conf/multiconfig/k3r5-sr2-hs-fs.conf
>>> new file mode 100644
>>> index 00000000..8e6b5c68
>>> --- /dev/null
>>> +++ b/conf/multiconfig/k3r5-sr2-hs-fs.conf
>>> @@ -0,0 +1,3 @@
>>> +require k3r5-sr2.conf
>>> +
>>> +MACHINE_append =3D "-hs-fs"
>>> diff --git a/conf/multiconfig/k3r5-hs-se.conf=20
>>> b/conf/multiconfig/k3r5-sr2-hs-se.conf
>>> similarity index 55%
>>> rename from conf/multiconfig/k3r5-hs-se.conf
>>> rename to conf/multiconfig/k3r5-sr2-hs-se.conf
>>> index 701f8e88..69e6d0c8 100644
>>> --- a/conf/multiconfig/k3r5-hs-se.conf
>>> +++ b/conf/multiconfig/k3r5-sr2-hs-se.conf
>>> @@ -1,3 +1,3 @@
>>> -require k3r5.conf
>>> +require k3r5-sr2.conf
>>> =C2=A0 MACHINE_append =3D "-hs-se"

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

