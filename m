Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.8106.1591914303636387731
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Jun 2020 15:25:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=D7v+BuIe;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: denys@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05BMOvIY119811;
	Thu, 11 Jun 2020 17:24:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1591914297;
	bh=Q64/vSWkfte7JmJoe27GzMKow+uPTcHQ57AwuP3Mvp4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=D7v+BuIeQ9KOK726oqC8Q2uZlV7IqQt4mdy8ChSzxD5CzNxJ4EhTwf2pW3uvSw2wi
	 gfSdFrYAq1jgVGgJhJdsTlyHp+RwDcfTN1ucDnmiDlGWmnJRwNSTYRGwyIF9YlhiLa
	 rD1c3AAe+VTT8sXvcKUKyFg6cRc6zpIi1alwCMFw=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05BMOvZb030831;
	Thu, 11 Jun 2020 17:24:57 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 11
 Jun 2020 17:24:57 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 11 Jun 2020 17:24:57 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05BMOv9R111257;
	Thu, 11 Jun 2020 17:24:57 -0500
Date: Thu, 11 Jun 2020 18:24:57 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: Ankur Tyagi <ankur.tyagi@gallagher.com>
CC: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assignment for uboot board config
Message-ID: <20200611222457.GB10194@beryl>
References: <20200609040204.47343-1-ankur.tyagi@gallagher.com>
 <SYXPR01MB1088DE758604A092AF17E50CE5800@SYXPR01MB1088.ausprd01.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <SYXPR01MB1088DE758604A092AF17E50CE5800@SYXPR01MB1088.ausprd01.prod.outlook.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Jun 11, 2020 at 10:13:53PM +0000, Ankur Tyagi wrote:
> ping

I haven't seen this patch on the list - are you sure you sent it properly? Can 
you please re-send it again?


> -----Original Message-----
> From: Ankur Tyagi <ankur.tyagi@gallagher.com> 
> Sent: Tuesday, 9 June 2020 4:02 PM
> To: meta-ti@lists.yoctoproject.org
> Cc: Ankur Tyagi <Ankur.Tyagi@gallagher.com>
> Subject: [meta-ti][dunfell/master PATCH] ti33x.inc: Use weak assignment for uboot board config
> 
> When using meta-ti BSP layer, user should be able to override default uboot
> board config with their custom board config as it is common for customers
> to design custom board based upon am335x-evm dev kit.

The idea is that if you are creating a custom board based on am335x-evm and 
adding new config to U-boot, you should consider adding a new OE machine. Even 
if your machine includes ti33x.inc for common SoC definitions, you can still 
overwrite UBOOT_MACHINE in your <custom-machine>.conf file...


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

> 

