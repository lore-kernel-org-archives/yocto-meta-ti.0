Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F163C3DA49
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 21:59:40 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.2103.1721167176236769918
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 16 Jul 2024 14:59:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=bLYxnsBR;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46GLxY0v045424;
	Tue, 16 Jul 2024 16:59:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721167174;
	bh=vg8uMsJFGgI0oHpsuSAztnb8jJu6J+ZU+niC/5R9+Yc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=bLYxnsBRzoJkI9O3ClFM2QYSNjR9eFHoerhEJ+z80tUXvHi+5XDLOhHt+61CWUEMy
	 jl16/w2kCJ/0YdZsJbHwblt1a9quwQzLeyoL47uGFdexeDatD7PijWF2qobt1ZNRWh
	 dwI5NeCigTbi8+3mkwhf04/EoYyBEdMie9dmdxWQ=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46GLxYsT062419
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 Jul 2024 16:59:34 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 16
 Jul 2024 16:59:34 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 16 Jul 2024 16:59:34 -0500
Received: from [10.249.34.122] ([10.249.34.122])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46GLxYvC027690;
	Tue, 16 Jul 2024 16:59:34 -0500
Message-ID: <8e8c232c-26b5-406d-8114-ba38d42bb511@ti.com>
Date: Tue, 16 Jul 2024 16:59:34 -0500
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
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <CAMKF1sqYD1BRcqxR=K9VsfXnWnqOTvS5H4de2qQ1mvj2qTcnkw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 46GLxY0v045424
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 16 Jul 2024 21:59:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17870



On 7/16/2024 4:58 PM, Khem Raj wrote:
> On Tue, Jul 16, 2024 at 12:45=E2=80=AFPM Ryan Eatmon via
> lists.yoctoproject.org <reatmon=3Dti.com@lists.yoctoproject.org> wrote:
>>
>> Referring to the TI specific kernel header file via -I${UNPACKDIR}
>> causes a "buildpaths" QA error.  Solution is to copy the file from
>> UNPACKDIR into the S dir at the start of each compile, and then fix th=
e
>> patch to make sure the #include is correct for this new location.
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   ...1-MmRpc-Stop-looking-for-rpmsg_rpc.h-in-the-kernel.patch | 2 +-
>>   meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb                    | 6 ++++=
--
>>   2 files changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-ipc/0001-MmRpc-Stop-looking=
-for-rpmsg_rpc.h-in-the-kernel.patch b/meta-ti-bsp/recipes-ti/ipc/ti-ipc/=
0001-MmRpc-Stop-looking-for-rpmsg_rpc.h-in-the-kernel.patch
>> index 522ad5e4..6d84cfb4 100644
>> --- a/meta-ti-bsp/recipes-ti/ipc/ti-ipc/0001-MmRpc-Stop-looking-for-rp=
msg_rpc.h-in-the-kernel.patch
>> +++ b/meta-ti-bsp/recipes-ti/ipc/ti-ipc/0001-MmRpc-Stop-looking-for-rp=
msg_rpc.h-in-the-kernel.patch
>> @@ -26,7 +26,7 @@ index 2df7420..10f496b 100644
>>    #endif
>>
>>   -#include linux_include(KERNEL_INSTALL_DIR,rpmsg_rpc)
>> -+#include "linux/rpmsg_rpc.h"
>> ++#include "rpmsg_rpc.h"
>>
>>    #ifdef _linux_
>>    #define linux _linux
>> diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb b/meta-ti-bsp/re=
cipes-ti/ipc/ti-ipc_git.bb
>> index 11be09ea..e12ce273 100644
>> --- a/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb
>> +++ b/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb
>> @@ -18,8 +18,6 @@ SRC_URI +=3D "file://tiipclad-daemon.sh \
>>               file://0001-MmRpc-Stop-looking-for-rpmsg_rpc.h-in-the-ke=
rnel.patch \
>>              "
>>
>> -CFLAGS +=3D "-I${UNPACKDIR}=3D"
>> -
>=20
> Perhaps adding  -fdebug-prefix-map=3D${UNPACKDIR}=3D${TARGET_DBGSRC_DIR=
}
> in CFLAGS is all you need.

I'll try it.  Thanks.



>>   DAEMON =3D "UNKNOWN"
>>   DAEMON:dra7xx =3D "lad_dra7xx"
>>   DAEMON:omapl138 =3D "lad_omapl138"
>> @@ -40,6 +38,10 @@ do_configure() {
>>       oe_runconf
>>   }
>>
>> +do_compile:prepend() {
>> +    cp ${UNPACKDIR}/linux/rpmsg_rpc.h ${S}/packages/ti/ipc/mm/rpmsg_r=
pc.h
>> +}
>> +
>>   do_install:append() {
>>       install -d ${D}${sysconfdir}/init.d/
>>
>> --
>> 2.17.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#17868): https://lists.yoctoproject.org/g/meta-ti/m=
essage/17868
>> Mute This Topic: https://lists.yoctoproject.org/mt/107259201/1997914
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [raj.khem@=
gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

