Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.105.1618844653380790885
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 19 Apr 2021 08:04:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=PjBFac5s;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: s-anna@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13JF4BtG020936;
	Mon, 19 Apr 2021 10:04:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618844651;
	bh=y+N42Ut6oiMoOMywySo+21h1ct4Pm14+ZV5CPV3L6WA=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=PjBFac5stHUVOW/QZ3DH41tpu2hFY51LfopQ/KdFl2venDQs8/6uIhiSW3C+XY23o
	 GF9Eazv7naZr041Tu2+0EQsT9uk/AlQ4pI/wTD0F9MiuIS4Vbnd2K/pYSf+PSMfadh
	 k79KKoXNCl9ntj/kRIp8GfY3wpRz291gOsoaOcgA=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13JF4BvP029275
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 Apr 2021 10:04:11 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 19
 Apr 2021 10:04:11 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 19 Apr 2021 10:04:11 -0500
Received: from [10.250.33.21] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13JF4Bnm060035;
	Mon, 19 Apr 2021 10:04:11 -0500
Subject: Re: [meta-ti] [dunfell/master PATCH v2 4/6] conf: k2g-evm: Remove non-existent dtb* from 5.10
To: <praneeth@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20210416050600.16593-1-praneeth@ti.com>
 <20210416050600.16593-5-praneeth@ti.com>
From: "Suman Anna" <s-anna@ti.com>
Message-ID: <e265111a-7169-cdc6-4d5f-0df4804c2725@ti.com>
Date: Mon, 19 Apr 2021 10:04:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210416050600.16593-5-praneeth@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Praneeth,

On 4/16/21 12:05 AM, praneeth via lists.yoctoproject.org wrote:
> From: Praneeth Bajjuri <praneeth@ti.com>
> 
> Remove the non-existent dtb* , as they are not currently present on
> ti-linux-5.10.y.
> 
> -    keystone-k2g-evm-lcd.dtb
> -    keystone-k2g-ice.dtb

FWIW, keystone-k2g-ice.dtb is not an overlay, and is present even on upstream
kernel. Why are you removing this?

regards
Suman

> 
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> ---
>  conf/machine/k2g-evm.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/conf/machine/k2g-evm.conf b/conf/machine/k2g-evm.conf
> index 7681a752..e032068e 100644
> --- a/conf/machine/k2g-evm.conf
> +++ b/conf/machine/k2g-evm.conf
> @@ -6,7 +6,7 @@ require conf/machine/include/k2g.inc
>  
>  MACHINE_FEATURES += "alsa"
>  
> -KERNEL_DEVICETREE = "keystone-k2g-evm.dtb keystone-k2g-evm-lcd.dtb keystone-k2g-ice.dtb \
> +KERNEL_DEVICETREE = "keystone-k2g-evm.dtb \
>                       ${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'keystone-k2g-ice-pru-excl-uio.dtb', '', d)}"
>  
>  UBOOT_MACHINE = "k2g_evm_config"
> 
> 
> 
> 
> 

