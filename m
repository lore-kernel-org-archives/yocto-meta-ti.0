Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A94CC021AA
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 22:24:18 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.36059.1740003850785736121
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 19 Feb 2025 14:24:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=BoJNpVcD;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51JMNt4H2094877
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 19 Feb 2025 16:23:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740003835;
	bh=izAqHbkxE4Ef1pRNkcog6m9Q7qA2/okbUbEX+/1gm1Q=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=BoJNpVcDBkFmxBohIkmvfQEGLmFc8HKRBwwO2/vvboPeKTSk/svifWknVffwRrWEk
	 pXqJ85FlQwgg5aSk3gxKdvAaKlzKCW8+ZG/iNGxqTUwxIeQQL92Suts6wTi49qCKhg
	 rQn3t1TCvTG42qzvLsIYv+aDgRDLSDQnhUIYsI2o=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51JMNtjJ051332;
	Wed, 19 Feb 2025 16:23:55 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 19
 Feb 2025 16:23:55 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 19 Feb 2025 16:23:55 -0600
Received: from [10.249.33.110] ([10.249.33.110])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51JMNtOA125079;
	Wed, 19 Feb 2025 16:23:55 -0600
Message-ID: <d486a357-8b00-4399-ad57-03007591743a@ti.com>
Date: Wed, 19 Feb 2025 16:23:55 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master/scarthgap][PATCH] trusted-firmware-a: simplify
 TI customizations
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20250219214801.2239589-1-denis@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250219214801.2239589-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 19 Feb 2025 22:24:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18328



On 2/19/2025 3:48 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> The original .bbappend started with just a few customizations behind
> a :k3 SoC override, but eventually grew in size. It got converted into
> a .inc file, which is behind the same SoC override and hence it gets
> included by .bbappend only for K3 platforms:
> https://git.yoctoproject.org/meta-ti/commit/?id=389f9a8b726868768a8bed6cbe0b2a1f18c05410
> 
> It doesn't make sense to use the same :k3 override inside this .inc
> file for every variable. Moreover, it makes it harder to change
> those variables downstream for any derivative platform or even for
> upstream testing.
> 
> This change drops redundant :k3 SoC overrides, w/o changing existing
> behavior. It allows easier modifications of such customizations from
> downstream layers or a local.conf, e.g. SRC_URI_TRUSTED_FIRMWARE_A
> 
> Note that SRC_URI is set exactly the same as in upstream base .inc
> file, but version-specific recipes in meta-arm tend to add extra
> patches directly to SRC_URI, which is undesirable here. Thus, reset
> SRC_URI back to its default.
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>   .../trusted-firmware-a-ti.inc                 | 26 ++++++++++++-------
>   1 file changed, 16 insertions(+), 10 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
> index 9971e960..21aef489 100644
> --- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
> +++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
> @@ -1,14 +1,20 @@
> -PV:k3 = "2.12+git"
> -SRCREV_tfa:k3 = "5227171c079d0c7d22a6d37b5cec079c8c5bb4b1"
> -LIC_FILES_CHKSUM:k3 = "file://docs/license.rst;md5=1118e32884721c0be33267bd7ae11130"
> -SRC_URI:k3 = "git://github.com/TexasInstruments/arm-trusted-firmware.git;protocol=https;name=tfa;branch=ti-master"
> -COMPATIBLE_MACHINE:k3 = "k3"
> -TFA_BUILD_TARGET:k3 = "all"
> -TFA_INSTALL_TARGET:k3 = "bl31"
> -TFA_SPD:k3 = "opteed"
> +# NOTE: This .inc file with customizations only gets included for K3 platforms
> +
> +PV = "2.12+git"
> +SRCREV_tfa = "5227171c079d0c7d22a6d37b5cec079c8c5bb4b1"
> +SRC_URI_TRUSTED_FIRMWARE_A = "git://github.com/TexasInstruments/arm-trusted-firmware.git;protocol=https"
> +SRCBRANCH = "ti-master"
> +SRC_URI = "${SRC_URI_TRUSTED_FIRMWARE_A};name=tfa;branch=${SRCBRANCH}"

I think this is already the value of SRC_URI from the main recipe...  so 
we shouldn't need to override it here if we are redefining the 
SRC_URI_TRUSTED_FIRMWARE_A variable.



> +LIC_FILES_CHKSUM = "file://docs/license.rst;md5=1118e32884721c0be33267bd7ae11130"
> +COMPATIBLE_MACHINE = "k3"
> +
> +TFA_BUILD_TARGET = "all"
> +TFA_INSTALL_TARGET = "bl31"
> +TFA_SPD = "opteed"
>   
>   # For am62lxx, install bl1 & bl31 using TFA_INSTALL_TARGET
>   TFA_INSTALL_TARGET:am62lxx = "bl31 bl1"
>   
> -EXTRA_OEMAKE:append:k3 = "${@ ' K3_USART=' + d.getVar('TFA_K3_USART') if d.getVar('TFA_K3_USART') else ''}"
> -EXTRA_OEMAKE:append:k3 = "${@ ' K3_PM_SYSTEM_SUSPEND=' + d.getVar('TFA_K3_SYSTEM_SUSPEND') if d.getVar('TFA_K3_SYSTEM_SUSPEND') else ''}"
> +EXTRA_OEMAKE += "${@ 'K3_USART=' + d.getVar('TFA_K3_USART') if d.getVar('TFA_K3_USART') else ''}"
> +EXTRA_OEMAKE += "${@ 'K3_PM_SYSTEM_SUSPEND=' + d.getVar('TFA_K3_SYSTEM_SUSPEND') if d.getVar('TFA_K3_SYSTEM_SUSPEND') else ''}"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18327): https://lists.yoctoproject.org/g/meta-ti/message/18327
> Mute This Topic: https://lists.yoctoproject.org/mt/111278675/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

