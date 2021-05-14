Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.11053.1621009103244928589
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 14 May 2021 09:18:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=MmBP/hbK;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14EGILw2085627;
	Fri, 14 May 2021 11:18:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1621009101;
	bh=I/77inSylqxq72x2EZzyzmFxxZVEwVZI2ey06MXnIXg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=MmBP/hbK8WJSZnWOBj07a7bziwygO8QsEd/JLQMESBmNAxtdAhbq6LfYb1h78F0Qf
	 HQiYtsEcQ9EWvFKfFe4Yms6DlAzeaGo2OgOuqFnk+yvYyJse51rwpmo2Nj8j1xNenb
	 WuFI85dS4/iN+miNpwsJ9TyblhDDA/UfFCKMpS+Y=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14EGILML026431
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 14 May 2021 11:18:21 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 14
 May 2021 11:18:20 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 14 May 2021 11:18:21 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14EGIKdK062931;
	Fri, 14 May 2021 11:18:20 -0500
Date: Fri, 14 May 2021 11:18:20 -0500
From: "Nishanth Menon" <nm@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <denys@konsulko.com>, <praneeth@ti.com>
Subject: Re: [meta-ti][dunfell/master][PATCH] linux-ti-staging: Added DTC_FLAG to Kernel argument to build dtbs with symbols
Message-ID: <20210514161820.ioszuqcsewohf3hs@bundle>
References: <20210514012143.7094-1-yogeshs@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210514012143.7094-1-yogeshs@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 20:21-20210513, Yogesh Siraswar wrote:
> Added DTC_FLAG (-@) to individual MACHINE configuration to compile dtbs with symbols.
> This fixes the issue where the dtbs are build without symbols causing issue with overlays

70 characters wrap please.

> 
> Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
> ---
>  conf/machine/am335x-evm.conf                  |  9 +++++++++
>  conf/machine/am335x-hs-evm.conf               |  9 +++++++++
>  conf/machine/am437x-evm.conf                  |  9 +++++++++
>  conf/machine/am437x-hs-evm.conf               |  9 +++++++++
>  conf/machine/am57xx-evm.conf                  |  8 ++++++++
>  conf/machine/am57xx-hs-evm.conf               |  9 +++++++++
>  conf/machine/am65xx-evm.conf                  |  8 ++++++++
>  conf/machine/am65xx-hs-evm.conf               |  9 +++++++++
>  conf/machine/dra7xx-evm.conf                  | 11 +++++++++++
>  conf/machine/dra7xx-hs-evm.conf               |  9 +++++++++
>  conf/machine/j7-evm.conf                      |  9 +++++++++
>  conf/machine/j7-hs-evm.conf                   |  9 +++++++++
>  conf/machine/j7200-evm.conf                   | 10 ++++++++++
>  conf/machine/k2g-evm.conf                     |  9 +++++++++
>  conf/machine/k2g-hs-evm.conf                  |  9 +++++++++
>  recipes-kernel/linux/linux-ti-staging_5.10.bb |  2 +-

how about mainline?

>  16 files changed, 137 insertions(+), 1 deletion(-)
> 
> diff --git a/conf/machine/am335x-evm.conf b/conf/machine/am335x-evm.conf
> index 469c4d37..dc50e686 100644
> --- a/conf/machine/am335x-evm.conf
> +++ b/conf/machine/am335x-evm.conf
> @@ -13,6 +13,15 @@ IMAGE_FSTYPES += "ubifs ubi"
>  SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS3"
>  SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
>  
> +#Add DTC_FLAGS to compile DTB with symbols.
> +#Weak assignment so that can be over-written with
> +#EXTRA_DTC_FLAGS = "" in local.conf

We dont need this comment every where, do we?
> +
> +EXTRA_DTC_FLAGS ?= "DTC_FLAGS=-@"
> +
> +KERNEL_EXTRA_ARGS += "${EXTRA_DTC_FLAGS}"

Should'nt this be in a common file
[...]

> diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
> index 4ec19af7..ee5e6fa1 100644
> --- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
> @@ -25,7 +25,7 @@ SRCREV = "d85aee3e19aa7403bd157d2ae30917e736096a7f"
>  PV = "5.10.30+git${SRCPV}"
>  
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
> -MACHINE_KERNEL_PR_append = "a"
> +MACHINE_KERNEL_PR_append = "b"
>  PR = "${MACHINE_KERNEL_PR}"
> 

I wonder if this comes here.
KERNEL_EXTRA_ARGS += "${EXTRA_DTC_FLAGS}"

>  KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
> -- 
> 2.17.1
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
