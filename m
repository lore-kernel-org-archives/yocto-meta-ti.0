Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6353FC47422
	for <webhook@archiver.kernel.org>; Mon, 29 Jan 2024 12:17:06 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.13379.1706530618363546822
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 29 Jan 2024 04:16:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=QzJ/HeWj;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40TCGtKb077452;
	Mon, 29 Jan 2024 06:16:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1706530615;
	bh=ZhyNZydlGxqJcjUpvfEieI6lM1fIDIcKuL9t8eaa3OM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=QzJ/HeWjF6dKFUTZDjD+ZJRuT9jOYpJNr4XWm6NiRbx2qROqSWBFsdtrA+8LMWFPN
	 PvgWGjyOtFcSwEjB9sYC//Ey96EA7ZlpH23/sM/hFhXFRUPYgzkTHIz9cJO/R1hQjG
	 tXPXkhen7Rhy0prVrM6R6s7FKGHb2uglLkGu/rL4=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40TCGtSM064272
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 29 Jan 2024 06:16:55 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 29
 Jan 2024 06:16:54 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 29 Jan 2024 06:16:54 -0600
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40TCGqmn083990;
	Mon, 29 Jan 2024 06:16:53 -0600
Message-ID: <7c298257-50c9-42dc-8aa4-cc11dbb94e78@ti.com>
Date: Mon, 29 Jan 2024 17:46:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-ti][kirkstone][PATCH 3/4] ti-test: Remove
 OAMP-DRM test
To: <sinthu.raja@mistralsolutions.com>, <reatmon@ti.com>,
        Denys Dmytriyenko
	<denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>
References: <20240129115342.9321-1-sinthu.raja@ti.com>
 <20240129115342.9321-4-sinthu.raja@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20240129115342.9321-4-sinthu.raja@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 40TCGtKb077452
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 29 Jan 2024 12:17:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17429

OMAP-DRM instead of OAMP-DRM in the title of commit message!

On 29/01/24 17:23, Sinthu Raja M via lists.yoctoproject.org wrote:
> From: Sinthu Raja <sinthu.=E2=80=8Araja@=E2=80=8Ati.=E2=80=8Acom> The o=
mapdrm test is outdated=20
> and the required test cases shall be executed using the GST commands.=20
> Disable the same which is no longer required. Signed-off-by: Sinthu=20
> Raja <sinthu.=E2=80=8Araja@=E2=80=8Ati.=E2=80=8Acom>
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe.
> ZjQcmQRYFpfptBannerEnd
> From: Sinthu Raja <sinthu.raja@ti.com>
>
> The omapdrm test is outdated and the required test cases shall be execu=
ted
> using the GST commands. Disable the same which is no longer required.
>
> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> ---
>   meta-arago-test/recipes-core/packagegroups/ti-test.bb | 3 ---
>   1 file changed, 3 deletions(-)
>
> diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/me=
ta-arago-test/recipes-core/packagegroups/ti-test.bb
> index cf720c03..9a6dc67a 100644
> --- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> +++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> @@ -87,15 +87,12 @@ TI_TEST_TI_TOOLS:append:ti43x =3D " \
>       switch-config \
>   "
>  =20
> -NOT_MAINLINE_MMIP_DEPS =3D "${@bb.utils.contains('MACHINE_FEATURES', '=
mmip', 'omapdrmtest', '', d)}"
> -
>   TI_TEST_TI_TOOLS:append:omap-a15 =3D " \
>       omapconf \
>       pru-icss \
>       switch-config \
>       ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', " \
>           ti-ipc-test \
> -	    ${NOT_MAINLINE_MMIP_DEPS} \
>       ", d)} \
>   "
>  =20
> --=20
> 2.36.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17427): https://urldefense.com/v3/__https://lists.y=
octoproject.org/g/meta-ti/message/17427__;!!G3vK!XLvgxXPJEyvy6cLcpnUMkJl_=
6_GfwLnjml7BWshhFvPjzWB-i5_1zL1PtxC6ejqaxP3I3DC8x0yD5lY_4oErfdW0k0-TixKRw=
DUk$
> Mute This Topic: https://urldefense.com/v3/__https://lists.yoctoproject=
.org/mt/104029526/7030289__;!!G3vK!XLvgxXPJEyvy6cLcpnUMkJl_6_GfwLnjml7BWs=
hhFvPjzWB-i5_1zL1PtxC6ejqaxP3I3DC8x0yD5lY_4oErfdW0k0-Ti5O4C_sT$
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://urldefense.com/v3/__https://lists.yoctoproject.org=
/g/meta-ti/unsub__;!!G3vK!XLvgxXPJEyvy6cLcpnUMkJl_6_GfwLnjml7BWshhFvPjzWB=
-i5_1zL1PtxC6ejqaxP3I3DC8x0yD5lY_4oErfdW0k0-Ti8_18Sed$  [c-shilwant@ti.co=
m]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

