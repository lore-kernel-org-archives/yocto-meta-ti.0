Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87507C2BB3F
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 18:53:48 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.21668.1700074420331288456
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Nov 2023 10:53:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=mcIJh9L+;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3AFIrZ80033062;
	Wed, 15 Nov 2023 12:53:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1700074415;
	bh=2/FJr6q5z7Xvh45R2awSw8LBgUAzcq7EQ63Qo3+nRHo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=mcIJh9L+ua6qUqYB0fLmDQCHwA/Y6xST2cDFSgwcXYgh8jsnZD21XtCXsXrXeVRcl
	 eTD+P+kq6k0I3dHcx56JpexK3BBjlR5OrFFowYZew0Egp3p+BEKf7Y3TWlyTy35wTj
	 pEkWaY9oPesMBqowN67OQuVeg7T8w1X0oT//J800=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3AFIrZRX123362
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 Nov 2023 12:53:35 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 15
 Nov 2023 12:53:35 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 15 Nov 2023 12:53:34 -0600
Received: from [10.249.38.142] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3AFIrYmt115738;
	Wed, 15 Nov 2023 12:53:34 -0600
Message-ID: <a8385dac-08b0-460c-9213-4e56dd167d57@ti.com>
Date: Wed, 15 Nov 2023 12:53:34 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][kirkstone][PATCH] ti-gc320-driver: fix stdarg header
 file compilation issues
Content-Language: en-US
To: "Bajjuri, Praneeth" <praneeth@ti.com>, <sinthu.raja@mistralsolutions.com>,
        <detheridge@ti.com>, <meta-ti@lists.yoctoproject.org>,
        Denys Dmytriyenko
	<denis@denix.org>
CC: Sinthu Raja <sinthu.raja@ti.com>, "Pothukuchi, Vijay" <vijayp@ti.com>,
        "Kumar, Udit" <u-kumar1@ti.com>
References: <20231115105842.4629-1-sinthu.raja@ti.com>
 <e5d72429-1930-427f-95fb-1f15a47b0ad5@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <e5d72429-1930-427f-95fb-1f15a47b0ad5@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 3AFIrZ80033062
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Nov 2023 18:53:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17302



On 11/15/2023 11:39 AM, Bajjuri, Praneeth wrote:
> updating denys email id
>=20
> On 11/15/2023 4:58 AM, Sinthu Raja M via lists.yoctoproject.org wrote:
>> From: Sinthu Raja <sinthu.raja@ti.com>
>>
>> The stdarg header file location is changed to linux/stdarg.h. Add patc=
h
>> to fix the compilation issue and also add fix to import DMA_BUF namspa=
ce
>> to load the dma_buf modules
>>
>> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
>> ---
>> =C2=A0 ...tdarg-header-file-compilation-issues.patch | 43 ++++++++++++=
+++++++
>> =C2=A0 ...F-namespace-to-load-the-dma_buf-modu.patch | 28 ++++++++++++
>> =C2=A0 .../ti-gc320-driver_5.0.11.p7.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +-
>=20
> Why not patch it at
> https://git.ti.com/cgit/graphics/ti-gc320-driver/
>=20
> and have a branch ti-5.0.11.p7-k6.1 ?
>=20
> and only do SRCREV update and rename the bb recipe?


Agreed.  This is the better way of doing it.  We do not want to carry=20
any more patches in meta-ti that are not yocto build requirements=20
specific.  This patch should go into the upstream repo on a new branch=20
like Praneeth said.


>=20
>> =C2=A0 3 files changed, 74 insertions(+), 1 deletion(-)
>> =C2=A0 create mode 100644=20
>> meta-ti-bsp/recipes-bsp/gc320-drivers/files/0001-km-Fix-stdarg-header-=
file-compilation-issues.patch
>> =C2=A0 create mode 100644=20
>> meta-ti-bsp/recipes-bsp/gc320-drivers/files/0002-km-import-DMA_BUF-nam=
espace-to-load-the-dma_buf-modu.patch
>>
>> diff --git=20
>> a/meta-ti-bsp/recipes-bsp/gc320-drivers/files/0001-km-Fix-stdarg-heade=
r-file-compilation-issues.patch b/meta-ti-bsp/recipes-bsp/gc320-drivers/f=
iles/0001-km-Fix-stdarg-header-file-compilation-issues.patch
>> new file mode 100644
>> index 00000000..9262fe6a
>> --- /dev/null
>> +++=20
>> b/meta-ti-bsp/recipes-bsp/gc320-drivers/files/0001-km-Fix-stdarg-heade=
r-file-compilation-issues.patch
>> @@ -0,0 +1,43 @@
>> +From 466a0f62d4ca9fd8eeea3fc060f4f1a9584f4af5 Mon Sep 17 00:00:00 200=
1
>> +From: Sinthu Raja <sinthu.raja@ti.com>
>> +Date: Tue, 14 Nov 2023 12:45:29 +0530
>> +Subject: [PATCH 1/2] km: Fix stdarg header file compilation issues
>> +
>> +The location of the stdarg.h is changed to linux/stdarg.h. Fix the sa=
me
>> +by updating the stdarg header location.
>> +
>> +Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
>> +---
>> + hal/os/linux/kernel/gc_hal_kernel_debug.h=C2=A0=C2=A0 | 2 +-
>> + hal/os/linux/kernel/gc_hal_kernel_debugfs.h | 2 +-
>> + 2 files changed, 2 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/hal/os/linux/kernel/gc_hal_kernel_debug.h=20
>> b/hal/os/linux/kernel/gc_hal_kernel_debug.h
>> +index 54782fd..cac5528 100755
>> +--- a/hal/os/linux/kernel/gc_hal_kernel_debug.h
>> ++++ b/hal/os/linux/kernel/gc_hal_kernel_debug.h
>> +@@ -59,7 +59,7 @@
>> + #include <gc_hal_kernel_linux.h>
>> + #include <linux/spinlock.h>
>> + #include <linux/time.h>
>> +-#include <stdarg.h>
>> ++#include <linux/stdarg.h>
>> +
>> + #ifdef __cplusplus
>> + extern "C" {
>> +diff --git a/hal/os/linux/kernel/gc_hal_kernel_debugfs.h=20
>> b/hal/os/linux/kernel/gc_hal_kernel_debugfs.h
>> +index 9a15d77..a960272 100755
>> +--- a/hal/os/linux/kernel/gc_hal_kernel_debugfs.h
>> ++++ b/hal/os/linux/kernel/gc_hal_kernel_debugfs.h
>> +@@ -53,7 +53,7 @@
>> +=20
>> **********************************************************************=
*******/
>> +
>> +
>> +-#include <stdarg.h>
>> ++#include <linux/stdarg.h>
>> +
>> + #ifndef __gc_hal_kernel_debugfs_h_
>> + #define __gc_hal_kernel_debugfs_h_
>> +--
>> +2.36.1
>> +
>> diff --git=20
>> a/meta-ti-bsp/recipes-bsp/gc320-drivers/files/0002-km-import-DMA_BUF-n=
amespace-to-load-the-dma_buf-modu.patch b/meta-ti-bsp/recipes-bsp/gc320-d=
rivers/files/0002-km-import-DMA_BUF-namespace-to-load-the-dma_buf-modu.pa=
tch
>> new file mode 100644
>> index 00000000..f95599ef
>> --- /dev/null
>> +++=20
>> b/meta-ti-bsp/recipes-bsp/gc320-drivers/files/0002-km-import-DMA_BUF-n=
amespace-to-load-the-dma_buf-modu.patch
>> @@ -0,0 +1,28 @@
>> +From e7d20324dcfed1b57e09d9e1498fad666e91665e Mon Sep 17 00:00:00 200=
1
>> +From: Sinthu Raja <sinthu.raja@ti.com>
>> +Date: Tue, 14 Nov 2023 12:53:00 +0530
>> +Subject: [PATCH 2/2] km: import DMA_BUF namespace to load the dma_buf=
=20
>> modules
>> +
>> +The DMA BUF module is added to the namespace. To load the graphics
>> +driver with dma_buf module import the DAM_BUF namespace
>> +
>> +Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
>> +---
>> + hal/os/linux/kernel/gc_hal_kernel_probe.c | 1 +
>> + 1 file changed, 1 insertion(+)
>> +
>> +diff --git a/hal/os/linux/kernel/gc_hal_kernel_probe.c=20
>> b/hal/os/linux/kernel/gc_hal_kernel_probe.c
>> +index 877b5a2..430c67e 100755
>> +--- a/hal/os/linux/kernel/gc_hal_kernel_probe.c
>> ++++ b/hal/os/linux/kernel/gc_hal_kernel_probe.c
>> +@@ -73,6 +73,7 @@
>> + #define _GC_OBJ_ZONE=C2=A0=C2=A0=C2=A0 gcvZONE_DRIVER
>> +
>> + MODULE_DESCRIPTION("Vivante Graphics Driver");
>> ++MODULE_IMPORT_NS(DMA_BUF);
>> + MODULE_LICENSE("GPL");
>> +
>> + static struct class* gpuClass;
>> +--
>> +2.36.1
>> +
>> diff --git=20
>> a/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb=20
>> b/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
>> index a56810d4..e38d9f49 100644
>> --- a/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.=
bb
>> +++ b/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.=
bb
>> @@ -15,7 +15,9 @@ BRANCH =3D "ti-${PV}-k5.10"
>> =C2=A0 SRCREV =3D "e2a10f31e255a65ec30a6e10b890e77d7e9cb107"
>> -SRC_URI =3D=20
>> "git://git.ti.com/git/graphics/ti-gc320-driver.git;protocol=3Dhttps;br=
anch=3D${BRANCH}"
>> +SRC_URI =3D=20
>> "git://git.ti.com/git/graphics/ti-gc320-driver.git;protocol=3Dhttps;br=
anch=3D${BRANCH} \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0001-km-Fix-stdarg-header=
-file-compilation-issues.patch \
>> +      =20
>> file://0002-km-import-DMA_BUF-namespace-to-load-the-dma_buf-modu.patch=
"
>> =C2=A0 S =3D "${WORKDIR}/git/src"
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#17299):=20
>> https://lists.yoctoproject.org/g/meta-ti/message/17299
>> Mute This Topic: https://lists.yoctoproject.org/mt/102602692/2167429
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub=20
>> [praneeth@ti.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

