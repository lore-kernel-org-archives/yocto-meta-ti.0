Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C03DDCAC58E
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 06:13:04 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.26060.1757916780652220643
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 14 Sep 2025 23:13:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=bc6WHQNV;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: m-shah@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58F6D090980734
	for <meta-ti@lists.yoctoproject.org>; Mon, 15 Sep 2025 01:13:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757916780;
	bh=f/X3PkstycDNcBTSPRuamxi4GibLd6iiT1YN+sSzOTM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=bc6WHQNVjhAFqI3WDyaucS1ptutGofVMi3qhuiNcqXhWtKCb+F5Gg450ERzY7SlAv
	 zNqn4Fo91h+DyXVV19ur7MVAEROXD0cbiouPVbp/XwJYJ7y6GkE9SId1DXUld0Cx4B
	 F2TjeP4trOD3jx+AdBmIMV9dLNQEXL8zFEVZPwN0=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58F6CxWw525743
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 15 Sep 2025 01:12:59 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 15
 Sep 2025 01:12:59 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 15 Sep 2025 01:12:59 -0500
Received: from [10.24.72.162] (moteen-ubuntu-desk.dhcp.ti.com [10.24.72.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58F6Cux83254204;
	Mon, 15 Sep 2025 01:12:56 -0500
Message-ID: <ab3c6b64-cf3a-4274-96ff-a81c47ee727b@ti.com>
Date: Mon, 15 Sep 2025 11:42:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master][PATCH 1/2] recipes-ti: initrd: Make minimal initrd image
To: Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <vigneshr@ti.com>, <u-kumar1@ti.com>, <a-limaye@ti.com>,
        <n-francis@ti.com>, <praneeth@ti.com>, <jm@ti.com>, <b-padhi@ti.com>
References: <20250908105315.19583-1-m-shah@ti.com>
 <20250908105315.19583-2-m-shah@ti.com>
 <d5b52951-ad23-4a2a-b541-ea20a1b54b81@ti.com>
Content-Language: en-US
From: Moteen Shah <m-shah@ti.com>
In-Reply-To: <d5b52951-ad23-4a2a-b541-ea20a1b54b81@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot03.ext.ti.com id 58F6D090980734
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 15 Sep 2025 06:13:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19010

Hey Ryan,
Thanks for the detailed review.

On 12/09/25 21:42, Ryan Eatmon wrote:
>
> After some discussion in a call with Denys today, I think we have some=20
> feedback on what is needed to better leverage this patch idea.
>
> 1) We need the way to get this image built as part of the build=20
> process. =C2=A0The best way to accomplish that will likely be to follow=
 the=20
> firmware approach and include it in the=20
> MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS variable for each platform that=20
> requires it.

I was planning to do something like:

do_rootfs[depends] +=3D "ti-initrd-image:do_image_complete"
ROOTFS_POSTPROCESS_COMMAND +=3D "install_initrd_to_boot; "
install_initrd_to_boot() {
 =C2=A0=C2=A0=C2=A0 install -m 0644 ${DEPLOY_DIR_IMAGE}/initrd.cpio=20
${IMAGE_ROOTFS}/boot/initrd.cpio
}

in core-image-%.bbappend file to make this image as a part of core image=20
build.

I will look out for how I can achieve the same with=20
MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS.

Is the above solution optimal though? Since all of the K3 platforms will=20
be shifting to the initrd flow.

>
> 2) We need a better way to specify the list of MODULES rather than=20
> hardcoding the list in the recipe.=C2=A0 The list of required modules w=
ill=20
> likely be different for different platforms.
>
> To that end we recommend creating a new variable that should be=20
> defined in the ti-soc.inc:
>
> =C2=A0 TI_INITRAMFS_KERNEL_MODULES ?=3D ""
>
> Then in each platform specific .inc file we can set that list to the=20
> needed modules based on the ti-bsp need.=C2=A0 Our vendor kernels do no=
t=20
> need it, so it could remain blank, but the mainline/next bsps could=20
> set it since those actually create the kernel module packages.
>
> =C2=A0 TI_INITRAMFS_KERNEL_MODULES:append:bsp-mainline =3D " mod1 mod2"
> =C2=A0 TI_INITRAMFS_KERNEL_MODULES:append:bsp-next =3D " mod1 mod2"
>
> Then in the ti-initrd-image.bb you would drop the MODULES=3D"" setting=20
> and just change to the variable TI_INITRAMFS_KERNEL_MODULES.
>
> This way, if there are other layers that want to create their own=20
> initramfs we have a variable in place for them to use to include the=20
> required modules based on the kernel version that is being built.

Seems like a better solution for including the modules, I'll fix it in v2.

>
>
>
> So, I would probably break all of this up into multiple patches. The=20
> first patch would the work in #2 above to establish the needed=20
> variable for all platforms.=C2=A0 The next patches are your patches but=
=20
> moving to TI_INITRAMFS_KERNEL_MODULES.=C2=A0 And the final patch would =
be=20
> adding your new ti-initrd-image into=20
> MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS list for all platforms.

Noted.

Regards,
Moteen

>
> Did I miss anything, Denys?
>
>
> On 9/8/2025 5:53 AM, Moteen Shah wrote:
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
=C2=A0 | 56 +++++++++++++++++++
>> =C2=A0 2 files changed, 61 insertions(+)
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
>> @@ -0,0 +1,5 @@
>> +SUMMARY =3D "Minimal initrd for boot requirements"
>> +
>> +require recipes-core/packagegroups/packagegroup-core-boot.bb
>> +
>> +RDEPENDS:${PN}:remove =3D "grub-efi kernel"
>> diff --git a/meta-ti-bsp/recipes-ti/initrd/ti-initrd-image.bb=20
>> b/meta-ti-bsp/recipes-ti/initrd/ti-initrd-image.bb
>> new file mode 100644
>> index 00000000..f6b99073
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-ti/initrd/ti-initrd-image.bb
>> @@ -0,0 +1,56 @@
>> +SUMMARY =3D "TI SDK minimal initrd image"
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
>> +
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
>> +MODULES =3D "\
>> +=C2=A0=C2=A0=C2=A0 kernel-module-cdns-pltfrm \
>> +=C2=A0=C2=A0=C2=A0 kernel-module-ti-j721e-ufs \
>> +=C2=A0=C2=A0=C2=A0 kernel-module-tps6594-i2c \
>> +"
>> +
>> +UTILS =3D "\
>> +=C2=A0=C2=A0=C2=A0 cifs-utils \
>> +=C2=A0=C2=A0=C2=A0 nfs-utils \
>> +=C2=A0=C2=A0=C2=A0 nfs-utils-client \
>> +"
>> +
>> +PACKAGE_INSTALL =3D "\
>> +=C2=A0=C2=A0=C2=A0 ${INITRAMFS_SCRIPTS} \
>> +=C2=A0=C2=A0=C2=A0 ${UTILS} \
>> +=C2=A0=C2=A0=C2=A0 ${MODULES} \
>> +=C2=A0=C2=A0=C2=A0 packagegroup-ti-initrd \
>> +"
>> +
>> +export IMAGE_BASENAME =3D "ti-initrd-image"
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

