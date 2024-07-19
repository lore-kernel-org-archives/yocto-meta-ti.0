Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A113EC3DA5D
	for <webhook@archiver.kernel.org>; Fri, 19 Jul 2024 04:27:32 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.11729.1721363246115575489
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 Jul 2024 21:27:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=zO5TK+4H;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46J4RNDH119575;
	Thu, 18 Jul 2024 23:27:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721363243;
	bh=iovwAP8zRvCE5GXfcOBpIKJ6A3UWap7ehGFbWKLD9bU=;
	h=Date:Subject:To:References:CC:From:In-Reply-To;
	b=zO5TK+4Hu5ptCPNwidGhlTbeZdfv8wcFsy5XSEwbSPVRrJvyxex2qS/28DAs/pZvx
	 m6TeHYd/BHRn2Ax/SxY95pi2mfdh1kalIXfCSDbGarCHYe18cryuzsHzuP4DqMr69W
	 gk5YyqUuaXPjNMZ7NYj7OMiJ42PoRckA9N/PGoT4=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46J4RNtq015833
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 18 Jul 2024 23:27:23 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 18
 Jul 2024 23:27:23 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 18 Jul 2024 23:27:23 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46J4RLex091366;
	Thu, 18 Jul 2024 23:27:21 -0500
Message-ID: <bd14cae5-e473-4542-adea-0b0cd15d9a8c@ti.com>
Date: Fri, 19 Jul 2024 09:57:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-ti][master/scarthgap][PATCH] linux: Manage the
 kernel patches using the BSP system
To: <meta-ti@lists.yoctoproject.org>
References: <20240718182421.13591-1-reatmon@ti.com>
Content-Language: en-US
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>, <reatmon@ti.com>,
        Gyan Gupta <g-gupta@ti.com>
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20240718182421.13591-1-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 46J4RNDH119575
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 19 Jul 2024 04:27:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17889

Hi Ryan,
On 18/07/24 23:54, Ryan Eatmon via lists.yoctoproject.org wrote:
> Applying the patches to all kernels is not going to work. Each kernel=20
> might need different patches to address reproducibility issues.=20
> Signed-off-by: Ryan Eatmon <reatmon@=E2=80=8Ati.=E2=80=8Acom> ---=20
> meta-ti-bsp/recipes-kernel/linux/ti-kernel.=E2=80=8Ainc | 12
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe. If you wish to report this=20
> message to IT Security, please forward the message as an attachment to=20
> phishing@list.ti.com
> ZjQcmQRYFpfptBannerEnd
> Applying the patches to all kernels is not going to work.  Each kernel
> might need different patches to address reproducibility issues.
>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc b/meta-ti-b=
sp/recipes-kernel/linux/ti-kernel.inc
> index f24fbe51..8bb30d40 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
> +++ b/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
> @@ -13,8 +13,12 @@ EXTRA_DTC_ARGS +=3D "${@get_extra_dtc_args(d)}"
>   KERNEL_DTBDEST =3D "${KERNEL_IMAGEDEST}/dtb"
>   KERNEL_DTBVENDORED =3D "1"
>  =20
> -SRC_URI:append =3D " \
> -file://0001-lib-build_OID_registry-fix-reproducibility-issues.patch \
> -file://0001-vt-conmakehash-improve-reproducibility.patch \
> -file://0001-pnmtologo-use-relocatable-file-name.patch \
> +KERNEL_PATCHES =3D ""
> +
> +KERNEL_PATCHES:bsp-ti-6.6 =3D " \
> +    file://0001-lib-build_OID_registry-fix-reproducibility-issues.patc=
h \
> +    file://0001-vt-conmakehash-improve-reproducibility.patch \
> +    file://0001-pnmtologo-use-relocatable-file-name.patch \
>   "



The patch title says [master/scarthgap] but I don't see these patches in=20
scarthgap getting applied [1]
Additionally the patches itself are missing in scarthgap branch [2]
Are they applicable to scarthgap?

[1]:=20
https://git.ti.com/cgit/arago-project/meta-ti/tree/meta-ti-bsp/recipes-ke=
rnel/linux/ti-kernel.inc?h=3Dscarthgap

[2]:=20
https://git.ti.com/cgit/arago-project/meta-ti/tree/meta-ti-bsp/recipes-ke=
rnel/linux/files?h=3Dscarthgap



> +
> +SRC_URI:append =3D " ${KERNEL_PATCHES} "
> --=20
> 2.17.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17888): https://urldefense.com/v3/__https://lists.y=
octoproject.org/g/meta-ti/message/17888__;!!G3vK!T7Z2BA-Nk4Deu1oupZmJqJKh=
IHqoFGbruxASymNM3q5ISnIEShmzH_rXiNv1sd9t5IPUFAeq1MVZGvxkGY-um1_ZJzYlEx9Q0=
w$
> Mute This Topic: https://urldefense.com/v3/__https://lists.yoctoproject=
.org/mt/107421992/7030289__;!!G3vK!T7Z2BA-Nk4Deu1oupZmJqJKhIHqoFGbruxASym=
NM3q5ISnIEShmzH_rXiNv1sd9t5IPUFAeq1MVZGvxkGY-um1_ZJzYHEViZow$
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://urldefense.com/v3/__https://lists.yoctoproject.org=
/g/meta-ti/unsub__;!!G3vK!T7Z2BA-Nk4Deu1oupZmJqJKhIHqoFGbruxASymNM3q5ISnI=
EShmzH_rXiNv1sd9t5IPUFAeq1MVZGvxkGY-um1_ZJzb2hPAKdA$  [c-shilwant@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

