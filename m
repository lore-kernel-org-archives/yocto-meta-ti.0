Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7EA1CAC5A0
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 13:46:43 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.14588.1758203195925640205
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 Sep 2025 06:46:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=LLdxww4L;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: afd@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58IDkZVf022128
	for <meta-ti@lists.yoctoproject.org>; Thu, 18 Sep 2025 08:46:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758203195;
	bh=482J9/r0QDb7sRXgepx6KjlisPTQ8FKn0LmtI9l70Ho=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=LLdxww4LQwp+IIwXH190l7hq7Y7yowPX3k0X+QUwM4ptX+S6Pm6OQbpF4z16YVB+d
	 N6buPLsph0nThbgFSZbtM7zc0ya+2XlY0ifAXQhZgVhw1FCBehxoZksgfld0DxMc4J
	 xsMumXuwG+e2BXVUUwheEjM7hiNtrWvbOzjXeitc=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58IDkZjb1587525
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 18 Sep 2025 08:46:35 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 18
 Sep 2025 08:46:34 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 18 Sep 2025 08:46:34 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58IDkYD8961289;
	Thu, 18 Sep 2025 08:46:34 -0500
Message-ID: <d8457238-760a-4dd5-8b9b-a8eaa310ea4b@ti.com>
Date: Thu, 18 Sep 2025 08:46:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master][PATCH 1/2] recipes-ti: initrd: Make minimal
 initrd image
To: <m-shah@ti.com>, <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <vigneshr@ti.com>, <u-kumar1@ti.com>, <a-limaye@ti.com>,
        <n-francis@ti.com>, <praneeth@ti.com>, <jm@ti.com>, <b-padhi@ti.com>
References: <20250908105315.19583-1-m-shah@ti.com>
 <20250908105315.19583-2-m-shah@ti.com>
 <d5b52951-ad23-4a2a-b541-ea20a1b54b81@ti.com>
 <ab3c6b64-cf3a-4274-96ff-a81c47ee727b@ti.com>
 <ccf0bea6-5130-439e-b752-1a6fd413d246@ti.com>
 <653a9707-41a4-486e-a8f0-d02c398831d5@ti.com>
 <11f9f37a-ee40-4b33-ab69-81bcaf2ab07c@ti.com>
 <82a49211-5d1c-4955-b923-2a4b3ab73daa@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <82a49211-5d1c-4955-b923-2a4b3ab73daa@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot03.ext.ti.com id 58IDkZVf022128
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 18 Sep 2025 13:46:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19036

On 9/18/25 12:54 AM, Moteen Shah via lists.yoctoproject.org wrote:
>=20
> On 17/09/25 20:14, Ryan Eatmon via lists.yoctoproject.org wrote:
>>
>>
>> On 9/17/2025 2:58 AM, Moteen Shah wrote:
>>> Hey Ryan,
>>>
>>> On 15/09/25 17:14, Ryan Eatmon wrote:
>>>>
>>>>
>>>> On 9/15/2025 1:12 AM, Moteen Shah wrote:
>>>>> Hey Ryan,
>>>>> Thanks for the detailed review.
>>>>>
>>>>> On 12/09/25 21:42, Ryan Eatmon wrote:
>>>>>>
>>>>>> After some discussion in a call with Denys today, I think we have =
some feedback on what is needed to better leverage this patch idea.
>>>>>>
>>>>>> 1) We need the way to get this image built as part of the build pr=
ocess. =C2=A0The best way to accomplish that will likely be to follow the=
 firmware approach and include it in the MACHINE_ESSENTIAL_EXTRA_RRECOMME=
NDS variable for each platform that requires it.
>>>>>
>>>>> I was planning to do something like:
>>>>>
>>>>> do_rootfs[depends] +=3D "ti-initrd-image:do_image_complete"
>>>>> ROOTFS_POSTPROCESS_COMMAND +=3D "install_initrd_to_boot; "
>>>>> install_initrd_to_boot() {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 install -m 0644 ${DEPLOY_DIR_IMAGE}/initrd=
.cpio ${IMAGE_ROOTFS}/boot/initrd.cpio
>>>>> }
>>>>>
>>>>> in core-image-%.bbappend file to make this image as a part of core =
image build.
>>>>>
>>>>> I will look out for how I can achieve the same with MACHINE_ESSENTI=
AL_EXTRA_RRECOMMENDS.
>>>>>
>>>>> Is the above solution optimal though? Since all of the K3 platforms=
 will be shifting to the initrd flow.
>>>>
>>>> There are more distributions than just poky and arago.=C2=A0 The sol=
ution I suggested will work for all of them and not require anything spec=
ific like your solution.
>>>>
>>>
>>> Understood, I will use MACHINE_ESSENTIAL_EXTRA_RRECOMMEND inside k3.i=
nc, but how should I include the initrd image in the boot directory of th=
e root partition, since initrd itself is an image I cannot use ${IMAGE_RO=
OTFS} inside ti-initrd-image.bb. I did found a way around it https://list=
s.yoctoproject.org/g/yocto/message/47500, not really sure if its the corr=
ect way.
>>
>> Why does the initrd need to be in the rootfs?=C2=A0 The whole point of=
 this initrd is to get the kernel to boot to get to the point of loading =
the rootfs, at which point the initrd has served it's purpose.
>=20
> I was keeping it inside the rootfs to avoid increasing size of the boot=
 partition, grub was able to read/load it from any of the required partit=
ions given in the SD Card. I will put it in the boot partition after incr=
easing its size then in v2.
>=20

Rootfs is the right spot, it should go in the same spot as the other
Linux boot components (kernel and DTB) which we should have in rootfs.

Andrew

> Regards,
> Moteen
>=20
>>
>>
>>> Regards,
>>> Moteen
>>>
>>>>
>>>>>>
>>>>>> 2) We need a better way to specify the list of MODULES rather than=
 hardcoding the list in the recipe.=C2=A0 The list of required modules wi=
ll likely be different for different platforms.
>>>>>>
>>>>>> To that end we recommend creating a new variable that should be de=
fined in the ti-soc.inc:
>>>>>>
>>>>>> =C2=A0 TI_INITRAMFS_KERNEL_MODULES ?=3D ""
>>>>>>
>>>>>> Then in each platform specific .inc file we can set that list to t=
he needed modules based on the ti-bsp need.=C2=A0 Our vendor kernels do n=
ot need it, so it could remain blank, but the mainline/next bsps could se=
t it since those actually create the kernel module packages.
>>>>>>
>>>>>> =C2=A0 TI_INITRAMFS_KERNEL_MODULES:append:bsp-mainline =3D " mod1 =
mod2"
>>>>>> =C2=A0 TI_INITRAMFS_KERNEL_MODULES:append:bsp-next =3D " mod1 mod2=
"
>>>>>>
>>>>>> Then in the ti-initrd-image.bb you would drop the MODULES=3D"" set=
ting and just change to the variable TI_INITRAMFS_KERNEL_MODULES.
>>>>>>
>>>>>> This way, if there are other layers that want to create their own =
initramfs we have a variable in place for them to use to include the requ=
ired modules based on the kernel version that is being built.
>>>>>
>>>>> Seems like a better solution for including the modules, I'll fix it=
 in v2.
>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>> So, I would probably break all of this up into multiple patches. T=
he first patch would the work in #2 above to establish the needed variabl=
e for all platforms.=C2=A0 The next patches are your patches but moving t=
o TI_INITRAMFS_KERNEL_MODULES.=C2=A0 And the final patch would be adding =
your new ti-initrd-image into MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS list fo=
r all platforms.
>>>>>
>>>>> Noted.
>>>>>
>>>>> Regards,
>>>>> Moteen
>>>>>
>>>>>>
>>>>>> Did I miss anything, Denys?
>>>>>>
>>>>>>
>>>>>> On 9/8/2025 5:53 AM, Moteen Shah wrote:
>>>>>>> Introduce a new minimal initramfs image which will be used
>>>>>>> for all K3 devices in the boot flow. The image will package
>>>>>>> boot essential and other modules which will be modprobed by
>>>>>>> initramfs-udev once the inbuilt drivers gets probed.
>>>>>>>
>>>>>>> Signed-off-by: Moteen Shah <m-shah@ti.com>
>>>>>>> ---
>>>>>>> =C2=A0 .../initrd/packagegroup-ti-initrd.bb=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 ++
>>>>>>> =C2=A0 .../recipes-ti/initrd/ti-initrd-image.bb=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 56 +++++++++++++++++++
>>>>>>> =C2=A0 2 files changed, 61 insertions(+)
>>>>>>> =C2=A0 create mode 100644 meta-ti-bsp/recipes-ti/initrd/packagegr=
oup-ti-initrd.bb
>>>>>>> =C2=A0 create mode 100644 meta-ti-bsp/recipes-ti/initrd/ti-initrd=
-image.bb
>>>>>>>
>>>>>>> diff --git a/meta-ti-bsp/recipes-ti/initrd/packagegroup-ti-initrd=
.bb b/meta-ti-bsp/recipes-ti/initrd/packagegroup-ti-initrd.bb
>>>>>>> new file mode 100644
>>>>>>> index 00000000..8847cb2e
>>>>>>> --- /dev/null
>>>>>>> +++ b/meta-ti-bsp/recipes-ti/initrd/packagegroup-ti-initrd.bb
>>>>>>> @@ -0,0 +1,5 @@
>>>>>>> +SUMMARY =3D "Minimal initrd for boot requirements"
>>>>>>> +
>>>>>>> +require recipes-core/packagegroups/packagegroup-core-boot.bb
>>>>>>> +
>>>>>>> +RDEPENDS:${PN}:remove =3D "grub-efi kernel"
>>>>>>> diff --git a/meta-ti-bsp/recipes-ti/initrd/ti-initrd-image.bb b/m=
eta-ti-bsp/recipes-ti/initrd/ti-initrd-image.bb
>>>>>>> new file mode 100644
>>>>>>> index 00000000..f6b99073
>>>>>>> --- /dev/null
>>>>>>> +++ b/meta-ti-bsp/recipes-ti/initrd/ti-initrd-image.bb
>>>>>>> @@ -0,0 +1,56 @@
>>>>>>> +SUMMARY =3D "TI SDK minimal initrd image"
>>>>>>> +
>>>>>>> +DESCRIPTION =3D "Image meant to probe boot essential modules\
>>>>>>> + and other modules to reach the userspace, which cannot be\
>>>>>>> + built inside the upstream linux kernel image.\
>>>>>>> +"
>>>>>>> +
>>>>>>> +LICENSE =3D "MIT"
>>>>>>> +
>>>>>>> +inherit core-image
>>>>>>> +
>>>>>>> +IMAGE_NAME =3D "initrd"
>>>>>>> +
>>>>>>> +IMAGE_NAME_SUFFIX =3D ""
>>>>>>> +
>>>>>>> +IMAGE_FEATURES:remove =3D "package-management"
>>>>>>> +
>>>>>>> +INITRAMFS_FSTYPES =3D "cpio cpio.xz"
>>>>>>> +
>>>>>>> +IMAGE_FSTYPES =3D "${INITRAMFS_FSTYPES}"
>>>>>>> +
>>>>>>> +INITRAMFS_SCRIPTS ?=3D "\
>>>>>>> +=C2=A0=C2=A0=C2=A0 initramfs-framework-base \
>>>>>>> +=C2=A0=C2=A0=C2=A0 initramfs-module-udev \
>>>>>>> +=C2=A0=C2=A0=C2=A0 initramfs-module-nfsrootfs \
>>>>>>> +"
>>>>>>> +
>>>>>>> +MODULES =3D "\
>>>>>>> +=C2=A0=C2=A0=C2=A0 kernel-module-cdns-pltfrm \
>>>>>>> +=C2=A0=C2=A0=C2=A0 kernel-module-ti-j721e-ufs \
>>>>>>> +=C2=A0=C2=A0=C2=A0 kernel-module-tps6594-i2c \
>>>>>>> +"
>>>>>>> +
>>>>>>> +UTILS =3D "\
>>>>>>> +=C2=A0=C2=A0=C2=A0 cifs-utils \
>>>>>>> +=C2=A0=C2=A0=C2=A0 nfs-utils \
>>>>>>> +=C2=A0=C2=A0=C2=A0 nfs-utils-client \
>>>>>>> +"
>>>>>>> +
>>>>>>> +PACKAGE_INSTALL =3D "\
>>>>>>> +=C2=A0=C2=A0=C2=A0 ${INITRAMFS_SCRIPTS} \
>>>>>>> +=C2=A0=C2=A0=C2=A0 ${UTILS} \
>>>>>>> +=C2=A0=C2=A0=C2=A0 ${MODULES} \
>>>>>>> +=C2=A0=C2=A0=C2=A0 packagegroup-ti-initrd \
>>>>>>> +"
>>>>>>> +
>>>>>>> +export IMAGE_BASENAME =3D "ti-initrd-image"
>>>>>>> +
>>>>>>> +# To further reduce the size of the rootfs, remove the /boot dir=
ectory from
>>>>>>> +# the final image this is usually done by adding RDEPENDS_kernel=
-base =3D ""
>>>>>>> +# in the configuration file. In our case we can't use this metho=
d. Instead we
>>>>>>> +# just wipe out the content of "/boot" before creating the image.
>>>>>>> +ROOTFS_POSTPROCESS_COMMAND +=3D "empty_boot_dir; "
>>>>>>> +empty_boot_dir () {
>>>>>>> +=C2=A0=C2=A0=C2=A0 rm -rf ${IMAGE_ROOTFS}/boot/*
>>>>>>> +}
>>>>>>
>>>>
>>
>>
>>
>>
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#19030): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/19030
> Mute This Topic: https://lists.yoctoproject.org/mt/115128108/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com=
]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


