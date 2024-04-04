Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36151CD1292
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 18:55:33 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.855.1712256932471887405
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 04 Apr 2024 11:55:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=Bj8YEi9h;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 434ItUDX101012;
	Thu, 4 Apr 2024 13:55:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1712256930;
	bh=LMJ2Of7ajUwhWtv1agpSZIOx+X/GSp9t/jc6XXfad00=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=Bj8YEi9hNUdGrlW939aelFv4eTbU6OrcjI/dUd9mOjXfH5t+MtzfvGMM+8vQFn4m7
	 rFaGSTVOcqsezzL1J1+gEY8OuTKumyxZbMP1RXsV8460mMkxzgaEDmbdH6bOj7/Ry6
	 r8e0Uj3VosPSPK26n6FfD45s0JWQqbd7v+E4qxwQ=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 434ItUPn075000
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 4 Apr 2024 13:55:30 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 4
 Apr 2024 13:55:30 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 4 Apr 2024 13:55:30 -0500
Received: from [128.247.81.69] (dtmxl9433pnr.dhcp.ti.com [128.247.81.69])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 434ItUrj089429;
	Thu, 4 Apr 2024 13:55:30 -0500
Message-ID: <48f63bdc-c013-45b4-9f68-0adcb3184d50@ti.com>
Date: Thu, 4 Apr 2024 13:55:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH] conf: machine:
 beagleplay/beaglebone-ai64: Set KERNEL_DEVICETREE_PREFIX
To: "Bajjuri, Praneeth" <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20240404133732.32477-1-reatmon@ti.com>
 <3e20c882-6491-472f-8c8a-ced27e4be65e@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <3e20c882-6491-472f-8c8a-ced27e4be65e@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 434ItUDX101012
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 04 Apr 2024 18:55:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17560



On 4/4/2024 1:42 PM, Bajjuri, Praneeth wrote:
>=20
>=20
> On 4/4/2024 8:37 AM, Ryan Eatmon wrote:
>> Set the KERNEL_DEVICETREE_PREFIX so that, when using the various TI
>> kernel recipes, the "correct" DTB files are pulled in depending on wha=
t
>> is available in that kernel source.
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>> =C2=A0 meta-ti-bsp/conf/machine/beaglebone-ai64.conf | 4 ++++
>> =C2=A0 meta-ti-bsp/conf/machine/beagleplay.conf=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 5 +++++
>> =C2=A0 2 files changed, 9 insertions(+)
>>
>> diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf=20
>> b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
>> index 8ec52bba..a9be4d13 100644
>> --- a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
>> +++ b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
>> @@ -13,6 +13,10 @@ UBOOT_MACHINE =3D "j721e_evm_a72_config"
>> =C2=A0 # under meta-ti-bsp/recipes-bsp/u-boot/ for more details.
>> =C2=A0 UBOOT_CONFIG_FRAGMENTS =3D "j721e_beagleboneai64_a72.config"
>> +KERNEL_DEVICETREE_PREFIX =3D " \
>> +=C2=A0=C2=A0=C2=A0 ti/k3-j721e \
>> +"
>> +
>> =C2=A0 KERNEL_DEVICETREE =3D " \
>> =C2=A0 ti/k3-j721e-beagleboneai64.dtb \
>> =C2=A0 ti/k3-j721e-common-proc-board.dtb \
>=20
>=20
> Can we remove these overlays now ?

These are from the beagle kernel, not ours.


>=20
> ti/k3-j721e-beagleboneai64-dsi-rpi-7inch-panel.dtbo \
> ti/k3-j721e-evm-csi2-ov5640.dtbo \
> ti/k3-j721e-evm-fusion.dtbo \
> ti/k3-j721e-evm-gesi-exp-board.dtbo \
> ti/k3-j721e-evm-pcie0-ep.dtbo \
> ti/k3-j721e-evm-quad-port-eth-exp.dtbo \
> ti/k3-j721e-evm-virt-mac-client.dtbo \
> ti/k3-j721e-sk-csi2-ov5640.dtbo \
> ti/k3-j721e-sk-csi2-rpi-imx219.dtbo \
> ti/k3-j721e-sk-fusion.dtbo \
> ti/k3-j721e-sk-rpi-hdr-ehrpwm.dtbo \
>=20
>=20
>> diff --git a/meta-ti-bsp/conf/machine/beagleplay.conf=20
>> b/meta-ti-bsp/conf/machine/beagleplay.conf
>> index 75e62afd..65c14333 100644
>> --- a/meta-ti-bsp/conf/machine/beagleplay.conf
>> +++ b/meta-ti-bsp/conf/machine/beagleplay.conf
>> @@ -28,6 +28,11 @@ UBOOT_CONFIG_FRAGMENTS =3D "am625_beagleplay_a53.co=
nfig"
>> =C2=A0 PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-bb.org"
>> =C2=A0 PREFERRED_PROVIDER_u-boot =3D "u-boot-bb.org"
>> +KERNEL_DEVICETREE_PREFIX =3D " \
>> +=C2=A0=C2=A0=C2=A0 ti/k3-am625 \
>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk \
>> +"
>> +
>> =C2=A0 KERNEL_DEVICETREE =3D " \
>> =C2=A0 ti/k3-am625-beagleplay.dtb \
>> =C2=A0 ti/k3-am625-beagleplay-csi2-ov5640.dtbo \
>=20
> similar here. Can we remove the following overlays
>=20
> ti/k3-am625-beagleplay-csi2-ov5640.dtbo \
> ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtbo \
> ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtbo \
> ti/k3-am625-sk-dmtimer-pwm.dtbo \
> ti/k3-am625-sk-ecap-capture.dtbo \
> ti/k3-am625-sk-lincolntech-lcd185-panel.dtbo \
> ti/k3-am625-sk-mcspi-loopback.dtbo \
> ti/k3-am625-sk-microtips-mf101hie-panel.dtbo \
> ti/k3-am625-sk-microtips-mf103hie-lcd2.dtbo \
> ti/k3-am625-sk-pwm.dtbo \
> ti/k3-am625-sk-rpi-hdr-ehrpwm.dtbo \
> ti/k3-am62x-sk-csi2-imx219.dtbo \
> ti/k3-am62x-sk-csi2-ov5640.dtbo \
> ti/k3-am62x-sk-csi2-tevi-ov5640.dtbo \
> ti/k3-am62x-sk-csi2-v3link-fusion.dtbo \
> ti/k3-am62x-sk-eqep.dtbo \
> ti/k3-am62x-sk-hdmi-audio.dtbo \
> ti/k3-am62x-sk-lpm-wkup-sources.dtbo \
> ti/k3-am62x-sk-mcan.dtbo \

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

