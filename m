Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09B2FCCA470
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 13:10:51 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.24987.1759237848772848123
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 30 Sep 2025 06:10:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=h+LIV6gt;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58UDAlo42920212;
	Tue, 30 Sep 2025 08:10:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759237847;
	bh=uI5bJ2e2UY35zn98hsDUjwTS0wdeqVrFlypjLjlFVLo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=h+LIV6gtU+y2iejBe+W5WCgy16S/wvWqYqqEOQZvEZp1QHFGOxntSpl0z6bllyAsW
	 e6fVfi5dasLgqy4wb3Um+KqKUW8sWS/hZDu+stxb9H/mUP0rmjmDj28Ynrw82NJVFq
	 gf5lClK+nJ03gj0FW3YA4m7qw2auzFLTWXm7u8Jg=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58UDAlaE3939277
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 30 Sep 2025 08:10:47 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 30
 Sep 2025 08:10:47 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Sep 2025 08:10:47 -0500
Received: from [128.247.81.40] (dtmz023nlv.dhcp.ti.com [128.247.81.40] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58UDAlFD2952172;
	Tue, 30 Sep 2025 08:10:47 -0500
Message-ID: <1a3caf3c-f8c4-428c-aea8-56e80d1db631@ti.com>
Date: Tue, 30 Sep 2025 08:10:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master][PATCH 4/4 v2] meta-ti-bsp: conf: machine: include: Build
 initrd for all K3 platforms
To: Moteen Shah <m-shah@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <vigneshr@ti.com>, <u-kumar1@ti.com>, <a-limaye@ti.com>,
        <n-francis@ti.com>, <praneeth@ti.com>, <jm@ti.com>, <b-padhi@ti.com>,
        <bb@ti.com>, <denys@konsulko.com>, <rs@ti.com>
References: <20250919093831.20609-1-m-shah@ti.com>
 <20250919093831.20609-5-m-shah@ti.com>
 <81a30ddf-5067-447b-adf2-ade8d683a8df@ti.com>
 <12c1b1fd-e51e-4a18-a249-f761510a21ac@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <12c1b1fd-e51e-4a18-a249-f761510a21ac@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot02.ext.ti.com id 58UDAlo42920212
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 30 Sep 2025 13:10:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19082



On 9/30/2025 7:57 AM, Moteen Shah wrote:
> Hey Ryan,
>=20
> On 24/09/25 02:45, Ryan Eatmon wrote:
>>
>>
>> On 9/19/2025 4:38 AM, Moteen Shah wrote:
>>> Trigger build for initramfs image and package it in the boot partitio=
n
>>> of all K3 platforms whenever an image recipe is built with upstream
>>> kernel(mainline or mainline-next).
>>>
>>> Signed-off-by: Moteen Shah <m-shah@ti.com>
>>> ---
>>> =C2=A0 meta-ti-bsp/conf/machine/include/k3.inc | 8 +++++++-
>>> =C2=A0 1 file changed, 7 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/=20
>>> conf/machine/include/k3.inc
>>
>> If this flow is meant to apply to ALL TI platforms, then these changes=
=20
>> should be in ti-soc.inc and not k3.inc.=C2=A0 You are missing am335, a=
m43,=20
>> and am57 with this change.
>=20
> For now, we are only targeting the K3 devices.

Why limit it in this way?  Why do we want to support multiple boot=20
strategies for different parts?


>>
>>
>>> index 50411a8e..c0c49e0d 100644
>>> --- a/meta-ti-bsp/conf/machine/include/k3.inc
>>> +++ b/meta-ti-bsp/conf/machine/include/k3.inc
>>> @@ -33,6 +33,8 @@ MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "kernel-image=
-=20
>>> image ti-kernel-fitimage"
>>> =C2=A0 =C2=A0 TFA_PLATFORM =3D "k3"
>>> =C2=A0 +BUILD_INITRD_IMAGE =3D ""
>>> +
>>
>> Don't split the default assignment of this variable from the=20
>> overrides. Moved it down below.
>>
>>> =C2=A0 # Use the expected value of the ubifs filesystem's volume name=
 in=20
>>> the kernel
>>> =C2=A0 # and u-boot.
>>> =C2=A0 UBI_VOLNAME =3D "rootfs"
>>> @@ -43,7 +45,11 @@ MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "ti-pka-f=
w"
>>> =C2=A0 =C2=A0 IMAGE_FSTYPES +=3D "tar.xz wic.xz wic.bmap"
>>> =C2=A0 -IMAGE_BOOT_FILES ?=3D "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFI=
X}=20
>>> tiboot3.bin tiboot3-*-evm.bin"
>>> +BUILD_INITRD_IMAGE:bsp-mainline =3D "ti-initrd-image:do_image_comple=
te"
>>> +BUILD_INITRD_IMAGE:bsp-next =3D "ti-initrd-image:do_image_complete"
>>> +do_image_complete[depends] +=3D "${BUILD_INITRD_IMAGE}"
>>
>> After speaking with Denys, he is suggesting to use EXTRA_IMAGEDEPENDS=20
>> instead of the do_image_complete to make it be built.
>>
>> BUILD_CORE_INITRAMFS_IMAGE ?=3D ""
>> BUILD_CORE_INITRAMFS_IMAGE:bsp-mainline =3D "ti-core-initramfs"
>> BUILD_CORE_INITRAMFS_IMAGE:bsp-next =3D "ti-core-initramfs"
>> EXTRA_IMAGEDEPENDS +=3D "${BUILD_CORE_INITRAMFS_IMAGE}"
>>
>> Give that a try and see if it makes the initramfs be built correctly.
>=20
> I tried this out, but it went into failure, similar to what mentioned b=
y=20
> Denys.
>=20
> Regards,
> Moteen
>=20
>>
>>> +
>>> +IMAGE_BOOT_FILES ?=3D "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX}=20
>>> tiboot3.bin tiboot3-*-evm.bin initrd.cpio.xz"
>>
>> Fix filename here too.=C2=A0 s/initrd/ti-core-initramfs/
>>
>>> =C2=A0 IMAGE_EFI_BOOT_FILES ?=3D "${IMAGE_BOOT_FILES}"
>>> =C2=A0 =C2=A0 EFI_PROVIDER ?=3D "grub-efi"
>>

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


