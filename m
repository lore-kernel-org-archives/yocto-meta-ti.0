Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.22395.1585168088652112478
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Mar 2020 13:28:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=zRk+0XhR;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: denys@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02PKS7Xi055834;
	Wed, 25 Mar 2020 15:28:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1585168087;
	bh=NcAUfNK/qAV4e7fQOpr4ww6EhQcqSX0ypr1Qs6R31Xc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=zRk+0XhRef7xWCE/uRLOw8JeqfExBM/ely6sQYXE5NhMelz9KUiFAKsrexgsyZKhs
	 nuZRaf8b2XTw0J/qdEVvRZkp4/c4Z7u38xnjW0/uL67I9KdkfNmtxHR9UUwb0GTpEU
	 7vUN8r8OWMc83MZlfTAL9yM6pCiQUIER6ivUdY1w=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02PKS7Ea038831
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 25 Mar 2020 15:28:07 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 25
 Mar 2020 15:28:07 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 25 Mar 2020 15:28:07 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02PKS7Vk081038;
	Wed, 25 Mar 2020 15:28:07 -0500
Date: Wed, 25 Mar 2020 16:28:07 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: <m-radhakrishnan2@ti.com>
CC: <meta-ti@yoctoproject.org>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] [thud/master][PATCH] sciclient-rtos: Specifying HS_BUILD=yes for am65xx-evm-hs targets
Message-ID: <20200325202806.GA11867@beryl>
References: <20200325140046.38709-1-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200325140046.38709-1-m-radhakrishnan2@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Why thud?
Also, please don't forget Signed-off-by: line.


On Wed, Mar 25, 2020 at 10:00:46AM -0400, Mahesh Radhakrishnan via Lists.Yoctoproject.Org wrote:
> ---
>  recipes-bsp/sciclient/sciclient-rtos_git.bb | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/recipes-bsp/sciclient/sciclient-rtos_git.bb b/recipes-bsp/sciclient/sciclient-rtos_git.bb
> index d14c4a12..74a64c1c 100644
> --- a/recipes-bsp/sciclient/sciclient-rtos_git.bb
> +++ b/recipes-bsp/sciclient/sciclient-rtos_git.bb
> @@ -25,6 +25,10 @@ SCICLIENT_ROOTPATH = "${SCICLIENT_PACKAGE_BASE}/package/all/pdk_/packages/ti/drv
>  export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
>  export PDK_SCICLIENT_ROOT_PATH = "${SCICLIENT_PACKAGE_BASE}/package/all/pdk_/packages"
>  
> +BUILD_HS = ""
> +BUILD_HS_am65xx-hs-evm = "yes"
> +export BUILD_HS
> +
>  # Sciclient for am65x supports mcu1_1 in addition to the default cores in TI_PDK_LIMIT_CORES
>  TI_PDK_LIMIT_CORES_append_am65xx = " mcu1_1"
>  
> -- 
> 2.17.1
> 

> 

