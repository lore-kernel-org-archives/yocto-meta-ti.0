Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92A1ECAC5B5
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 05:10:42 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.46877.1759122640403105974
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 28 Sep 2025 22:10:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=BxAryBcm;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: m-shah@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58T5AdJ02604760;
	Mon, 29 Sep 2025 00:10:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759122639;
	bh=DL75jZlbimu3cm4HZ9yToX31jl/MzssBwrNg597359Q=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=BxAryBcmo04pu/LB19btxsHyIcKTS5NNphrpGU2ow8THIKL+AkUzsmx+jag58Xwu3
	 /LkE27467sG7GAjh56yU1ksrdcrnZL/+5493JqL+x7STa8z3keGHnFowpAz1epgg7J
	 DwcGiKEsnJMAaVLxDYZCddycsw+YI9Z2XmWiGtfM=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58T5AdwU1669090
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 29 Sep 2025 00:10:39 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 29
 Sep 2025 00:10:38 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 29 Sep 2025 00:10:38 -0500
Received: from [10.24.72.162] (moteen-ubuntu-desk.dhcp.ti.com [10.24.72.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58T5AY42650639;
	Mon, 29 Sep 2025 00:10:35 -0500
Message-ID: <0bb092ca-cdc4-4166-b158-c66dd857383d@ti.com>
Date: Mon, 29 Sep 2025 10:40:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master][PATCH 2/4 v2] recipes-ti: initrd: Make minimal initrd
 image
To: Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <vigneshr@ti.com>, <u-kumar1@ti.com>, <a-limaye@ti.com>,
        <n-francis@ti.com>, <praneeth@ti.com>, <jm@ti.com>, <b-padhi@ti.com>,
        <bb@ti.com>, <denys@konsulko.com>, <rs@ti.com>
References: <20250919093831.20609-1-m-shah@ti.com>
 <20250919093831.20609-3-m-shah@ti.com>
 <1058b2e6-7196-4cb2-b851-3f2b6e015b99@ti.com>
Content-Language: en-US
From: Moteen Shah <m-shah@ti.com>
In-Reply-To: <1058b2e6-7196-4cb2-b851-3f2b6e015b99@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot02.ext.ti.com id 58T5AdJ02604760
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 29 Sep 2025 05:10:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19070


On 24/09/25 02:44, Ryan Eatmon wrote:
>
>
> On 9/19/2025 4:38 AM, Moteen Shah wrote:
>> Introduce a new minimal initramfs image which will be used
>> for all K3 devices in the boot flow. The image will package
>> boot essential and other modules which will be modprobed by
>> initramfs-udev once the inbuilt drivers gets probed.
>>
>> Signed-off-by: Moteen Shah <m-shah@ti.com>
>> ---
>> =C2=A0 .../initrd/packagegroup-ti-initrd.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 ++
>> =C2=A0 .../recipes-ti/initrd/ti-initrd-image.bb=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 50 +++++++++++++++++++
>> =C2=A0 2 files changed, 55 insertions(+)
>> =C2=A0 create mode 100644=20
>> meta-ti-bsp/recipes-ti/initrd/packagegroup-ti-initrd.bb
>> =C2=A0 create mode 100644 meta-ti-bsp/recipes-ti/initrd/ti-initrd-imag=
e.bb
>>
>> diff --git a/meta-ti-bsp/recipes-ti/initrd/packagegroup-ti-initrd.bb=20
>> b/meta-ti-bsp/recipes-ti/initrd/packagegroup-ti-initrd.bb
>> new file mode 100644
>> index 00000000..8847cb2e
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-ti/initrd/packagegroup-ti-initrd.bb
>
> We are using initrd and initramfs in different places.=C2=A0 Yocto seem=
s to=20
> use initramfs everywhere.=C2=A0 Let's unify to initramfs instead of ini=
trd.
>
> Change the recipe name to packagegroup-ti-core-initramfs.bb
>
>> @@ -0,0 +1,5 @@
>> +SUMMARY =3D "Minimal initrd for boot requirements"
>> +
>> +require recipes-core/packagegroups/packagegroup-core-boot.bb
>> +
>> +RDEPENDS:${PN}:remove =3D "grub-efi kernel"
>> diff --git a/meta-ti-bsp/recipes-ti/initrd/ti-initrd-image.bb=20
>> b/meta-ti-bsp/recipes-ti/initrd/ti-initrd-image.bb
>> new file mode 100644
>> index 00000000..f47307e5
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-ti/initrd/ti-initrd-image.bb
>
> Change the recipe name to ti-core-initramfs.bb
>
>
>> @@ -0,0 +1,50 @@
>> +SUMMARY =3D "TI SDK minimal initrd image"
>
> s/initrd/initramfs/

Noted.

>
>> +
>> +DESCRIPTION =3D "Image meant to probe boot essential modules\
>> + and other modules to reach the userspace, which cannot be\
>> + built inside the upstream linux kernel image.\
>> +"
>> +
>> +LICENSE =3D "MIT"
>> +
>> +inherit core-image
>> +
>> +IMAGE_NAME =3D "initrd"
>
> Change the image name to ti-core-initramfs.=C2=A0 There is no good reas=
on=20
> to not use more characters and be more descriptive.
>
>> +IMAGE_NAME_SUFFIX =3D ""
>> +
>> +IMAGE_FEATURES:remove =3D "package-management"
>> +
>> +INITRAMFS_FSTYPES =3D "cpio cpio.xz"
>> +
>> +IMAGE_FSTYPES =3D "${INITRAMFS_FSTYPES}"
>> +
>> +INITRAMFS_SCRIPTS ?=3D "\
>> +=C2=A0=C2=A0=C2=A0 initramfs-framework-base \
>> +=C2=A0=C2=A0=C2=A0 initramfs-module-udev \
>> +=C2=A0=C2=A0=C2=A0 initramfs-module-nfsrootfs \
>> +"
>> +
>> +UTILS =3D "\
>> +=C2=A0=C2=A0=C2=A0 cifs-utils \
>> +=C2=A0=C2=A0=C2=A0 nfs-utils \
>> +=C2=A0=C2=A0=C2=A0 nfs-utils-client \
>> +"
>
> I think the two variables above all need to move into the packagegroup=20
> and not directly in the image recipe.=C2=A0 Otherwise what is the point=
 of=20
> the packagegroup at all?
>
> Use RDEPENDS to make the packagegroup depend on the variables, and=20
> then remove them from the list below.=C2=A0 And move the=20
> TI_INITRAMFS_KERNEL_MODULES entry as well.
>
> That way if someone else wants to create another initramfs to do=20
> something like secure boot (or whatever) they have a single point to=20
> include and pull in all of the files required for boot.

Makes sense, I will fix in v3.

>
>> +PACKAGE_INSTALL =3D "\
>> +=C2=A0=C2=A0=C2=A0 ${INITRAMFS_SCRIPTS} \
>> +=C2=A0=C2=A0=C2=A0 ${UTILS} \
>> +=C2=A0=C2=A0=C2=A0 ${TI_INITRAMFS_KERNEL_MODULES} \
>> +=C2=A0=C2=A0=C2=A0 packagegroup-ti-initrd \
>
> s/packagegroup-ti-initrd/packagegroup-ti-core-initramfs/
>
>> +"
>> +
>> +export IMAGE_BASENAME =3D "ti-initrd-image"
>
> s/ti-initrd-image/ti-core-initramfs/

Noted.

Regards,
Moteen

>
>> +
>> +# To further reduce the size of the rootfs, remove the /boot=20
>> directory from
>> +# the final image this is usually done by adding=20
>> RDEPENDS_kernel-base =3D ""
>> +# in the configuration file. In our case we can't use this method.=20
>> Instead we
>> +# just wipe out the content of "/boot" before creating the image.
>> +ROOTFS_POSTPROCESS_COMMAND +=3D "empty_boot_dir; "
>> +empty_boot_dir () {
>> +=C2=A0=C2=A0=C2=A0 rm -rf ${IMAGE_ROOTFS}/boot/*
>> +}
>

