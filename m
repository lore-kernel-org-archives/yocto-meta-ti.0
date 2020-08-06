Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.10327.1596731700041405660
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Aug 2020 09:35:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=bmB1rdA5;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: denys@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7E64EE01FA3; Thu,  6 Aug 2020 09:34:59 -0700 (PDT)
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
	*      [198.47.19.142 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6ABEFE01FA1
	for <meta-ti@yoctoproject.org>; Thu,  6 Aug 2020 09:34:56 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 076GYudS003102
	for <meta-ti@yoctoproject.org>; Thu, 6 Aug 2020 11:34:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1596731696;
	bh=+1h0gt0q1k79u64zjzXhPlATEZGi4E8mxsAAsCKi//A=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=bmB1rdA52P+su5KjAyAokHZMuo4plkFToD1E8T9CabZpaDDF9tUXllGf858KomAs8
	 g5O017SR10tpuYuU5FPYuqCPzDgopbXVEpSnt8SaALmXI3vDPnoxDII/FX8NCtCgNG
	 B1PqKk2uZ7gM57KAdNnEzGMuJl9MZ/lHpFx87o20=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 076GYuCm042737
	for <meta-ti@yoctoproject.org>; Thu, 6 Aug 2020 11:34:56 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 6 Aug
 2020 11:34:55 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 6 Aug 2020 11:34:55 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 076GYtUD092656;
	Thu, 6 Aug 2020 11:34:55 -0500
Date: Thu, 6 Aug 2020 12:34:55 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: Dan Murphy <dmurphy@ti.com>
CC: <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] linux-ti-staging: update to 5.4.54
Message-ID: <20200806163455.GX14660@beryl>
References: <20200806145317.10393-1-dmurphy@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200806145317.10393-1-dmurphy@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Doesn't seem to apply. There was another update yesterday being tested in 
"next" - can you please rebase?


On Thu, Aug 06, 2020 at 09:53:17AM -0500, Dan Murphy wrote:
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  recipes-kernel/linux/linux-ti-staging-rt_5.4.bb | 4 ++--
>  recipes-kernel/linux/linux-ti-staging_5.4.bb    | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
> index 87c64c555cdb..f7c3ce53668b 100644
> --- a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
> +++ b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
> @@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.4:"
>  
>  BRANCH = "ti-rt-linux-5.4.y"
>  
> -SRCREV = "92c1547f2d83a4a75a1181a88631ef2d64f1e0dd"
> -PV = "5.4.52+git${SRCPV}"
> +SRCREV = "93189093447068135d91f93aa75ee1c1239438f1"
> +PV = "5.4.54+git${SRCPV}"
> diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kernel/linux/linux-ti-staging_5.4.bb
> index 28dedccc74f3..75ce5bad7fde 100644
> --- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
> @@ -61,8 +61,8 @@ S = "${WORKDIR}/git"
>  
>  BRANCH = "ti-linux-5.4.y"
>  
> -SRCREV = "41c32273d7f5666a5637a109ec004fd746d5efac"
> -PV = "5.4.52+git${SRCPV}"
> +SRCREV = "e5a461dfc65bd00558e0b40e97f678cc7fa480bd"
> +PV = "5.4.54+git${SRCPV}"
>  
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
>  MACHINE_KERNEL_PR_append = "a"
> -- 
> 2.28.0
> 
