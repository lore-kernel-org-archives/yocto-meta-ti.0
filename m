Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web09.6146.1580769940848784212
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 03 Feb 2020 14:45:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=n8zwQC0L;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: denys@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 013MjdB8048901;
	Mon, 3 Feb 2020 16:45:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1580769939;
	bh=VnXu6Vo6nsoT6A8D+AXXtZY+7NBGpMoQu+AYJpsyirE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=n8zwQC0LWU2ehts9JtiWrM9SaVBXFTelg/l9FNBunMEgU9ItyyPuk0IsqanfrvvqN
	 aC+c5xHtyEe7EqU46eGm1+Lhln5H+kz0/+LKGQsUP3zPpxYZln/5IAi9cZFvMWDhw/
	 lwpJJ+xVcFiWJuOSNzK3mE7x26emkRs3jMZ+ADkE=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 013MjdL0052443
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 3 Feb 2020 16:45:39 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 3 Feb
 2020 16:45:39 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 3 Feb 2020 16:45:39 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 013MjdeQ126754;
	Mon, 3 Feb 2020 16:45:39 -0600
Date: Mon, 3 Feb 2020 17:45:39 -0500
From: "Denys Dmytriyenko" <denys@ti.com>
To: <m-radhakrishnan2@ti.com>
CC: <meta-ti@yoctoproject.org>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] [thud/master][PATCH 2/2] sciclient-rtos: Updating License checksum, along with the file it is calculated
Message-ID: <20200203224538.GB26854@beryl>
References: <20200203224309.19843-1-m-radhakrishnan2@ti.com>
 <20200203224309.19843-3-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200203224309.19843-3-m-radhakrishnan2@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Feb 03, 2020 at 05:43:09PM -0500, Mahesh Radhakrishnan via Lists.Yoctoproject.Org wrote:
> From: Mahesh Radhakrishnan <a0875154@UDA0875154>
> 
> The license as such has not changed, but moved to a License file which
> is not expected to change frequently
> ---
>  recipes-bsp/sciclient/sciclient-rtos_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-bsp/sciclient/sciclient-rtos_git.bb b/recipes-bsp/sciclient/sciclient-rtos_git.bb
> index 6a3d79c3..1f65149c 100644
> --- a/recipes-bsp/sciclient/sciclient-rtos_git.bb
> +++ b/recipes-bsp/sciclient/sciclient-rtos_git.bb
> @@ -7,12 +7,12 @@ TI_PDK_COMP = "ti.drv.sciclient"
>  PE = "1"
>  
>  LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://sciclient.h;beginline=1;endline=31;md5=7224b2eeca1444815f1737bfcdfa892a"
> +LIC_FILES_CHKSUM = "file://COPYING.txt;beginline=1;endline=31;md5=c05dd6e04691b3339c447a7a21691705"

Do you want to drop beginline/endline since the entire file is the license now?


>  COMPATIBLE_MACHINE = "k3"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -PR = "r0"
> +PR = "r1"
>  
>  DEPENDS_append = " osal-rtos common-csl-ip-rtos"
>  
> -- 
> 2.17.1
> 

> 

