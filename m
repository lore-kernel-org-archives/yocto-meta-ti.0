Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B4E1CAC598
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 07:58:51 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.17540.1758095919113542990
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 Sep 2025 00:58:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=Npb7crg6;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: m-shah@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58H7wcha1463019
	for <meta-ti@lists.yoctoproject.org>; Wed, 17 Sep 2025 02:58:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758095918;
	bh=HhvxY3ne90vcMa1bj9lCm4OaTEde/xxQdBd+MazA4HA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Npb7crg6aH4Pw/P+Cys4+ke2aaGYGKsb2SpM7M4jEN1Ys+QQMCJqAEnD1Lis0EDKp
	 Vux2kLmqxI2MCckZHpTqtOoPIyuEW/Giz+TrG36cpomvTGpk906KuUn7+6A4HeOgKR
	 Dn7dYOfo/+vcq5HQWW2wMr9rCfKsvDKRGLnV90zs=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58H7wcdK599496
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 17 Sep 2025 02:58:38 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 17
 Sep 2025 02:58:38 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 17 Sep 2025 02:58:37 -0500
Received: from [10.24.72.162] (moteen-ubuntu-desk.dhcp.ti.com [10.24.72.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58H7wYBJ2958539;
	Wed, 17 Sep 2025 02:58:35 -0500
Message-ID: <653a9707-41a4-486e-a8f0-d02c398831d5@ti.com>
Date: Wed, 17 Sep 2025 13:28:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master][PATCH 1/2] recipes-ti: initrd: Make minimal initrd image
To: Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <vigneshr@ti.com>, <u-kumar1@ti.com>, <a-limaye@ti.com>,
        <n-francis@ti.com>, <praneeth@ti.com>, <jm@ti.com>, <b-padhi@ti.com>
References: <20250908105315.19583-1-m-shah@ti.com>
 <20250908105315.19583-2-m-shah@ti.com>
 <d5b52951-ad23-4a2a-b541-ea20a1b54b81@ti.com>
 <ab3c6b64-cf3a-4274-96ff-a81c47ee727b@ti.com>
 <ccf0bea6-5130-439e-b752-1a6fd413d246@ti.com>
Content-Language: en-US
From: Moteen Shah <m-shah@ti.com>
In-Reply-To: <ccf0bea6-5130-439e-b752-1a6fd413d246@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot03.ext.ti.com id 58H7wcha1463019
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 17 Sep 2025 07:58:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19015

Hey Ryan,

On 15/09/25 17:14, Ryan Eatmon wrote:
>
>
> On 9/15/2025 1:12 AM, Moteen Shah wrote:
>> Hey Ryan,
>> Thanks for the detailed review.
>>
>> On 12/09/25 21:42, Ryan Eatmon wrote:
>>>
>>> After some discussion in a call with Denys today, I think we have=20
>>> some feedback on what is needed to better leverage this patch idea.
>>>
>>> 1) We need the way to get this image built as part of the build=20
>>> process. =C2=A0The best way to accomplish that will likely be to foll=
ow=20
>>> the firmware approach and include it in the=20
>>> MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS variable for each platform that=20
>>> requires it.
>>
>> I was planning to do something like:
>>
>> do_rootfs[depends] +=3D "ti-initrd-image:do_image_complete"
>> ROOTFS_POSTPROCESS_COMMAND +=3D "install_initrd_to_boot; "
>> install_initrd_to_boot() {
>> =C2=A0=C2=A0=C2=A0=C2=A0 install -m 0644 ${DEPLOY_DIR_IMAGE}/initrd.cp=
io=20
>> ${IMAGE_ROOTFS}/boot/initrd.cpio
>> }
>>
>> in core-image-%.bbappend file to make this image as a part of core=20
>> image build.
>>
>> I will look out for how I can achieve the same with=20
>> MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS.
>>
>> Is the above solution optimal though? Since all of the K3 platforms=20
>> will be shifting to the initrd flow.
>
> There are more distributions than just poky and arago.=C2=A0 The soluti=
on I=20
> suggested will work for all of them and not require anything specific=20
> like your solution.
>

Understood, I will use MACHINE_ESSENTIAL_EXTRA_RRECOMMEND inside k3.inc,=20
but how should I include the initrd image in the boot directory of the=20
root partition, since initrd itself is an image I cannot use=20
${IMAGE_ROOTFS} inside ti-initrd-image.bb. I did found a way around it=20
https://lists.yoctoproject.org/g/yocto/message/47500, not really sure if=20
its the correct way.

Regards,
Moteen

>
>>>
>>> 2) We need a better way to specify the list of MODULES rather than=20
>>> hardcoding the list in the recipe.=C2=A0 The list of required modules=
=20
>>> will likely be different for different platforms.
>>>
>>> To that end we recommend creating a new variable that should be=20
>>> defined in the ti-soc.inc:
>>>
>>> =C2=A0 TI_INITRAMFS_KERNEL_MODULES ?=3D ""
>>>
>>> Then in each platform specific .inc file we can set that list to the=20
>>> needed modules based on the ti-bsp need.=C2=A0 Our vendor kernels do =
not=20
>>> need it, so it could remain blank, but the mainline/next bsps could=20
>>> set it since those actually create the kernel module packages.
>>>
>>> =C2=A0 TI_INITRAMFS_KERNEL_MODULES:append:bsp-mainline =3D " mod1 mod=
2"
>>> =C2=A0 TI_INITRAMFS_KERNEL_MODULES:append:bsp-next =3D " mod1 mod2"
>>>
>>> Then in the ti-initrd-image.bb you would drop the MODULES=3D"" settin=
g=20
>>> and just change to the variable TI_INITRAMFS_KERNEL_MODULES.
>>>
>>> This way, if there are other layers that want to create their own=20
>>> initramfs we have a variable in place for them to use to include the=20
>>> required modules based on the kernel version that is being built.
>>
>> Seems like a better solution for including the modules, I'll fix it=20
>> in v2.
>>
>>>
>>>
>>>
>>> So, I would probably break all of this up into multiple patches. The=20
>>> first patch would the work in #2 above to establish the needed=20
>>> variable for all platforms.=C2=A0 The next patches are your patches b=
ut=20
>>> moving to TI_INITRAMFS_KERNEL_MODULES.=C2=A0 And the final patch woul=
d be=20
>>> adding your new ti-initrd-image into=20
>>> MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS list for all platforms.
>>
>> Noted.
>>
>> Regards,
>> Moteen
>>
>>>
>>> Did I miss anything, Denys?
>>>
>>>
>>> On 9/8/2025 5:53 AM, Moteen Shah wrote:
>>>> Introduce a new minimal initramfs image which will be used
>>>> for all K3 devices in the boot flow. The image will package
>>>> boot essential and other modules which will be modprobed by
>>>> initramfs-udev once the inbuilt drivers gets probed.
>>>>
>>>> Signed-off-by: Moteen Shah <m-shah@ti.com>
>>>> ---
>>>> =C2=A0 .../initrd/packagegroup-ti-initrd.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 ++
>>>> =C2=A0 .../recipes-ti/initrd/ti-initrd-image.bb=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 56=20
>>>> +++++++++++++++++++
>>>> =C2=A0 2 files changed, 61 insertions(+)
>>>> =C2=A0 create mode 100644=20
>>>> meta-ti-bsp/recipes-ti/initrd/packagegroup-ti-initrd.bb
>>>> =C2=A0 create mode 100644 meta-ti-bsp/recipes-ti/initrd/ti-initrd-im=
age.bb
>>>>
>>>> diff --git=20
>>>> a/meta-ti-bsp/recipes-ti/initrd/packagegroup-ti-initrd.bb=20
>>>> b/meta-ti-bsp/recipes-ti/initrd/packagegroup-ti-initrd.bb
>>>> new file mode 100644
>>>> index 00000000..8847cb2e
>>>> --- /dev/null
>>>> +++ b/meta-ti-bsp/recipes-ti/initrd/packagegroup-ti-initrd.bb
>>>> @@ -0,0 +1,5 @@
>>>> +SUMMARY =3D "Minimal initrd for boot requirements"
>>>> +
>>>> +require recipes-core/packagegroups/packagegroup-core-boot.bb
>>>> +
>>>> +RDEPENDS:${PN}:remove =3D "grub-efi kernel"
>>>> diff --git a/meta-ti-bsp/recipes-ti/initrd/ti-initrd-image.bb=20
>>>> b/meta-ti-bsp/recipes-ti/initrd/ti-initrd-image.bb
>>>> new file mode 100644
>>>> index 00000000..f6b99073
>>>> --- /dev/null
>>>> +++ b/meta-ti-bsp/recipes-ti/initrd/ti-initrd-image.bb
>>>> @@ -0,0 +1,56 @@
>>>> +SUMMARY =3D "TI SDK minimal initrd image"
>>>> +
>>>> +DESCRIPTION =3D "Image meant to probe boot essential modules\
>>>> + and other modules to reach the userspace, which cannot be\
>>>> + built inside the upstream linux kernel image.\
>>>> +"
>>>> +
>>>> +LICENSE =3D "MIT"
>>>> +
>>>> +inherit core-image
>>>> +
>>>> +IMAGE_NAME =3D "initrd"
>>>> +
>>>> +IMAGE_NAME_SUFFIX =3D ""
>>>> +
>>>> +IMAGE_FEATURES:remove =3D "package-management"
>>>> +
>>>> +INITRAMFS_FSTYPES =3D "cpio cpio.xz"
>>>> +
>>>> +IMAGE_FSTYPES =3D "${INITRAMFS_FSTYPES}"
>>>> +
>>>> +INITRAMFS_SCRIPTS ?=3D "\
>>>> +=C2=A0=C2=A0=C2=A0 initramfs-framework-base \
>>>> +=C2=A0=C2=A0=C2=A0 initramfs-module-udev \
>>>> +=C2=A0=C2=A0=C2=A0 initramfs-module-nfsrootfs \
>>>> +"
>>>> +
>>>> +MODULES =3D "\
>>>> +=C2=A0=C2=A0=C2=A0 kernel-module-cdns-pltfrm \
>>>> +=C2=A0=C2=A0=C2=A0 kernel-module-ti-j721e-ufs \
>>>> +=C2=A0=C2=A0=C2=A0 kernel-module-tps6594-i2c \
>>>> +"
>>>> +
>>>> +UTILS =3D "\
>>>> +=C2=A0=C2=A0=C2=A0 cifs-utils \
>>>> +=C2=A0=C2=A0=C2=A0 nfs-utils \
>>>> +=C2=A0=C2=A0=C2=A0 nfs-utils-client \
>>>> +"
>>>> +
>>>> +PACKAGE_INSTALL =3D "\
>>>> +=C2=A0=C2=A0=C2=A0 ${INITRAMFS_SCRIPTS} \
>>>> +=C2=A0=C2=A0=C2=A0 ${UTILS} \
>>>> +=C2=A0=C2=A0=C2=A0 ${MODULES} \
>>>> +=C2=A0=C2=A0=C2=A0 packagegroup-ti-initrd \
>>>> +"
>>>> +
>>>> +export IMAGE_BASENAME =3D "ti-initrd-image"
>>>> +
>>>> +# To further reduce the size of the rootfs, remove the /boot=20
>>>> directory from
>>>> +# the final image this is usually done by adding=20
>>>> RDEPENDS_kernel-base =3D ""
>>>> +# in the configuration file. In our case we can't use this method.=20
>>>> Instead we
>>>> +# just wipe out the content of "/boot" before creating the image.
>>>> +ROOTFS_POSTPROCESS_COMMAND +=3D "empty_boot_dir; "
>>>> +empty_boot_dir () {
>>>> +=C2=A0=C2=A0=C2=A0 rm -rf ${IMAGE_ROOTFS}/boot/*
>>>> +}
>>>
>

