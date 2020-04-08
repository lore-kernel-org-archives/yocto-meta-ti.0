Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.1123.1586370096423467132
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Apr 2020 11:21:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=XQR2hMV5;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: denys@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F3C64E01994; Wed,  8 Apr 2020 11:21:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DB189E01991
	for <meta-ti@yoctoproject.org>; Wed,  8 Apr 2020 11:21:34 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 038ILXCk077327
	for <meta-ti@yoctoproject.org>; Wed, 8 Apr 2020 13:21:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1586370093;
	bh=G2FKLksVLcseDvaPY9t/1F/Xf5l4XW2KSE0OQYOmFYo=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=XQR2hMV5jbmHqyo6FHhsJ1XNSS60+nGl0SBGdNXCUNTkWYkaYRM8sj/2mZk4dUb8y
	 RtPl4V+9bwqv9/emXEYygrEX3jZMagTV1pb+102j6pwE22py11TdQzwaxhDDbD9xqC
	 tPSI8FYEqDdYLsW8pMn29jdBD34sDerCcTgA7egs=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 038ILXDY017406
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 8 Apr 2020 13:21:33 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 8 Apr
 2020 13:21:33 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 8 Apr 2020 13:21:33 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 038ILX9v012441;
	Wed, 8 Apr 2020 13:21:33 -0500
Date: Wed, 8 Apr 2020 14:21:33 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: <m-radhakrishnan2@ti.com>
CC: <meta-ti@yoctoproject.org>
Subject: Re: [meta-ti] [zeus/master][PATCH 3/5] pm-lld-rtos:SRCREV update to 01.08.00.23A
Message-ID: <20200408182133.GW24070@beryl>
References: <20200406221928.23776-1-m-radhakrishnan2@ti.com>
 <20200406221928.23776-4-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200406221928.23776-4-m-radhakrishnan2@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Apr 06, 2020 at 06:19:26PM -0400, Mahesh Radhakrishnan via lists.yoctoproject.org wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>  recipes-bsp/pm-lld/pm-lld-rtos_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
> index 5db670e3..a6090d2f 100644
> --- a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
> +++ b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
> @@ -20,8 +20,8 @@ PM_LLD_GIT_BRANCH_k2g = "int_pm_am335x"
>  
>  PM_LLD_GIT_DESTSUFFIX = "git/ti/drv/pm"
>  
> -# Below commit ID corresponds to "DEV.PM_LLD.01.08.00.23"
> -PM_LLD_SRCREV = "7c064b93a0ae648441991abb5c71b99d2c209eeb"
> +# Below commit ID corresponds to "DEV.PM_LLD.01.08.00.23A"
> +PM_LLD_SRCREV = "759abc6ffb890d24b82de0248d204ad10c1bfc2a"

ERROR: Fetcher failure: Unable to find revision 759abc6ffb890d24b82de0248d204ad10c1bfc2a in branch master even from upstream


>  # Below commit ID corresponds to "DEV.PM_LLD.01.04.00.05C"
>  PM_LLD_SRCREV_ti33x = "dd1f8486e7738956631b7f4829c8238be2e49dd6"
> @@ -32,7 +32,7 @@ BRANCH = "${PM_LLD_GIT_BRANCH}"
>  SRC_URI = "${PM_LLD_GIT_URI};destsuffix=${PM_LLD_GIT_DESTSUFFIX};protocol=${PM_LLD_GIT_PROTOCOL};branch=${BRANCH}"
>  
>  SRCREV = "${PM_LLD_SRCREV}"
> -PV = "01.08.00.23"
> +PV = "01.08.00.23A"
>  PR = "r0"
>  
>  S = "${WORKDIR}/${PM_LLD_GIT_DESTSUFFIX}"
> -- 
> 2.17.1
> 

> 

