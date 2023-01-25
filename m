Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A2AEC27C76
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 20:44:59 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.57530.1674679490221642005
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Jan 2023 12:44:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=Cdymq53c;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30PKijvO079164;
	Wed, 25 Jan 2023 14:44:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674679485;
	bh=iZrrtbrUqIJtjUgkjsAvQ5fBCbt1ANR97pi/0k4ID1Q=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Cdymq53ct9Lfy9DQIEugsNXeDXA2qew8mZhSnLFWJVCJbDJZcbQ77V9sDHQKe74Gk
	 m/P1h/sl59WVasPPPhrrh/WLmJaxUFRPOzr5NpsBjGNGpVFUsaqPA6AKzIHbB5uKoE
	 CTZzIqXZBndDYEHDFY8JWoh0jGq27wpMlz3qoV5I=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30PKijMC037241
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 25 Jan 2023 14:44:45 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 25
 Jan 2023 14:44:44 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 25 Jan 2023 14:44:44 -0600
Received: from [10.250.36.129] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30PKiigx076119;
	Wed, 25 Jan 2023 14:44:44 -0600
Message-ID: <80bdc280-1a5d-1968-202e-0c692c318b35@ti.com>
Date: Wed, 25 Jan 2023 14:44:44 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [meta-ti][dunfell][PATCH v2 1/2] conf: machine: am62xx-evm: Add
 Support for AM62xx HS-SE
Content-Language: en-US
To: "Shilwant, Chirag" <c-shilwant@ti.com>,
        "Bajjuri, Praneeth"
	<praneeth@ti.com>,
        Denys Dmytriyenko <denis@denix.org>,
        "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
CC: "Adivi, Sai Sree Kartheek" <s-adivi@ti.com>,
        "Bhagat, Paresh"
	<p-bhagat@ti.com>, "Gupta, Gyan" <g-gupta@ti.com>
References: <20230124051418.1201453-1-c-shilwant@ti.com>
 <ed5e6b0a-2e47-6d82-b23e-525afc3ddb1b@ti.com>
 <8e959c31249645538f048e9f56873b0d@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <8e959c31249645538f048e9f56873b0d@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 30PKijvO079164
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Jan 2023 20:44:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15656


Yes.  But that single patch was trying to do two different platforms.=20
So splitting them was needed.  In this case you are submitting support=20
for a new platform but breaking the implementation into multiple commits.

Multiple commits is okay for times when you submitting multiple changes=20
where each commit is stand alone, but taken together they add support=20
for a feature/change.

In this case, the single change is adding the new platform and the=20
multiple commits are not stand alone.  The first just defines the=20
platform but it would still be incorrect.  And the second patch is=20
pointless without the first.  So merging them into a single commit make=20
sense.


On 1/24/2023 23:18, Shilwant, Chirag wrote:
> I would prefer to see this as a single patch.
>=20
>> Well after we added AM62Q HS-SE and AM62A support in single commit, Pr=
aneeth has suggested us to split the patchesif possible as reviewing beco=
mes difficult if we have everything in=20
> single patch. Also, Denys mentioned that single patch or patch series=20
> will also do. Hence, to satisfy both conditions kept it as 2 separate=20
> patches in one series with all conf in a patch and signing stuff in oth=
er =F0=9F=98=8A
>=20
> -----------------------------------------------------------------------=
-
> *From:* Eatmon, Ryan
> *Sent:* 25 January 2023 04:21:18
> *To:* Shilwant, Chirag; Bajjuri, Praneeth; Denys Dmytriyenko;=20
> meta-ti@lists.yoctoproject.org
> *Cc:* Adivi, Sai Sree Kartheek; Bhagat, Paresh; Gupta, Gyan
> *Subject:* Re: [meta-ti][dunfell][PATCH v2 1/2] conf: machine:=20
> am62xx-evm: Add Support for AM62xx HS-SE
>=20
> I would prefer to see this as a single patch.=C2=A0 Adding in support f=
or a
> new platform should roll-up all of the needed changes at the same time
> and not sequence them out in multiple commits.=C2=A0 The only time we d=
o this
> is when not all of the pieces of firmware are in place but we want to g=
o
> ahead and add the platform into the builds.
>=20
> Also, please address Andrew's question about the DM firmware, and about
> pulling in past Reviewed-by/Acked-by on the patches.
>=20
>=20
> On 1/23/2023 23:14, Chirag Shilwant wrote:
>> - Add machine conf for AM62xx HS-SE.
>> - The wic images will boot on AM62x GP devices by default. To boot on =
AM62x HS-SE, simply switch out the SYSFW image:
>>=20
>> $ cd /mnt/sd-card/boot
>> $ mv tiboot3-am62x-hs-evm.bin tiboot3.bin
>>=20
>> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
>> ---
>>=C2=A0=C2=A0 ...-evm-k3r5.conf =3D> am62xx-evm-k3r5-gp.conf} |=C2=A0 3 =
+++
>>=C2=A0=C2=A0 conf/machine/am62xx-evm-k3r5-hs-se.conf=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 21 +++++++++++++++++++
>>=C2=A0=C2=A0 conf/machine/am62xx-evm.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 4 ++++
>>=C2=A0=C2=A0 conf/machine/include/am62xx.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 11 ++++++++--
>>=C2=A0=C2=A0 4 files changed, 37 insertions(+), 2 deletions(-)
>>=C2=A0=C2=A0 rename conf/machine/{am62xx-evm-k3r5.conf =3D> am62xx-evm-=
k3r5-gp.conf} (67%)
>>=C2=A0=C2=A0 create mode 100644 conf/machine/am62xx-evm-k3r5-hs-se.conf
>>=20
>> diff --git a/conf/machine/am62xx-evm-k3r5.conf b/conf/machine/am62xx-e=
vm-k3r5-gp.conf
>> similarity index 67%
>> rename from conf/machine/am62xx-evm-k3r5.conf
>> rename to conf/machine/am62xx-evm-k3r5-gp.conf
>> index 724a8d4a..d9867bc7 100644
>> --- a/conf/machine/am62xx-evm-k3r5.conf
>> +++ b/conf/machine/am62xx-evm-k3r5-gp.conf
>> @@ -9,3 +9,6 @@ SYSFW_CONFIG =3D "evm"
>>=C2=A0=C2=A0 SYSFW_SUFFIX =3D "gp"
>>  =20
>>=C2=A0=C2=A0 UBOOT_MACHINE =3D "am62x_evm_r5_defconfig"
>> +
>> +UBOOT_BINARY =3D "u-boot-spl.${UBOOT_SUFFIX}"
>> +UBOOT_IMAGE =3D "u-boot-r5spl-gp-${MAINMACHINE}-${PV}-${PR}.${UBOOT_S=
UFFIX}"
>> diff --git a/conf/machine/am62xx-evm-k3r5-hs-se.conf b/conf/machine/am=
62xx-evm-k3r5-hs-se.conf
>> new file mode 100644
>> index 00000000..913e69fa
>> --- /dev/null
>> +++ b/conf/machine/am62xx-evm-k3r5-hs-se.conf
>> @@ -0,0 +1,21 @@
>> +#@TYPE: Machine
>> +#@NAME: AM62xx HS-SE EVM (R5F)
>> +#@DESCRIPTION: Machine configuration for the TI AM62xx HS-SE EVM (R5F=
 core)
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
>> +UBOOT_IMAGE =3D "u-boot-r5spl-hs-se-${MAINMACHINE}-${PV}-${PR}.${UBOO=
T_SUFFIX}"
>> +UBOOT_SYMLINK =3D "u-boot-r5spl-hs-se.${UBOOT_SUFFIX}"
>> diff --git a/conf/machine/am62xx-evm.conf b/conf/machine/am62xx-evm.co=
nf
>> index 3d9e3b90..b4904eca 100644
>> --- a/conf/machine/am62xx-evm.conf
>> +++ b/conf/machine/am62xx-evm.conf
>> @@ -19,3 +19,7 @@ KERNEL_DEVICETREE =3D " \
>>=C2=A0=C2=A0 "
>>  =20
>>=C2=A0=C2=A0 UBOOT_MACHINE =3D "am62x_evm_a53_defconfig"
>> +
>> +SPL_BINARY =3D "tispl.bin_HS"
>> +UBOOT_BINARY =3D "u-boot.img_HS"
>> +UBOOT_SYMLINK =3D "u-boot.img"
>> diff --git a/conf/machine/include/am62xx.inc b/conf/machine/include/am=
62xx.inc
>> index 0231235f..912318e9 100644
>> --- a/conf/machine/include/am62xx.inc
>> +++ b/conf/machine/include/am62xx.inc
>> @@ -8,8 +8,15 @@ SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
>>  =20
>>=C2=A0=C2=A0 TFA_K3_SYSTEM_SUSPEND =3D "1"
>>  =20
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
>>  =20
>>=C2=A0=C2=A0 TFA_BOARD =3D "lite"
>>=C2=A0=C2=A0 OPTEEMACHINE =3D "k3-am62x"
>=20
> --=20
> Ryan Eatmon=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.=C2=A0 -=C2=A0 LCPD=C2=A0 -=C2=A0 MGTS

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

