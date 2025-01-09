Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 927FDE77197
	for <webhook@archiver.kernel.org>; Thu,  9 Jan 2025 20:03:13 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.2245.1736452992085321778
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 09 Jan 2025 12:03:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=OFe+SpJk;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 509K3BmO130969;
	Thu, 9 Jan 2025 14:03:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736452991;
	bh=ND2GYMU07Dbu0v0OS5zdzM8V++okm3dlQU8Vm+6JHww=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=OFe+SpJkRGHTvtHiUAllw10eNy5m7U5fkMeEx0B42nL1FKC18DF0pjfikBBtq6o7I
	 6Nmth/4yVZLpIB2hvQ5RwUhmKDD/P/ARGJLEt7RDs7tuFXUsdC9aALYzXluuwMnJTN
	 WGv3YSF46pbeL+8Emicf+fmBImQQgJFkWoZxhrMU=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 509K3BFn086900
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Jan 2025 14:03:11 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 9
 Jan 2025 14:03:10 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 9 Jan 2025 14:03:10 -0600
Received: from [10.249.33.244] ([10.249.33.244])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 509K3ASN031444;
	Thu, 9 Jan 2025 14:03:10 -0600
Message-ID: <d8923ac2-ee6f-418c-917b-85c8a866bb07@ti.com>
Date: Thu, 9 Jan 2025 14:03:10 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH] libdce: Fix compile errors
To: Chirag Shilwant <c-shilwant@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
References: <20250109171652.3024-1-reatmon@ti.com>
 <af54e3ed-7354-4872-8c13-612027335cf4@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <af54e3ed-7354-4872-8c13-612027335cf4@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 509K3BmO130969
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 09 Jan 2025 20:03:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18175



On 1/9/2025 1:50 PM, Chirag Shilwant wrote:
> Hi,
> On 09/01/25 22:46, Ryan Eatmon via lists.yoctoproject.org wrote:
>> Added a patch to fix some compile errors: ..=E2=80=8A/git/memplugin_li=
nux.=E2=80=8Ac:=20
>> In function 'memplugin_alloc': ..=E2=80=8A/git/memplugin_linux.=E2=80=8A=
c:=E2=80=8A69:=E2=80=8A9:=20
>> error: implicit declaration of function 'dsp_dce_buf_lock'=20
>> [-Wimplicit-function-declaration] 69 | dsp_dce_buf_lock(1,
>> ZjQcmQRYFpfptBannerStart
>> This message was sent from outside of Texas Instruments.
>> Do not click links or open attachments unless you recognize the source=
=20
>> of this email and know the content is safe.
>> Report=C2=A0Suspicious
>> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!uHdqXRfP1m07KyZE=
3PNDfMzpulZCOH34hVMNBCLRBdzFbdBs5l1f-3NAfQSc-GHKWgxxiFjmDJES7cQVnA$>
>> ZjQcmQRYFpfptBannerEnd
>> Added a patch to fix some compile errors:
>=20
>=20
>=20
> Any particular reasons for fixing the compilation error via a patch
> rather than updating the sources itself since it lies under git.ti.com =
[1]

Because that repo hasn't been updated in 7 years.  If we want to work on=20
getting it updated, then we can remove the patch.  But we have a build=20
failure today that we need to resolve.

>=20
> [1]: https://git.ti.com/cgit/omapzoom/libdce/
>=20
> --=20
> Chirag
>=20
>=20
>=20
>>
>> ../git/memplugin_linux.c: In function 'memplugin_alloc':
>> ../git/memplugin_linux.c:69:9: error: implicit declaration of function=
=20
>> 'dsp_dce_buf_lock' [-Wimplicit-function-declaration]
>> =C2=A0=C2=A0=C2=A0 69 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 dsp_dce_buf_lock(1, &(h->dma_buf_fd));
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~
>> ../git/memplugin_linux.c:71:9: error: implicit declaration of function=
=20
>> 'dce_buf_lock' [-Wimplicit-function-declaration]
>> =C2=A0=C2=A0=C2=A0 71 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 dce_buf_lock(1, &(h->dma_buf_fd));
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ^~~~~~~~~~~~
>> ../git/memplugin_linux.c: In function 'memplugin_free':
>> ../git/memplugin_linux.c:91:17: error: implicit declaration of=20
>> function 'dsp_dce_buf_unlock' [-Wimplicit-function-declaration]
>> =C2=A0=C2=A0=C2=A0 91 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dsp_dce_buf_unlock(1, &(=
h->dma_buf_fd));
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~=
~~~~~~~~~
>> ../git/memplugin_linux.c:93:17: error: implicit declaration of=20
>> function 'dce_buf_unlock' [-Wimplicit-function-declaration]
>> =C2=A0=C2=A0=C2=A0 93 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dce_buf_unlock(1, &(h->d=
ma_buf_fd));
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~=
~~~~~
>> ../git/memplugin_linux.c:95:13: error: implicit declaration of=20
>> function 'close'; did you mean 'pclose'?=20
>> [-Wimplicit-function-declaration]
>> =C2=A0=C2=A0=C2=A0 95 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 close(h->dma_buf_fd);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pclose
>>
>> and
>>
>> ../git/libdce_linux.c: In function 'dce_deinit':
>> ../git/libdce_linux.c:90:9: error: implicit declaration of function=20
>> 'close'; did you mean 'pclose'? [-Wimplicit-function-declaration]
>> =C2=A0=C2=A0=C2=A0 90 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 close(OmapDrm_FD);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ^~~~~
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 pclose
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>> =C2=A0 .../files/0001-linux-Fix-compile-errors.patch | 70 ++++++++++++=
+++++++
>> =C2=A0 .../libdce/libdce_3.00.15.00.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 +-
>> =C2=A0 2 files changed, 74 insertions(+), 1 deletion(-)
>> =C2=A0 create mode 100644=20
>> meta-ti-extras/recipes-multimedia/libdce/files/0001-linux-Fix-compile-=
errors.patch
>>
>> diff --git=20
>> a/meta-ti-extras/recipes-multimedia/libdce/files/0001-linux-Fix-compil=
e-errors.patch b/meta-ti-extras/recipes-multimedia/libdce/files/0001-linu=
x-Fix-compile-errors.patch
>> new file mode 100644
>> index 00000000..aaee694d
>> --- /dev/null
>> +++=20
>> b/meta-ti-extras/recipes-multimedia/libdce/files/0001-linux-Fix-compil=
e-errors.patch
>> @@ -0,0 +1,70 @@
>> +From 23db5f29715b771b8557703f1eea7f1502796d5d Mon Sep 17 00:00:00 200=
1
>> +From: Ryan Eatmon <reatmon@ti.com>
>> +Date: Thu, 9 Jan 2025 10:34:17 -0600
>> +Subject: [PATCH] linux: Fix compile errors
>> +
>> +Fix the following compile errors:
>> +
>> +../git/memplugin_linux.c:69:9: error: implicit declaration of=20
>> function 'dsp_dce_buf_lock' [-Wimplicit-function-declaration]
>> +=C2=A0=C2=A0 69 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dsp=
_dce_buf_lock(1, &(h->dma_buf_fd));
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ^~~~~~~~~~~~~~~~
>> +../git/memplugin_linux.c:71:9: error: implicit declaration of=20
>> function 'dce_buf_lock' [-Wimplicit-function-declaration]
>> +=C2=A0=C2=A0 71 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dce=
_buf_lock(1, &(h->dma_buf_fd));
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ^~~~~~~~~~~~
>> +../git/memplugin_linux.c: In function 'memplugin_free':
>> +../git/memplugin_linux.c:91:17: error: implicit declaration of=20
>> function 'dsp_dce_buf_unlock' [-Wimplicit-function-declaration]
>> +=C2=A0=C2=A0 91 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dsp_dce_buf_unlock(1, &(h->dma=
_buf_fd));
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~=
~~~
>> +../git/memplugin_linux.c:93:17: error: implicit declaration of=20
>> function 'dce_buf_unlock' [-Wimplicit-function-declaration]
>> +=C2=A0=C2=A0 93 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dce_buf_unlock(1, &(h->dma_buf=
_fd));
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~
>> +../git/memplugin_linux.c:95:13: error: implicit declaration of=20
>> function 'close'; did you mean 'pclose'?=20
>> [-Wimplicit-function-declaration]
>> +=C2=A0=C2=A0 95 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 close(h->dma_buf_fd);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pclose
>> +
>> +and
>> +
>> +../git/libdce_linux.c: In function 'dce_deinit':
>> +../git/libdce_linux.c:90:9: error: implicit declaration of function=20
>> 'close'; did you mean 'pclose'? [-Wimplicit-function-declaration]
>> +=C2=A0=C2=A0 90 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clo=
se(OmapDrm_FD);
>> +
>> +Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> +
>> +Upstream-Status: Pending
>> +
>> +---
>> + libdce_linux.c=C2=A0=C2=A0=C2=A0 | 2 ++
>> + memplugin_linux.c | 2 ++
>> + 2 files changed, 4 insertions(+)
>> +
>> +diff --git a/libdce_linux.c b/libdce_linux.c
>> +index 8bae002..6e4f63d 100644
>> +--- a/libdce_linux.c
>> ++++ b/libdce_linux.c
>> +@@ -45,6 +45,8 @@
>> + #include "dce_rpc.h"
>> + #include "memplugin.h"
>> +
>> ++#include <unistd.h>
>> ++
>> + #define INVALID_DRM_FD (-1)
>> +
>> + static int=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 OmapDrm_FD=C2=A0 =3D INVALID_DRM_FD;
>> +diff --git a/memplugin_linux.c b/memplugin_linux.c
>> +index 5543a68..59b3658 100644
>> +--- a/memplugin_linux.c
>> ++++ b/memplugin_linux.c
>> +@@ -33,6 +33,9 @@
>> + #include "memplugin.h"
>> + #include "dce_priv.h"
>> +
>> ++#include "libdce.h"
>> ++#include <unistd.h>
>> ++
>> + extern struct omap_device=C2=A0=C2=A0 *OmapDev;
>> +
>> +
>> +--
>> +2.17.1
>> +
>> diff --git=20
>> a/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb=20
>> b/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb
>> index f46d9c77..998d3ff6 100644
>> --- a/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb
>> +++ b/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb
>> @@ -6,7 +6,10 @@ inherit autotools pkgconfig
>> =C2=A0 DEPENDS =3D "libdrm ti-ipc"
>> -SRC_URI =3D=20
>> "git://git.ti.com/git/omapzoom/libdce.git;protocol=3Dhttps;branch=3Dma=
ster"
>> +SRC_URI =3D "\
>> +   =20
>> git://git.ti.com/git/omapzoom/libdce.git;protocol=3Dhttps;branch=3Dmas=
ter \
>> +=C2=A0=C2=A0=C2=A0 file://0001-linux-Fix-compile-errors.patch \
>> +"
>> =C2=A0 SRCREV =3D "ec14e1d5cea1ed3c3ea0e2b9cf1fd581acff93e3"
>> --=20
>> 2.17.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#18173):=20
>> https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-ti/m=
essage/18173__;!!G3vK!TLNSNZOPvXvx6hiX5DMwLuL_pgFjvlY37wMKeYiPj0b6f-45x1h=
UCU7vy3QYAJ96BpKRZONUk5s3cI0OT4Jzib7p5HkQtR2ybQ$
>> Mute This Topic:=20
>> https://urldefense.com/v3/__https://lists.yoctoproject.org/mt/11051989=
4/7030289__;!!G3vK!TLNSNZOPvXvx6hiX5DMwLuL_pgFjvlY37wMKeYiPj0b6f-45x1hUCU=
7vy3QYAJ96BpKRZONUk5s3cI0OT4Jzib7p5HnrENT7XA$
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe:=20
>> https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-ti/u=
nsub__;!!G3vK!TLNSNZOPvXvx6hiX5DMwLuL_pgFjvlY37wMKeYiPj0b6f-45x1hUCU7vy3Q=
YAJ96BpKRZONUk5s3cI0OT4Jzib7p5HlRH8nZ_w$=C2=A0 [c-shilwant@ti.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

