Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BC3AC71157
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 15:46:04 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.2214.1750261554109446270
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 18 Jun 2025 08:45:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=ApZwwnlR;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55IFjp8Z152669;
	Wed, 18 Jun 2025 10:45:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750261551;
	bh=e/aMeunteD03cA+IQ1ceJBirnX37bwZ6hN1LmTGtRcM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ApZwwnlRaWv4mWX6GNUJ8puoHdsX5yS+7S46xwCYzLyd1/ZQq2DDXIogp0mMSW48/
	 k64lYKYnOrDA9TMYa1lTTW7lfx7et1fR1HWlU5IcGDfSsyTXvxW71soJUJlBM0GWP6
	 vJeQ+vDKzDv4cDw/r3orb8N2xOVJ7CZjBK3fiOjQ=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55IFjp003055092
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 18 Jun 2025 10:45:51 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 18
 Jun 2025 10:45:51 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 18 Jun 2025 10:45:51 -0500
Received: from [128.247.81.69] (dtmxl9433pnr.dhcp.ti.com [128.247.81.69])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55IFjoH53736108;
	Wed, 18 Jun 2025 10:45:50 -0500
Message-ID: <5a356743-37cc-485d-8922-533779a70101@ti.com>
Date: Wed, 18 Jun 2025 10:45:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [scarthgap][PATCH v2] recipes-bsp: Add TI TAD5212 DAC firmware
 recipe
To: Andrew Davis <afd@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        <meta-ti@lists.yoctoproject.org>, <denis@denix.org>, <praneeth@ti.com>
CC: <v-singh1@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>
References: <20250618100143.1955550-1-p-bhagat@ti.com>
 <d4118654-6519-4d2e-adef-d875a320915e@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <d4118654-6519-4d2e-adef-d875a320915e@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot03.ext.ti.com id 55IFjp8Z152669
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 18 Jun 2025 15:46:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18654



On 6/18/2025 10:37 AM, Andrew Davis wrote:
> On 6/18/25 5:01 AM, Paresh Bhagat wrote:
>> From: Vishnu Singh <v-singh1@ti.com>
>>
>> Add TAD5212 DAC firmware images for am62dxx-evm to support two DAC
>> configurations:
>> - tad5212_01.bin: Configures 1 DAC with stereo channel in i2s mode.
>> - tad5212_04.bin: Configures 4 DAC with each having stereo channel
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 support in i2s =
mode.
>>
>> Signed-off-by: Vishnu Singh <v-singh1@ti.com>
>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
>> ---
>> Boot logs
>> https://gist.github.com/paresh-bhagat12/38ad3188e2da2546627341cd9416cc=
ad
>>
>> Change log:
>> V1 -> V2:
>> =C2=A0=C2=A0=C2=A0=C2=A0- Updated names of firmware in recipe
>>
>> =C2=A0 meta-ti-bsp/conf/machine/include/am62dxx.inc=C2=A0 |=C2=A0 2 ++
>> =C2=A0 .../recipes-bsp/ti-dac-fw/ti-dac-fw.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 20 +++++++++++++++++++
>> =C2=A0 .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc=C2=A0=C2=A0 |=C2=A0=
 1 +
>> =C2=A0 3 files changed, 23 insertions(+)
>> =C2=A0 create mode 100644 meta-ti-bsp/recipes-bsp/ti-dac-fw/ti-dac-fw.=
bb
>>
>> diff --git a/meta-ti-bsp/conf/machine/include/am62dxx.inc=20
>> b/meta-ti-bsp/conf/machine/include/am62dxx.inc
>> index ac4e8e17..3c60acb1 100644
>> --- a/meta-ti-bsp/conf/machine/include/am62dxx.inc
>> +++ b/meta-ti-bsp/conf/machine/include/am62dxx.inc
>> @@ -13,3 +13,5 @@ IMAGE_BOOT_FILES +=3D "tiboot3-am62dx-hs-evm.bin"
>> =C2=A0 TFA_BOARD =3D "lite"
>> =C2=A0 OPTEEMACHINE =3D "k3-am62x"
>> +
>> +MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "ti-dac-fw"
>=20
> This firmware is specific to a DAC found on the EVM, not all AM62D base=
d
> boards will need this, above should go in the EVM config=20
> (am62pxx-evm.conf).

Good catch.  Looks like we need a v3.

And I think you meant am62dxx-evm.conf



> Andrew
>=20
>> diff --git a/meta-ti-bsp/recipes-bsp/ti-dac-fw/ti-dac-fw.bb=20
>> b/meta-ti-bsp/recipes-bsp/ti-dac-fw/ti-dac-fw.bb
>> new file mode 100644
>> index 00000000..68b17aad
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-bsp/ti-dac-fw/ti-dac-fw.bb
>> @@ -0,0 +1,20 @@
>> +DESCRIPTION =3D "TI DAC TAD5212 config prebuild binary firmware"
>> +
>> +require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>> +
>> +LICENSE =3D "TI-TFL"
>> +LIC_FILES_CHKSUM =3D=20
>> "file://${THISDIR}/../../licenses/TI-TFL;md5=3Da1b59cb7ba626b9dbbcbf00=
f3fbc438a"
>> +
>> +PV =3D "${TAD5212_FW_VERSION}"
>> +PR =3D "${INC_PR}.0"
>> +
>> +COMPATIBLE_MACHINE =3D "am62dxx"
>> +
>> +TAD5212_1DEV =3D "tad5212_01.bin"
>> +TAD5212_4DEV =3D "tad5212_04.bin"
>> +
>> +do_install() {
>> +=C2=A0=C2=A0=C2=A0 install -d ${D}${nonarch_base_libdir}/firmware
>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${S}/ti/tad5212/${TAD5212_1DEV}=20
>> ${D}${nonarch_base_libdir}/firmware/
>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${S}/ti/tad5212/${TAD5212_4DEV}=20
>> ${D}${nonarch_base_libdir}/firmware/
>> +}
>> diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc=20
>> b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>> index d1dd9df3..08cd0b30 100644
>> --- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>> +++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>> @@ -17,6 +17,7 @@ CNM_WAVE521_FW_VERSION =3D "1.0.8"
>> =C2=A0 TI_DM_FW_VERSION =3D "11.00.09"
>> =C2=A0 TI_SYSFW_VERSION =3D "11.01.00"
>> =C2=A0 TI_HSM_DEMO_FW_VERSION =3D "11.00.09"
>> +TAD5212_FW_VERSION =3D "1.0.0.0"
>> =C2=A0 TI_LINUX_FW_SRCREV ?=3D "a37c82f0e25e0e3c99fdf03f1d57f7b08314a2=
bc"
>> =C2=A0 SRCREV =3D "${TI_LINUX_FW_SRCREV}"

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

