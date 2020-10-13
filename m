Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.5038.1602620730159191399
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 13 Oct 2020 13:25:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=k0BhpDF4;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: denys@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09DKPTOm125799;
	Tue, 13 Oct 2020 15:25:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1602620729;
	bh=CueT4hv9/qDasjCgqKfchvBNpPfPXxFyYHewM/iy1Ok=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=k0BhpDF4S2eZD1wIZF294zSacQepiOnXbE3d0jVzg5Rc3CEGlpnmHwZcLRfyBte/K
	 M9mhTDnlGVkVBF3zwl2IYaKGmotSExjwAJcumo+xVbIO7np0Mn/mwsl+5ZH+yooT7p
	 5bTf7mzgE9irITMcLVtYZPySKDiauHgyOPf7KQ9k=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09DKPTA8115109
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 13 Oct 2020 15:25:29 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 13
 Oct 2020 15:25:28 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 13 Oct 2020 15:25:28 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09DKPSe4101987;
	Tue, 13 Oct 2020 15:25:28 -0500
Date: Tue, 13 Oct 2020 16:25:28 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] [PATCH 2/2] ti-rtos-firmware: Remove trailing slash from S
Message-ID: <20201013202528.GA14852@beryl>
References: <20201013183642.267548-1-raj.khem@gmail.com>
 <20201013183642.267548-2-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201013183642.267548-2-raj.khem@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Oct 13, 2020 at 11:36:42AM -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Reviewed-by: Denys Dmytriyenko <denys@ti.com>


> ---
>  recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> index 2dfae1ec..2bbdd018 100644
> --- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> @@ -51,7 +51,7 @@ CORESDK_RTOS_FILE_PREFIX ?= ""
>  CORESDK_RTOS_FILE_SUFFIX ?= ""
>  
>  # Common code below
> -S = "${WORKDIR}/lib/"
> +S = "${WORKDIR}/lib"
>  
>  PV = "${CORESDK_RTOS_VERSION_DOT}"
>  
> -- 
> 2.28.0
> 

> 
> 
> 

