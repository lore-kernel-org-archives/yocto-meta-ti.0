Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9991C7EE24
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 19:19:34 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.18087.1685992767795542720
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 05 Jun 2023 12:19:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=jbp0Ukzm;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 355JJNKN098250;
	Mon, 5 Jun 2023 14:19:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685992763;
	bh=roV0Mhjjo7oTAv3qvkCvLDYqKWX91wFzmS2spffVNzM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=jbp0UkzmdFHNR3n1VV3eA7cUH8tUg6A/zkTlnxi/0l3deoQbTSKtLKuFPRakLF7bq
	 mvSEA/1pGMqp+k1vlqoEfTfkchKWzJZ5w64nvuOTwcwlCW9YbiOI7z3Ez5Pgh+G7Bx
	 3jp7hL3tysENejZc48FwjCNGTHOKlfZcs/zM/sIY=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 355JJNl8021579
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 Jun 2023 14:19:23 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 Jun 2023 14:19:23 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 Jun 2023 14:19:23 -0500
Received: from [10.247.28.33] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 355JJNUX106924;
	Mon, 5 Jun 2023 14:19:23 -0500
Message-ID: <32462cb9-bf0b-a27f-38b0-4e8142d42865@ti.com>
Date: Mon, 5 Jun 2023 14:19:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [meta-ti] [kirkstone][PATCH] meta-ti-bsp: Add recipe for
 u-boot-ti-jailhouse and linux-ti-jailhouse
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        <p-bhagat@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <c-shilwant@ti.com>, <s-adivi@ti.com>,
        <khasim@ti.com>, <g-gupta@ti.com>
References: <20230602092932.2576466-1-p-bhagat@ti.com>
 <20230602122130.GN9226@denix.org>
 <feec212b-1db4-b5ab-4cce-13a63924bf84@ti.com>
Content-Language: en-US
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <feec212b-1db4-b5ab-4cce-13a63924bf84@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 355JJNKN098250
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 05 Jun 2023 19:19:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16668



On 6/2/2023 12:08 PM, Ryan Eatmon wrote:
>=20
>=20
> On 6/2/2023 7:21, Denys Dmytriyenko wrote:
>> On Fri, Jun 02, 2023 at 02:59:32PM +0530, Paresh Bhagat via=20
>> lists.yoctoproject.org wrote:
>>> Add a recipe for u-boot-ti-jailhouse and linux-ti-jailhouse which=20
>>> contains
>>> patches used for jailhouse. These will be used to build jailhouse ima=
ge.
>>>
>>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
>>> ---
>>> =C2=A0 .../u-boot/u-boot-ti-jailhouse_2023.04.bb=C2=A0=C2=A0=C2=A0=C2=
=A0 | 11 ++++++
>>> =C2=A0 .../linux/linux-ti-jailhouse-6.1/defconfig=C2=A0=C2=A0=C2=A0 |=
=C2=A0 2 +
>>> =C2=A0 .../linux/linux-ti-jailhouse-6.1/k3/defconfig |=C2=A0 2 +
>>> =C2=A0 .../linux-ti-jailhouse-6.1/omapl138/defconfig |=C2=A0 1 +
>>> =C2=A0 .../linux/linux-ti-jailhouse_6.1.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 37 +++++++++++++++++++

1. Can you clarify what is the upstream path for the uboot and kernel=20
changes that is carried in this forked branches?

2. Are you sure that these forked branches and repo will have only=20
jailhouse and no other future product focused branches for other=20
demo/produce-enhancement projects?

2.1 My recommendation is to name the .bb recipes as generic product=20
names In anticipation of similar future branches for specific product=20
features if exists.

Example on how beagleboard.org u-boot recipe for ai64 vs play is=20
maintained at
https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/recipes-bsp/u-boot/=
u-boot-bb.org_git.bb?h=3Dkirkstone=20



>>> =C2=A0 5 files changed, 53 insertions(+)
>>> =C2=A0 create mode 100644=20
>>> meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb
>>> =C2=A0 create mode 100644=20
>>> meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/defconfig
>>> =C2=A0 create mode 100644=20
>>> meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/k3/defconfig
>>> =C2=A0 create mode 100644=20
>>> meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/omapl138/defc=
onfig
>>> =C2=A0 create mode 100644=20
>>> meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse_6.1.bb
>>>
>>> diff --git=20
>>> a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb=20
>>> b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb
>>> new file mode 100644
>>> index 00000000..be374108
>>> --- /dev/null
>>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb
>>> @@ -0,0 +1,11 @@
>>> +require u-boot-ti.inc
>>> +
>>> +LIC_FILES_CHKSUM =3D=20
>>> "file://Licenses/README;md5=3D2ca5f2c35c8cc335f0a19756634782f1"
>>> +
>>> +PR =3D "r0"
>>> +
>>> +BRANCH =3D "ti-u-boot-2023.04-jailhouse"
>>> +
>>> +UBOOT_GIT_URI =3D "git://git.ti.com/git/processor-sdk/u-boot.git"
>>> +
>>> +SRCREV =3D "79615e1c99b9aa73948f811f5f866cff2e34dc37"
>>> diff --git=20
>>> a/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/defconfig=20
>>> b/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/defconfig
>>> new file mode 100644
>>> index 00000000..24b53cf7
>>> --- /dev/null
>>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/defconf=
ig
>>> @@ -0,0 +1,2 @@
>>> +use-kernel-config=3Dmulti_v7_defconfig
>>> +config-fragment=3Dkernel/configs/ti_multi_v7_prune.config
>>> diff --git=20
>>> a/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/k3/defconfi=
g b/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/k3/defconfig
>>> new file mode 100644
>>> index 00000000..ef1d3efd
>>> --- /dev/null
>>> +++=20
>>> b/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/k3/defconfi=
g
>>> @@ -0,0 +1,2 @@
>>> +use-kernel-config=3Ddefconfig
>>> +config-fragment=3Dkernel/configs/ti_arm64_prune.config
>>> diff --git=20
>>> a/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/omapl138/de=
fconfig b/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/omapl13=
8/defconfig
>>> new file mode 100644
>>> index 00000000..099493af
>>> --- /dev/null
>>> +++=20
>>> b/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/omapl138/de=
fconfig
>>> @@ -0,0 +1 @@
>>> +use-kernel-config=3Ddavinci_all_defconfig
>>> diff --git=20
>>> a/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse_6.1.bb=20
>>> b/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse_6.1.bb
>>> new file mode 100644
>>> index 00000000..85eaba25
>>> --- /dev/null
>>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse_6.1.bb
>>> @@ -0,0 +1,37 @@
>>
>> Can you do it similarly to linux-ti-staging-rt recipe by not=20
>> duplicating the
>> entire base recipe?
>=20
> I was going to ask the same question.
>=20
>>
>>> +SECTION =3D "kernel"
>>> +SUMMARY =3D "Linux kernel for jailhouse for TI devices"
>>> +LICENSE =3D "GPL-2.0-only"
>>> +LIC_FILES_CHKSUM =3D=20
>>> "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7e46"
>>> +
>>> +COMPATIBLE_MACHINE =3D "am62xx-evm"
>>> +
>>> +inherit kernel_vendor_dtb
>>> +
>>> +require recipes-kernel/linux/setup-defconfig.inc
>>> +require recipes-kernel/linux/kernel-rdepends.inc
>>> +require recipes-kernel/linux/ti-kernel.inc
>>> +include ${@ 'recipes-kernel/linux/ti-kernel-devicetree-prefix.inc'=20
>>> if d.getVar('KERNEL_DEVICETREE_PREFIX') else ''}
>>> +
>>> +DEPENDS +=3D "gmp-native libmpc-native"
>>> +
>>> +# Look in the generic major.minor directory for files
>>> +FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-6.1:"
>>> +
>>> +KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT} \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ${EXTRA_DTC_ARGS}"
>>> +
>>> +S =3D "${WORKDIR}/git"
>>> +
>>> +BRANCH =3D "ti-linux-6.1.y-jailhouse"
>>> +
>>> +SRCREV =3D "0ed0dec2462b805b0188fe080895adc437871549"
>>> +PV =3D "6.1.26+git${SRCPV}"
>>> +
>>> +# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a=20
>>> rebuild
>>> +MACHINE_KERNEL_PR:append =3D "b"
>>> +PR =3D "${MACHINE_KERNEL_PR}"
>>> +
>>> +KERNEL_GIT_URI =3D "git://git.ti.com/git/processor-sdk/linux.git"
>>> +KERNEL_GIT_PROTOCOL =3D "https"
>>> +SRC_URI +=3D=20
>>> "${KERNEL_GIT_URI};protocol=3D${KERNEL_GIT_PROTOCOL};branch=3D${BRANC=
H} \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 f=
ile://defconfig"
>>> --=20
>>> 2.34.1
>=20

