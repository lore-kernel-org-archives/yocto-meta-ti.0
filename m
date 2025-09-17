Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F83CA0EE8
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 10:12:12 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.19263.1758103928057581164
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 Sep 2025 03:12:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=Knw0cBfX;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: m-shah@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58HAC7D5225658
	for <meta-ti@lists.yoctoproject.org>; Wed, 17 Sep 2025 05:12:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758103927;
	bh=73DmYZ7RBiyIGFOpb+BSNn/pqDy29AbxHEtJBzHAU/A=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Knw0cBfXVxWAcrbana4JsK1JF+dSgvFt5Fcwu54b3uy4A+yuf9ut1ixTHDj9hsO7y
	 zLTS+Q74f8ITapIZcyTdsOLa/aPJsftkY4yQVkfgzSeDFaJMUaW0xTr4BP2TSr4jkT
	 Q+U21mSpZ0MdL4JbwI1yB3ym/0wg8GjfTEbDtS5w=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58HAC7fT2264639
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 17 Sep 2025 05:12:07 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 17
 Sep 2025 05:12:06 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 17 Sep 2025 05:12:06 -0500
Received: from [10.24.72.162] (moteen-ubuntu-desk.dhcp.ti.com [10.24.72.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58HAC3tn3134594;
	Wed, 17 Sep 2025 05:12:04 -0500
Message-ID: <38c38ef5-2dbb-49f4-ae5f-8e10b5dac098@ti.com>
Date: Wed, 17 Sep 2025 15:42:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master][PATCH 1/2] recipes-ti: initrd: Make minimal
 initrd image
To: Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <vigneshr@ti.com>, <u-kumar1@ti.com>, <a-limaye@ti.com>,
        <n-francis@ti.com>, <praneeth@ti.com>, <jm@ti.com>, <b-padhi@ti.com>
References: <20250908105315.19583-1-m-shah@ti.com>
 <20250908105315.19583-2-m-shah@ti.com>
 <d5b52951-ad23-4a2a-b541-ea20a1b54b81@ti.com>
 <ab3c6b64-cf3a-4274-96ff-a81c47ee727b@ti.com>
 <ccf0bea6-5130-439e-b752-1a6fd413d246@ti.com>
 <186602EC8486BF32.13540@lists.yoctoproject.org>
Content-Language: en-US
From: Moteen Shah <m-shah@ti.com>
In-Reply-To: <186602EC8486BF32.13540@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot04.ext.ti.com id 58HAC7D5225658
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 17 Sep 2025 10:12:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19016

Hey Ryan,

On 17/09/25 13:28, Moteen Shah via lists.yoctoproject.org wrote:
> Hey Ryan,
>
> On 15/09/25 17:14, Ryan Eatmon wrote:
>>
>>
>> On 9/15/2025 1:12 AM, Moteen Shah wrote:
>>> Hey Ryan,
>>> Thanks for the detailed review.
>>>
>>> On 12/09/25 21:42, Ryan Eatmon wrote:
>>>>
>>>> After some discussion in a call with Denys today, I think we have=20
>>>> some feedback on what is needed to better leverage this patch idea.
>>>>
>>>> 1) We need the way to get this image built as part of the build=20
>>>> process. =C2=A0The best way to accomplish that will likely be to fol=
low=20
>>>> the firmware approach and include it in the=20
>>>> MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS variable for each platform that=20
>>>> requires it.
>>>
>>> I was planning to do something like:
>>>
>>> do_rootfs[depends] +=3D "ti-initrd-image:do_image_complete"
>>> ROOTFS_POSTPROCESS_COMMAND +=3D "install_initrd_to_boot; "
>>> install_initrd_to_boot() {
>>> =C2=A0=C2=A0=C2=A0=C2=A0 install -m 0644 ${DEPLOY_DIR_IMAGE}/initrd.c=
pio=20
>>> ${IMAGE_ROOTFS}/boot/initrd.cpio
>>> }
>>>
>>> in core-image-%.bbappend file to make this image as a part of core=20
>>> image build.
>>>
>>> I will look out for how I can achieve the same with=20
>>> MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS.
>>>
>>> Is the above solution optimal though? Since all of the K3 platforms=20
>>> will be shifting to the initrd flow.
>>
>> There are more distributions than just poky and arago.=C2=A0 The solut=
ion=20
>> I suggested will work for all of them and not require anything=20
>> specific like your solution.
>>
>
> Understood, I will use MACHINE_ESSENTIAL_EXTRA_RRECOMMEND inside=20
> k3.inc, but how should I include the initrd image in the boot=20
> directory of the root partition, since initrd itself is an image I=20
> cannot use ${IMAGE_ROOTFS} inside ti-initrd-image.bb. I did found a=20
> way around it https://lists.yoctoproject.org/g/yocto/message/47500,=20
> not really sure if its the correct way.
>
> Regards,
> Moteen
>

Adding on the thread, using MACHINE_ESSENTIAL_EXTRA_RRECOMMEND does not=20
builds the initrd.cpio. I suspect that the tag is used to include=20
packages and since ti-initrd-image is recipe for image itself and not a=20
package it does not work. As a workaround to the issue, I am using:

do_image_complete[depends] +=3D "ti-initrd-image:do_image_complete"


in the platform specific .inc files.

Regards,
Moteen


>>
>>>>
>>>> 2) We need a better way to specify the list of MODULES rather than=20
>>>> hardcoding the list in the recipe.=C2=A0 The list of required module=
s=20
>>>> will likely be different for different platforms.
>>>>
>>>> To that end we recommend creating a new variable that should be=20
>>>> defined in the ti-soc.inc:
>>>>
>>>> =C2=A0 TI_INITRAMFS_KERNEL_MODULES ?=3D ""
>>>>
>>>> Then in each platform specific .inc file we can set that list to=20
>>>> the needed modules based on the ti-bsp need.=C2=A0 Our vendor kernel=
s do=20
>>>> not need it, so it could remain blank, but the mainline/next bsps=20
>>>> could set it since those actually create the kernel module packages.
>>>>
>>>> =C2=A0 TI_INITRAMFS_KERNEL_MODULES:append:bsp-mainline =3D " mod1 mo=
d2"
>>>> =C2=A0 TI_INITRAMFS_KERNEL_MODULES:append:bsp-next =3D " mod1 mod2"
>>>>
>>>> Then in the ti-initrd-image.bb you would drop the MODULES=3D""=20
>>>> setting and just change to the variable TI_INITRAMFS_KERNEL_MODULES.
>>>>
>>>> This way, if there are other layers that want to create their own=20
>>>> initramfs we have a variable in place for them to use to include=20
>>>> the required modules based on the kernel version that is being built.
>>>
>>> Seems like a better solution for including the modules, I'll fix it=20
>>> in v2.
>>>
>>>>
>>>>
>>>>
>>>> So, I would probably break all of this up into multiple patches.=20
>>>> The first patch would the work in #2 above to establish the needed=20
>>>> variable for all platforms.=C2=A0 The next patches are your patches =
but=20
>>>> moving to TI_INITRAMFS_KERNEL_MODULES.=C2=A0 And the final patch wou=
ld=20
>>>> be adding your new ti-initrd-image into=20
>>>> MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS list for all platforms.
>>>
>>> Noted.
>>>
>>> Regards,
>>> Moteen
>>>
>>>>
>>>> Did I miss anything, Denys?
>>>>
>>>>
>>>> On 9/8/2025 5:53 AM, Moteen Shah wrote:
>>>>> Introduce a new minimal initramfs image which will be used
>>>>> for all K3 devices in the boot flow. The image will package
>>>>> boot essential and other modules which will be modprobed by
>>>>> initramfs-udev once the inbuilt drivers gets probed.
>>>>>
>>>>> Signed-off-by: Moteen Shah <m-shah@ti.com>
>>>>> ---
>>>>> =C2=A0 .../initrd/packagegroup-ti-initrd.bb=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 ++
>>>>> =C2=A0 .../recipes-ti/initrd/ti-initrd-image.bb=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 56=20
>>>>> +++++++++++++++++++
>>>>> =C2=A0 2 files changed, 61 insertions(+)
>>>>> =C2=A0 create mode 100644=20
>>>>> meta-ti-bsp/recipes-ti/initrd/packagegroup-ti-initrd.bb
>>>>> =C2=A0 create mode 100644 meta-ti-bsp/recipes-ti/initrd/ti-initrd-i=
mage.bb
>>>>>
>>>>> diff --git=20
>>>>> a/meta-ti-bsp/recipes-ti/initrd/packagegroup-ti-initrd.bb=20
>>>>> b/meta-ti-bsp/recipes-ti/initrd/packagegroup-ti-initrd.bb
>>>>> new file mode 100644
>>>>> index 00000000..8847cb2e
>>>>> --- /dev/null
>>>>> +++ b/meta-ti-bsp/recipes-ti/initrd/packagegroup-ti-initrd.bb
>>>>> @@ -0,0 +1,5 @@
>>>>> +SUMMARY =3D "Minimal initrd for boot requirements"
>>>>> +
>>>>> +require recipes-core/packagegroups/packagegroup-core-boot.bb
>>>>> +
>>>>> +RDEPENDS:${PN}:remove =3D "grub-efi kernel"
>>>>> diff --git a/meta-ti-bsp/recipes-ti/initrd/ti-initrd-image.bb=20
>>>>> b/meta-ti-bsp/recipes-ti/initrd/ti-initrd-image.bb
>>>>> new file mode 100644
>>>>> index 00000000..f6b99073
>>>>> --- /dev/null
>>>>> +++ b/meta-ti-bsp/recipes-ti/initrd/ti-initrd-image.bb
>>>>> @@ -0,0 +1,56 @@
>>>>> +SUMMARY =3D "TI SDK minimal initrd image"
>>>>> +
>>>>> +DESCRIPTION =3D "Image meant to probe boot essential modules\
>>>>> + and other modules to reach the userspace, which cannot be\
>>>>> + built inside the upstream linux kernel image.\
>>>>> +"
>>>>> +
>>>>> +LICENSE =3D "MIT"
>>>>> +
>>>>> +inherit core-image
>>>>> +
>>>>> +IMAGE_NAME =3D "initrd"
>>>>> +
>>>>> +IMAGE_NAME_SUFFIX =3D ""
>>>>> +
>>>>> +IMAGE_FEATURES:remove =3D "package-management"
>>>>> +
>>>>> +INITRAMFS_FSTYPES =3D "cpio cpio.xz"
>>>>> +
>>>>> +IMAGE_FSTYPES =3D "${INITRAMFS_FSTYPES}"
>>>>> +
>>>>> +INITRAMFS_SCRIPTS ?=3D "\
>>>>> +=C2=A0=C2=A0=C2=A0 initramfs-framework-base \
>>>>> +=C2=A0=C2=A0=C2=A0 initramfs-module-udev \
>>>>> +=C2=A0=C2=A0=C2=A0 initramfs-module-nfsrootfs \
>>>>> +"
>>>>> +
>>>>> +MODULES =3D "\
>>>>> +=C2=A0=C2=A0=C2=A0 kernel-module-cdns-pltfrm \
>>>>> +=C2=A0=C2=A0=C2=A0 kernel-module-ti-j721e-ufs \
>>>>> +=C2=A0=C2=A0=C2=A0 kernel-module-tps6594-i2c \
>>>>> +"
>>>>> +
>>>>> +UTILS =3D "\
>>>>> +=C2=A0=C2=A0=C2=A0 cifs-utils \
>>>>> +=C2=A0=C2=A0=C2=A0 nfs-utils \
>>>>> +=C2=A0=C2=A0=C2=A0 nfs-utils-client \
>>>>> +"
>>>>> +
>>>>> +PACKAGE_INSTALL =3D "\
>>>>> +=C2=A0=C2=A0=C2=A0 ${INITRAMFS_SCRIPTS} \
>>>>> +=C2=A0=C2=A0=C2=A0 ${UTILS} \
>>>>> +=C2=A0=C2=A0=C2=A0 ${MODULES} \
>>>>> +=C2=A0=C2=A0=C2=A0 packagegroup-ti-initrd \
>>>>> +"
>>>>> +
>>>>> +export IMAGE_BASENAME =3D "ti-initrd-image"
>>>>> +
>>>>> +# To further reduce the size of the rootfs, remove the /boot=20
>>>>> directory from
>>>>> +# the final image this is usually done by adding=20
>>>>> RDEPENDS_kernel-base =3D ""
>>>>> +# in the configuration file. In our case we can't use this=20
>>>>> method. Instead we
>>>>> +# just wipe out the content of "/boot" before creating the image.
>>>>> +ROOTFS_POSTPROCESS_COMMAND +=3D "empty_boot_dir; "
>>>>> +empty_boot_dir () {
>>>>> +=C2=A0=C2=A0=C2=A0 rm -rf ${IMAGE_ROOTFS}/boot/*
>>>>> +}
>>>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#19015): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/19015
> Mute This Topic: https://lists.yoctoproject.org/mt/115128108/9997635
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [m-shah@ti.=
com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

