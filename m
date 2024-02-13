Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABDC1C4829A
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 06:49:02 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.6307.1707806938270851360
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Feb 2024 22:48:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=jcIrTMsB;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41D6msnV017645;
	Tue, 13 Feb 2024 00:48:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707806934;
	bh=eXIBI32C8pTQ14XIISpnmzMnqxSyzL2qNi8mX9v6RIw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=jcIrTMsBogRfckFYk6+eTkKRUxmaAlkv3ufCVVLgmf2AeHfSD6U0BDzIQ0u1Vm/v9
	 EgPwYKIxzgUP5PavI2JtLkeZ2yzMsUpuFscHloauwuQ04Vzvr2CqHBIEipmyLuBjvm
	 NrYsLuw4q2aO/GAcSMS7PSWs3NKijiBNl67UIuwg=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41D6msA9041362
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 13 Feb 2024 00:48:54 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 13
 Feb 2024 00:48:53 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 13 Feb 2024 00:48:53 -0600
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41D6m1JZ098962;
	Tue, 13 Feb 2024 00:48:52 -0600
Message-ID: <db44e8b4-3c1b-4739-a4d5-c9f4ccdd7c0c@ti.com>
Date: Tue, 13 Feb 2024 12:18:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-ti] [master][PATCH] layer.conf: add
 compatibility with scarthgap
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20240213033335.3884670-1-denis@denix.org>
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20240213033335.3884670-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 41D6msnV017645
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 13 Feb 2024 06:49:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17478


On 13/02/24 09:03, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@=E2=80=8Akonsulko.=E2=80=8Acom> OE-Core =
master has=20
> switched compatibility requirements from nanbield to scarthgap in=20
> preparation for the upcoming 5.=E2=80=8A0 release.=20
> https:=E2=80=8A//urldefense.=E2=80=8Acom/v3/__https:=E2=80=8A//wiki.=E2=
=80=8Ayoctoproject.=E2=80=8Aorg/wiki/Releases__;!!G3vK!ROTyMVBUpWLhwNofCZ=
JZhWiQzM3whXqAxjgtw_opF9h4p5eXyS-BKISNCzozXPPgDVPoVKMmqJd_$
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe.
> ZjQcmQRYFpfptBannerEnd
> From: Denys Dmytriyenko <denys@konsulko.com>
>
> OE-Core master has switched compatibility requirements from nanbield
> to scarthgap in preparation for the upcoming 5.0 release.
> https://urldefense.com/v3/__https://wiki.yoctoproject.org/wiki/Releases=
__;!!G3vK!ROTyMVBUpWLhwNofCZJZhWiQzM3whXqAxjgtw_opF9h4p5eXyS-BKISNCzozXPP=
gDVPoVKMmqJd_$
>
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
Acked-by: Chirag Shilwant <c-shilwant@ti.com>
> ---
>   meta-ti-bsp/conf/layer.conf    | 2 +-
>   meta-ti-extras/conf/layer.conf | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
> index f0fcbc7b..502e355f 100644
> --- a/meta-ti-bsp/conf/layer.conf
> +++ b/meta-ti-bsp/conf/layer.conf
> @@ -9,7 +9,7 @@ BBFILE_COLLECTIONS +=3D "meta-ti-bsp"
>   BBFILE_PATTERN_meta-ti-bsp :=3D "^${LAYERDIR}/"
>   BBFILE_PRIORITY_meta-ti-bsp =3D "6"
>  =20
> -LAYERSERIES_COMPAT_meta-ti-bsp =3D "kirkstone langdale mickledore nanb=
ield"
> +LAYERSERIES_COMPAT_meta-ti-bsp =3D "kirkstone langdale mickledore nanb=
ield scarthgap"
>  =20
>   LICENSE_PATH +=3D "${LAYERDIR}/licenses"
>  =20
> diff --git a/meta-ti-extras/conf/layer.conf b/meta-ti-extras/conf/layer=
.conf
> index a7cca42e..a05dbe5f 100644
> --- a/meta-ti-extras/conf/layer.conf
> +++ b/meta-ti-extras/conf/layer.conf
> @@ -9,7 +9,7 @@ BBFILE_COLLECTIONS +=3D "meta-ti-extras"
>   BBFILE_PATTERN_meta-ti-extras :=3D "^${LAYERDIR}/"
>   BBFILE_PRIORITY_meta-ti-extras =3D "6"
>  =20
> -LAYERSERIES_COMPAT_meta-ti-extras =3D "kirkstone langdale mickledore n=
anbield"
> +LAYERSERIES_COMPAT_meta-ti-extras =3D "kirkstone langdale mickledore n=
anbield scarthgap"
>  =20
>   LICENSE_PATH +=3D "${LAYERDIR}/licenses"
>  =20
> --=20
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17477): https://urldefense.com/v3/__https://lists.y=
octoproject.org/g/meta-ti/message/17477__;!!G3vK!ROTyMVBUpWLhwNofCZJZhWiQ=
zM3whXqAxjgtw_opF9h4p5eXyS-BKISNCzozXPPgDVPoVNZXBGZv$
> Mute This Topic: https://urldefense.com/v3/__https://lists.yoctoproject=
.org/mt/104326553/7030289__;!!G3vK!ROTyMVBUpWLhwNofCZJZhWiQzM3whXqAxjgtw_=
opF9h4p5eXyS-BKISNCzozXPPgDVPoVNCUuW4j$
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://urldefense.com/v3/__https://lists.yoctoproject.org=
/g/meta-ti/unsub__;!!G3vK!ROTyMVBUpWLhwNofCZJZhWiQzM3whXqAxjgtw_opF9h4p5e=
XyS-BKISNCzozXPPgDVPoVKI7LW6n$  [c-shilwant@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

