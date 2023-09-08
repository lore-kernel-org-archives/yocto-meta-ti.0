Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85E70EE8010
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 14:31:08 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.40298.1694183463745273177
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 08 Sep 2023 07:31:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=YVvBHCNz;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 388EV0ZE056374;
	Fri, 8 Sep 2023 09:31:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1694183460;
	bh=YQw/bw0V7kobrhOyRxLbniNeQMWn8L10vfpGQkDNnZE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=YVvBHCNzhFIa8Z8YiMNr3Y+QNDhNmbpJBU3gBk9LCg4Ln+vJAGuOjkWntxWYJ1f2S
	 oWI9m7P+qelDN7JNbzqJf1By45WcBqjz2IN66xX4MQAkarWh+yjaUCzuoikFJPbS1k
	 CZUZnmtBWMF8I7JutMseLvKmoIGiRuKTgxsB51nU=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 388EV0Wp026024
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 8 Sep 2023 09:31:00 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 8
 Sep 2023 09:30:58 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 8 Sep 2023 09:30:58 -0500
Received: from [10.249.36.168] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 388EUwfm023513;
	Fri, 8 Sep 2023 09:30:58 -0500
Message-ID: <74e43780-fd8a-cbbc-433a-7235b3e46422@ti.com>
Date: Fri, 8 Sep 2023 09:30:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [meta-ti][master/kirkstone][PATCH 2/2] recipes-bsp: u-boot: Add
 logic to handle fragment u-boot configs
Content-Language: en-US
To: "Bajjuri, Praneeth" <praneeth@ti.com>,
        Chirag Shilwant
	<c-shilwant@ti.com>,
        Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Khasim <khasim@ti.com>, Gyan Gupta <g-gupta@ti.com>
References: <20230908131427.2237438-1-c-shilwant@ti.com>
 <0285dd35-5107-7290-a40c-65880b6a186b@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <0285dd35-5107-7290-a40c-65880b6a186b@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 388EV0ZE056374
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 08 Sep 2023 14:31:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16939



On 9/8/2023 9:16 AM, Bajjuri, Praneeth wrote:
>=20
>=20
> On 9/8/2023 8:14 AM, Chirag Shilwant wrote:
>> - Add u-boot-mergeconfig.inc which will ensure we handle fragment=20
>> u-boot configs.
>> - Include u-boot-mergeconfig.inc in u-boot-ti.inc.
>> - Add a new variable UBOOT_CONFIG_FRAGMENT which stores the name of=20
>> fragment defconfig to be used.
>=20
> This patch has to be split,
> The config fragment part belongs separately as its own patch and should=
=20
> go first.
>=20
> am62xxsip machine including the necessary uboot config is its seperate=20
> patch on top

Agreed.

1) Add UBOOT_CONFIG_FRAGMENT support to u-boot.
2) Add am62xx sip machine using this new feature.  (merge the other=20
patch with this change).

>>
>> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
>> ---
>> =C2=A0 meta-ti-bsp/conf/machine/am62xx-sip-evm-k3r5.conf=C2=A0=C2=A0=C2=
=A0=C2=A0 | 1 +
>> =C2=A0 meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc | 7 +++++=
++
>> =C2=A0 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
>> =C2=A0 3 files changed, 9 insertions(+)
>> =C2=A0 create mode 100644=20
>> meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc
>>
>> diff --git a/meta-ti-bsp/conf/machine/am62xx-sip-evm-k3r5.conf=20
>> b/meta-ti-bsp/conf/machine/am62xx-sip-evm-k3r5.conf
>> index 472da1cc..a5be1130 100644
>> --- a/meta-ti-bsp/conf/machine/am62xx-sip-evm-k3r5.conf
>> +++ b/meta-ti-bsp/conf/machine/am62xx-sip-evm-k3r5.conf
>> @@ -9,3 +9,4 @@ SYSFW_CONFIG =3D "evm"
>> =C2=A0 SYSFW_SUFFIX =3D "hs-fs"
>> =C2=A0 UBOOT_MACHINE =3D "am62x_evm_r5_defconfig"
>> +UBOOT_CONFIG_FRAGMENT =3D "am62xsip_sk_r5.config"
>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc=20
>> b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc
>> new file mode 100644
>> index 00000000..69db6260
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc
>> @@ -0,0 +1,7 @@
>> +do_compile:prepend () {
>> +=C2=A0=C2=A0 if [ -n "${UBOOT_CONFIG_FRAGMENT}" ]
>> +=C2=A0=C2=A0 then
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 oe_runmake -C ${S} O=3D${B} ${UB=
OOT_MACHINE}=20
>> ${UBOOT_CONFIG_FRAGMENT}
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 oe_runmake -C ${S} O=3D${B} oldd=
efconfig
>> +=C2=A0=C2=A0 fi
>> +}
>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc=20
>> b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> index f3285c23..5292517b 100644
>> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> @@ -7,6 +7,7 @@ SPL_BINARY ?=3D "MLO"
>> =C2=A0 require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot-common.inc
>> =C2=A0 require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
>> +require u-boot-mergeconfig.inc
>> =C2=A0 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/u-boot:"

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

