Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A15AC3DA49
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 05:10:56 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.3930.1721106655400821980
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 15 Jul 2024 22:10:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=yVnKCOHo;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46G5Apap001406;
	Tue, 16 Jul 2024 00:10:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721106651;
	bh=pdYMd1p7Ih002LtXZ0/TBLXSCcrXGzTXqYfvj77hwNQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=yVnKCOHoJ1YNqN6OQilFRRHSyCdf5Lv+QetXLggCYCjnH0/Sr5QEmnp0MyO3e/SSI
	 Ir/C/WxTVoPbVj4opegt59IX3crcTOlDhS0GJF8jlfJ132algKSNWShrp2dMpaGe/m
	 LWhfsmbeM2m04NUIFKFN+xd02jcBehi5se6Ts7xg=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46G5ApVg018509
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 Jul 2024 00:10:51 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 16
 Jul 2024 00:10:50 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 16 Jul 2024 00:10:50 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46G5Altj058132;
	Tue, 16 Jul 2024 00:10:48 -0500
Message-ID: <3353e180-778f-4ddb-a7a3-480a853d8235@ti.com>
Date: Tue, 16 Jul 2024 10:40:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-ti] [scarthgap PATCH] ipc: ti-rpmsg-char: Update
 library to 0.6.7
To: <praneeth@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Hari Nagalla <hnagalla@ti.com>,
        Nick
 Saulnier <nsaulnier@ti.com>, Gyan Gupta <g-gupta@ti.com>,
        Ryan Eatmon
	<reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
References: <20240715235724.28197-1-praneeth@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20240715235724.28197-1-praneeth@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 46G5Apap001406
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 16 Jul 2024 05:10:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17866

Hi Praneeth,

I believe this patch is applicable to master branch as well.
So, an update is needed in patch title.

s/[scarthgap]/[master/scarthgap]

---
Chirag

On 16/07/24 05:27, praneeth via lists.yoctoproject.org wrote:
> From: Praneeth Bajjuri <praneeth@=E2=80=8Ati.=E2=80=8Acom> update from =
0.=E2=80=8A6.=E2=80=8A6 to=20
> 0.=E2=80=8A6.=E2=80=8A7. This update brings the following fixes from ti=
-rpmsg-char=20
> repo. 5100a2e lib: Fix truncation warnings 15011fe example: Add=20
> roundtrip delay metering aac39ae lib: fix truncation
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe. If you wish to report this=20
> message to IT Security, please forward the message as an attachment to=20
> phishing@list.ti.com
> ZjQcmQRYFpfptBannerEnd
> From: Praneeth Bajjuri <praneeth@ti.com>
>
> update from 0.6.6 to 0.6.7.
> This update brings the following fixes from ti-rpmsg-char repo.
>
> 5100a2e lib: Fix truncation warnings
> 15011fe example: Add roundtrip delay metering
> aac39ae lib: fix truncation warnings with spritnf
> 4b9fd76 include: rproc_id: Add numbered enum
>
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> ---
>   meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc b/meta-ti-bsp=
/recipes-ti/ipc/ti-rpmsg-char.inc
> index 4710be09..22d03d97 100644
> --- a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
> +++ b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
> @@ -7,10 +7,10 @@ PROTOCOL =3D "https"
>   BRANCH =3D "master"
>   SRC_URI =3D "git://git.ti.com/git/rpmsg/ti-rpmsg-char.git;protocol=3D=
${PROTOCOL};branch=3D${BRANCH};"
>  =20
> -# 0.6.6 release
> -SRCREV =3D "55a6f4032246631a309f8608af5e822024664b59"
> +# 0.6.7 release
> +SRCREV =3D "5100a2e4a4a951e40ea0708fa78960770ec0ac33"
>  =20
> -PV =3D "0.6.6+git"
> +PV =3D "0.6.7+git"
>  =20
>   S =3D "${WORKDIR}/git"
>  =20
> --=20
> 2.17.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17864): https://urldefense.com/v3/__https://lists.y=
octoproject.org/g/meta-ti/message/17864__;!!G3vK!QuZEGugMEXWahQ5JD6pgtKPR=
v_c9J4hSKNw0BKTezGXPlwBdo3eAB3QE00s-KVodpzMi1t_ypIA-zO6v1pb2qJ6720InGszZ0=
dU$
> Mute This Topic: https://urldefense.com/v3/__https://lists.yoctoproject=
.org/mt/107243546/7030289__;!!G3vK!QuZEGugMEXWahQ5JD6pgtKPRv_c9J4hSKNw0BK=
TezGXPlwBdo3eAB3QE00s-KVodpzMi1t_ypIA-zO6v1pb2qJ6720InXBtMpww$
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://urldefense.com/v3/__https://lists.yoctoproject.org=
/g/meta-ti/unsub__;!!G3vK!QuZEGugMEXWahQ5JD6pgtKPRv_c9J4hSKNw0BKTezGXPlwB=
do3eAB3QE00s-KVodpzMi1t_ypIA-zO6v1pb2qJ6720In5zb8cmc$  [c-shilwant@ti.com=
]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

