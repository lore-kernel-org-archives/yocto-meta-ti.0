Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CE6DC4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 16:59:08 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.19820.1699462741711541264
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Nov 2023 08:59:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=Tc+12ZtC;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A8Gx16U104563
	for <meta-ti@lists.yoctoproject.org>; Wed, 8 Nov 2023 10:59:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1699462741;
	bh=OtIOiLCYaacWFGel1FqOIV7bbacssjMvDiFY7HpV7k8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Tc+12ZtCBr1eVRLlXzW53vwBxFZhG7JVCAOWg0//2P57m2DbsvH9y9cKfHHVnro0s
	 pUZOKMX/8ThciWf2LKd4KAlEn8VRxZoDQK9lQIUlszVmvtp25QYesuiHODrINsr/kf
	 dzYqUav714ZrBGUM8tbyGb/ixfLF3cihBaoLPoeA=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A8Gx13x052784
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 8 Nov 2023 10:59:01 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 Nov 2023 10:59:00 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 Nov 2023 10:59:00 -0600
Received: from [128.247.81.69] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A8Gx0nA112801;
	Wed, 8 Nov 2023 10:59:00 -0600
Message-ID: <0f8f2d4b-8c42-45a0-b470-1c3952b8c9c8@ti.com>
Date: Wed, 8 Nov 2023 10:59:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kirkstone PATCH v2] conf: machine: am62*: extend picking common
 overlays by prefix
Content-Language: en-US
To: Judith Mendez <jm@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Jai Luthra <j-luthra@ti.com>
References: <20231108160437.15536-1-praneeth@ti.com>
 <9c519c91-6f8e-450a-b0d3-b37194eb63a2@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <9c519c91-6f8e-450a-b0d3-b37194eb63a2@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 3A8Gx16U104563
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Nov 2023 16:59:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17280



On 11/8/2023 10:43 AM, Judith Mendez wrote:
> Hi Praneeth,
>=20
> On 11/8/23 10:04 AM, Praneeth Bajjuri wrote:
>> commit f5851386 ("conf: machine: am62*: Pick common overlays by prefix=
")
>> picks common HDMI and CSI overlays for am62 platform variants.
>>
>> Adding capability to extend the same prefix for common overlays for=20
>> applicable
>> am62 platforms in more generic way to include new mcan overlays added =
[1]
>>
>> [1]:=20
>> https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?&id=3D=
3b01c392627f
>>
>> given the differences in SK-AM62-LP containing=C2=A0 B2B HDMI Samtec=20
>> connector,
>> just added the kernel prefix to pick common mcan overlay.
>>
>> for am62pxx: It has 4 MCANs vs all other am62xx devices have 3 MCANs,
>> hence keeping this prefix seperate for am62pxx to pick right overlay.
>>
>> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
>> ---
>> v2: updated am62xxsip conf and updated for am62pxx to pick different
>> mcan overlay
>>
>> =C2=A0 meta-ti-bsp/conf/machine/am62axx-evm.conf=C2=A0=C2=A0 | 3 +--
>> =C2=A0 meta-ti-bsp/conf/machine/am62xx-evm.conf=C2=A0=C2=A0=C2=A0 | 3 =
+--
>> =C2=A0 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf | 1 +
>> =C2=A0 meta-ti-bsp/conf/machine/am62xxsip-evm.conf | 4 ++--
>> =C2=A0 4 files changed, 5 insertions(+), 6 deletions(-)
>>
>> diff --git a/meta-ti-bsp/conf/machine/am62axx-evm.conf=20
>> b/meta-ti-bsp/conf/machine/am62axx-evm.conf
>> index ef60e9d1..22f61401 100644
>> --- a/meta-ti-bsp/conf/machine/am62axx-evm.conf
>> +++ b/meta-ti-bsp/conf/machine/am62axx-evm.conf
>> @@ -6,8 +6,7 @@ require conf/machine/include/am62axx.inc
>> =C2=A0 KERNEL_DEVICETREE_PREFIX =3D " \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am62a7 \
>> -=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-csi2 \
>> -=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-hdmi \
>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-fpdlink \
>> =C2=A0 "
>> diff --git a/meta-ti-bsp/conf/machine/am62xx-evm.conf=20
>> b/meta-ti-bsp/conf/machine/am62xx-evm.conf
>> index b60ba156..fadbc6f4 100644
>> --- a/meta-ti-bsp/conf/machine/am62xx-evm.conf
>> +++ b/meta-ti-bsp/conf/machine/am62xx-evm.conf
>> @@ -7,8 +7,7 @@ require conf/machine/include/ti-extras.inc
>> =C2=A0 KERNEL_DEVICETREE_PREFIX =3D " \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am625 \
>> -=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-csi2 \
>> -=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-hdmi \
>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk \
>> =C2=A0 "
>> =C2=A0 KERNEL_DEVICETREE =3D " \
>> diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf=20
>> b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
>> index 0d2f89ca..afa5e061 100644
>> --- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
>> +++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
>> @@ -8,6 +8,7 @@ KERNEL_DEVICETREE_PREFIX =3D " \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am62-lp \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am625-sk \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-hdmi \
>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-mcan \
>> =C2=A0 "
>=20
> This change is not required for 62 LP. MCAN overlay is
> already included here:
>=20
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am625-sk \

Are you sure?

ti/k3-am625-sk !=3D ti/k3-am62x-sk

5 versus x



>> =C2=A0 KERNEL_DEVICETREE =3D " \
>> diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf=20
>> b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
>> index b3bda44a..cae58afe 100644
>> --- a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
>> +++ b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
>> @@ -6,8 +6,8 @@ require conf/machine/include/am62xx.inc
>> =C2=A0 KERNEL_DEVICETREE_PREFIX =3D " \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am625 \
>> -=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-csi2 \
>> -=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-hdmi \
>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk \
>> +
>> =C2=A0 "
>> =C2=A0 KERNEL_DEVICETREE =3D " \
>=20
> ~ Judith

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

