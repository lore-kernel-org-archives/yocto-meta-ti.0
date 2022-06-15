Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41545C43334
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 15:11:27 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.6105.1655305880305408222
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Jun 2022 08:11:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com
 header.s=ti-com-17q1 header.b=SHry4G7s;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25FFBJqv095225;
	Wed, 15 Jun 2022 10:11:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1655305879;
	bh=dJuDwDqBoa9fdgzlAMZZXBcFKhSGR7vqsCxYvcDguLY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=SHry4G7sDJquQ11xGOpDKa53Nu8aRIcYh0GHIX3Af1b0O1KIdLXp+jb7i+AZqdK9q
	 WE6mb+yzPTYt4OQFcUxwvo+bDATsFpIfQ1UGyiS+VGDBD0JrC07NN04TKv077ABa31
	 GFAmwbAfSq3MWNaLb2nGwuOhUc9prnDALfbxajWM=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25FFBIVN001304
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 Jun 2022 10:11:19 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 15
 Jun 2022 10:11:18 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 15 Jun 2022 10:11:18 -0500
Received: from [10.250.33.138] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25FFBIve058913;
	Wed, 15 Jun 2022 10:11:18 -0500
Message-ID: <c2d5e4e9-68c2-9ae0-8aef-51fda15cb66d@ti.com>
Date: Wed, 15 Jun 2022 10:11:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [meta-ti][dunfell][PATCH v3] conf: machine: wic: Fix HS image
 boot partition
Content-Language: en-US
To: Ryan Eatmon <reatmon@ti.com>, Manorit Chawdhry <m-chawdhry@ti.com>,
        Jayesh
 Choudhary <j-choudhary@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <20220609145909.15483-1-afd@ti.com>
 <20220614082059.jjouefku4pf3f3jn@ula0497581>
 <a2a8081b-9028-b1b7-8d46-7328587e13d8@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <a2a8081b-9028-b1b7-8d46-7328587e13d8@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id
 25FFBJqv095225
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Jun 2022 15:11:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14821

On 6/15/22 9:52 AM, Ryan Eatmon wrote:
>=20
>=20
> On 6/14/2022 3:20, Manorit Chawdhry wrote:
>> On 09:59-20220609, Andrew Davis wrote:
>>> From: Manorit Chawdhry <m-chawdhry@ti.com>
>>>
>>> IMAGE_BOOT_FILES was being overwritten in the HS recipes leading to
>>> incomplete binaries in /boot and the naming of the binaries were not
>>> correct.
>>>
>>> Fixes /boot partition for HS devices.
>>>
>>> Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
>>> [afd: Extended fix to all HS platforms]
>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>> ---
>>>
>>> Changes from v2:
>>> =C2=A0 - Added UBOOT_SYMLINK to fix missing u-boot.img image
>>
>> LGTM.
>>
>> Acked-by: Manorit Chawdhry <m-chawdhry@ti.com>
>=20
>=20
> I hate to ask this, but I just merged in the patches to add j721s2-hs-e=
vm support... do you want to make a V4 and make the same changes in that =
file? or do you want to submit another patch to clean that up?
>=20
>=20


We can make a delta patch to fixup j721s2 after this goes in.

Jayesh,

Can you take that action, see what we did here for each platform and
do the same for j721s2-hs and submit a patch.

Andrew


>=20
>>>
>>> =C2=A0 conf/machine/am64xx-hs-evm.conf | 3 +--
>>> =C2=A0 conf/machine/am65xx-hs-evm.conf | 3 +--
>>> =C2=A0 conf/machine/include/k3.inc=C2=A0=C2=A0=C2=A0=C2=A0 | 5 +++--
>>> =C2=A0 conf/machine/j7-hs-evm.conf=C2=A0=C2=A0=C2=A0=C2=A0 | 3 +--
>>> =C2=A0 conf/machine/j7200-hs-evm.conf=C2=A0 | 3 +--
>>> =C2=A0 5 files changed, 7 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/conf/machine/am64xx-hs-evm.conf b/conf/machine/am64xx-hs=
-evm.conf
>>> index 44e81463..ebbe2e62 100644
>>> --- a/conf/machine/am64xx-hs-evm.conf
>>> +++ b/conf/machine/am64xx-hs-evm.conf
>>> @@ -15,8 +15,7 @@ UBOOT_DTBO_LOADADDRESS =3D "0x83080000"
>>> =C2=A0 UBOOT_DTBO_OFFSET =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "0x0001000=
0"
>>> =C2=A0 SPL_BINARY =3D "tispl.bin_HS"
>>> -SPL_BINARYNAME =3D "tispl.bin"
>>> =C2=A0 UBOOT_BINARY =3D "u-boot.img_HS"
>>> -IMAGE_BOOT_FILES =3D "${UBOOT_BINARY}"
>>> +UBOOT_SYMLINK =3D "u-boot.img"
>>> =C2=A0 TI_SECURE_DEV_PKG =3D "${TI_SECURE_DEV_PKG_K3}"
>>> diff --git a/conf/machine/am65xx-hs-evm.conf b/conf/machine/am65xx-hs=
-evm.conf
>>> index e4eebb6a..de92cacb 100644
>>> --- a/conf/machine/am65xx-hs-evm.conf
>>> +++ b/conf/machine/am65xx-hs-evm.conf
>>> @@ -15,8 +15,7 @@ UBOOT_DTBO_LOADADDRESS =3D "0x83080000"
>>> =C2=A0 UBOOT_DTBO_OFFSET =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "0x0001000=
0"
>>> =C2=A0 SPL_BINARY =3D "tispl.bin_HS"
>>> -SPL_BINARYNAME =3D "tispl.bin"
>>> =C2=A0 UBOOT_BINARY =3D "u-boot.img_HS"
>>> -IMAGE_BOOT_FILES =3D "${UBOOT_BINARY}"
>>> +UBOOT_SYMLINK =3D "u-boot.img"
>>> =C2=A0 TI_SECURE_DEV_PKG =3D "${TI_SECURE_DEV_PKG_K3}"
>>> diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.in=
c
>>> index e0970698..f85e6b98 100644
>>> --- a/conf/machine/include/k3.inc
>>> +++ b/conf/machine/include/k3.inc
>>> @@ -22,6 +22,7 @@ UBOOT_ENTRYPOINT =3D "0x80008000"
>>> =C2=A0 UBOOT_LOADADDRESS =3D "0x80008000"
>>> =C2=A0 SPL_BINARY =3D "tispl.bin"
>>> +SPL_BINARYNAME =3D "tispl.bin"
>>> =C2=A0 UBOOT_SUFFIX =3D "img"
>>> =C2=A0 EXTRA_IMAGEDEPENDS +=3D "virtual/bootloader"
>>> @@ -40,8 +41,8 @@ MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhos=
t vfat ext2 alsa ethernet pci"
>>> =C2=A0 IMAGE_FSTYPES +=3D "tar.xz wic.xz wic.bmap"
>>> -IMAGE_BOOT_FILES_LEGACY =3D "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ti=
boot3.bin sysfw.itb"
>>> -IMAGE_BOOT_FILES_MULTI_CERT =3D "${SPL_BINARY} u-boot.${UBOOT_SUFFIX=
} tiboot3.bin"
>>> +IMAGE_BOOT_FILES_LEGACY =3D "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX=
} tiboot3.bin sysfw.itb"
>>> +IMAGE_BOOT_FILES_MULTI_CERT =3D "${SPL_BINARYNAME} u-boot.${UBOOT_SU=
FFIX} tiboot3.bin"
>>> =C2=A0 IMAGE_BOOT_FILES ?=3D "${IMAGE_BOOT_FILES_LEGACY}"
>>> diff --git a/conf/machine/j7-hs-evm.conf b/conf/machine/j7-hs-evm.con=
f
>>> index f2e3ccf5..ece0d85e 100644
>>> --- a/conf/machine/j7-hs-evm.conf
>>> +++ b/conf/machine/j7-hs-evm.conf
>>> @@ -15,9 +15,8 @@ UBOOT_DTBO_LOADADDRESS =3D "0x83080000"
>>> =C2=A0 UBOOT_DTBO_OFFSET =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "0x0001000=
0"
>>> =C2=A0 SPL_BINARY =3D "tispl.bin_HS"
>>> -SPL_BINARYNAME =3D "tispl.bin"
>>> =C2=A0 UBOOT_BINARY =3D "u-boot.img_HS"
>>> -IMAGE_BOOT_FILES =3D "${UBOOT_BINARY}"
>>> +UBOOT_SYMLINK =3D "u-boot.img"
>>> =C2=A0 BBMULTICONFIG +=3D "k3r5-sr1-1"
>>> diff --git a/conf/machine/j7200-hs-evm.conf b/conf/machine/j7200-hs-e=
vm.conf
>>> index a5bd637e..8821ffac 100644
>>> --- a/conf/machine/j7200-hs-evm.conf
>>> +++ b/conf/machine/j7200-hs-evm.conf
>>> @@ -15,8 +15,7 @@ UBOOT_DTBO_LOADADDRESS =3D "0x83080000"
>>> =C2=A0 UBOOT_DTBO_OFFSET =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "0x0001000=
0"
>>> =C2=A0 SPL_BINARY =3D "tispl.bin_HS"
>>> -SPL_BINARYNAME =3D "tispl.bin"
>>> =C2=A0 UBOOT_BINARY =3D "u-boot.img_HS"
>>> -IMAGE_BOOT_FILES =3D "${UBOOT_BINARY}"
>>> +UBOOT_SYMLINK =3D "u-boot.img"
>>> =C2=A0 TI_SECURE_DEV_PKG =3D "${TI_SECURE_DEV_PKG_K3}"
>>> --=20
>>> 2.36.1
>>>
>=20

