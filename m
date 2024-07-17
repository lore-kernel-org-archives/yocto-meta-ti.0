Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08535C3DA59
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 00:40:31 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.4908.1721176826580549588
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 16 Jul 2024 17:40:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=Q1w75/Jb;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46H0eKDv059629;
	Tue, 16 Jul 2024 19:40:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721176820;
	bh=pAfcEZ8Sj2ghDghBkBQnQw3eyRGAlVfUqMFN8ILZjLs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Q1w75/JbzQnonW1ivssQuUTjxFTtefFpXiqXV0i/fBKN+GUDzAMhJeUh9FDfJMmLu
	 6a9YX3sVtmu1J8QvOsyATvEn3CvcRgGTlZd4AySLHL7QnK0KeF/xUNAeQVtEzeZ0Pn
	 YSsSoF6X5JoYAHk3LD0ky8S1spWZOkT7y5iwcHNo=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46H0eJiA022184
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 Jul 2024 19:40:19 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 16
 Jul 2024 19:40:19 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 16 Jul 2024 19:40:19 -0500
Received: from [10.249.34.122] ([10.249.34.122])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46H0eJgD023610;
	Tue, 16 Jul 2024 19:40:19 -0500
Message-ID: <7d33e0ea-0eb8-4529-a261-e39231cbff9b@ti.com>
Date: Tue, 16 Jul 2024 19:40:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH] ti-ipc: Fix "buildpaths" QA error
To: Khem Raj <raj.khem@gmail.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20240716194532.26124-1-reatmon@ti.com>
 <CAMKF1sqYD1BRcqxR=K9VsfXnWnqOTvS5H4de2qQ1mvj2qTcnkw@mail.gmail.com>
 <17E2D06D8D9D55DA.6764@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <17E2D06D8D9D55DA.6764@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 46H0eKDv059629
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 17 Jul 2024 00:40:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17871



On 7/16/2024 4:59 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
>=20
>=20
> On 7/16/2024 4:58 PM, Khem Raj wrote:
>> On Tue, Jul 16, 2024 at 12:45=E2=80=AFPM Ryan Eatmon via
>> lists.yoctoproject.org <reatmon=3Dti.com@lists.yoctoproject.org> wrote=
:
>>>
>>> Referring to the TI specific kernel header file via -I${UNPACKDIR}
>>> causes a "buildpaths" QA error.=C2=A0 Solution is to copy the file fr=
om
>>> UNPACKDIR into the S dir at the start of each compile, and then fix t=
he
>>> patch to make sure the #include is correct for this new location.
>>>
>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>> ---
>>> =C2=A0 ...1-MmRpc-Stop-looking-for-rpmsg_rpc.h-in-the-kernel.patch | =
2 +-
>>> =C2=A0 meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 6 ++++--
>>> =C2=A0 2 files changed, 5 insertions(+), 3 deletions(-)
>>>
>>> diff --git=20
>>> a/meta-ti-bsp/recipes-ti/ipc/ti-ipc/0001-MmRpc-Stop-looking-for-rpmsg=
_rpc.h-in-the-kernel.patch b/meta-ti-bsp/recipes-ti/ipc/ti-ipc/0001-MmRpc=
-Stop-looking-for-rpmsg_rpc.h-in-the-kernel.patch
>>> index 522ad5e4..6d84cfb4 100644
>>> ---=20
>>> a/meta-ti-bsp/recipes-ti/ipc/ti-ipc/0001-MmRpc-Stop-looking-for-rpmsg=
_rpc.h-in-the-kernel.patch
>>> +++=20
>>> b/meta-ti-bsp/recipes-ti/ipc/ti-ipc/0001-MmRpc-Stop-looking-for-rpmsg=
_rpc.h-in-the-kernel.patch
>>> @@ -26,7 +26,7 @@ index 2df7420..10f496b 100644
>>> =C2=A0=C2=A0 #endif
>>>
>>> =C2=A0 -#include linux_include(KERNEL_INSTALL_DIR,rpmsg_rpc)
>>> -+#include "linux/rpmsg_rpc.h"
>>> ++#include "rpmsg_rpc.h"
>>>
>>> =C2=A0=C2=A0 #ifdef _linux_
>>> =C2=A0=C2=A0 #define linux _linux
>>> diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb=20
>>> b/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb
>>> index 11be09ea..e12ce273 100644
>>> --- a/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb
>>> +++ b/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb
>>> @@ -18,8 +18,6 @@ SRC_URI +=3D "file://tiipclad-daemon.sh \
>>>              =20
>>> file://0001-MmRpc-Stop-looking-for-rpmsg_rpc.h-in-the-kernel.patch \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "
>>>
>>> -CFLAGS +=3D "-I${UNPACKDIR}=3D"
>>> -
>>
>> Perhaps adding=C2=A0 -fdebug-prefix-map=3D${UNPACKDIR}=3D${TARGET_DBGS=
RC_DIR}
>> in CFLAGS is all you need.
>=20
> I'll try it.=C2=A0 Thanks.
>=20

Looks like that works.  v2 incoming.

>=20
>>> =C2=A0 DAEMON =3D "UNKNOWN"
>>> =C2=A0 DAEMON:dra7xx =3D "lad_dra7xx"
>>> =C2=A0 DAEMON:omapl138 =3D "lad_omapl138"
>>> @@ -40,6 +38,10 @@ do_configure() {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 oe_runconf
>>> =C2=A0 }
>>>
>>> +do_compile:prepend() {
>>> +=C2=A0=C2=A0=C2=A0 cp ${UNPACKDIR}/linux/rpmsg_rpc.h=20
>>> ${S}/packages/ti/ipc/mm/rpmsg_rpc.h
>>> +}
>>> +
>>> =C2=A0 do_install:append() {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}${sysconfdir}/init.d/
>>>
>>> --=20
>>> 2.17.1
>>>
>>>
>>>
>>>
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17870): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/17870
> Mute This Topic: https://lists.yoctoproject.org/mt/107259201/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti=
.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

