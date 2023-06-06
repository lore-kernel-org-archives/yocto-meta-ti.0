Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF8E3C7EE29
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 12:12:30 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.7081.1686053548587612978
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 Jun 2023 05:12:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=Lj/WVT2T;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: p-bhagat@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 356CCRSN116262
	for <meta-ti@lists.yoctoproject.org>; Tue, 6 Jun 2023 07:12:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686053547;
	bh=+q/heyTzGtsZFmaGxED+v5BCKp3SdrJNSVGdIG8O764=;
	h=Date:Subject:To:References:CC:From:In-Reply-To;
	b=Lj/WVT2TVSQ6XZX8VKzQYZojmv9n++I8DWFl7WsWqA2KuMHmpjYUljYgOUcXPY72e
	 VswrkYdDLvMGGYeORQ5yUYa5i4stv8ofFbU8wLIA5v31Iy0OMyZeQlqyjZYrdn5UFj
	 RYEH1nu4YBdeUmMVc+gy9pCOFMKsDYrteOCzk+ps=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 356CCRCE024744
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 6 Jun 2023 07:12:27 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 Jun 2023 07:12:27 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 Jun 2023 07:12:27 -0500
Received: from [172.24.145.229] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 356CCOQl017817;
	Tue, 6 Jun 2023 07:12:25 -0500
Message-ID: <8561ca8e-4885-c44d-6022-a20aedffb207@ti.com>
Date: Tue, 6 Jun 2023 17:42:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-ti] [kirkstone][PATCH] meta-ti-bsp: Add recipe for
 u-boot-ti-jailhouse and linux-ti-jailhouse
Content-Language: en-US
To: "Bajjuri, Praneeth" <praneeth@ti.com>, <reatmon@ti.com>
References: <20230602092932.2576466-1-p-bhagat@ti.com>
 <20230602122130.GN9226@denix.org>
 <feec212b-1db4-b5ab-4cce-13a63924bf84@ti.com>
 <32462cb9-bf0b-a27f-38b0-4e8142d42865@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <c-shilwant@ti.com>, <s-adivi@ti.com>,
        <khasim@ti.com>, <g-gupta@ti.com>
From: Paresh Bhagat <p-bhagat@ti.com>
In-Reply-To: <32462cb9-bf0b-a27f-38b0-4e8142d42865@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 356CCRSN116262
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 06 Jun 2023 12:12:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16674

Hi,

On 06/06/23 00:49, Bajjuri, Praneeth wrote:
>
>
> On 6/2/2023 12:08 PM, Ryan Eatmon wrote:
>>
>>
>> On 6/2/2023 7:21, Denys Dmytriyenko wrote:
>>> On Fri, Jun 02, 2023 at 02:59:32PM +0530, Paresh Bhagat via=20
>>> lists.yoctoproject.org wrote:
>>>> Add a recipe for u-boot-ti-jailhouse and linux-ti-jailhouse which=20
>>>> contains
>>>> patches used for jailhouse. These will be used to build jailhouse=20
>>>> image.
>>>>
>>>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
>>>> ---
>>>> =C2=A0 .../u-boot/u-boot-ti-jailhouse_2023.04.bb=C2=A0=C2=A0=C2=A0=C2=
=A0 | 11 ++++++
>>>> =C2=A0 .../linux/linux-ti-jailhouse-6.1/defconfig=C2=A0=C2=A0=C2=A0 =
|=C2=A0 2 +
>>>> =C2=A0 .../linux/linux-ti-jailhouse-6.1/k3/defconfig |=C2=A0 2 +
>>>> =C2=A0 .../linux-ti-jailhouse-6.1/omapl138/defconfig |=C2=A0 1 +
>>>> =C2=A0 .../linux/linux-ti-jailhouse_6.1.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 37=20
>>>> +++++++++++++++++++
>
> 1. Can you clarify what is the upstream path for the uboot and kernel=20
> changes that is carried in this forked branches?
There are patches to core kernel memory manager which cannot go upstream=20
easily unless Siemens takes it.
>
> 2. Are you sure that these forked branches and repo will have only=20
> jailhouse and no other future product focused branches for other=20
> demo/produce-enhancement projects?
We will modify the recipe to have generic name so later any new feature=20
can be hosted in separate branch in linux/u-boot repos. With the help of=20
MACHINE_FEATURE same recipe with feature specific branch can be used.=20
Branches: ti-linux-6.1.y-jailhouse & ti-u-boot-2023.04-jailhouse - these=20
will have only have jailhouse.
>
> 2.1 My recommendation is to name the .bb recipes as generic product=20
> names In anticipation of similar future branches for specific product=20
> features if exists.
>
> Example on how beagleboard.org u-boot recipe for ai64 vs play is=20
> maintained at
> https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/recipes-bsp/u-boo=
t/u-boot-bb.org_git.bb?h=3Dkirkstone=20
>

we will name the recipes as linux-ti-extras and u-boot-ti-extras.

i will send a v3 some time today to include jailhouse via machine=20
feature and also with updated recipe names.

Thanks all

>
>
>>>> =C2=A0 5 files changed, 53 insertions(+)
>>>> =C2=A0 create mode 100644=20
>>>> meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb
>>>> =C2=A0 create mode 100644=20
>>>> meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/defconfig
>>>> =C2=A0 create mode 100644=20
>>>> meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/k3/defconfig
>>>> =C2=A0 create mode 100644=20
>>>> meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/omapl138/def=
config
>>>> =C2=A0 create mode 100644=20
>>>> meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse_6.1.bb
>>>>
>>>> diff --git=20
>>>> a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb=20
>>>> b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb
>>>> new file mode 100644
>>>> index 00000000..be374108
>>>> --- /dev/null
>>>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb
>>>> @@ -0,0 +1,11 @@
>>>> +require u-boot-ti.inc
>>>> +
>>>> +LIC_FILES_CHKSUM =3D=20
>>>> "file://Licenses/README;md5=3D2ca5f2c35c8cc335f0a19756634782f1"
>>>> +
>>>> +PR =3D "r0"
>>>> +
>>>> +BRANCH =3D "ti-u-boot-2023.04-jailhouse"
>>>> +
>>>> +UBOOT_GIT_URI =3D "git://git.ti.com/git/processor-sdk/u-boot.git"
>>>> +
>>>> +SRCREV =3D "79615e1c99b9aa73948f811f5f866cff2e34dc37"
>>>> diff --git=20
>>>> a/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/defconfig=20
>>>> b/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/defconfig
>>>> new file mode 100644
>>>> index 00000000..24b53cf7
>>>> --- /dev/null
>>>> +++=20
>>>> b/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/defconfig
>>>> @@ -0,0 +1,2 @@
>>>> +use-kernel-config=3Dmulti_v7_defconfig
>>>> +config-fragment=3Dkernel/configs/ti_multi_v7_prune.config
>>>> diff --git=20
>>>> a/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/k3/defconf=
ig=20
>>>> b/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/k3/defconf=
ig
>>>> new file mode 100644
>>>> index 00000000..ef1d3efd
>>>> --- /dev/null
>>>> +++=20
>>>> b/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/k3/defconf=
ig
>>>> @@ -0,0 +1,2 @@
>>>> +use-kernel-config=3Ddefconfig
>>>> +config-fragment=3Dkernel/configs/ti_arm64_prune.config
>>>> diff --git=20
>>>> a/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/omapl138/d=
efconfig=20
>>>> b/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/omapl138/d=
efconfig=20
>>>>
>>>> new file mode 100644
>>>> index 00000000..099493af
>>>> --- /dev/null
>>>> +++=20
>>>> b/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse-6.1/omapl138/d=
efconfig
>>>> @@ -0,0 +1 @@
>>>> +use-kernel-config=3Ddavinci_all_defconfig
>>>> diff --git=20
>>>> a/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse_6.1.bb=20
>>>> b/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse_6.1.bb
>>>> new file mode 100644
>>>> index 00000000..85eaba25
>>>> --- /dev/null
>>>> +++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse_6.1.bb
>>>> @@ -0,0 +1,37 @@
>>>
>>> Can you do it similarly to linux-ti-staging-rt recipe by not=20
>>> duplicating the
>>> entire base recipe?
>>
>> I was going to ask the same question.
>>
>>>
>>>> +SECTION =3D "kernel"
>>>> +SUMMARY =3D "Linux kernel for jailhouse for TI devices"
>>>> +LICENSE =3D "GPL-2.0-only"
>>>> +LIC_FILES_CHKSUM =3D=20
>>>> "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7e46"
>>>> +
>>>> +COMPATIBLE_MACHINE =3D "am62xx-evm"
>>>> +
>>>> +inherit kernel_vendor_dtb
>>>> +
>>>> +require recipes-kernel/linux/setup-defconfig.inc
>>>> +require recipes-kernel/linux/kernel-rdepends.inc
>>>> +require recipes-kernel/linux/ti-kernel.inc
>>>> +include ${@ 'recipes-kernel/linux/ti-kernel-devicetree-prefix.inc'=20
>>>> if d.getVar('KERNEL_DEVICETREE_PREFIX') else ''}
>>>> +
>>>> +DEPENDS +=3D "gmp-native libmpc-native"
>>>> +
>>>> +# Look in the generic major.minor directory for files
>>>> +FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-6.1:"
>>>> +
>>>> +KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT} \
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ${EXTRA_DTC_ARGS}"
>>>> +
>>>> +S =3D "${WORKDIR}/git"
>>>> +
>>>> +BRANCH =3D "ti-linux-6.1.y-jailhouse"
>>>> +
>>>> +SRCREV =3D "0ed0dec2462b805b0188fe080895adc437871549"
>>>> +PV =3D "6.1.26+git${SRCPV}"
>>>> +
>>>> +# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause=20
>>>> a rebuild
>>>> +MACHINE_KERNEL_PR:append =3D "b"
>>>> +PR =3D "${MACHINE_KERNEL_PR}"
>>>> +
>>>> +KERNEL_GIT_URI =3D "git://git.ti.com/git/processor-sdk/linux.git"
>>>> +KERNEL_GIT_PROTOCOL =3D "https"
>>>> +SRC_URI +=3D=20
>>>> "${KERNEL_GIT_URI};protocol=3D${KERNEL_GIT_PROTOCOL};branch=3D${BRAN=
CH} \
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
file://defconfig"
>>>> --=20
>>>> 2.34.1
>>

