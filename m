Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06BC4C282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 19:49:17 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.4591.1742327355349290162
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 18 Mar 2025 12:49:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=tfJR6wk+;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52IJn5Qw2722767
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Mar 2025 14:49:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742327345;
	bh=3kZa1v+0bOUY4wHJrIVE3juqKKebe+D7G60lUX0hmrw=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=tfJR6wk+Tm+3TnYbRJRBzVeJG7Qrj7qXuN+4RQn8PwUa4/O9++2PW6uTCM/mM4znd
	 w8YMj8cReNKqKqmdo+rg5zKfXQeW7EhnNr+d0nGQYgXvYE9ezGfTFYgPDNNT25incI
	 bU5wt3y4DA8CV0GWb6cHesG6ysM+TPqyoMD4hYdQ=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52IJn5XV059620
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 18 Mar 2025 14:49:05 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 18
 Mar 2025 14:49:05 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 18 Mar 2025 14:49:05 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52IJn5nr052745;
	Tue, 18 Mar 2025 14:49:05 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 18 Mar 2025 14:49:05 -0500
Message-ID: <D8JNHWJT52ZV.3PUFIM5MHPPES@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <oss@ew.tq-group.com>
Subject: Re: [meta-ti] [scarthgap/master][PATCH] ti-sgx-ddk-km: work around
 incorrect target name selection
From: Randolph Sapp <rs@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, <matthias.schiffer@ew.tq-group.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250306141217.346689-1-matthias.schiffer@ew.tq-group.com>
 <20250314214144.GG23729@denix.org>
In-Reply-To: <20250314214144.GG23729@denix.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 18 Mar 2025 19:49:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18402

On Fri Mar 14, 2025 at 4:41 PM CDT, Denys Dmytriyenko wrote:
> + Randolph Sapp as a domain expert here
>
>
> On Thu, Mar 06, 2025 at 03:12:17PM +0100, Matthias Schiffer via lists.yoc=
toproject.org wrote:
>> The omap5-sgx-ddk-linux Makefiles contain a list of target triple
>> patterns that are detected as "Yocto" to deal with arm vs. armhf target
>> selection. This breaks for Yocto distros that override TARGET_VENDOR,
>> requiring patches like [1]; similar patches can also be found in other
>> vendors' machine layers.
>>=20
>> Work around the incorrect target selection by passing TARGET_PRIMARY_ARC=
H
>> via EXTRA_OEMAKE.
>>=20
>> [1] https://github.com/tq-systems/meta-tq/blob/scarthgap.TQ.ARM.BSP.0003=
/meta-tq/dynamic-layers/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-=
km/linux-5.10/0001-ti-sgx-ddk-km-properly-handle-more-OE-YP-compiler-pr.pat=
ch
>>=20
>> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
>> ---
>>=20
>> Tested with meta-tq + meta-ti scarthgap for am335x.
>>=20
>>  .../powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb     | 11 +++++------
>>  1 file changed, 5 insertions(+), 6 deletions(-)
>>=20
>> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.=
4948957.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.494=
8957.bb
>> index 49376221..aaeee1d2 100644
>> --- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957=
.bb
>> +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957=
.bb
>> @@ -28,8 +28,11 @@ TARGET_PRODUCT:am65xx =3D "ti654x_linux"
>>  PVR_BUILD =3D "release"
>>  PVR_WS =3D "lws-generic"
>> =20
>> +TARGET_PRIMARY_ARCH =3D "target_armhf"
>> +TARGET_PRIMARY_ARCH:aarch64 =3D "target_aarch64"
>> +
>>  EXTRA_OEMAKE +=3D 'KERNELDIR=3D"${STAGING_KERNEL_DIR}" BUILD=3D${PVR_BU=
ILD} \
>> -WINDOW_SYSTEM=3D${PVR_WS} PVR_BUILD_DIR=3D${TARGET_PRODUCT}'
>> +WINDOW_SYSTEM=3D${PVR_WS} PVR_BUILD_DIR=3D${TARGET_PRODUCT} TARGET_PRIM=
ARY_ARCH=3D${TARGET_PRIMARY_ARCH}'
>> =20
>>  # There are useful flags here that are interpreted by the final kbuild =
pass
>>  # These variables are not necessary when compiling outside of Yocto
>> @@ -40,11 +43,7 @@ export KERNEL_OBJCOPY
>>  export KERNEL_STRIP
>> =20
>>  do_install() {
>> -    make -C ${STAGING_KERNEL_DIR} M=3D${B}/eurasiacon/binary_${TARGET_P=
RODUCT}_${PVR_WS}_${PVR_BUILD}/target_armhf/kbuild INSTALL_MOD_PATH=3D${D}$=
{root_prefix} PREFIX=3D${STAGING_DIR_HOST} modules_install
>> -}
>> -
>> -do_install:am65xx() {
>> -    make -C ${STAGING_KERNEL_DIR} M=3D${B}/eurasiacon/binary_${TARGET_P=
RODUCT}_${PVR_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=3D${D=
}${root_prefix} PREFIX=3D${STAGING_DIR_HOST} modules_install
>> +    make -C ${STAGING_KERNEL_DIR} M=3D${B}/eurasiacon/binary_${TARGET_P=
RODUCT}_${PVR_WS}_${PVR_BUILD}/${TARGET_PRIMARY_ARCH}/kbuild INSTALL_MOD_PA=
TH=3D${D}${root_prefix} PREFIX=3D${STAGING_DIR_HOST} modules_install
>>  }
>> =20
>>  RRECOMMENDS:${PN} +=3D "ti-sgx-ddk-um"

NAK, in my opinion this should not be handled by the Yocto recipe and inste=
ad
the compiler patterns need to be updated to properly match the given compil=
er.
I'll update the source repo and this recipe to resolve the issue outlined a=
bove.

