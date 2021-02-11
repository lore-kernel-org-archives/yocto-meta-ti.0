Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.3488.1613080752437331525
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Feb 2021 13:59:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=mJjh6eMr;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: s-anna@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 11BLxBGK042322
	for <meta-ti@lists.yoctoproject.org>; Thu, 11 Feb 2021 15:59:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1613080751;
	bh=8wVQEKsKIc/eFs3Fcin/kGISlguwBc+RWFmWDOoA/hE=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=mJjh6eMrin7vQEZMDnCQuwyFyVorArRndt5aqsE3nEVOYRZ29MoFS3/g0z8xewfFK
	 eKBPLOKeVStB7UNb4GXRigBEW12j2JrHOEFCWQapEOukiR3YH7xAA/dhMHqtX1WaH5
	 nnMZm8wTvS+uUueKO6AsmLYovlYsLgpggyACd/s4=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 11BLxBpO039447
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 11 Feb 2021 15:59:11 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 11
 Feb 2021 15:59:11 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 11 Feb 2021 15:59:11 -0600
Received: from [10.250.69.23] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 11BLxAWC086980;
	Thu, 11 Feb 2021 15:59:10 -0600
Subject: Re: [meta-ti] [dunfell/master PATCH] linux-ti-staging: Update 5.4 kernel to 07.03.00.000
To: <praneeth@ti.com>, Dan Murphy <dmurphy@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20210211215720.13920-1-praneeth@ti.com>
From: "Suman Anna" <s-anna@ti.com>
Message-ID: <94870517-e1b3-499b-3f4c-940810d70609@ti.com>
Date: Thu, 11 Feb 2021 15:59:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210211215720.13920-1-praneeth@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2/11/21 3:57 PM, praneeth via lists.yoctoproject.org wrote:
> From: Praneeth Bajjuri <praneeth@ti.com>
> 
> Update 5.4 kernel to 07.03.00.000

Hmm, 07.03.00.001?

> 
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> ---
>  recipes-kernel/linux/linux-ti-staging-rt_5.4.bb | 2 +-
>  recipes-kernel/linux/linux-ti-staging_5.4.bb    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
> index d00ac054..475a3cd3 100644
> --- a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
> +++ b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
> @@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.4:"
>  
>  BRANCH = "ti-rt-linux-5.4.y"
>  
> -SRCREV = "cfa5bbe5258d318b6fcf9743ae9002ec0a5f158a"
> +SRCREV = "21f8134c92d1f11ecca74291df672905612337ef"
>  PV = "5.4.93+git${SRCPV}"
> diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kernel/linux/linux-ti-staging_5.4.bb
> index ed330469..f5e1ba5e 100644
> --- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
> @@ -21,7 +21,7 @@ S = "${WORKDIR}/git"
>  
>  BRANCH = "ti-linux-5.4.y"
>  
> -SRCREV = "437d3ec51580225f89bc997dd06929c6aff03eef"
> +SRCREV = "cabf941a8cd60a205353cb775e450ec225a5cc3b"
>  PV = "5.4.93+git${SRCPV}"
>  
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
> 
> 
> 
> 
> 

