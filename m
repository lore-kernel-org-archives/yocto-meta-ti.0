Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.26687.1592250107751726223
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 15 Jun 2020 12:41:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=N3CJo3WY;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: denys@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05FJffok070422;
	Mon, 15 Jun 2020 14:41:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1592250101;
	bh=lEri0pRmVbZixUxV/9avX1t2q0txY0feA3otNmbGPQI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=N3CJo3WYTolBSAOZVEe/zBdITKgzLjE1bYS0J0B8yMrrT2eOHaVxPILPBadnogTx0
	 fn0RXZ5byUdGtcNuTgdtQ5NqTp4+u7/07Xeji2yIG68Ea+Dp1mFR1ThAMM6A8zWPGH
	 iaYd5b3aWDE15xpLzy4yV14tZuRBKkM1v5ZkrqhY=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05FJffwE038214
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 15 Jun 2020 14:41:41 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 15
 Jun 2020 14:41:41 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 15 Jun 2020 14:41:41 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05FJffiI065313;
	Mon, 15 Jun 2020 14:41:41 -0500
Date: Mon, 15 Jun 2020 15:41:41 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: Ankur Tyagi <Ankur.Tyagi@gallagher.com>
CC: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assignment for uboot board config
Message-ID: <20200615194140.GB10991@beryl>
References: <20200611223018.58178-1-ankur.tyagi@gallagher.com>
 <SYXPR01MB10887259A369A29D4C3B932CE5800@SYXPR01MB1088.ausprd01.prod.outlook.com>
 <SY3PR01MB0809877DA03074D6265139D1E59C0@SY3PR01MB0809.ausprd01.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <SY3PR01MB0809877DA03074D6265139D1E59C0@SY3PR01MB0809.ausprd01.prod.outlook.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jun 15, 2020 at 07:38:36PM +0000, Ankur Tyagi wrote:
> Hi Denys,
> 
> Gentle reminder as this patch has been in the mailing list (#12992) for some 
> time now but I haven't heard anything.

Is your subscription working properly? I did reply here:
https://lists.yoctoproject.org/g/meta-ti/topic/74828692


> Regards
> Ankur
> 
> -----Original Message-----
> From: Ankur Tyagi 
> Sent: Friday, 12 June 2020 10:49 AM
> To: meta-ti@lists.yoctoproject.org
> Subject: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assignment for uboot board config
> 
> When using meta-ti BSP layer, user should be able to override default uboot
> board config with their custom board config as it is common for customers
> to design custom board based upon am335x-evm dev kit.
> 
> Signed-off-by: Ankur Tyagi <ankur.tyagi@gallagher.com>
> ---
>  conf/machine/include/ti33x.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
> index abfd7ec7..ff72a382 100644
> --- a/conf/machine/include/ti33x.inc
> +++ b/conf/machine/include/ti33x.inc
> @@ -39,7 +39,7 @@ KERNEL_DEVICETREE = " \
>  KERNEL_DEVICETREE += "${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'am335x-icev2-pru-excl-uio.dtb', '', d)}"
>  
>  UBOOT_ARCH = "arm"
> -UBOOT_MACHINE = "am335x_evm_config"
> +UBOOT_MACHINE ?= "am335x_evm_config"
>  
>  UBOOT_ENTRYPOINT = "0x80008000"
>  UBOOT_LOADADDRESS = "0x80008000"
> -- 
> 2.17.1
> 
