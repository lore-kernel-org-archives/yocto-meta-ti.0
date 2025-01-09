Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88A23E77197
	for <webhook@archiver.kernel.org>; Thu,  9 Jan 2025 19:50:13 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.1930.1736452212719824674
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 09 Jan 2025 11:50:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=St39CkHV;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 509JoB8m3205652
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Jan 2025 13:50:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736452211;
	bh=gE9bWxpF2+g96eQHuc89Ebd+ggJg8SWcAYQzTnPn3ic=;
	h=Date:Subject:To:References:CC:From:In-Reply-To;
	b=St39CkHVC/7obbdxEAe/MJ8hbPPiGUJP2VyOmLkCteisHdd/KRuBs1Urn3mXgD7iz
	 rWYQcHXbQVEb6oWkjQOuswp5H8JqDJvDPOZmT9dirAqLwzEgaSiphFcezSrMSN6jkY
	 BEmoJ6rCivEiqrdRrmHtkBRi7V11K2kWTGHwMQ7Q=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 509JoBAS076860
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Jan 2025 13:50:11 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 9
 Jan 2025 13:50:10 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 9 Jan 2025 13:50:10 -0600
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 509Jo8HX030393;
	Thu, 9 Jan 2025 13:50:09 -0600
Message-ID: <af54e3ed-7354-4872-8c13-612027335cf4@ti.com>
Date: Fri, 10 Jan 2025 01:20:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH] libdce: Fix compile errors
To: <meta-ti@lists.yoctoproject.org>
References: <20250109171652.3024-1-reatmon@ti.com>
Content-Language: en-US
CC: <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20250109171652.3024-1-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot04.ext.ti.com id 509JoB8m3205652
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 09 Jan 2025 19:50:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18174

Hi,
On 09/01/25 22:46, Ryan Eatmon via lists.yoctoproject.org wrote:
> Added a patch to fix some compile errors: ..=E2=80=8A/git/memplugin_lin=
ux.=E2=80=8Ac:=20
> In function 'memplugin_alloc': ..=E2=80=8A/git/memplugin_linux.=E2=80=8A=
c:=E2=80=8A69:=E2=80=8A9:=20
> error: implicit declaration of function 'dsp_dce_buf_lock'=20
> [-Wimplicit-function-declaration] 69 | dsp_dce_buf_lock(1,
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe.
> Report=C2=A0Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!uHdqXRfP1m07KyZE3=
PNDfMzpulZCOH34hVMNBCLRBdzFbdBs5l1f-3NAfQSc-GHKWgxxiFjmDJES7cQVnA$>=20
>
> ZjQcmQRYFpfptBannerEnd
> Added a patch to fix some compile errors:



Any particular reasons for fixing the compilation error via a patch
rather than updating the sources itself since it lies under git.ti.com [1=
]


[1]: https://git.ti.com/cgit/omapzoom/libdce/

--
Chirag



>
> ../git/memplugin_linux.c: In function 'memplugin_alloc':
> ../git/memplugin_linux.c:69:9: error: implicit declaration of function =
'dsp_dce_buf_lock' [-Wimplicit-function-declaration]
>     69 |         dsp_dce_buf_lock(1, &(h->dma_buf_fd));
>        |         ^~~~~~~~~~~~~~~~
> ../git/memplugin_linux.c:71:9: error: implicit declaration of function =
'dce_buf_lock' [-Wimplicit-function-declaration]
>     71 |         dce_buf_lock(1, &(h->dma_buf_fd));
>        |         ^~~~~~~~~~~~
> ../git/memplugin_linux.c: In function 'memplugin_free':
> ../git/memplugin_linux.c:91:17: error: implicit declaration of function=
 'dsp_dce_buf_unlock' [-Wimplicit-function-declaration]
>     91 |                 dsp_dce_buf_unlock(1, &(h->dma_buf_fd));
>        |                 ^~~~~~~~~~~~~~~~~~
> ../git/memplugin_linux.c:93:17: error: implicit declaration of function=
 'dce_buf_unlock' [-Wimplicit-function-declaration]
>     93 |                 dce_buf_unlock(1, &(h->dma_buf_fd));
>        |                 ^~~~~~~~~~~~~~
> ../git/memplugin_linux.c:95:13: error: implicit declaration of function=
 'close'; did you mean 'pclose'? [-Wimplicit-function-declaration]
>     95 |             close(h->dma_buf_fd);
>        |             ^~~~~
>        |             pclose
>
> and
>
> ../git/libdce_linux.c: In function 'dce_deinit':
> ../git/libdce_linux.c:90:9: error: implicit declaration of function 'cl=
ose'; did you mean 'pclose'? [-Wimplicit-function-declaration]
>     90 |         close(OmapDrm_FD);
>        |         ^~~~~
>        |         pclose
>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   .../files/0001-linux-Fix-compile-errors.patch | 70 ++++++++++++++++++=
+
>   .../libdce/libdce_3.00.15.00.bb               |  5 +-
>   2 files changed, 74 insertions(+), 1 deletion(-)
>   create mode 100644 meta-ti-extras/recipes-multimedia/libdce/files/000=
1-linux-Fix-compile-errors.patch
>
> diff --git a/meta-ti-extras/recipes-multimedia/libdce/files/0001-linux-=
Fix-compile-errors.patch b/meta-ti-extras/recipes-multimedia/libdce/files=
/0001-linux-Fix-compile-errors.patch
> new file mode 100644
> index 00000000..aaee694d
> --- /dev/null
> +++ b/meta-ti-extras/recipes-multimedia/libdce/files/0001-linux-Fix-com=
pile-errors.patch
> @@ -0,0 +1,70 @@
> +From 23db5f29715b771b8557703f1eea7f1502796d5d Mon Sep 17 00:00:00 2001
> +From: Ryan Eatmon <reatmon@ti.com>
> +Date: Thu, 9 Jan 2025 10:34:17 -0600
> +Subject: [PATCH] linux: Fix compile errors
> +
> +Fix the following compile errors:
> +
> +../git/memplugin_linux.c:69:9: error: implicit declaration of function=
 'dsp_dce_buf_lock' [-Wimplicit-function-declaration]
> +   69 |         dsp_dce_buf_lock(1, &(h->dma_buf_fd));
> +      |         ^~~~~~~~~~~~~~~~
> +../git/memplugin_linux.c:71:9: error: implicit declaration of function=
 'dce_buf_lock' [-Wimplicit-function-declaration]
> +   71 |         dce_buf_lock(1, &(h->dma_buf_fd));
> +      |         ^~~~~~~~~~~~
> +../git/memplugin_linux.c: In function 'memplugin_free':
> +../git/memplugin_linux.c:91:17: error: implicit declaration of functio=
n 'dsp_dce_buf_unlock' [-Wimplicit-function-declaration]
> +   91 |                 dsp_dce_buf_unlock(1, &(h->dma_buf_fd));
> +      |                 ^~~~~~~~~~~~~~~~~~
> +../git/memplugin_linux.c:93:17: error: implicit declaration of functio=
n 'dce_buf_unlock' [-Wimplicit-function-declaration]
> +   93 |                 dce_buf_unlock(1, &(h->dma_buf_fd));
> +      |                 ^~~~~~~~~~~~~~
> +../git/memplugin_linux.c:95:13: error: implicit declaration of functio=
n 'close'; did you mean 'pclose'? [-Wimplicit-function-declaration]
> +   95 |             close(h->dma_buf_fd);
> +      |             ^~~~~
> +      |             pclose
> +
> +and
> +
> +../git/libdce_linux.c: In function 'dce_deinit':
> +../git/libdce_linux.c:90:9: error: implicit declaration of function 'c=
lose'; did you mean 'pclose'? [-Wimplicit-function-declaration]
> +   90 |         close(OmapDrm_FD);
> +
> +Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> +
> +Upstream-Status: Pending
> +
> +---
> + libdce_linux.c    | 2 ++
> + memplugin_linux.c | 2 ++
> + 2 files changed, 4 insertions(+)
> +
> +diff --git a/libdce_linux.c b/libdce_linux.c
> +index 8bae002..6e4f63d 100644
> +--- a/libdce_linux.c
> ++++ b/libdce_linux.c
> +@@ -45,6 +45,8 @@
> + #include "dce_rpc.h"
> + #include "memplugin.h"
> +
> ++#include <unistd.h>
> ++
> + #define INVALID_DRM_FD (-1)
> +
> + static int             OmapDrm_FD  =3D INVALID_DRM_FD;
> +diff --git a/memplugin_linux.c b/memplugin_linux.c
> +index 5543a68..59b3658 100644
> +--- a/memplugin_linux.c
> ++++ b/memplugin_linux.c
> +@@ -33,6 +33,9 @@
> + #include "memplugin.h"
> + #include "dce_priv.h"
> +
> ++#include "libdce.h"
> ++#include <unistd.h>
> ++
> + extern struct omap_device   *OmapDev;
> +
> +
> +--
> +2.17.1
> +
> diff --git a/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00=
.bb b/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb
> index f46d9c77..998d3ff6 100644
> --- a/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb
> +++ b/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb
> @@ -6,7 +6,10 @@ inherit autotools pkgconfig
>  =20
>   DEPENDS =3D "libdrm ti-ipc"
>  =20
> -SRC_URI =3D "git://git.ti.com/git/omapzoom/libdce.git;protocol=3Dhttps=
;branch=3Dmaster"
> +SRC_URI =3D "\
> +    git://git.ti.com/git/omapzoom/libdce.git;protocol=3Dhttps;branch=3D=
master \
> +    file://0001-linux-Fix-compile-errors.patch \
> +"
>  =20
>   SRCREV =3D "ec14e1d5cea1ed3c3ea0e2b9cf1fd581acff93e3"
>  =20
> --=20
> 2.17.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18173): https://urldefense.com/v3/__https://lists.y=
octoproject.org/g/meta-ti/message/18173__;!!G3vK!TLNSNZOPvXvx6hiX5DMwLuL_=
pgFjvlY37wMKeYiPj0b6f-45x1hUCU7vy3QYAJ96BpKRZONUk5s3cI0OT4Jzib7p5HkQtR2yb=
Q$
> Mute This Topic: https://urldefense.com/v3/__https://lists.yoctoproject=
.org/mt/110519894/7030289__;!!G3vK!TLNSNZOPvXvx6hiX5DMwLuL_pgFjvlY37wMKeY=
iPj0b6f-45x1hUCU7vy3QYAJ96BpKRZONUk5s3cI0OT4Jzib7p5HnrENT7XA$
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://urldefense.com/v3/__https://lists.yoctoproject.org=
/g/meta-ti/unsub__;!!G3vK!TLNSNZOPvXvx6hiX5DMwLuL_pgFjvlY37wMKeYiPj0b6f-4=
5x1hUCU7vy3QYAJ96BpKRZONUk5s3cI0OT4Jzib7p5HlRH8nZ_w$  [c-shilwant@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

