Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1217FC3DA4A
	for <webhook@archiver.kernel.org>; Wed, 14 Aug 2024 21:16:04 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.109382.1723670161356514901
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 14 Aug 2024 14:16:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=vNwQNXjz;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47ELG02V098560;
	Wed, 14 Aug 2024 16:16:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1723670160;
	bh=1UWO/tvYrghiOYH+tCwZqx80xb8bwbeDpFAa9jVNUog=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=vNwQNXjz23yzTvLgchMQ3VdGkeOMyZEpWpoIL0esL+9UwSrgQpTZ2J3GwCK7ke2KE
	 z1vUbTyi83zOJloK6cTl5I18j2CjZPq6mvFa+Q1jo4A5bkGqr9AUNdYg+5UGSpRr8U
	 vKil5HEeO1VdDBEdgQoJ32Pmv8c5FjlUSrPTbhHc=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47ELG0Gx018280
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 14 Aug 2024 16:16:00 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 Aug 2024 16:15:59 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 Aug 2024 16:15:59 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47ELFvD3084471;
	Wed, 14 Aug 2024 16:15:57 -0500
Message-ID: <1f022884-f6fe-4537-a4a2-f7583ace8947@ti.com>
Date: Thu, 15 Aug 2024 02:45:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][RFC] conf: machine: am62xx-unified:
 Create new common am62xx machine
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Gyan Gupta <g-gupta@ti.com>, Sai Sree Kartheek Adivi <s-adivi@ti.com>,
        "Raghavendra, Vignesh" <vigneshr@ti.com>, Khasim <khasim@ti.com>
References: <20240808192718.14154-1-reatmon@ti.com>
 <11f3d6f8-79e2-48cc-825e-3a05fe6a5050@ti.com>
 <17EBAE4BFE99D30B.10903@lists.yoctoproject.org>
 <982de64d-2196-45cd-9532-bb43e8f40609@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <982de64d-2196-45cd-9532-bb43e8f40609@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 47ELG02V098560
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 14 Aug 2024 21:16:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17939

On 15/08/24 00:53, Ryan Eatmon wrote:
>
>
> On 8/14/2024 2:15 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
>>
>>
>> On 8/14/2024 1:09 PM, Chirag Shilwant wrote:
>>> Hi Ryan & Denys,
>>> On 09/08/24 00:57, Ryan Eatmon via lists.yoctoproject.org wrote:
>>>> To reduce the number of required builds for testing purposes,=20
>>>> create a common unified am62xx machine target that can produce all=20
>>>> of the files for all of the variant platforms related to am62xx=20
>>>> (sip and lp). Additionally, continue to support
>>>> ZjQcmQRYFpfptBannerStart
>>>> This message was sent from outside of Texas Instruments.
>>>> Do not click links or open attachments unless you recognize the=20
>>>> source of this email and know the content is safe. If you wish to=20
>>>> report this message to IT Security, please forward the message as=20
>>>> an attachment to phishing@list.ti.com
>>>> Report=C2=A0Suspicious
>>>> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!uFdqXRfP9mwbKw=
ZFHJNj_V92vi6mT9DGTpQZeFU0LNi8euAkYQM024IcX-dd54y6XIw8nwcGUnREacyk1hI$>=20
>>>>
>>>> ZjQcmQRYFpfptBannerEnd
>>>> To reduce the number of required builds for testing purposes, create=
 a
>>>> common unified am62xx machine target that can produce all of the fil=
es
>>>> for all of the variant platforms related to am62xx (sip and lp).
>>>> Additionally, continue to support building the specific target if
>>>> desired.
>>>>
>>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>>
>>>
>>>
>>> We need to see how do we enable the support of fragment configs with=20
>>> UBOOT_CONFIG
>>> as I see atleast ti-u-boot-2024.04 still following the fragment=20
>>> config model for few usecases.
>>
>> I've been working on this topic all day today.=C2=A0 I'll probably hav=
e an=20
>> additional RFC version tomorrow once I'm done testing it.
>>
>> Once we are happy with everything we can decide if we want to push=20
>> the solution to oe-core, or keep it in meta-ti.
>
> But to be fair, there are no fragments in the am62xx family. There=20
> were back under the 6.1 bsp, but under 6.6 the fragment it is gone.



 From Yocto pov that's true but again not for ti-u-boot-2024.04 perspecti=
ve.
We still have many fragment configs in u-boot tree for am62xx family.
For Instance - am62x_a53_splashscreen.config, am62x_a53_usbdfu.config,=20
etc [1]

Though they currently aren't in default machine configurations of meta-ti
for am62xx family but we never know what happens in future.
Also, not supporting u-boot fragments via meta-ti would eventually need a
signup from baseport team to never use it. Which means the 6.1 bsp flow,
where 62sip, 62lp had fragment model shouldn't be prefered by ti-u-boot
in future.


Praneeth/ Vignesh,

Correct me if I'm wrong but AFAIR, fragments where added in 6.1 bsp based
on upstream feedbacks & were removed from 6.6 bsp for the same reason.
So, we can't rule out the possibility of that fragments being added back
to default flow in future LTS.


[1]:=20
https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/configs?h=3Dti-u-boot-20=
24.04

---
Chirag



>
>
>>
>>> I see two approaches,
>>>
>>> - Add the support in oe-core to handle u-boot fragment configs
>>>
>>> - Extend u-boot-mergeconfig.inc we currently have in meta-ti [1] to=20
>>> support UBOOT_CONFIG
>>>
>>>
>>> Personally, I would prefer the first option if that's acceptable to=20
>>> oe-core as well
>>> but I would like to hear your opinions on the same
>>>
>>>
>>> [1]:=20
>>> https://git.ti.com/cgit/arago-project/meta-ti/tree/meta-ti-bsp/recipe=
s-bsp/u-boot/u-boot-mergeconfig.inc?h=3Dscarthgap
>>>
>>>
>>> ---
>>> Chirag
>>>
>>>
>>>
>>>> ---
>>>> =C2=A0 meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf |=C2=A0 9 +---
>>>> =C2=A0 meta-ti-bsp/conf/machine/am62xx-evm.conf=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 5 +--
>>>> =C2=A0 .../conf/machine/am62xx-lp-evm-k3r5.conf=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 9 +---
>>>> =C2=A0 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf=C2=A0=C2=A0 |=C2=A0=
 5 +--
>>>> =C2=A0 .../conf/machine/am62xx-unified-k3r5.conf=C2=A0=C2=A0=C2=A0=C2=
=A0 | 20 +++++++++
>>>> =C2=A0 meta-ti-bsp/conf/machine/am62xx-unified.conf=C2=A0 | 43=20
>>>> +++++++++++++++++++
>>>> =C2=A0 .../conf/machine/am62xxsip-evm-k3r5.conf=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 8 ++--
>>>> =C2=A0 meta-ti-bsp/conf/machine/am62xxsip-evm.conf=C2=A0=C2=A0 |=C2=A0=
 6 +--
>>>> =C2=A0 8 files changed, 76 insertions(+), 29 deletions(-)
>>>> =C2=A0 create mode 100644 meta-ti-bsp/conf/machine/am62xx-unified-k3=
r5.conf
>>>> =C2=A0 create mode 100644 meta-ti-bsp/conf/machine/am62xx-unified.co=
nf
>>>>
>>>> diff --git a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf=20
>>>> b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
>>>> index 548369ca..3a819835 100644
>>>> --- a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
>>>> +++ b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
>>>> @@ -2,11 +2,6 @@
>>>> =C2=A0 #@NAME: AM62XX EVM (R5F)
>>>> =C2=A0 #@DESCRIPTION: Machine configuration for the TI AM62xx EVM (R=
5F=20
>>>> core)
>>>> -require conf/machine/include/k3r5.inc
>>>> -require conf/machine/include/ti-extras.inc
>>>> +require conf/machine/am62xx-unified-k3r5.conf
>>>> -SYSFW_SOC =3D "am62x"
>>>> -SYSFW_CONFIG =3D "evm"
>>>> -SYSFW_SUFFIX =3D "hs-fs"
>>>> -
>>>> -UBOOT_MACHINE =3D "am62x_evm_r5_defconfig"
>>>> +UBOOT_CONFIG =3D "evm"
>>>> diff --git a/meta-ti-bsp/conf/machine/am62xx-evm.conf=20
>>>> b/meta-ti-bsp/conf/machine/am62xx-evm.conf
>>>> index 31de4a14..8c80cb1f 100644
>>>> --- a/meta-ti-bsp/conf/machine/am62xx-evm.conf
>>>> +++ b/meta-ti-bsp/conf/machine/am62xx-evm.conf
>>>> @@ -2,8 +2,7 @@
>>>> =C2=A0 #@NAME: AM62XX EVM
>>>> =C2=A0 #@DESCRIPTION: Machine configuration for the TI AM62XX EVM
>>>> -require conf/machine/include/am62xx.inc
>>>> -require conf/machine/include/ti-extras.inc
>>>> +require conf/machine/am62xx-unified.conf
>>>> =C2=A0 KERNEL_DEVICETREE_PREFIX =3D " \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am625 \
>>>> @@ -30,4 +29,4 @@ KERNEL_DEVICETREE =3D " \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-hdmi-audio.dtbo \
>>>> =C2=A0 "
>>>> -UBOOT_MACHINE =3D "am62x_evm_a53_defconfig"
>>>> +UBOOT_CONFIG =3D "evm"
>>>> diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf=20
>>>> b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
>>>> index 52b69a72..fb760e99 100644
>>>> --- a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
>>>> +++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
>>>> @@ -2,11 +2,6 @@
>>>> =C2=A0 #@NAME: AM62XX LP GP EVM (R5F)
>>>> =C2=A0 #@DESCRIPTION: Machine configuration for the TI AM62xx LP GP =
EVM=20
>>>> (R5F core)
>>>> -require conf/machine/include/k3r5.inc
>>>> -require conf/machine/include/ti-extras.inc
>>>> +require conf/machine/am62xx-unified-k3r5.conf
>>>> -SYSFW_SOC =3D "am62x"
>>>> -SYSFW_CONFIG =3D "evm"
>>>> -SYSFW_SUFFIX =3D "hs-fs"
>>>> -
>>>> -UBOOT_MACHINE =3D "am62x_lpsk_r5_defconfig"
>>>> +UBOOT_CONFIG =3D "lpsk"
>>>> diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf=20
>>>> b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
>>>> index e9271f5b..f7d89d68 100644
>>>> --- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
>>>> +++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
>>>> @@ -2,8 +2,7 @@
>>>> =C2=A0 #@NAME: AM62XX LP EVM
>>>> =C2=A0 #@DESCRIPTION: Machine configuration for the TI AM62XX LP EVM
>>>> -require conf/machine/include/am62xx.inc
>>>> -require conf/machine/include/ti-extras.inc
>>>> +require conf/machine/am62xx-unified.conf
>>>> =C2=A0 KERNEL_DEVICETREE_PREFIX =3D " \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am62-lp \
>>>> @@ -19,4 +18,4 @@ KERNEL_DEVICETREE =3D " \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-hdmi-audio.dtbo \
>>>> =C2=A0 "
>>>> -UBOOT_MACHINE =3D "am62x_lpsk_a53_defconfig"
>>>> +UBOOT_CONFIG =3D "lpsk"
>>>> diff --git a/meta-ti-bsp/conf/machine/am62xx-unified-k3r5.conf=20
>>>> b/meta-ti-bsp/conf/machine/am62xx-unified-k3r5.conf
>>>> new file mode 100644
>>>> index 00000000..7d65e6af
>>>> --- /dev/null
>>>> +++ b/meta-ti-bsp/conf/machine/am62xx-unified-k3r5.conf
>>>> @@ -0,0 +1,20 @@
>>>> +#@TYPE: Machine
>>>> +#@NAME: AM62XX EVM (R5F)
>>>> +#@DESCRIPTION: Machine configuration for the TI AM62xx EVM (R5F cor=
e)
>>>> +
>>>> +require conf/machine/include/k3r5.inc
>>>> +require conf/machine/include/ti-extras.inc
>>>> +
>>>> +SYSFW_SOC =3D "am62x"
>>>> +SYSFW_CONFIG =3D "evm"
>>>> +SYSFW_SUFFIX =3D "hs-fs"
>>>> +
>>>> +UBOOT_MACHINE =3D ""
>>>> +# Last config in the list is default
>>>> +UBOOT_CONFIG ??=3D "sip lpsk evm"
>>>> +
>>>> +UBOOT_CONFIG:bsp-ti-6_1 ??=3D "evm"
>>>> +
>>>> +UBOOT_CONFIG[sip] =3D "am62xsip_evm_r5_defconfig"
>>>> +UBOOT_CONFIG[lpsk] =3D "am62x_lpsk_r5_defconfig"
>>>> +UBOOT_CONFIG[evm] =3D "am62x_evm_r5_defconfig"
>>>> diff --git a/meta-ti-bsp/conf/machine/am62xx-unified.conf=20
>>>> b/meta-ti-bsp/conf/machine/am62xx-unified.conf
>>>> new file mode 100644
>>>> index 00000000..5b03239f
>>>> --- /dev/null
>>>> +++ b/meta-ti-bsp/conf/machine/am62xx-unified.conf
>>>> @@ -0,0 +1,43 @@
>>>> +#@TYPE: Machine
>>>> +#@NAME: AM62XX Unified EVM
>>>> +#@DESCRIPTION: Machine configuration for the TI AM62XX EVM and all=20
>>>> of its variations
>>>> +
>>>> +require conf/machine/include/am62xx.inc
>>>> +require conf/machine/include/ti-extras.inc
>>>> +
>>>> +KERNEL_DEVICETREE_PREFIX =3D " \
>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62-lp \
>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am625 \
>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk \
>>>> +"
>>>> +
>>>> +KERNEL_DEVICETREE =3D " \
>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62-lp-sk.dtb \
>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am625-beagleplay-csi2-ov5640.dtbo \
>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtbo \
>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am625-beagleplay.dtb \
>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am625-phyboard-lyra-rdk.dtb \
>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am625-sk.dtb \
>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am625-verdin-nonwifi-dahlia.dtb \
>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am625-verdin-nonwifi-dev.dtb \
>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am625-verdin-nonwifi-mallow.dtb \
>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am625-verdin-nonwifi-yavia.dtb \
>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am625-verdin-wifi-dahlia.dtb \
>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am625-verdin-wifi-dev.dtb \
>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am625-verdin-wifi-mallow.dtb \
>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am625-verdin-wifi-yavia.dtb \
>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-csi2-imx219.dtbo \
>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-csi2-ov5640.dtbo \
>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-csi2-tevi-ov5640.dtbo \
>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-hdmi-audio.dtbo \
>>>> +"
>>>> +
>>>> +UBOOT_MACHINE =3D ""
>>>> +# Last config in the list is default
>>>> +UBOOT_CONFIG ??=3D "sip lpsk evm"
>>>> +
>>>> +UBOOT_CONFIG:bsp-ti-6_1 ??=3D "lpsk evm"
>>>> +
>>>> +UBOOT_CONFIG[sip] =3D "am62xsip_evm_a53_defconfig"
>>>> +UBOOT_CONFIG[lpsk] =3D "am62x_lpsk_a53_defconfig"
>>>> +UBOOT_CONFIG[evm] =3D "am62x_evm_a53_defconfig"
>>>> diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf=20
>>>> b/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
>>>> index 55bc530b..ab538ff3 100644
>>>> --- a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
>>>> +++ b/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
>>>> @@ -2,13 +2,11 @@
>>>> =C2=A0 #@NAME: AM62XX SIP EVM (R5F)
>>>> =C2=A0 #@DESCRIPTION: Machine configuration for the TI AM62xx SIP EV=
M=20
>>>> (R5F core)
>>>> -require conf/machine/include/k3r5.inc
>>>> +require conf/machine/am62xx-unified-k3r5.conf
>>>> -SYSFW_SOC =3D "am62x"
>>>> -SYSFW_CONFIG =3D "evm"
>>>> -SYSFW_SUFFIX =3D "hs-fs"
>>>> +UBOOT_CONFIG =3D "sip"
>>>> -UBOOT_MACHINE =3D "am62xsip_evm_r5_defconfig"
>>>> +UBOOT_CONFIG:bsp-ti-6_1 =3D ""
>>>> =C2=A0 UBOOT_MACHINE:bsp-ti-6_1 =3D "am62x_evm_r5_defconfig"
>>>> diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf=20
>>>> b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
>>>> index 8104329e..6b179b80 100644
>>>> --- a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
>>>> +++ b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
>>>> @@ -2,7 +2,7 @@
>>>> =C2=A0 #@NAME: AM62XX SIP EVM
>>>> =C2=A0 #@DESCRIPTION: Machine configuration for the TI AM62XX SIP EV=
M
>>>> -require conf/machine/include/am62xx.inc
>>>> +require conf/machine/am62xx-unified.conf
>>>> =C2=A0 KERNEL_DEVICETREE_PREFIX =3D " \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am625 \
>>>> @@ -13,6 +13,4 @@ KERNEL_DEVICETREE =3D " \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am625-sk.dtb \
>>>> =C2=A0 "
>>>> -UBOOT_MACHINE =3D "am62xsip_evm_a53_defconfig"
>>>> -
>>>> -UBOOT_MACHINE:bsp-ti-6_1 =3D "am62x_evm_a53_defconfig"
>>>> +UBOOT_CONFIG =3D "sip"
>>>> --=20
>>>> 2.17.1
>>>>
>>>>
>>>>
>>>>
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#17937):=20
>> https://lists.yoctoproject.org/g/meta-ti/message/17937
>> Mute This Topic: https://lists.yoctoproject.org/mt/107796202/6551054
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub=20
>> [reatmon@ti.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>

