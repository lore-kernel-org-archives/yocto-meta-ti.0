Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4E38CCA468
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 12:58:10 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.24775.1759237085406764592
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 30 Sep 2025 05:58:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=pr/PGqhr;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: m-shah@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58UCw3h22420445;
	Tue, 30 Sep 2025 07:58:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759237083;
	bh=dgE7299eiUSbq7iTUTuf12f/etu38h0E6qJAAJGs3nU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=pr/PGqhrIsCiE7Kz3gcyS1RR/Te+MmUVcr064pln/n/e90d10MK8NOvgtIzHtTLAI
	 0SFADPrKFrZTfzKZqaB2YRUoMZPeaCAIAgUWkzOg1tNCRDmmjjxWsuPlLPC0SBijUl
	 wO6yGox7JB7YYc53WYiIivNUeH7aIlnZ/tYTwds8=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58UCw3Sk3118240
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 30 Sep 2025 07:58:03 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 30
 Sep 2025 07:58:02 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Sep 2025 07:58:03 -0500
Received: from [10.24.72.162] (moteen-ubuntu-desk.dhcp.ti.com [10.24.72.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58UCvxsd3194476;
	Tue, 30 Sep 2025 07:58:00 -0500
Message-ID: <12c1b1fd-e51e-4a18-a249-f761510a21ac@ti.com>
Date: Tue, 30 Sep 2025 18:27:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master][PATCH 4/4 v2] meta-ti-bsp: conf: machine: include: Build
 initrd for all K3 platforms
To: Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <vigneshr@ti.com>, <u-kumar1@ti.com>, <a-limaye@ti.com>,
        <n-francis@ti.com>, <praneeth@ti.com>, <jm@ti.com>, <b-padhi@ti.com>,
        <bb@ti.com>, <denys@konsulko.com>, <rs@ti.com>
References: <20250919093831.20609-1-m-shah@ti.com>
 <20250919093831.20609-5-m-shah@ti.com>
 <81a30ddf-5067-447b-adf2-ade8d683a8df@ti.com>
Content-Language: en-US
From: Moteen Shah <m-shah@ti.com>
In-Reply-To: <81a30ddf-5067-447b-adf2-ade8d683a8df@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot03.ext.ti.com id 58UCw3h22420445
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 30 Sep 2025 12:58:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19081

Hey Ryan,

On 24/09/25 02:45, Ryan Eatmon wrote:
>
>
> On 9/19/2025 4:38 AM, Moteen Shah wrote:
>> Trigger build for initramfs image and package it in the boot partition
>> of all K3 platforms whenever an image recipe is built with upstream
>> kernel(mainline or mainline-next).
>>
>> Signed-off-by: Moteen Shah <m-shah@ti.com>
>> ---
>> =C2=A0 meta-ti-bsp/conf/machine/include/k3.inc | 8 +++++++-
>> =C2=A0 1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-ti-bsp/conf/machine/include/k3.inc=20
>> b/meta-ti-bsp/conf/machine/include/k3.inc
>
> If this flow is meant to apply to ALL TI platforms, then these changes=20
> should be in ti-soc.inc and not k3.inc.=C2=A0 You are missing am335, am=
43,=20
> and am57 with this change.

For now, we are only targeting the K3 devices.

>
>
>> index 50411a8e..c0c49e0d 100644
>> --- a/meta-ti-bsp/conf/machine/include/k3.inc
>> +++ b/meta-ti-bsp/conf/machine/include/k3.inc
>> @@ -33,6 +33,8 @@ MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D=20
>> "kernel-image-image ti-kernel-fitimage"
>> =C2=A0 =C2=A0 TFA_PLATFORM =3D "k3"
>> =C2=A0 +BUILD_INITRD_IMAGE =3D ""
>> +
>
> Don't split the default assignment of this variable from the=20
> overrides. Moved it down below.
>
>> =C2=A0 # Use the expected value of the ubifs filesystem's volume name =
in=20
>> the kernel
>> =C2=A0 # and u-boot.
>> =C2=A0 UBI_VOLNAME =3D "rootfs"
>> @@ -43,7 +45,11 @@ MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "ti-pka-fw=
"
>> =C2=A0 =C2=A0 IMAGE_FSTYPES +=3D "tar.xz wic.xz wic.bmap"
>> =C2=A0 -IMAGE_BOOT_FILES ?=3D "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX=
}=20
>> tiboot3.bin tiboot3-*-evm.bin"
>> +BUILD_INITRD_IMAGE:bsp-mainline =3D "ti-initrd-image:do_image_complet=
e"
>> +BUILD_INITRD_IMAGE:bsp-next =3D "ti-initrd-image:do_image_complete"
>> +do_image_complete[depends] +=3D "${BUILD_INITRD_IMAGE}"
>
> After speaking with Denys, he is suggesting to use EXTRA_IMAGEDEPENDS=20
> instead of the do_image_complete to make it be built.
>
> BUILD_CORE_INITRAMFS_IMAGE ?=3D ""
> BUILD_CORE_INITRAMFS_IMAGE:bsp-mainline =3D "ti-core-initramfs"
> BUILD_CORE_INITRAMFS_IMAGE:bsp-next =3D "ti-core-initramfs"
> EXTRA_IMAGEDEPENDS +=3D "${BUILD_CORE_INITRAMFS_IMAGE}"
>
> Give that a try and see if it makes the initramfs be built correctly.

I tried this out, but it went into failure, similar to what mentioned by=20
Denys.

Regards,
Moteen

>
>> +
>> +IMAGE_BOOT_FILES ?=3D "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX}=20
>> tiboot3.bin tiboot3-*-evm.bin initrd.cpio.xz"
>
> Fix filename here too.=C2=A0 s/initrd/ti-core-initramfs/
>
>> =C2=A0 IMAGE_EFI_BOOT_FILES ?=3D "${IMAGE_BOOT_FILES}"
>> =C2=A0 =C2=A0 EFI_PROVIDER ?=3D "grub-efi"
>

