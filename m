Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.101.1638894046959353783
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Dec 2021 08:20:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=BT7UEmk3;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1B7GKdAW100820;
	Tue, 7 Dec 2021 10:20:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1638894039;
	bh=nJpxE6/9j9ig20XrOG87T+5uadmRKrViTn5WCS9QLtQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=BT7UEmk3SdCGF81NjS4ypiY5rWPJs8SXULsaGxMXe8QBaJ/TtXt5OybKiVjCNPaKl
	 Ggxq7Eg8Y0/6RApKh/MOvx3nlMYALyb77EklmOqkiBxYpwFLuXCMat+FJOTQzKiiXd
	 Og0tVQHnu7drHbsTR1x1ayNKfLhP5bje7wGca9ho=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1B7GKcYN064416
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 Dec 2021 10:20:38 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 7
 Dec 2021 10:20:38 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 7 Dec 2021 10:20:38 -0600
Received: from [10.247.25.23] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1B7GKcSj038537;
	Tue, 7 Dec 2021 10:20:38 -0600
Message-ID: <2fae9c31-0939-b83f-d24c-dfe10566f7da@ti.com>
Date: Tue, 7 Dec 2021 10:20:38 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] Revert "conf: am437xx-evm: Remove non-existent dtb* from 5.10"
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>,
        <meta-ti@lists.yoctoproject.org>
CC: <denys@konsulko.com>, <khilman@baylibre.com>,
        Yogesh Siraswar
	<yogeshs@ti.com>, Denys Dmytriyenko <denis@denix.org>
References: <20211207153245.3548-1-aouledameur@baylibre.com>
From: "praneeth" <praneeth@ti.com>
In-Reply-To: <20211207153245.3548-1-aouledameur@baylibre.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Assuming the patch is for dunfell/master ,
for future reference, please update subject header appropriate.

On 12/7/2021 9:32 AM, Amjad Ouled-Ameur wrote:
> HDMI with Audio playback is currently broken on AM437X EVM,
> this is due to the fact that am437x-gp-evm-hdmi.dtb is missing.
> Reverting the aforementioned commit fixes the issue by adding the
> required DTB.

the required dts is added in kernel recently,was not present during the 
5.10LTS Initial migration phase hence we had to make
ba0ddc5ae9ebf9777d31283f272e4ed518e1f514 to get the builds going.

Ref: 
https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/arch/arm/boot/dts/am437x-gp-evm-hdmi.dts?h=ti-linux-5.10.y&id=25434078d3f93d1346af5e52e0f150f9083321d8

please update the commitmsg to xref the kernel commit that has added 
this dts and hence the need of revert.

ex for commit-msg for similar change on other platform:
https://git.yoctoproject.org/meta-ti/commit/?h=dunfell&id=45f43b3a292b383bdeea3b72478f323e31d641f1


> 
> This reverts commit ba0ddc5ae9ebf9777d31283f272e4ed518e1f514.
> 

> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> ---
>   conf/machine/include/ti43x.inc | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/conf/machine/include/ti43x.inc b/conf/machine/include/ti43x.inc
> index 75b745b37839..6376a27830f8 100644
> --- a/conf/machine/include/ti43x.inc
> +++ b/conf/machine/include/ti43x.inc
> @@ -27,9 +27,9 @@ PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
>   KERNEL_IMAGETYPE = "zImage"
>   
>   KERNEL_DEVICETREE = " \
> -    am437x-gp-evm.dtb \
> +    am437x-gp-evm.dtb am437x-gp-evm-hdmi.dtb \
>       am437x-sk-evm.dtb am437x-idk-evm.dtb \
> -    am43x-epos-evm.dtb \
> +    am43x-epos-evm.dtb am43x-epos-evm-hdmi.dtb \
>   "
>   
>   KERNEL_DEVICETREE += "${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'am437x-idk-pru-excl-uio.dtb', '', d)}"
> 
