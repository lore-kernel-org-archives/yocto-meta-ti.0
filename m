Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A054CC3DA64
	for <webhook@archiver.kernel.org>; Sun, 28 Jul 2024 15:44:47 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.36781.1722181477731858934
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 28 Jul 2024 08:44:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=Yn5NEMSL;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46SFiWHv077581;
	Sun, 28 Jul 2024 10:44:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722181472;
	bh=paEOSEwNXZ8G2puFgs8TdA+jcezMwyWz26TaeiwVTkA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Yn5NEMSLIcbX5j1bBTGSUsNbmWS0OEkMShWe0J9Ia3NUXTqhlazu8DxuQApild2A3
	 YviSJKZKuRiohtccSiVbkCjWeVAMM4Dj5scysfrOTNzK+v6r7fGCs3lnzMGETKPjhX
	 tMapnuMe9ees2ipHpBl9UcW+5jvjSKsqeXYRVBIY=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46SFiWD3015681
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 28 Jul 2024 10:44:32 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 28
 Jul 2024 10:44:31 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 28 Jul 2024 10:44:31 -0500
Received: from [10.250.32.187] ([10.250.32.187])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46SFiV0n128509;
	Sun, 28 Jul 2024 10:44:31 -0500
Message-ID: <d680c4d8-ab28-4c4a-8221-850863333deb@ti.com>
Date: Sun, 28 Jul 2024 10:44:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/scarthgap][PATCH v2] linux: Manage the kernel
 patches using the BSP system
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>
References: <20240719151018.8521-1-reatmon@ti.com>
 <20240724213529.GT17572@denix.org>
 <17E54FEAFE628178.22625@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <17E54FEAFE628178.22625@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 46SFiWHv077581
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sun, 28 Jul 2024 15:44:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17914



On 7/24/2024 8:18 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
>=20
> On 7/24/2024 4:35 PM, Denys Dmytriyenko wrote:
>> On Fri, Jul 19, 2024 at 10:10:18AM -0500, Ryan Eatmon via=20
>> lists.yoctoproject.org wrote:
>>> Applying the patches to all kernels is not going to work.=C2=A0 Each =
kernel
>>> might need different patches to address reproducibility issues.
>>
>> Can you also backport this to scarthgap, as these patches fon't apply=20
>> cleanly
>> to bb.org and currently break Beagle builds. Thanks.
>=20
> It is staged in next waiting for a CICD run.

Finally promoted.  It is now on scarthgap.

>=20
>>
>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>> ---
>>> v2: Fix BSP tag for bsp-ti-6_6
>>>
>>> =C2=A0 meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc | 12 ++++++++--=
--
>>> =C2=A0 1 file changed, 8 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc=20
>>> b/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
>>> index f24fbe51..1831ba66 100644
>>> --- a/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
>>> +++ b/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
>>> @@ -13,8 +13,12 @@ EXTRA_DTC_ARGS +=3D "${@get_extra_dtc_args(d)}"
>>> =C2=A0 KERNEL_DTBDEST =3D "${KERNEL_IMAGEDEST}/dtb"
>>> =C2=A0 KERNEL_DTBVENDORED =3D "1"
>>> -SRC_URI:append =3D " \
>>> -file://0001-lib-build_OID_registry-fix-reproducibility-issues.patch =
\
>>> -file://0001-vt-conmakehash-improve-reproducibility.patch \
>>> -file://0001-pnmtologo-use-relocatable-file-name.patch \
>>> +KERNEL_PATCHES =3D ""
>>> +
>>> +KERNEL_PATCHES:bsp-ti-6_6 =3D " \
>>> +   =20
>>> file://0001-lib-build_OID_registry-fix-reproducibility-issues.patch \
>>> +=C2=A0=C2=A0=C2=A0 file://0001-vt-conmakehash-improve-reproducibilit=
y.patch \
>>> +=C2=A0=C2=A0=C2=A0 file://0001-pnmtologo-use-relocatable-file-name.p=
atch \
>>> =C2=A0 "
>>> +
>>> +SRC_URI:append =3D " ${KERNEL_PATCHES} "
>>> --=20
>>> 2.17.1
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17906): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/17906
> Mute This Topic: https://lists.yoctoproject.org/mt/107436568/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti=
.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

