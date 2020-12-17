Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.12415.1608226207818902782
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 17 Dec 2020 09:30:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Masv4EKH;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: nm@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id A944838C0857
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2020 17:30:06 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BHHU5pr004979
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2020 11:30:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1608226205;
	bh=+9T+xMn75eT+iBrIVBJfxBpbeRDpzj5sKAJCEU+OjBY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Masv4EKHhC50B/c92pJs8sodTDQ5NJWBfrzEeGHrmwofMu/uszvThuo0cIZICXkP6
	 rjKWQYgD2To6cQcqhxxYaKCrBs3O4yHfxslTd49vuJxCfU3IHHwsqAjaOPLH6OzQIA
	 J77yloqrDOXtjRJ5bX6gfvEiP0USO2P5ddAUNCpg=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BHHU55W049515
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2020 11:30:05 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 17
 Dec 2020 11:30:05 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 17 Dec 2020 11:30:05 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BHHU5TI121955;
	Thu, 17 Dec 2020 11:30:05 -0600
Date: Thu, 17 Dec 2020 11:30:05 -0600
From: "Nishanth Menon" <nm@ti.com>
To: <dmurphy@ti.com>
CC: <meta-ti@yoctoproject.org>
Subject: Re: [meta-ti] [dunfell/master] [PATCH v2 06/10] ti-uboot-staging: Update to the latest commit
Message-ID: <20201217173005.v73onfawru3qvyqn@kahuna>
References: <20201217133228.22886-1-dmurphy@ti.com>
 <20201217133228.22886-7-dmurphy@ti.com>
MIME-Version: 1.0
In-Reply-To: <20201217133228.22886-7-dmurphy@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 07:32-20201217, Dan Murphy via lists.yoctoproject.org wrote:
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
> index 15dd32da66f2..1cf20c9096bc 100644
> --- a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
> +++ b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
> @@ -1,7 +1,7 @@
>  require u-boot-ti.inc
>  
> -PR = "r25"
> +PR = "r26"
>  
>  BRANCH = "ti-u-boot-2020.01"
>  
> -SRCREV = "10dad9df6a0eb00f45bed48c9df0c9effb4fbae5"
> +SRCREV = "2df0015ffde76aad8fad6348e0ddf2b814068036"


This would need to be
https://git.ti.com/cgit/ti-u-boot/ti-u-boot/commit/?h=ti-u-boot-2020.01&id=c32cf0dd6bc60911927548ad20973c71fce95661

please update.
> -- 
> 2.29.2
> 

> 
> 
> 


-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
