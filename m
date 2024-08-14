Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E74A9C3DA4A
	for <webhook@archiver.kernel.org>; Wed, 14 Aug 2024 18:10:02 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.104758.1723658998037395343
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 14 Aug 2024 11:09:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=pRjg2i2s;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47EI9u7N120253;
	Wed, 14 Aug 2024 13:09:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1723658996;
	bh=cCpL32E8mHiLjCtUi6m+mcfcWam9okL1Gm27mQAURmg=;
	h=Date:Subject:To:References:From:CC:In-Reply-To;
	b=pRjg2i2s9ELnIgV8UWXqcg1q/9VElrMlixj5Z8GOCXzxKkQ8NqfeQDA+T/rwOg5VV
	 r5kQ5U8y8V71VWfjBSKs7TCEN2kV0ZXqJylTOWcrp5zR+kX7AysbYW+mAn7g19lOa2
	 XF0gDF3VfeR44F99TKzsT4UIU4p5I2CGZNT9wKpE=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47EI9uIS004789
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 14 Aug 2024 13:09:56 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 Aug 2024 13:09:56 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 Aug 2024 13:09:56 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47EI9raP034764;
	Wed, 14 Aug 2024 13:09:54 -0500
Message-ID: <11f3d6f8-79e2-48cc-825e-3a05fe6a5050@ti.com>
Date: Wed, 14 Aug 2024 23:39:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-ti][master/scarthgap][RFC] conf: machine:
 am62xx-unified: Create new common am62xx machine
To: <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20240808192718.14154-1-reatmon@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
CC: Gyan Gupta <g-gupta@ti.com>
In-Reply-To: <20240808192718.14154-1-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 47EI9u7N120253
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 14 Aug 2024 18:10:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17936

Hi Ryan & Denys,
On 09/08/24 00:57, Ryan Eatmon via lists.yoctoproject.org wrote:
> To reduce the number of required builds for testing purposes, create a=20
> common unified am62xx machine target that can produce all of the files=20
> for all of the variant platforms related to am62xx (sip and lp).=20
> Additionally, continue to support
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe. If you wish to report this=20
> message to IT Security, please forward the message as an attachment to=20
> phishing@list.ti.com
> Report=C2=A0Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!uFdqXRfP9mwbKwZFH=
JNj_V92vi6mT9DGTpQZeFU0LNi8euAkYQM024IcX-dd54y6XIw8nwcGUnREacyk1hI$>=20
>
> ZjQcmQRYFpfptBannerEnd
> To reduce the number of required builds for testing purposes, create a
> common unified am62xx machine target that can produce all of the files
> for all of the variant platforms related to am62xx (sip and lp).
> Additionally, continue to support building the specific target if
> desired.
>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>



We need to see how do we enable the support of fragment configs with=20
UBOOT_CONFIG
as I see atleast ti-u-boot-2024.04 still following the fragment config=20
model for few usecases.

I see two approaches,

- Add the support in oe-core to handle u-boot fragment configs

- Extend u-boot-mergeconfig.inc we currently have in meta-ti [1] to=20
support UBOOT_CONFIG


Personally, I would prefer the first option if that's acceptable to=20
oe-core as well
but I would like to hear your opinions on the same


[1]:=20
https://git.ti.com/cgit/arago-project/meta-ti/tree/meta-ti-bsp/recipes-bs=
p/u-boot/u-boot-mergeconfig.inc?h=3Dscarthgap


---
Chirag



> ---
>   meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf |  9 +---
>   meta-ti-bsp/conf/machine/am62xx-evm.conf      |  5 +--
>   .../conf/machine/am62xx-lp-evm-k3r5.conf      |  9 +---
>   meta-ti-bsp/conf/machine/am62xx-lp-evm.conf   |  5 +--
>   .../conf/machine/am62xx-unified-k3r5.conf     | 20 +++++++++
>   meta-ti-bsp/conf/machine/am62xx-unified.conf  | 43 ++++++++++++++++++=
+
>   .../conf/machine/am62xxsip-evm-k3r5.conf      |  8 ++--
>   meta-ti-bsp/conf/machine/am62xxsip-evm.conf   |  6 +--
>   8 files changed, 76 insertions(+), 29 deletions(-)
>   create mode 100644 meta-ti-bsp/conf/machine/am62xx-unified-k3r5.conf
>   create mode 100644 meta-ti-bsp/conf/machine/am62xx-unified.conf
>
> diff --git a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf b/meta-ti-bs=
p/conf/machine/am62xx-evm-k3r5.conf
> index 548369ca..3a819835 100644
> --- a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
> +++ b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
> @@ -2,11 +2,6 @@
>   #@NAME: AM62XX EVM (R5F)
>   #@DESCRIPTION: Machine configuration for the TI AM62xx EVM (R5F core)
>  =20
> -require conf/machine/include/k3r5.inc
> -require conf/machine/include/ti-extras.inc
> +require conf/machine/am62xx-unified-k3r5.conf
>  =20
> -SYSFW_SOC =3D "am62x"
> -SYSFW_CONFIG =3D "evm"
> -SYSFW_SUFFIX =3D "hs-fs"
> -
> -UBOOT_MACHINE =3D "am62x_evm_r5_defconfig"
> +UBOOT_CONFIG =3D "evm"
> diff --git a/meta-ti-bsp/conf/machine/am62xx-evm.conf b/meta-ti-bsp/con=
f/machine/am62xx-evm.conf
> index 31de4a14..8c80cb1f 100644
> --- a/meta-ti-bsp/conf/machine/am62xx-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62xx-evm.conf
> @@ -2,8 +2,7 @@
>   #@NAME: AM62XX EVM
>   #@DESCRIPTION: Machine configuration for the TI AM62XX EVM
>  =20
> -require conf/machine/include/am62xx.inc
> -require conf/machine/include/ti-extras.inc
> +require conf/machine/am62xx-unified.conf
>  =20
>   KERNEL_DEVICETREE_PREFIX =3D " \
>       ti/k3-am625 \
> @@ -30,4 +29,4 @@ KERNEL_DEVICETREE =3D " \
>       ti/k3-am62x-sk-hdmi-audio.dtbo \
>   "
>  =20
> -UBOOT_MACHINE =3D "am62x_evm_a53_defconfig"
> +UBOOT_CONFIG =3D "evm"
> diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf b/meta-ti=
-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
> index 52b69a72..fb760e99 100644
> --- a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
> +++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
> @@ -2,11 +2,6 @@
>   #@NAME: AM62XX LP GP EVM (R5F)
>   #@DESCRIPTION: Machine configuration for the TI AM62xx LP GP EVM (R5F=
 core)
>  =20
> -require conf/machine/include/k3r5.inc
> -require conf/machine/include/ti-extras.inc
> +require conf/machine/am62xx-unified-k3r5.conf
>  =20
> -SYSFW_SOC =3D "am62x"
> -SYSFW_CONFIG =3D "evm"
> -SYSFW_SUFFIX =3D "hs-fs"
> -
> -UBOOT_MACHINE =3D "am62x_lpsk_r5_defconfig"
> +UBOOT_CONFIG =3D "lpsk"
> diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/=
conf/machine/am62xx-lp-evm.conf
> index e9271f5b..f7d89d68 100644
> --- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
> @@ -2,8 +2,7 @@
>   #@NAME: AM62XX LP EVM
>   #@DESCRIPTION: Machine configuration for the TI AM62XX LP EVM
>  =20
> -require conf/machine/include/am62xx.inc
> -require conf/machine/include/ti-extras.inc
> +require conf/machine/am62xx-unified.conf
>  =20
>   KERNEL_DEVICETREE_PREFIX =3D " \
>       ti/k3-am62-lp \
> @@ -19,4 +18,4 @@ KERNEL_DEVICETREE =3D " \
>       ti/k3-am62x-sk-hdmi-audio.dtbo \
>   "
>  =20
> -UBOOT_MACHINE =3D "am62x_lpsk_a53_defconfig"
> +UBOOT_CONFIG =3D "lpsk"
> diff --git a/meta-ti-bsp/conf/machine/am62xx-unified-k3r5.conf b/meta-t=
i-bsp/conf/machine/am62xx-unified-k3r5.conf
> new file mode 100644
> index 00000000..7d65e6af
> --- /dev/null
> +++ b/meta-ti-bsp/conf/machine/am62xx-unified-k3r5.conf
> @@ -0,0 +1,20 @@
> +#@TYPE: Machine
> +#@NAME: AM62XX EVM (R5F)
> +#@DESCRIPTION: Machine configuration for the TI AM62xx EVM (R5F core)
> +
> +require conf/machine/include/k3r5.inc
> +require conf/machine/include/ti-extras.inc
> +
> +SYSFW_SOC =3D "am62x"
> +SYSFW_CONFIG =3D "evm"
> +SYSFW_SUFFIX =3D "hs-fs"
> +
> +UBOOT_MACHINE =3D ""
> +# Last config in the list is default
> +UBOOT_CONFIG ??=3D "sip lpsk evm"
> +
> +UBOOT_CONFIG:bsp-ti-6_1 ??=3D "evm"
> +
> +UBOOT_CONFIG[sip] =3D "am62xsip_evm_r5_defconfig"
> +UBOOT_CONFIG[lpsk] =3D "am62x_lpsk_r5_defconfig"
> +UBOOT_CONFIG[evm] =3D "am62x_evm_r5_defconfig"
> diff --git a/meta-ti-bsp/conf/machine/am62xx-unified.conf b/meta-ti-bsp=
/conf/machine/am62xx-unified.conf
> new file mode 100644
> index 00000000..5b03239f
> --- /dev/null
> +++ b/meta-ti-bsp/conf/machine/am62xx-unified.conf
> @@ -0,0 +1,43 @@
> +#@TYPE: Machine
> +#@NAME: AM62XX Unified EVM
> +#@DESCRIPTION: Machine configuration for the TI AM62XX EVM and all of =
its variations
> +
> +require conf/machine/include/am62xx.inc
> +require conf/machine/include/ti-extras.inc
> +
> +KERNEL_DEVICETREE_PREFIX =3D " \
> +    ti/k3-am62-lp \
> +    ti/k3-am625 \
> +    ti/k3-am62x-sk \
> +"
> +
> +KERNEL_DEVICETREE =3D " \
> +    ti/k3-am62-lp-sk.dtb \
> +    ti/k3-am625-beagleplay-csi2-ov5640.dtbo \
> +    ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtbo \
> +    ti/k3-am625-beagleplay.dtb \
> +    ti/k3-am625-phyboard-lyra-rdk.dtb \
> +    ti/k3-am625-sk.dtb \
> +    ti/k3-am625-verdin-nonwifi-dahlia.dtb \
> +    ti/k3-am625-verdin-nonwifi-dev.dtb \
> +    ti/k3-am625-verdin-nonwifi-mallow.dtb \
> +    ti/k3-am625-verdin-nonwifi-yavia.dtb \
> +    ti/k3-am625-verdin-wifi-dahlia.dtb \
> +    ti/k3-am625-verdin-wifi-dev.dtb \
> +    ti/k3-am625-verdin-wifi-mallow.dtb \
> +    ti/k3-am625-verdin-wifi-yavia.dtb \
> +    ti/k3-am62x-sk-csi2-imx219.dtbo \
> +    ti/k3-am62x-sk-csi2-ov5640.dtbo \
> +    ti/k3-am62x-sk-csi2-tevi-ov5640.dtbo \
> +    ti/k3-am62x-sk-hdmi-audio.dtbo \
> +"
> +
> +UBOOT_MACHINE =3D ""
> +# Last config in the list is default
> +UBOOT_CONFIG ??=3D "sip lpsk evm"
> +
> +UBOOT_CONFIG:bsp-ti-6_1 ??=3D "lpsk evm"
> +
> +UBOOT_CONFIG[sip] =3D "am62xsip_evm_a53_defconfig"
> +UBOOT_CONFIG[lpsk] =3D "am62x_lpsk_a53_defconfig"
> +UBOOT_CONFIG[evm] =3D "am62x_evm_a53_defconfig"
> diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf b/meta-ti=
-bsp/conf/machine/am62xxsip-evm-k3r5.conf
> index 55bc530b..ab538ff3 100644
> --- a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
> +++ b/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
> @@ -2,13 +2,11 @@
>   #@NAME: AM62XX SIP EVM (R5F)
>   #@DESCRIPTION: Machine configuration for the TI AM62xx SIP EVM (R5F c=
ore)
>  =20
> -require conf/machine/include/k3r5.inc
> +require conf/machine/am62xx-unified-k3r5.conf
>  =20
> -SYSFW_SOC =3D "am62x"
> -SYSFW_CONFIG =3D "evm"
> -SYSFW_SUFFIX =3D "hs-fs"
> +UBOOT_CONFIG =3D "sip"
>  =20
> -UBOOT_MACHINE =3D "am62xsip_evm_r5_defconfig"
> +UBOOT_CONFIG:bsp-ti-6_1 =3D ""
>  =20
>   UBOOT_MACHINE:bsp-ti-6_1 =3D "am62x_evm_r5_defconfig"
>  =20
> diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf b/meta-ti-bsp/=
conf/machine/am62xxsip-evm.conf
> index 8104329e..6b179b80 100644
> --- a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
> @@ -2,7 +2,7 @@
>   #@NAME: AM62XX SIP EVM
>   #@DESCRIPTION: Machine configuration for the TI AM62XX SIP EVM
>  =20
> -require conf/machine/include/am62xx.inc
> +require conf/machine/am62xx-unified.conf
>  =20
>   KERNEL_DEVICETREE_PREFIX =3D " \
>       ti/k3-am625 \
> @@ -13,6 +13,4 @@ KERNEL_DEVICETREE =3D " \
>       ti/k3-am625-sk.dtb \
>   "
>  =20
> -UBOOT_MACHINE =3D "am62xsip_evm_a53_defconfig"
> -
> -UBOOT_MACHINE:bsp-ti-6_1 =3D "am62x_evm_a53_defconfig"
> +UBOOT_CONFIG =3D "sip"
> --=20
> 2.17.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17931): https://urldefense.com/v3/__https://lists.y=
octoproject.org/g/meta-ti/message/17931__;!!G3vK!U-r2MVyHaQGOtRj3aNhTjsDU=
YyItxHnzUGRG-G5JLIPNsN8lJvMKVSLNpaAab2D6lT8SjjhTdHlsGIgYCUbpGqaVKNaNnb30M=
Q$
> Mute This Topic: https://urldefense.com/v3/__https://lists.yoctoproject=
.org/mt/107796202/7030289__;!!G3vK!U-r2MVyHaQGOtRj3aNhTjsDUYyItxHnzUGRG-G=
5JLIPNsN8lJvMKVSLNpaAab2D6lT8SjjhTdHlsGIgYCUbpGqaVKNZDezDSJQ$
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://urldefense.com/v3/__https://lists.yoctoproject.org=
/g/meta-ti/unsub__;!!G3vK!U-r2MVyHaQGOtRj3aNhTjsDUYyItxHnzUGRG-G5JLIPNsN8=
lJvMKVSLNpaAab2D6lT8SjjhTdHlsGIgYCUbpGqaVKNZtDaB-gQ$  [c-shilwant@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

