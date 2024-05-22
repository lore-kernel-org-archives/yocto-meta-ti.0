Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95CC7C25B7A
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 13:36:33 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.10280.1716384991069085262
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 May 2024 06:36:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=lXLh4agh;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: c-shilwant@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44MDaTtC127315;
	Wed, 22 May 2024 08:36:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1716384989;
	bh=RWwjbQHKwQPrgPxBlyfjhJkmVl6vOc1cS6FwKFIA3kM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=lXLh4aghFSyb2BfNMH2P49GqqRKSUBxbNYOZq+qcQKL4GxpiP2XasmBAoAXXpL/gY
	 UgN1fp623yLUyX08/vG9RjMnPptwcGEdSxI/7bohPsgekGD1iGpSPvki9l9Gbpl3L1
	 ugF++HNyZURZvPJd5xZnb55+3RvbpnUdp4f04AoU=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44MDaS9t014859
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 22 May 2024 08:36:29 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 22
 May 2024 08:36:28 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 22 May 2024 08:36:28 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44MDaQVS012986;
	Wed, 22 May 2024 08:36:26 -0500
Message-ID: <4baccef5-2db3-4dc8-b22e-598b5ec0f2af@ti.com>
Date: Wed, 22 May 2024 19:06:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH] conf: machine: Update
 UBOOT_MACHINE for am62xx-lp-evm
To: Ryan Eatmon <reatmon@ti.com>, <bb@ti.com>
CC: Denys Dmytriyenko <denis@denix.org>, Gyan Gupta <g-gupta@ti.com>,
        Praneeth
	<praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20240522130057.1346796-1-c-shilwant@ti.com>
 <6b9f0fc1-077d-4d03-a54b-5b72996925dd@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <6b9f0fc1-077d-4d03-a54b-5b72996925dd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 44MDaTtC127315
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 May 2024 13:36:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17673

+ Bryan for providing more details on the u-boot defconfig name change=20
for am62xx-lp-evm

On 22/05/24 18:46, Ryan Eatmon wrote:
>
> This changes make scarthgap and master incompatible with the current=20
> default for uboot...=C2=A0 2024.04 is not the default yet.=C2=A0 Why wa=
s this=20
> change made in uboot?
>
> We cannot accept this change until we default to 2024.04.


Hi Ryan,

How should we plan to enable am62xx-lp-evm scarthgap builds?
Delaying the am62xx-lp-evm builds after ltsprep may not be advisable.


>
>
>
> On 5/22/2024 8:00 AM, Chirag Shilwant wrote:
>> Modify the U-Boot defconfig names for A53 and R5
>> machine configurations based on ti-u-boot-2024.04 [1]
>>
>> [1]:=20
>> https://git.ti.com/cgit/ti-u-boot/ti-u-boot/commit/?h=3Dti-u-boot-2024=
.04&id=3D781b6a4a9ffde2428484d5c061b80e6c192b2049
>>
>> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
>> ---
>> =C2=A0 meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf | 2 +-
>> =C2=A0 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 2 +-
>> =C2=A0 2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf=20
>> b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
>> index 52b69a72..ddcd79c4 100644
>> --- a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
>> +++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
>> @@ -9,4 +9,4 @@ SYSFW_SOC =3D "am62x"
>> =C2=A0 SYSFW_CONFIG =3D "evm"
>> =C2=A0 SYSFW_SUFFIX =3D "hs-fs"
>> =C2=A0 -UBOOT_MACHINE =3D "am62x_lpsk_r5_defconfig"
>> +UBOOT_MACHINE =3D "am62x_lp_sk_r5_defconfig"
>> diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf=20
>> b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
>> index 51e99728..9ffb9898 100644
>> --- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
>> +++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
>> @@ -17,4 +17,4 @@ KERNEL_DEVICETREE =3D " \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am62-lp-sk.dtb \
>> =C2=A0 "
>> =C2=A0 -UBOOT_MACHINE =3D "am62x_lpsk_a53_defconfig"
>> +UBOOT_MACHINE =3D "am62x_lp_sk_a53_defconfig"
>

