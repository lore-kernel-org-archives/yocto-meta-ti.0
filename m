Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4961C54E58
	for <webhook@archiver.kernel.org>; Tue, 12 Mar 2024 06:58:56 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.3035.1710226735112256794
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 11 Mar 2024 23:58:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=keyI61QN;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42C6ws9t055975
	for <meta-ti@lists.yoctoproject.org>; Tue, 12 Mar 2024 01:58:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1710226734;
	bh=e4fQ3lnrGkduKtIp6HFW+K/O2oVlElAbsiC/UCy9wY4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=keyI61QN4Std0oZNKE2CKPDqwOTxs1DBa029ZlEvwb7Mf5aFggK0Ox7/T5c7py2so
	 xyAc7Dox6j7pXRDCIHi9PKKuW2Mhv7+gYd0EQ7bNYr/nNW+hWRiycx7w7zRGZc1Gex
	 cG0nuIqMxr8uznv2TABQlCulV2zuFNeTOSAklfDI=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42C6wstF016536
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 12 Mar 2024 01:58:54 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 12
 Mar 2024 01:58:54 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 12 Mar 2024 01:58:54 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42C6wq4s107084;
	Tue, 12 Mar 2024 01:58:52 -0500
Message-ID: <f0c8ed68-71cd-445e-b3c3-6185590dd1b1@ti.com>
Date: Tue, 12 Mar 2024 12:28:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-ti] [kirkstone][PATCH] ipc: ti-rpmsg-char:
 Update library to 0.6.6
Content-Language: en-US
To: <meta-ti@lists.yoctoproject.org>
CC: Apurva Nandan <a-nandan@ti.com>, Hari Nagalla <hnagalla@ti.com>,
        Ryan
 Eatmon <reatmon@ti.com>, <praneeth@ti.com>
References: <20240311204437.17409-1-praneeth@ti.com>
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20240311204437.17409-1-praneeth@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 42C6ws9t055975
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 12 Mar 2024 06:58:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17512

On 12/03/24 02:14, praneeth via lists.yoctoproject.org wrote:
> From: Praneeth Bajjuri <praneeth@=E2=80=8Ati.=E2=80=8Acom> update from =
0.=E2=80=8A6.=E2=80=8A4 to=20
> 0.=E2=80=8A6.=E2=80=8A6. This update brings the following fixes from ti=
-rpmsg-char=20
> repo. 55a6f40 remove ti.=E2=80=8Aipc4.=E2=80=8Aping-pong reference 8892=
e57 lib: fix=20
> data type build warnings 7c2ab48 lib: fix
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe.
> ZjQcmQRYFpfptBannerEnd
> From: Praneeth Bajjuri <praneeth@ti.com>
>
> update from 0.6.4 to 0.6.6.
> This update brings the following fixes from ti-rpmsg-char repo.
>
> 55a6f40 remove ti.ipc4.ping-pong reference
> 8892e57 lib: fix data type build warnings
> 7c2ab48 lib: fix build warnings
>
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
Acked-by: Chirag Shilwant <c-shilwant@ti.com>

> ---
>   meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc b/meta-ti-bsp=
/recipes-ti/ipc/ti-rpmsg-char.inc
> index 78782e6a..cd00a682 100644
> --- a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
> +++ b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
> @@ -7,10 +7,10 @@ PROTOCOL =3D "https"
>   BRANCH =3D "master"
>   SRC_URI =3D "git://git.ti.com/git/rpmsg/ti-rpmsg-char.git;protocol=3D=
${PROTOCOL};branch=3D${BRANCH};"
>  =20
> -# 0.6.4 release
> -SRCREV =3D "439a13cf24662224d5dfa672c6a50d7c43899886"
> +# 0.6.6 release
> +SRCREV =3D "55a6f4032246631a309f8608af5e822024664b59"
>  =20
> -PV =3D "0.6.4+git${SRCPV}"
> +PV =3D "0.6.6+git${SRCPV}"
>  =20
>   S =3D "${WORKDIR}/git"
>  =20
> --=20
> 2.17.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17509): https://urldefense.com/v3/__https://lists.y=
octoproject.org/g/meta-ti/message/17509__;!!G3vK!TMRJkIQrFLLSgd4rFfbm7-5k=
mWt72wDCu_ysJQeLu5jJ3TDcLxRjtob7LiLRWSoZy3euQEwlOLtG6liEpXm_hGpJVjKSjDBM9=
MA$
> Mute This Topic: https://urldefense.com/v3/__https://lists.yoctoproject=
.org/mt/104872271/7030289__;!!G3vK!TMRJkIQrFLLSgd4rFfbm7-5kmWt72wDCu_ysJQ=
eLu5jJ3TDcLxRjtob7LiLRWSoZy3euQEwlOLtG6liEpXm_hGpJVjKS5Mwg8YY$
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://urldefense.com/v3/__https://lists.yoctoproject.org=
/g/meta-ti/unsub__;!!G3vK!TMRJkIQrFLLSgd4rFfbm7-5kmWt72wDCu_ysJQeLu5jJ3TD=
cLxRjtob7LiLRWSoZy3euQEwlOLtG6liEpXm_hGpJVjKSWLFMVok$  [c-shilwant@ti.com=
]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

