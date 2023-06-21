Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4B5DEB64D7
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 17:17:33 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.4601.1687367846724245239
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Jun 2023 10:17:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=Tjkv96ck;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35LHHM9j016812;
	Wed, 21 Jun 2023 12:17:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687367842;
	bh=7Z/R46+MgeW4mty36R/aRd04KR7WaUHY3YG1PWjmZeA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Tjkv96ckTMWeg6as6EytDC4jRiOaoBb7HVrpFXmkZJHRdTaf4y4ZgIDrqhCpZ5ukm
	 W5tuCAFKSk67J3nufYk71NyO1epZdPXj8y3py/lBZt4K2GtnKVk0WKwhz7d+JX7vn2
	 1iTndRx8tefsI47/a2UdtNLIPs/2u9VyelE/HiEs=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35LHHMNO011333
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 21 Jun 2023 12:17:22 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 21
 Jun 2023 12:17:22 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 21 Jun 2023 12:17:22 -0500
Received: from [10.249.34.224] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35LHHMiA040294;
	Wed, 21 Jun 2023 12:17:22 -0500
Message-ID: <91caa8d1-e17c-6e75-8b17-2e222471a420@ti.com>
Date: Wed, 21 Jun 2023 12:17:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [meta-ti][master/kirkstone][PATCH v2] pruhsr-fw: SR2.0: Add new
 firmware
Content-Language: en-US
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20230620221555.4561-1-reatmon@ti.com>
 <addccf44-0b38-4acc-8b86-e412b33c03a5@ti.com>
 <20230621164431.GM1518@denix.org>
 <299043e4-4b75-6d30-55b0-1c90aeb57616@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <299043e4-4b75-6d30-55b0-1c90aeb57616@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 35LHHM9j016812
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 21 Jun 2023 17:17:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16762



On 6/21/2023 11:54 AM, Andrew Davis wrote:
> On 6/21/23 11:44 AM, Denys Dmytriyenko wrote:
>> On Wed, Jun 21, 2023 at 09:59:53AM -0500, Andrew Davis via=20
>> lists.yoctoproject.org wrote:
>>> On 6/20/23 5:15 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
>>>> We need to package up new HSR firmware for am65x-sr2.=C2=A0 Add depe=
ndencies
>>>> for them on the correct platforms.
>>>>
>>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>>> ---
>>>> v2: Names of firmware were changed to match existing filenames.
>>>>
>>>> =C2=A0 .../pruhsr-fw/pruhsr-fw_am65x-sr2_git.bb=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 34=20
>>>> +++++++++++++++++++
>>>> =C2=A0 .../recipes-kernel/linux/kernel-rdepends.inc=C2=A0 |=C2=A0 4 =
+--
>>>> =C2=A0 2 files changed, 36 insertions(+), 2 deletions(-)
>>>> =C2=A0 create mode 100644=20
>>>> meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_am65x-sr2_git.bb
>>>>
>>>> diff --git=20
>>>> a/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_am65x-sr2_git.bb=20
>>>> b/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_am65x-sr2_git.bb
>>>> new file mode 100644
>>>> index 00000000..c31af832
>>>> --- /dev/null
>>>> +++ b/meta-ti-bsp/recipes-bsp/pruhsr-fw/pruhsr-fw_am65x-sr2_git.bb
>>>> @@ -0,0 +1,34 @@
>>>> +SUMMARY =3D "PRU HSR firmware for AM65xx SR2.0"
>>>> +
>>>> +require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>>>> +
>>>> +PV =3D "${PRUETH_FW_AM65X_SR2_VERSION}"
>>>> +PR =3D "${INC_PR}.0"
>>>> +
>>>> +CLEANBROKEN =3D "1"
>>>> +
>>>> +COMPATIBLE_MACHINE =3D "am65xx-evm|am64xx"
>>>> +
>>>> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>>
>>> Is this needed? I don't think the package changes based on machine he=
re.
>>
>> Good question. It can be both ways with own pros and cons:
>>
>> 1. Don't make it machine-specific. Either one of am64 or am65 will=20
>> build the
>> package once and it will be Aarch64-generic. So, same package with the=
=20
>> same
>> binaries inside can be used on am64 and am65. But COMPATIBLE_MACHINE i=
s a
>> build-time guard, so nothing prevents installing this Aarch64-generic=20
>> package
>> on other platforms - will that work? would there be adverse effects?
>>
>=20
> There is no ill effects to installing this on other platforms, they are=
=20
> just
> firmware blobs put in the firmware dir. No worse than installing a firm=
ware
> package for hardware you don't have installed (which we all do on our P=
Cs).
>=20
> I'd even say we should drop COMPATIBLE_MACHINE. Sure this firmware=20
> doesn't do
> anything for machines other than AM65/AM64, but no harm either, so it i=
s=20
> not
> "incompatible". And the job of installing this only on machines that=20
> need it
> is already handled in kernel-rdepends.inc below.

All of these pru recipe should be cleaned up.  I just did not want to do=20
that clean up at this time as it involves a lot of files.  So I just=20
copied an existing pru recipe for am65 sr2.  But I agree, we should=20
clean all of these up in the longer term.

> Andrew
>=20
>> 2. Make it machine-specific (as it is now) - it will be built/packaged=
=20
>> twice,
>> separate for am64 and am65, and no other platform will be allowed to=20
>> build it
>> due to COMPATIBLE_MACHINE. Moreover, at run-time, no other platform=20
>> will be
>> allowed to even install either of the packages, since they are=20
>> specific to
>> each of those 2 platforms.
>>
>> So, you decide which way is the best option in this case...
>>
>>
>>>> +S =3D "${WORKDIR}/git"
>>>> +
>>>> +TARGET =3D " \
>>>> +=C2=A0=C2=A0=C2=A0 am65x-sr2-pru0-pruhsr-fw.elf \
>>>> +=C2=A0=C2=A0=C2=A0 am65x-sr2-pru1-pruhsr-fw.elf \
>>>> +=C2=A0=C2=A0=C2=A0 am65x-sr2-rtu0-pruhsr-fw.elf \
>>>> +=C2=A0=C2=A0=C2=A0 am65x-sr2-rtu1-pruhsr-fw.elf \
>>>> +=C2=A0=C2=A0=C2=A0 am65x-sr2-txpru0-pruhsr-fw.elf \
>>>> +=C2=A0=C2=A0=C2=A0 am65x-sr2-txpru1-pruhsr-fw.elf \
>>>> +"
>>>> +
>>>> +do_install() {
>>>> +=C2=A0=C2=A0=C2=A0 install -d ${D}${nonarch_base_libdir}/firmware/t=
i-pruss
>>>> +=C2=A0=C2=A0=C2=A0 for f in ${TARGET}; do
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 0644 ${S}/ti-=
pruss/$f=20
>>>> ${D}${nonarch_base_libdir}/firmware/ti-pruss/$f
>>>> +=C2=A0=C2=A0=C2=A0 done
>>>> +}
>>>> +
>>>> +FILES:${PN} =3D "${nonarch_base_libdir}/firmware"
>>>> +
>>>> +INSANE_SKIP:${PN} =3D "arch"
>>>> diff --git a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc=20
>>>> b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
>>>> index d2dcc3e5..7c8f3171 100644
>>>> --- a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
>>>> +++ b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
>>>> @@ -16,8 +16,8 @@ RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am57xx=
=20
>>>> =3D " prueth-fw prusw-fw pruhsr
>>>> =C2=A0 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:ti43x =3D " pruet=
h-fw=20
>>>> pruhsr-fw pruprp-fw"
>>>> =C2=A0 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:ti33x =3D " pruet=
h-fw=20
>>>> pruhsr-fw pruprp-fw"
>>>> =C2=A0 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am65xx =3D "=20
>>>> prueth-fw-am65x"
>>>> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am65xx-evm =3D "=20
>>>> prueth-fw-am65x-sr2 prusw-fw-am65x-sr2"
>>>> -RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am64xx =3D "=20
>>>> prueth-fw-am65x-sr2"
>>>> +RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am65xx-evm =3D "=20
>>>> prueth-fw-am65x-sr2 pruhsr-fw-am65x-sr2 prusw-fw-am65x-sr2"
>>>> +RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am64xx =3D "=20
>>>> prueth-fw-am65x-sr2 pruhsr-fw-am65x-sr2"
>>>> =C2=A0 # Add run-time dependency for Cadence MHDP firmware to the ro=
otfs
>>>> =C2=A0 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721e =3D "=20
>>>> cadence-mhdp-fw"
>>>>
>>>>
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#16760):=20
>>>> https://lists.yoctoproject.org/g/meta-ti/message/16760
>>>> Mute This Topic: https://lists.yoctoproject.org/mt/99665494/3619733
>>>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>>>> Unsubscribe:=20
>>>> https://lists.yoctoproject.org/g/meta-ti/leave/6695306/3619733/20337=
73410/xyzzy [afd@ti.com]
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

