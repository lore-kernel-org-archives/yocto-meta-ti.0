Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11AD0C54E58
	for <webhook@archiver.kernel.org>; Thu, 21 Mar 2024 04:29:46 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.781.1710995377553718991
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 20 Mar 2024 21:29:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=io43Rz6R;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42L4TaPn099492;
	Wed, 20 Mar 2024 23:29:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1710995376;
	bh=UrLwyvQXHPhtXOSfuHFLTPXQZmYlfoyYeyHMGtwt8kU=;
	h=Date:Subject:To:References:CC:From:In-Reply-To;
	b=io43Rz6R2lRmo03JYThpGVo/9X+pUzJpnHkuDE9Q36Ol79e4uNMlb+UEOA29iE6lE
	 4FFZpXM0QcF1yRuW+oMCO3dy0xpTZP/zhVQ0FqQTfY1+w+DNwmXK2UH+jPMs0HfmH5
	 AMPCQEWeSYgArDlg3rlKZ3bdhOb6+2v32nNmdGAM=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42L4TZhB090292
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 20 Mar 2024 23:29:36 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 20
 Mar 2024 23:29:35 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 20 Mar 2024 23:29:35 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42L4TXFk053045;
	Wed, 20 Mar 2024 23:29:34 -0500
Message-ID: <55c50dc9-1b6f-4d55-a2d5-713ed10a2219@ti.com>
Date: Thu, 21 Mar 2024 09:59:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-ti][scarthgap][PATCH] README: update with
 scarthgap specific info
Content-Language: en-US
To: <meta-ti@lists.yoctoproject.org>
References: <20240320200539.24116-1-reatmon@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>,
        Praneeth Bajjuri
	<praneeth@ti.com>, <reatmon@ti.com>
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20240320200539.24116-1-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 42L4TaPn099492
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 21 Mar 2024 04:29:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17543


On 21/03/24 01:35, Ryan Eatmon via lists.yoctoproject.org wrote:
> All READMEs were still mentioning master, update that. Signed-off-by:=20
> Ryan Eatmon <reatmon@=E2=80=8Ati.=E2=80=8Acom> --- meta-ti-bsp/README |=
 4 ++--=20
> meta-ti-extras/README | 6 +++--- 2 files changed, 5 insertions(+), 5=20
> deletions(-) diff --git a/meta-ti-bsp/README
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe.
> ZjQcmQRYFpfptBannerEnd
> All READMEs were still mentioning master, update that.
>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   meta-ti-bsp/README    | 4 ++--
>   meta-ti-extras/README | 6 +++---
>   2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/meta-ti-bsp/README b/meta-ti-bsp/README
> index c5780531..70c40d4e 100644
> --- a/meta-ti-bsp/README
> +++ b/meta-ti-bsp/README
> @@ -8,11 +8,11 @@ This layer depends on:
>  =20
>   URI: git://git.openembedded.org/openembedded-core
>   layers: meta
> -branch: master
> +branch: scarthgap
>  =20
>   URI: git://git.yoctoproject.org/meta-arm
>   layers: meta-arm
> -branch: master
> +branch: scarthgap
>  =20


meta-arm:scratchgap is yet to be created -=20
https://git.yoctoproject.org/meta-arm/log/?h=3Dscratchgap
Maybe they are waiting for April to start :) -=20
https://wiki.yoctoproject.org/wiki/Releases


>  =20
>   The base BSP part of meta-ti should work with different OpenEmbedded/=
Yocto
> diff --git a/meta-ti-extras/README b/meta-ti-extras/README
> index 1b38921a..c6c058e0 100644
> --- a/meta-ti-extras/README
> +++ b/meta-ti-extras/README
> @@ -8,14 +8,14 @@ This layer depends on:
>  =20
>   URI: git://git.openembedded.org/openembedded-core
>   layers: meta
> -branch: master
> +branch: scarthgap
>  =20
>   URI: git://git.yoctoproject.org/meta-arm
>   layers: meta-arm
> -branch: master
> +branch: scarthgap
>  =20
>   URI: git://git.yoctoproject.org/meta-ti
> -branch: master
> +branch: scarthgap
>   revision: HEAD
>   layers: meta-ti-bsp
>  =20
> --=20
> 2.17.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17541): https://urldefense.com/v3/__https://lists.y=
octoproject.org/g/meta-ti/message/17541__;!!G3vK!TLlNUd7I6GKmFoyFWQDpjEqf=
q0fdzq1haDDMGHUgFqHg-8wP1gx07t-gHXmZU56vssHGAhZx0SkT5-u3Wqr82qAQ799Alq8lS=
Q$
> Mute This Topic: https://urldefense.com/v3/__https://lists.yoctoproject=
.org/mt/105052436/7030289__;!!G3vK!TLlNUd7I6GKmFoyFWQDpjEqfq0fdzq1haDDMGH=
UgFqHg-8wP1gx07t-gHXmZU56vssHGAhZx0SkT5-u3Wqr82qAQ79_YXsJPEA$
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://urldefense.com/v3/__https://lists.yoctoproject.org=
/g/meta-ti/unsub__;!!G3vK!TLlNUd7I6GKmFoyFWQDpjEqfq0fdzq1haDDMGHUgFqHg-8w=
P1gx07t-gHXmZU56vssHGAhZx0SkT5-u3Wqr82qAQ79_lwXlpkg$  [c-shilwant@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

