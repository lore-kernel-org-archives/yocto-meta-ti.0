Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94A36EE800C
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 14:25:38 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.40476.1694183133705844483
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 08 Sep 2023 07:25:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=kLjYrPHA;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 388EPUWU051958;
	Fri, 8 Sep 2023 09:25:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1694183130;
	bh=I+hBswJ5F1D169/wqNesW9LO8Fpc3pktxdsspTdHPPs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=kLjYrPHAUmLm1yad1iqCV2aaCbYeULh6v7nGaKCc0FtG8FI3VA1cpBArXYeevqSaV
	 eDL6YdonkcC1ZHxELk1mQmB5+5jpakHmHPWyMLr5twbEPswvfR/SBbZax/IXMbqoyH
	 3Wao3oa0n2CiIS0OLkqUOZMeSh9bTWDeKGh7BK0k=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 388EPULZ074891
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 8 Sep 2023 09:25:30 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 8
 Sep 2023 09:25:30 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 8 Sep 2023 09:25:30 -0500
Received: from [10.249.36.168] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 388EPU8I057011;
	Fri, 8 Sep 2023 09:25:30 -0500
Message-ID: <9bae7ad4-1793-c959-fb76-b10d47ba6688@ti.com>
Date: Fri, 8 Sep 2023 09:25:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [meta-ti][master/kirkstone][PATCH 1/2] conf: machine: Add
 am62xx-sip-evm configuration
To: "Bajjuri, Praneeth" <praneeth@ti.com>,
        Chirag Shilwant
	<c-shilwant@ti.com>,
        Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>,
        Nitin Yadav <n-yadav@ti.com>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Khasim <khasim@ti.com>, Gyan Gupta <g-gupta@ti.com>
References: <20230908130234.2227726-1-c-shilwant@ti.com>
 <956d7bc5-014e-359c-f6c7-15246028b6ea@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <956d7bc5-014e-359c-f6c7-15246028b6ea@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 388EPUWU051958
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 08 Sep 2023 14:25:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16938



On 9/8/2023 9:15 AM, Bajjuri, Praneeth wrote:
>=20
>=20
> On 9/8/2023 8:02 AM, Chirag Shilwant wrote:
>> - Add A53 and R5 machine configurations for am62xx-sip-evm.
>=20
> Can you keep the name consistent with the convention
> https://git.ti.com/cgit/ti-u-boot/ti-u-boot/commit/?h=3Dti-u-boot-2023.=
04&id=3D600ab30716936aa7f91dd11a9b1b8f8a184122e0
>=20
> s/am62xx-sip-evm/am62xxsip-evm

But about the am62xx-lp-evm?  Why is that different than the sip=20
variation?  (I really do not know, so please enlighten me.)

>>
>> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
>> ---
>> =C2=A0 meta-ti-bsp/conf/machine/am62xx-sip-evm-k3r5.conf | 11 ++++++++=
+++
>> =C2=A0 meta-ti-bsp/conf/machine/am62xx-sip-evm.conf=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 13 +++++++++++++
>> =C2=A0 2 files changed, 24 insertions(+)
>> =C2=A0 create mode 100644 meta-ti-bsp/conf/machine/am62xx-sip-evm-k3r5=
.conf
>> =C2=A0 create mode 100644 meta-ti-bsp/conf/machine/am62xx-sip-evm.conf
>>
>> diff --git a/meta-ti-bsp/conf/machine/am62xx-sip-evm-k3r5.conf=20
>> b/meta-ti-bsp/conf/machine/am62xx-sip-evm-k3r5.conf
>> new file mode 100644
>> index 00000000..472da1cc
>> --- /dev/null
>> +++ b/meta-ti-bsp/conf/machine/am62xx-sip-evm-k3r5.conf
>> @@ -0,0 +1,11 @@
>> +#@TYPE: Machine
>> +#@NAME: AM62XX SIP EVM (R5F)
>> +#@DESCRIPTION: Machine configuration for the TI AM62xx SIP EVM (R5F=20
>> core)
>> +
>> +require conf/machine/include/k3r5.inc
>> +
>> +SYSFW_SOC =3D "am62x"
>> +SYSFW_CONFIG =3D "evm"
>> +SYSFW_SUFFIX =3D "hs-fs"
>> +
>> +UBOOT_MACHINE =3D "am62x_evm_r5_defconfig"
>=20
> This is am62x config. Please converge config name from second patch and=
 use
> am62xsip_sk_r5.config
>=20
>=20
>> diff --git a/meta-ti-bsp/conf/machine/am62xx-sip-evm.conf=20
>> b/meta-ti-bsp/conf/machine/am62xx-sip-evm.conf
>> new file mode 100644
>> index 00000000..dc4f3b77
>> --- /dev/null
>> +++ b/meta-ti-bsp/conf/machine/am62xx-sip-evm.conf
>> @@ -0,0 +1,13 @@
>> +#@TYPE: Machine
>> +#@NAME: AM62XX SIP EVM
>> +#@DESCRIPTION: Machine configuration for the TI AM62XX SIP EVM
>> +
>> +require conf/machine/include/am62xx.inc
>> +
>> +KERNEL_DEVICETREE_PREFIX =3D "ti/k3-am625"
>> +
>> +KERNEL_DEVICETREE =3D " \
>> +=C2=A0=C2=A0=C2=A0 ti/k3-am625-sk.dtb \
>> +"
>> +
>> +UBOOT_MACHINE =3D "am62x_evm_a53_defconfig"
>=20
> same comment here . This is not the correct config for am62xxsip
>=20
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

