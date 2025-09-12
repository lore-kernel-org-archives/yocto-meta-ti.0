Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B332CAC582
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 16:28:27 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.21324.1757694499522331020
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 12 Sep 2025 09:28:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=qxkRg8cn;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: afd@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58CGSIoO1069761;
	Fri, 12 Sep 2025 11:28:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757694498;
	bh=4WGXuBAIcxLsyyYef9Tx2HW6Fbd7VKlOwbTzuRfxzmM=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=qxkRg8cnE2rW99EoZo/evOgXm2o3/HvynZMu6gNBE4cShA5lmaEeJBj+0cBo4JC3m
	 G1lrYLmwuseeal1NXj6aFrlURUDcMWS/6kSY2FvkWIfJl2vExmRD0Tyqwqrue9qrfE
	 lhOApBqHLVtW3jzxwjXTkt6/7aY+QHff+gOL3HqM=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58CGSIR11979960
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 12 Sep 2025 11:28:18 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 12
 Sep 2025 11:28:17 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 12 Sep 2025 11:28:17 -0500
Received: from [10.250.32.255] ([10.250.32.255])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58CGSHDR4179027;
	Fri, 12 Sep 2025 11:28:17 -0500
Message-ID: <f01b69fa-f0cc-4ca8-9408-b603cca9eaae@ti.com>
Date: Fri, 12 Sep 2025 11:28:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][RFC 3/6] ti-bsp: Use same version for both
 UM and KM driver
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        Randolph Sapp <rs@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20250909151028.272925-1-afd@ti.com>
 <20250909151028.272925-3-afd@ti.com>
 <fd0d9488-7d3d-42d5-8c06-abeca2e6c7c0@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <fd0d9488-7d3d-42d5-8c06-abeca2e6c7c0@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot02.ext.ti.com id 58CGSIoO1069761
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 12 Sep 2025 16:28:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19006

On 9/9/25 3:42 PM, Ryan Eatmon wrote:
>=20
>=20
> On 9/9/2025 10:10 AM, Andrew Davis wrote:
>> The DRIVER and matching UMLIBS must always match, no need to define a
>> version number for both. Keep this simple and remove the extra defines.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>> =C2=A0 meta-beagle/conf/machine/include/beagle-bsp.inc |=C2=A0 4 ----
>> =C2=A0 meta-ti-bsp/conf/machine/include/ti-bsp.inc=C2=A0=C2=A0=C2=A0=C2=
=A0 | 10 ++--------
>> =C2=A0 2 files changed, 2 insertions(+), 12 deletions(-)
>>
>> diff --git a/meta-beagle/conf/machine/include/beagle-bsp.inc b/meta-be=
agle/conf/machine/include/beagle-bsp.inc
>> index d180c297..448e2086 100644
>> --- a/meta-beagle/conf/machine/include/beagle-bsp.inc
>> +++ b/meta-beagle/conf/machine/include/beagle-bsp.inc
>> @@ -18,10 +18,8 @@ KERNEL_DEVICETREE_PREFIX:bsp-bb_org-6_12 =3D ""
>> =C2=A0 BSP_SGX_DRIVER_PROVIDER:bsp-bb_org-6_12 =3D "ti-sgx-ddk-km"
>> =C2=A0 BSP_SGX_DRIVER_VERSION:bsp-bb_org-6_12 =3D "1.17%"
>> -BSP_SGX_UMLIBS_VERSION:bsp-bb_org-6_12 =3D "1.17%"
>> =C2=A0 BSP_ROGUE_DRIVER_PROVIDER:bsp-bb_org-6_12 =3D "ti-img-rogue-dri=
ver"
>> =C2=A0 BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_12 =3D "24%"
>> -BSP_ROGUE_UMLIBS_VERSION:bsp-bb_org-6_12 =3D "24%"
>> =C2=A0 BSP_MESA_PVR_VERSION:bsp-bb_org-6_12 =3D "24%"
>> =C2=A0 # GC320 support requires out-of-tree drivers not yet available =
in bb.org 6.12
>> @@ -41,10 +39,8 @@ KERNEL_DEVICETREE_PREFIX:bsp-bb_org-6_6 =3D ""
>> =C2=A0 BSP_SGX_DRIVER_PROVIDER:bsp-bb_org-6_6 =3D "ti-sgx-ddk-km"
>> =C2=A0 BSP_SGX_DRIVER_VERSION:bsp-bb_org-6_6 =3D "1.17%"
>> -BSP_SGX_UMLIBS_VERSION:bsp-bb_org-6_6 =3D "1.17%"
>> =C2=A0 BSP_ROGUE_DRIVER_PROVIDER:bsp-bb_org-6_6 =3D "ti-img-rogue-driv=
er"
>> =C2=A0 BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_6 =3D "24%"
>> -BSP_ROGUE_UMLIBS_VERSION:bsp-bb_org-6_6 =3D "24%"
>> =C2=A0 BSP_MESA_PVR_VERSION:bsp-bb_org-6_6 =3D "24%"
>> =C2=A0 # GC320 support requires out-of-tree drivers not yet available =
in bb.org 6.6
>> diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp=
/conf/machine/include/ti-bsp.inc
>> index a5d9a51f..dc0473de 100644
>> --- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
>> +++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
>> @@ -44,10 +44,8 @@ BSP_BOOTLOADER_VERSION:bsp-ti-6_12 =3D "2025.01%"
>> =C2=A0 BSP_SGX_DRIVER_PROVIDER:bsp-ti-6_12 =3D "ti-sgx-ddk-km"
>> =C2=A0 BSP_SGX_DRIVER_VERSION:bsp-ti-6_12 =3D "1.17%"
>> -BSP_SGX_UMLIBS_VERSION:bsp-ti-6_12 =3D "1.17%"
>> =C2=A0 BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_12 =3D "ti-img-rogue-driver"
>> =C2=A0 BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_12 =3D "24%"
>> -BSP_ROGUE_UMLIBS_VERSION:bsp-ti-6_12 =3D "24%"
>> =C2=A0 BSP_MESA_PVR_VERSION:bsp-ti-6_12 =3D "24%"
>> =C2=A0 # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> @@ -61,10 +59,8 @@ BSP_BOOTLOADER_VERSION:bsp-ti-6_6 =3D "2024.04%"
>> =C2=A0 BSP_SGX_DRIVER_PROVIDER:bsp-ti-6_6 =3D "ti-sgx-ddk-km"
>> =C2=A0 BSP_SGX_DRIVER_VERSION:bsp-ti-6_6 =3D "1.17%"
>> -BSP_SGX_UMLIBS_VERSION:bsp-ti-6_6 =3D "1.17%"
>> =C2=A0 BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_6 =3D "ti-img-rogue-driver"
>> =C2=A0 BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_6 =3D "24%"
>> -BSP_ROGUE_UMLIBS_VERSION:bsp-ti-6_6 =3D "24%"
>> =C2=A0 BSP_MESA_PVR_VERSION:bsp-ti-6_6 =3D "24%"
>> =C2=A0 # GC320 support requires out-of-tree drivers not yet available =
in 6.6
>> @@ -84,8 +80,6 @@ BSP_SGX_DRIVER_PROVIDER ?=3D ""
>> =C2=A0 BSP_SGX_DRIVER_VERSION ?=3D ""
>> =C2=A0 BSP_ROGUE_DRIVER_PROVIDER ?=3D ""
>> =C2=A0 BSP_ROGUE_DRIVER_VERSION ?=3D ""
>> -BSP_SGX_UMLIBS_VERSION ?=3D ""
>> -BSP_ROGUE_UMLIBS_VERSION ?=3D ""
>> =C2=A0 BSP_MESA_PVR_VERSION ?=3D ""
>> =C2=A0 # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> @@ -101,7 +95,7 @@ PREFERRED_VERSION_${BSP_BOOTLOADER_PROVIDER} ?=3D "=
${BSP_BOOTLOADER_VERSION}"
>> =C2=A0 # GPU provider gets set in machine configs, as some machines ar=
e headless
>> =C2=A0 # Select default preferred versions here
>> =C2=A0 PREFERRED_VERSION_ti-sgx-ddk-km ?=3D "${BSP_SGX_DRIVER_VERSION}=
"
>> -PREFERRED_VERSION_ti-sgx-ddk-um ?=3D "${BSP_SGX_UMLIBS_VERSION}"
>> +PREFERRED_VERSION_ti-sgx-ddk-um ?=3D "${BSP_SGX_DRIVER_VERSION}"
>=20
> Since we are simplifying, do we want to take it further and rename the =
XXX_DRIVER_VERSION to just XXX_VERSION?
>=20
> BSP_ROGUE_DRIVER_VERSION -> BSP_ROGUE_VERSION
> BSP_SGX_DRIVER_VERSION -> BSP_SGX_VERSION

My only worry would be to me this looks like it should contain the
version of the GPU itself. Including "driver" makes it clear this
is for the SW version. No huge preference either way.

Andrew

>=20
>> =C2=A0 PREFERRED_VERSION_ti-img-rogue-driver ?=3D "${BSP_ROGUE_DRIVER_=
VERSION}"
>> -PREFERRED_VERSION_ti-img-rogue-umlibs ?=3D "${BSP_ROGUE_UMLIBS_VERSIO=
N}"
>> +PREFERRED_VERSION_ti-img-rogue-umlibs ?=3D "${BSP_ROGUE_DRIVER_VERSIO=
N}"
>> =C2=A0 PREFERRED_VERSION_mesa-pvr ?=3D "${BSP_MESA_PVR_VERSION}"
>=20


