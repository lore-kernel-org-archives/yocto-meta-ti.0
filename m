Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D294C433EF
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 00:30:41 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.5202.1651710636462345619
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 May 2022 17:30:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com
 header.s=ti-com-17q1 header.b=bh5ZBi7c;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2450UU2L069963;
	Wed, 4 May 2022 19:30:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651710630;
	bh=cyowoWuBDt2GQA1rRTgRbnjUMzY+MlQK0XYNS4nltCE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=bh5ZBi7cSVJkeHkRH0Mk/O+6y1c2/FxbImoPxarHi9NCqxpkK85ig7FSAwCgSyPCm
	 YmF6GQf7JjddacJRE3ehcXhrUY46S4al+1tiCEBzaarmlBHHTeSPm1AWfx1ywctoMV
	 Lw7jgOSk4PkWuegiqYVwsmTMYXJ6SyYbPM3P2aMg=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2450UU8J096191
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 4 May 2022 19:30:30 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 4
 May 2022 19:30:29 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 4 May 2022 19:30:29 -0500
Received: from [10.247.28.135] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2450UTQS014748;
	Wed, 4 May 2022 19:30:29 -0500
Message-ID: <686c5542-f556-c162-534c-5d41b81d953f@ti.com>
Date: Wed, 4 May 2022 19:30:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [meta-ti][dunfell][PATCH] recipes-bsp: tifs-lpm-stub: Introduce
 new recipe
Content-Language: en-US
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>,
        "Gerlach, Dave" <d-gerlach@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
References: <20220504213844.20764-1-reatmon@ti.com>
 <20220504214333.GG9834@denix.org>
 <c850f667-597e-ff43-c84a-17dde1afb0bb@ti.com>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <c850f667-597e-ff43-c84a-17dde1afb0bb@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id
 2450UU2L069963
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 05 May 2022 00:30:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14700



On 5/4/2022 4:49 PM, Ryan Eatmon wrote:
>=20
>=20
> On 5/4/2022 16:43, Denys Dmytriyenko wrote:
>> On Wed, May 04, 2022 at 04:38:44PM -0500, Ryan Eatmon via=20
>> lists.yoctoproject.org wrote:
>>> This firmware stub is required by the TI foundational security
>>> software while transitioning to low power mode.
>>>
>>> Add a recipe for this compatible with am62xx-evm
>>
>> Is it GP only FW?
>=20
> Not sure how to answer that.=C2=A0 I was just told to pick up this chan=
ge for=20
> the release and I cleaned it up to match a more consistent style.

Yes, this signed firmware is applicable for GP only.
We dont have a HS variant yet.

>=20
>>
>>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>> ---
>>> =C2=A0 recipes-bsp/ti-linux-fw/ti-linux-fw.inc=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 1 +
>>> =C2=A0 .../tifs-lpm-stub/tifs-lpm-stub_git.bb=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 24 +++++++++++++++++++
>>> =C2=A0 recipes-kernel/linux/kernel-rdepends.inc=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 4 ++++
>>> =C2=A0 3 files changed, 29 insertions(+)
>>> =C2=A0 create mode 100644 recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git=
.bb
>>>
>>> diff --git a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc=20
>>> b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>>> index 3ebdae30..47e76347 100644
>>> --- a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>>> +++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>>> @@ -18,6 +18,7 @@ GOODIX_FW_VERSION =3D "1.0.0.0"
>>> =C2=A0 CADENCE_MHDP_FW_VERSION =3D "1.2.17"
>>> =C2=A0 IMG_DEC_FW_VERSION =3D "1.0"
>>> =C2=A0 CNM_WAVE521_FW_VERSION =3D "1.0.00"
>>> +TIFS_LPM_STUB_FW_VERSION =3D "08.03.02"
>>> =C2=A0 TI_LINUX_FW_SRCREV ?=3D "917625c2721eef8677df9e47d919005b0d4f9=
3aa"
>>> =C2=A0 SRCREV =3D "${TI_LINUX_FW_SRCREV}"
>>> diff --git a/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb=20
>>> b/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb
>>> new file mode 100644
>>> index 00000000..642a8d3a
>>> --- /dev/null
>>> +++ b/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb
>>> @@ -0,0 +1,24 @@
>>> +SUMMARY =3D "TI Foundational security Low Power Management Stub"
>>> +
>>> +require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>>> +
>>> +PV =3D "${TIFS_LPM_STUB_FW_VERSION}"
>>> +PR =3D "${INC_PR}.0"
>>> +
>>> +CLEANBROKEN =3D "1"
>>> +
>>> +COMPATIBLE_MACHINE =3D "am62xx-evm"
>>> +
>>> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>> +
>>> +S =3D "${WORKDIR}/git"
>>> +
>>> +TARGET =3D "ti-fs-stub-firmware-am62x-gp-signed.bin"
>>> +
>>> +do_install() {
>>> +=C2=A0=C2=A0=C2=A0 install -d ${D}${base_libdir}/firmware/ti-sysfw/
>>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${S}/ti-sysfw/${TARGET}=20
>>> ${D}${base_libdir}/firmware/ti-sysfw/${TARGET}
>>> +}
>>> +
>>> +FILES_${PN} =3D "${base_libdir}/firmware"
>>> +
>>> diff --git a/recipes-kernel/linux/kernel-rdepends.inc=20
>>> b/recipes-kernel/linux/kernel-rdepends.inc
>>> index 522d9674..17aee4c2 100644
>>> --- a/recipes-kernel/linux/kernel-rdepends.inc
>>> +++ b/recipes-kernel/linux/kernel-rdepends.inc
>>> @@ -45,3 +45,7 @@ RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7 =3D =
"=20
>>> vxd-dec-fw"
>>> =C2=A0 # Add run-time dependency for Chips&Media Wave521 firmware to =
the=20
>>> rootfs
>>> =C2=A0 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j721s2-evm =3D "=20
>>> cnm-wave-fw"
>>> +
>>> +# Add run-time dependency for TIFS Low Power Module stub
>>> +RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am62xx-evm =3D "=20
>>> tifs-lpm-stub"
>>> +
>>> --=20
>>> 2.17.1
>=20

