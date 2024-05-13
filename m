Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47DD0C25B10
	for <webhook@archiver.kernel.org>; Mon, 13 May 2024 07:19:38 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.54555.1715584774510701071
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 13 May 2024 00:19:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=Y9hLSQQ8;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44D7JSQL035282;
	Mon, 13 May 2024 02:19:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1715584768;
	bh=C4xARTim2u5Msem1QkOjHyIgaP6bNMXK0uXrPLvF/6M=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Y9hLSQQ8AS2rIDl4uWnQEWgANQIiqCE2fSj8qEyQdE0bJNEczXr5BiLhWwCwlawEq
	 UuJ0qB7gxFyyWOutPaU0L3Zdb8s70qR986PKKmPYh4yeH2wFtB9PEMFsaMxy6XUey5
	 zOMODNm82XSAq0bBsdmaiWqfhk35hDAjUUoTkyrM=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44D7JShT027710
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 13 May 2024 02:19:28 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 13
 May 2024 02:19:28 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 13 May 2024 02:19:28 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44D7JPF1119580;
	Mon, 13 May 2024 02:19:26 -0500
Message-ID: <388e7b5a-3b1a-4485-a0df-8a601f591bfb@ti.com>
Date: Mon, 13 May 2024 12:49:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-ti][master/scarthgap][PATCH] conf: am437x-evm:
 Bump up max_leb_cnt
To: Ryan Eatmon <reatmon@ti.com>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Gyan Gupta <g-gupta@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        <meta-ti@lists.yoctoproject.org>
References: <17CCCB990A8CA32A.20378@lists.yoctoproject.org>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <17CCCB990A8CA32A.20378@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 44D7JSQL035282
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 13 May 2024 07:19:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17654

Hi Ryan,

Looks like this patch got missed out as I can't see it applied on=20
meta-ti master/scarthgap.
With latest scarthgap based processor-sdk builds, we need this bump up=20
for am437x-evm.

Errors we observe,
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing python function set_image_size
| DEBUG: 6281641.600000 =3D 4832032 * 1.300000
| DEBUG: 6281641.600000 =3D max(6281641.600000, 65536)[6281641.600000] + =
0
| DEBUG: 6281642.000000 =3D int(6281641.600000)
| DEBUG: 6281642 =3D aligned(6281642)
| DEBUG: returning 6281642
| DEBUG: Python function set_image_size finished
| DEBUG: Executing shell function do_image_ubifs
| Error: max_leb_cnt too low (6018 needed)

On 06/05/24 09:53, Chirag Shilwant via lists.yoctoproject.org wrote:
> New features added require another increase to max_leb_cnt.=20
> Signed-off-by: Chirag Shilwant <c-shilwant@=E2=80=8Ati.=E2=80=8Acom> --=
-=20
> meta-ti-bsp/conf/machine/am437x-evm.=E2=80=8Aconf | 2 +- 1 file changed=
, 1=20
> insertion(+), 1 deletion(-) diff --git=20
> a/meta-ti-bsp/conf/machine/am437x-evm.=E2=80=8Aconf
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe. If you wish to report this=20
> message to IT Security, please forward the message as an attachment to=20
> phishing@list.ti.com
> ZjQcmQRYFpfptBannerEnd
> New features added require another increase to max_leb_cnt.
>
> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> ---
>   meta-ti-bsp/conf/machine/am437x-evm.conf | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-ti-bsp/conf/machine/am437x-evm.conf b/meta-ti-bsp/con=
f/machine/am437x-evm.conf
> index 58b7996f..248add70 100644
> --- a/meta-ti-bsp/conf/machine/am437x-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am437x-evm.conf
> @@ -21,7 +21,7 @@ SERIAL_CONSOLES =3D "115200;ttyS0"
>   # UBI: logical eraseblock size:    253952 bytes
>   # from ubiattach stdout:
>   # UBI device number 0, total 994 LEBs
> -MKUBIFS_ARGS =3D "-F -m 4096 -e 253952 -c 6000"
> +MKUBIFS_ARGS =3D "-F -m 4096 -e 253952 -c 8000"
>  =20
>   # do ubiattach /dev/ubi_ctrl -m 11 -O 4096
>   # from dmesg:
> --=20
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17642): https://urldefense.com/v3/__https://lists.y=
octoproject.org/g/meta-ti/message/17642__;!!G3vK!QyV6c3884c4ajGLpKPNQPDSv=
XJeDU0P8_-TI1nuulPjWsafppz6T8JyZyRDfGvgrzGALzaFFFvH48vf5WtOBfbUA8ByEWxsrB=
xKi$
> Mute This Topic: https://urldefense.com/v3/__https://lists.yoctoproject=
.org/mt/105934386/7030289__;!!G3vK!QyV6c3884c4ajGLpKPNQPDSvXJeDU0P8_-TI1n=
uulPjWsafppz6T8JyZyRDfGvgrzGALzaFFFvH48vf5WtOBfbUA8ByEW3V5XAzx$
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://urldefense.com/v3/__https://lists.yoctoproject.org=
/g/meta-ti/unsub__;!!G3vK!QyV6c3884c4ajGLpKPNQPDSvXJeDU0P8_-TI1nuulPjWsaf=
ppz6T8JyZyRDfGvgrzGALzaFFFvH48vf5WtOBfbUA8ByEW_5UTeUl$  [c-shilwant@ti.co=
m]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

