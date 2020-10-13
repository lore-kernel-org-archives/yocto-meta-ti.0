Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.5651.1602622590845382824
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 13 Oct 2020 13:56:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Frq1E940;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: denys@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09DKuU7i020822
	for <meta-ti@lists.yoctoproject.org>; Tue, 13 Oct 2020 15:56:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1602622590;
	bh=F0XBgW/B5q43TiiGRPvmv6Nuy3TwLUlSAUQh50BbgDY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Frq1E940pO6952D0eVerIflwrXmXY41tzJkgvChw/Ur2T9Kz75q7QV+R7L+GnmJhm
	 Y2O/w6//PqFV6TBnzFa8E/xxHTULiw8ne4/vQUs/FLnm982x0kTGnOK4R2YA2pUy9z
	 WnQoyHDIGMlbG0K7xthDWfL+vAT9w3kANWUzV3MQ=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09DKuUGC068719
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 13 Oct 2020 15:56:30 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 13
 Oct 2020 15:56:29 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 13 Oct 2020 15:56:29 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09DKuTlQ025971;
	Tue, 13 Oct 2020 15:56:29 -0500
Date: Tue, 13 Oct 2020 16:56:29 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: Dan Murphy <dmurphy@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [PATCH] linux-ti-staging: Update kernel to 5.4.70
Message-ID: <20201013205629.GC14852@beryl>
References: <20201013180014.27373-1-dmurphy@ti.com>
MIME-Version: 1.0
In-Reply-To: <20201013180014.27373-1-dmurphy@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Oct 13, 2020 at 01:00:14PM -0500, Dan Murphy wrote:
> Signed-off-by: Dan Murphy <dmurphy@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@ti.com>


> ---
>  recipes-kernel/linux/linux-ti-staging-rt_5.4.bb | 4 ++--
>  recipes-kernel/linux/linux-ti-staging_5.4.bb    | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
> index c02e3b50c2aa..5127d372fc18 100644
> --- a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
> +++ b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
> @@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.4:"
>  
>  BRANCH = "ti-rt-linux-5.4.y"
>  
> -SRCREV = "ed5007e8489c355b5baeddeae5cf53f7882acee7"
> -PV = "5.4.69+git${SRCPV}"
> +SRCREV = "a5dca123aec8168af717956d3b1896a33989313c"
> +PV = "5.4.70+git${SRCPV}"
> diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kernel/linux/linux-ti-staging_5.4.bb
> index 2b4557d9b601..9df51c5b17ea 100644
> --- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
> @@ -60,8 +60,8 @@ S = "${WORKDIR}/git"
>  
>  BRANCH = "ti-linux-5.4.y"
>  
> -SRCREV = "f85baf8e2e6374594eb76d4c14ada9d62a2fa98b"
> -PV = "5.4.69+git${SRCPV}"
> +SRCREV = "cbeb88bfa96152c2b974a18ad14e84fa9f466f2f"
> +PV = "5.4.70+git${SRCPV}"
>  
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
>  MACHINE_KERNEL_PR_append = "a"
> -- 
> 2.28.0.585.ge1cfff676549
> 
