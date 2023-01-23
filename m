Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E303BC38142
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 17:14:30 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.48128.1674494061475124410
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Jan 2023 09:14:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=Ynu+vXIG;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30NHEIpF024609;
	Mon, 23 Jan 2023 11:14:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674494058;
	bh=UO3J/JB+slf2qnVThUrKitHOlwIQbAXsm6UscrS29Gk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Ynu+vXIGj0LiT24+O4IrswArLXvNoGo0xPRld7Vm5ymBs02ggAaHg3tWg5HpE7kU/
	 D6YmLacW/ETjhT6sFWv5f7HWV7GTAGFEwcT9czrCkawYMKhgv4qJTFyjfXP3T+dt8K
	 sTyz3Za3UnJHpEJn3aqrxtifWyZbz6mMOUsfaAxs=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30NHEIMY019527
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Jan 2023 11:14:18 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 23
 Jan 2023 11:14:18 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 23 Jan 2023 11:14:18 -0600
Received: from [10.247.26.97] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30NHEHdn029419;
	Mon, 23 Jan 2023 11:14:17 -0600
Message-ID: <750fbf73-d1eb-215e-e89a-f18e907dd920@ti.com>
Date: Mon, 23 Jan 2023 11:14:17 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [meta-ti][dunfell][PATCH] conf: machine: am62xx-evm: Add Support
 for AM62xx HS-SE
To: Andrew Davis <afd@ti.com>, <c-shilwant@ti.com>,
        Denys Dmytriyenko
	<denis@denix.org>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Gyan Gupta <g-gupta@ti.com>
References: <20230123102459.562886-1-c-shilwant@ti.com>
 <70e8956f-77ff-464c-40c4-d7d4a61f775f@ti.com>
Content-Language: en-US
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <70e8956f-77ff-464c-40c4-d7d4a61f775f@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 30NHEIpF024609
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 23 Jan 2023 17:14:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15625



On 1/23/2023 9:43 AM, Andrew Davis wrote:
> On 1/23/23 4:24 AM, Chirag Shilwant via lists.yoctoproject.org wrote:
>> - Add machine conf for AM62xx HS-SE.
>> - The wic images will boot on AM62x GP devices by default. To boot on=20
>> AM62x HS-SE, simply switch out the SYSFW image:
>>
>=20
> /me longs for day when HS is first-class and GP is treated like the=20
> degenerate case it is..

Thanks for reviewing. Unfortunately AM62x is not there yet, GP is still=20
in the hands of customers and expectation of default is needed on dunfell.

Kirkstone/mainline is a good target to switch default to HS.


>=20
> Reviewed-by: Andrew Davis <afd@ti.com>
>=20
>> $ cd /mnt/sd-card/boot
>> $ mv tiboot3-am62x-hs-evm.bin tiboot3.bin
>>
>> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
>> ---
>> =C2=A0 ...-evm-k3r5.conf =3D> am62xx-evm-k3r5-gp.conf} |=C2=A0 3 +++
>> =C2=A0 conf/machine/am62xx-evm-k3r5-hs-se.conf=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 21 +++++++++++++++++++
>> =C2=A0 conf/machine/am62xx-evm.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 4 ++++
>> =C2=A0 conf/machine/include/am62xx.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 11 ++++++++--
>> =C2=A0 4 files changed, 37 insertions(+), 2 deletions(-)
>> =C2=A0 rename conf/machine/{am62xx-evm-k3r5.conf =3D>=20
>> am62xx-evm-k3r5-gp.conf} (67%)
>> =C2=A0 create mode 100644 conf/machine/am62xx-evm-k3r5-hs-se.conf
>>
>> diff --git a/conf/machine/am62xx-evm-k3r5.conf=20
>> b/conf/machine/am62xx-evm-k3r5-gp.conf
>> similarity index 67%
>> rename from conf/machine/am62xx-evm-k3r5.conf
>> rename to conf/machine/am62xx-evm-k3r5-gp.conf
>> index 724a8d4a..d9867bc7 100644
>> --- a/conf/machine/am62xx-evm-k3r5.conf
>> +++ b/conf/machine/am62xx-evm-k3r5-gp.conf
>> @@ -9,3 +9,6 @@ SYSFW_CONFIG =3D "evm"
>> =C2=A0 SYSFW_SUFFIX =3D "gp"
>> =C2=A0 UBOOT_MACHINE =3D "am62x_evm_r5_defconfig"
>> +
>> +UBOOT_BINARY =3D "u-boot-spl.${UBOOT_SUFFIX}"
>> +UBOOT_IMAGE =3D=20
>> "u-boot-r5spl-gp-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
>> diff --git a/conf/machine/am62xx-evm-k3r5-hs-se.conf=20
>> b/conf/machine/am62xx-evm-k3r5-hs-se.conf
>> new file mode 100644
>> index 00000000..913e69fa
>> --- /dev/null
>> +++ b/conf/machine/am62xx-evm-k3r5-hs-se.conf
>> @@ -0,0 +1,21 @@
>> +#@TYPE: Machine
>> +#@NAME: AM62xx HS-SE EVM (R5F)
>> +#@DESCRIPTION: Machine configuration for the TI AM62xx HS-SE EVM (R5F=
=20
>> core)
>> +
>> +# Booting HS-SE requires different SYSFW, the rest is handled at runt=
ime
>> +
>> +require conf/machine/include/k3r5.inc
>> +SOC_FAMILY_append =3D ":k3r5-hs-se"
>> +
>> +SYSFW_SOC =3D "am62x"
>> +SYSFW_CONFIG =3D "evm"
>> +SYSFW_SUFFIX =3D "hs"
>> +
>> +SYSFW_TIBOOT3_SYMLINK =3D ""
>> +
>> +UBOOT_MACHINE =3D "am62x_evm_r5_defconfig"
>> +
>> +SPL_BINARY =3D ""
>> +UBOOT_BINARY =3D "u-boot-spl.${UBOOT_SUFFIX}"
>> +UBOOT_IMAGE =3D=20
>> "u-boot-r5spl-hs-se-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
>> +UBOOT_SYMLINK =3D "u-boot-r5spl-hs-se.${UBOOT_SUFFIX}"
>> diff --git a/conf/machine/am62xx-evm.conf b/conf/machine/am62xx-evm.co=
nf
>> index 3d9e3b90..b4904eca 100644
>> --- a/conf/machine/am62xx-evm.conf
>> +++ b/conf/machine/am62xx-evm.conf
>> @@ -19,3 +19,7 @@ KERNEL_DEVICETREE =3D " \
>> =C2=A0 "
>> =C2=A0 UBOOT_MACHINE =3D "am62x_evm_a53_defconfig"
>> +
>> +SPL_BINARY =3D "tispl.bin_HS"
>> +UBOOT_BINARY =3D "u-boot.img_HS"
>> +UBOOT_SYMLINK =3D "u-boot.img"
>> diff --git a/conf/machine/include/am62xx.inc=20
>> b/conf/machine/include/am62xx.inc
>> index 0231235f..912318e9 100644
>> --- a/conf/machine/include/am62xx.inc
>> +++ b/conf/machine/include/am62xx.inc
>> @@ -8,8 +8,15 @@ SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
>> =C2=A0 TFA_K3_SYSTEM_SUSPEND =3D "1"
>> -do_image_wic[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
>> -do_image_tar[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
>> +BBMULTICONFIG =3D "k3r5-gp"
>> +do_image_wic[mcdepends] =3D "mc::k3r5-gp:ti-sci-fw:do_deploy"
>> +do_image_tar[mcdepends] =3D "mc::k3r5-gp:ti-sci-fw:do_deploy"
>> +
>> +# Since default tiboot3.bin on AM62x is for GP, add a version for HS-=
SE
>> +BBMULTICONFIG +=3D "k3r5-hs-se"
>> +IMAGE_BOOT_FILES +=3D " tiboot3-am62x-hs-evm.bin"
>> +do_image_wic[mcdepends] +=3D "mc::k3r5-hs-se:ti-sci-fw:do_deploy"
>> +do_image_tar[mcdepends] +=3D "mc::k3r5-hs-se:ti-sci-fw:do_deploy"
>> =C2=A0 TFA_BOARD =3D "lite"
>> =C2=A0 OPTEEMACHINE =3D "k3-am62x"
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#15619):=20
>> https://lists.yoctoproject.org/g/meta-ti/message/15619
>> Mute This Topic: https://lists.yoctoproject.org/mt/96470962/3619733
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.co=
m]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

