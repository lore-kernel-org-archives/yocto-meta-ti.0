Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91B16EE8019
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 15:38:19 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.12.1694187496716108070
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 08 Sep 2023 08:38:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=lsVJ4W92;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 388FcCMt044315;
	Fri, 8 Sep 2023 10:38:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1694187492;
	bh=ATUoqcGYfdYuPRYl3VAC9KuIzxVLsZDr7hegCcBpRNU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=lsVJ4W929Ms9ylYlnSjS6DqudGfofaGcBjay/BnL+awayiGKB77ltipl84hAY0z/9
	 EOYQgRy9MPlinZ0q2YN2Q6LIGc1b7lY4FL2gXkGNxnR9+S3rduxJEJm0IkErfvu83V
	 jOOnuJ7/a4EZIrD3jfptUww7x7S6Ck5EAzYqp9+Q=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 388FcCOu004260
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 8 Sep 2023 10:38:12 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 8
 Sep 2023 10:38:12 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 8 Sep 2023 10:38:12 -0500
Received: from [10.249.36.168] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 388FcCOi019794;
	Fri, 8 Sep 2023 10:38:12 -0500
Message-ID: <a287daee-400e-cece-d80a-c571bb7b4cde@ti.com>
Date: Fri, 8 Sep 2023 10:38:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [meta-ti][master/kirkstone][PATCH 1/2] conf: machine: Add
 am62xx-sip-evm configuration
Content-Language: en-US
To: "Bajjuri, Praneeth" <praneeth@ti.com>,
        Chirag Shilwant
	<c-shilwant@ti.com>,
        Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>,
        Nitin Yadav <n-yadav@ti.com>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Khasim <khasim@ti.com>, Gyan Gupta <g-gupta@ti.com>
References: <20230908130234.2227726-1-c-shilwant@ti.com>
 <956d7bc5-014e-359c-f6c7-15246028b6ea@ti.com>
 <9bae7ad4-1793-c959-fb76-b10d47ba6688@ti.com>
 <398b0572-4f40-1f9b-0153-f4562cbd0bb0@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <398b0572-4f40-1f9b-0153-f4562cbd0bb0@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 388FcCMt044315
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 08 Sep 2023 15:38:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16941



On 9/8/2023 9:41 AM, Bajjuri, Praneeth wrote:
>=20
>=20
> On 9/8/2023 9:25 AM, Ryan Eatmon wrote:
>>
>>
>> On 9/8/2023 9:15 AM, Bajjuri, Praneeth wrote:
>>>
>>>
>>> On 9/8/2023 8:02 AM, Chirag Shilwant wrote:
>>>> - Add A53 and R5 machine configurations for am62xx-sip-evm.
>>>
>>> Can you keep the name consistent with the convention
>>> https://git.ti.com/cgit/ti-u-boot/ti-u-boot/commit/?h=3Dti-u-boot-202=
3.04&id=3D600ab30716936aa7f91dd11a9b1b8f8a184122e0
>>>
>>> s/am62xx-sip-evm/am62xxsip-evm
>>
>> But about the am62xx-lp-evm?=C2=A0 Why is that different than the sip=20
>> variation?=C2=A0 (I really do not know, so please enlighten me.)
>=20
> am62xxsip-evm >> is am62xx with LPDDR4 integrated with silicon (System=20
> in Package) and LPDDR4 is 512MB on this new board/sip variant
>=20
> am62xx-evm >> is am62xx Soc with 2GB DDR4 on board.
>=20
> am62xx-lp-evm >> is am62xx AMC package Soc with LPDDR4 on board.

Thanks.  Then I agree.  It needs to be called am62xxsip-evm.

>=20
>>
>>>>
>>>> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
>>>> ---
>>>> =C2=A0 meta-ti-bsp/conf/machine/am62xx-sip-evm-k3r5.conf | 11 ++++++=
+++++
>>>> =C2=A0 meta-ti-bsp/conf/machine/am62xx-sip-evm.conf=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 13 +++++++++++++
>>>> =C2=A0 2 files changed, 24 insertions(+)
>>>> =C2=A0 create mode 100644 meta-ti-bsp/conf/machine/am62xx-sip-evm-k3=
r5.conf
>>>> =C2=A0 create mode 100644 meta-ti-bsp/conf/machine/am62xx-sip-evm.co=
nf
>>>>
>>>> diff --git a/meta-ti-bsp/conf/machine/am62xx-sip-evm-k3r5.conf=20
>>>> b/meta-ti-bsp/conf/machine/am62xx-sip-evm-k3r5.conf
>>>> new file mode 100644
>>>> index 00000000..472da1cc
>>>> --- /dev/null
>>>> +++ b/meta-ti-bsp/conf/machine/am62xx-sip-evm-k3r5.conf
>>>> @@ -0,0 +1,11 @@
>>>> +#@TYPE: Machine
>>>> +#@NAME: AM62XX SIP EVM (R5F)
>>>> +#@DESCRIPTION: Machine configuration for the TI AM62xx SIP EVM (R5F=
=20
>>>> core)
>>>> +
>>>> +require conf/machine/include/k3r5.inc
>>>> +
>>>> +SYSFW_SOC =3D "am62x"
>>>> +SYSFW_CONFIG =3D "evm"
>>>> +SYSFW_SUFFIX =3D "hs-fs"
>>>> +
>>>> +UBOOT_MACHINE =3D "am62x_evm_r5_defconfig"
>>>
>>> This is am62x config. Please converge config name from second patch=20
>>> and use
>>> am62xsip_sk_r5.config
>>>
>>>
>>>> diff --git a/meta-ti-bsp/conf/machine/am62xx-sip-evm.conf=20
>>>> b/meta-ti-bsp/conf/machine/am62xx-sip-evm.conf
>>>> new file mode 100644
>>>> index 00000000..dc4f3b77
>>>> --- /dev/null
>>>> +++ b/meta-ti-bsp/conf/machine/am62xx-sip-evm.conf
>>>> @@ -0,0 +1,13 @@
>>>> +#@TYPE: Machine
>>>> +#@NAME: AM62XX SIP EVM
>>>> +#@DESCRIPTION: Machine configuration for the TI AM62XX SIP EVM
>>>> +
>>>> +require conf/machine/include/am62xx.inc
>>>> +
>>>> +KERNEL_DEVICETREE_PREFIX =3D "ti/k3-am625"
>>>> +
>>>> +KERNEL_DEVICETREE =3D " \
>>>> +=C2=A0=C2=A0=C2=A0 ti/k3-am625-sk.dtb \
>>>> +"
>>>> +
>>>> +UBOOT_MACHINE =3D "am62x_evm_a53_defconfig"
>>>
>>> same comment here . This is not the correct config for am62xxsip
>>>
>>>
>>

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

