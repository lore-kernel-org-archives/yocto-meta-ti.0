Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC745C47DDB
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 05:47:19 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.9494.1706248034543569579
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 25 Jan 2024 21:47:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=FHAsqqwG;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40Q5lDPg026289;
	Thu, 25 Jan 2024 23:47:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1706248033;
	bh=ruupZhKwFujzh/xSTqwrFDGjzC2OSi3WffdVMAnDa3A=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=FHAsqqwGC48Uv3Cf+j+V+HmnJOF+nml8CXCHC4K1KQDlJrs0W2bV0jkl7g9HXaGoA
	 nfWsgOW6IR2HtuFb3BudPSsveXWjvpbjjLEkZj7WGhOUUrSk5HRxxHnwEC2YCfAq9/
	 oUkrF/vY9K1RrqSIFQsSFx80RfQ665ZS/0hIpnR4=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40Q5lDEj111897
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 25 Jan 2024 23:47:13 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 25
 Jan 2024 23:47:13 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 25 Jan 2024 23:47:13 -0600
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40Q5l8nZ028809;
	Thu, 25 Jan 2024 23:47:09 -0600
Message-ID: <a206698a-90aa-49f0-a724-ac5940bdde6e@ti.com>
Date: Fri, 26 Jan 2024 11:17:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-ti] [kirkstone] [PATCH] meta-ti-bsp: Add
 bootsplash image file for AM62P
To: <devarsht@ti.com>, <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <praneeth@ti.com>, <denys@konsulko.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <khasim@ti.com>, <nsekhar@ti.com>, <n-jain1@ti.com>,
        <s-tripathy@ti.com>
References: <20240124144617.327734-1-devarsht@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20240124144617.327734-1-devarsht@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 40Q5lDPg026289
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 26 Jan 2024 05:47:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17420

Hi Devarsh,

On 24/01/24 20:16, Devarsh Thakkar via lists.yoctoproject.org wrote:
> Add TI logo image as bootsplash image file for AM62P and install it in=20
> boot directory from where u-boot can read from and display during=20
> boot-up time. Signed-off-by: Devarsh Thakkar <devarsht@=E2=80=8Ati.=E2=80=
=8Acom> ---=20
> meta-ti-bsp/conf/machine/include/am62pxx.=E2=80=8Ainc
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe.
> ZjQcmQRYFpfptBannerEnd
> Add TI logo image as bootsplash image file for AM62P and install it in
> boot directory from where u-boot can read from and display during
> boot-up time.
In u-boot tree, have we added the equivalent config fragment in-order to=20
disable A53 splash
which was planned to be used for tisdk-display-cluster image?
Integrating this patch without a config fragment in u-boot tree might=20
unnecessarily break the tisdk-display-cluster image!

>
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> ---
>   meta-ti-bsp/conf/machine/include/am62pxx.inc           |  3 +++
>   .../recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb    | 10 +++++++++=
+
>   2 files changed, 13 insertions(+)
>
> diff --git a/meta-ti-bsp/conf/machine/include/am62pxx.inc b/meta-ti-bsp=
/conf/machine/include/am62pxx.inc
> index bac68253..20e0771e 100644
> --- a/meta-ti-bsp/conf/machine/include/am62pxx.inc
> +++ b/meta-ti-bsp/conf/machine/include/am62pxx.inc
> @@ -9,6 +9,9 @@ PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue=
-driver"
>   # Default tiboot3.bin on AM62Px is for HS-FS
>   IMAGE_BOOT_FILES +=3D "tiboot3-am62px-hs-fs-evm.bin"
>  =20
> +# Bitmap image tarball for early splashscreen
> +IMAGE_BOOT_FILES +=3D "ti_logo_414x97_32bpp.bmp.gz"
> +
>   TFA_BOARD =3D "lite"
>   TFA_K3_SYSTEM_SUSPEND =3D "1"
>  =20
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.b=
b b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
> index 4fe1218a..c98cbe61 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
> @@ -17,3 +17,13 @@ do_deploy:append:am62xx() {
>   	install -d ${DEPLOYDIR}
>   	install -m 0644 ${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${DEPLO=
YDIR}
>   }
> +
> +do_install:append:am62pxx() {
> +	install -d ${D}/boot
> +	install -m 0644 ${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${D}/boo=
t
> +}
> +
> +do_deploy:append:am62pxx() {
> +	install -d ${DEPLOYDIR}
> +	install -m 0644 ${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${DEPLOY=
DIR}
> +}
> --=20
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17412): https://urldefense.com/v3/__https://lists.y=
octoproject.org/g/meta-ti/message/17412__;!!G3vK!SAjBqsYWt8FxWuH8q6YfBKxC=
fvqOjkX08Mt0sMB_0-PNFr1Ctdjp3WCUXZyWCcEFwFLoQeFVfluLPCQ2GQdFHCYOOH1JtDnl9=
4g$
> Mute This Topic: https://urldefense.com/v3/__https://lists.yoctoproject=
.org/mt/103932848/7030289__;!!G3vK!SAjBqsYWt8FxWuH8q6YfBKxCfvqOjkX08Mt0sM=
B_0-PNFr1Ctdjp3WCUXZyWCcEFwFLoQeFVfluLPCQ2GQdFHCYOOH1JI-qC-0g$
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://urldefense.com/v3/__https://lists.yoctoproject.org=
/g/meta-ti/unsub__;!!G3vK!SAjBqsYWt8FxWuH8q6YfBKxCfvqOjkX08Mt0sMB_0-PNFr1=
Ctdjp3WCUXZyWCcEFwFLoQeFVfluLPCQ2GQdFHCYOOH1Jo26-_Iw$  [c-shilwant@ti.com=
]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

