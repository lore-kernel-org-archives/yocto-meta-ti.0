Return-Path: <a-bhatia1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 410ECC77B7D
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 08:48:53 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.22621.1683276530984366707
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 05 May 2023 01:48:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=dQ0qNoJl;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: a-bhatia1@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3458mn2P058003;
	Fri, 5 May 2023 03:48:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1683276529;
	bh=f3huGXwu788IovqnaFS9RvBLGV177dQChr7ngnDlvEE=;
	h=Date:From:Subject:To:CC:References:In-Reply-To;
	b=dQ0qNoJlPLlBcuOv7mIAPhwehBrZDH6eAbPdpqPVSqbMrzLEupCQaxNhG4i9cDTPH
	 5QHPLVZTn20jb0enBkeQXFWGikgVh51H5ZXsIcW/T3LuNaCZO0AdTVt0100+XqVboe
	 mrwPHhfJU+XOe6FIBmJ/DJ9Ada/wCsSBxj4rWx0Y=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3458mn8R002173
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 5 May 2023 03:48:49 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 5
 May 2023 03:48:48 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 5 May 2023 03:48:48 -0500
Received: from [172.24.222.176] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3458mkap071799;
	Fri, 5 May 2023 03:48:47 -0500
Message-ID: <520a0aac-9cb9-a95f-bd5b-ba8153143561@ti.com>
Date: Fri, 5 May 2023 14:18:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Aradhya Bhatia <a-bhatia1@ti.com>
Subject: Re: [kirkstone-next][PATCH] meta-ti: conf: am6xx: Add display DT
 overlay support
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
CC: Meta-TI List <meta-ti@lists.yoctoproject.org>,
        Paresh Bhagat
	<p-bhagat@ti.com>,
        Sai Sree Kartheek Adivi <s-adivi@ti.com>, Gyan Gupta
	<g-gupta@ti.com>
References: <20230504062128.28222-1-a-bhatia1@ti.com>
 <aa2002d0-9940-d264-1ffe-cc2a349bc6b0@ti.com>
Content-Language: en-US
In-Reply-To: <aa2002d0-9940-d264-1ffe-cc2a349bc6b0@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 3458mn2P058003
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 05 May 2023 08:48:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16488

Ryan,

Thank you for reviewing the patch.

On 04-May-23 19:59, Ryan Eatmon wrote:
>=20
>=20
> On 5/4/2023 1:21, Aradhya Bhatia wrote:
>> Add the Microtips OLDI Panel DT overlay for AM625-SK, AM62-LP SK and
>> Rocktech OLDI LCD DT overlay for AM654-EVM.
>>
>> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
>> ---
>> =C2=A0 meta-ti-bsp/conf/machine/am62xx-evm.conf=C2=A0=C2=A0=C2=A0 | 1 =
+
>> =C2=A0 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf | 1 +
>> =C2=A0 meta-ti-bsp/conf/machine/include/am65xx.inc | 1 +
>> =C2=A0 3 files changed, 3 insertions(+)
>>
>> diff --git a/meta-ti-bsp/conf/machine/am62xx-evm.conf
>> b/meta-ti-bsp/conf/machine/am62xx-evm.conf
>> index d54213d4cb7b..0c0170defbfb 100644
>> --- a/meta-ti-bsp/conf/machine/am62xx-evm.conf
>> +++ b/meta-ti-bsp/conf/machine/am62xx-evm.conf
>> @@ -8,6 +8,7 @@ KERNEL_DEVICETREE_PREFIX =3D "ti/k3-am625"
>> =C2=A0 =C2=A0 KERNEL_DEVICETREE =3D " \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am625-sk.dtb \
>> +=C2=A0=C2=A0=C2=A0 ti/k3-am625-sk-microtips-mf101hie-panel.dtbo \
>> =C2=A0 "
>=20
> Starting in kirkstone, to support multiple kernels that might have
> differing sets of dtb overlays, we introduces the
> KERNEL_DEVICETREE_PREFIX variable to allow for pattern matches to pick
> the dtbs.
>=20
> The only items that should appear in KERNEL_DEVICETREE are dtbs that ar=
e
> in the upstream kernel (latest and greatest).
>=20
> Since the KERNEL_DEVICETREE_PREFIX covers what you are wanting to add,
> you do not need this change at all.
>=20
>> =C2=A0 UBOOT_MACHINE =3D "am62x_evm_a53_defconfig"
>> diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
>> b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
>> index ba1a12a7fdb7..9902987abc34 100644
>> --- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
>> +++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
>> @@ -11,6 +11,7 @@ KERNEL_DEVICETREE_PREFIX =3D " \
>> =C2=A0 =C2=A0 KERNEL_DEVICETREE =3D " \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am62x-lp-sk.dtb \
>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62-lp-sk-microtips-mf101hie-panel.dtbo \
>> =C2=A0 "
>=20
> In this case the KERNEL_DEVICETREE_PREFIX does not cover what you are
> adding, so you would need to change the PREFIX to:
>=20
> KERNEL_DEVICETREE_PREFIX =3D " \
> =C2=A0=C2=A0=C2=A0 ti/k3-am62x-lp \
> =C2=A0=C2=A0=C2=A0 ti/k3-am62-lp \
> =C2=A0=C2=A0=C2=A0 ti/k3-am625-sk \
> "
"ti/k3-am62-lp" should be supported instead of "ti/k3-am62x-lp" as the
name of the AM62-LP SK DT as been finalized to k3-am62-lp-sk.dts in the
kernel.[1]

I have sent the fix.

Regards
Aradhya

[1]:
https://lore.kernel.org/all/06cbcd7d-bc83-bfeb-0821-72c7caf9a5e7@linaro.o=
rg/

>=20
>> =C2=A0 SPL_BINARY =3D "tispl.bin_HS"
>> diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc
>> b/meta-ti-bsp/conf/machine/include/am65xx.inc
>> index 7dc234be671e..e0abad3e8f30 100644
>> --- a/meta-ti-bsp/conf/machine/include/am65xx.inc
>> +++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
>> @@ -9,6 +9,7 @@ KERNEL_DEVICETREE_PREFIX =3D "ti/k3-am654"
>> =C2=A0 =C2=A0 KERNEL_DEVICETREE =3D " \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am654-base-board.dtb \
>> +=C2=A0=C2=A0=C2=A0 ti/k3-am654-evm-oldi-lcd1evm.dtbo \
>> =C2=A0 "
>=20
> Since the KERNEL_DEVICETREE_PREFIX covers what you are wanting to add,
> you do not need this change at all.
>=20
>=20
>> =C2=A0 # On AM65x the file tiboot3.bin comes from the bootloader not t=
i-sci-fw
>=20


