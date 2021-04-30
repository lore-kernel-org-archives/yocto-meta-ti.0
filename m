Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.2857.1619812975458032854
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 30 Apr 2021 13:02:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=PfyfX/PO;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: s-anna@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13UK2sEk124040;
	Fri, 30 Apr 2021 15:02:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1619812974;
	bh=Nnnh8hkcNo6j2gcnTgjUYF8jn2yd4cdFpwv/FZ5xkNs=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=PfyfX/POAtMElxk/E5aI7yIjgGClt/MTLV2zy7dj+pgsX/iL9WReoFgChJ3fTQdFW
	 R8u7edExcShDIlkSHPLYBl4v29PEqx3yLO4BJeFnnYVJQ0S+l5QouyTj2jYPVe8wu3
	 Skf3xQgE+r/HN5FrL+Qkd9JF4+ed3++LBaSrFi8Q=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13UK2sNS010861
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 30 Apr 2021 15:02:54 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 30
 Apr 2021 15:02:53 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 30 Apr 2021 15:02:53 -0500
Received: from [10.250.34.141] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13UK2rDd124793;
	Fri, 30 Apr 2021 15:02:53 -0500
Subject: Re: [meta-ti] [dunfell/master PATCH 2/2] linux-ti-staging: Update 5.10 kernel to 5.10.30
To: <praneeth@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Yogesh Siraswar <yogeshs@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20210430182006.12039-1-praneeth@ti.com>
 <20210430182006.12039-2-praneeth@ti.com>
From: "Suman Anna" <s-anna@ti.com>
Message-ID: <0979d12e-4d89-768a-3da1-c6989502059c@ti.com>
Date: Fri, 30 Apr 2021 15:02:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210430182006.12039-2-praneeth@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Praneeth,

On 4/30/21 1:20 PM, praneeth via lists.yoctoproject.org wrote:
> From: Praneeth Bajjuri <praneeth@ti.com>
> 
> Update linux 5.10 to 5.10.30 stable.

I guess you are redoing this patch to reflect the latest tagged kernel commit SHAs?

regards
Suman

> 
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> ---
>  recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 4 ++--
>  recipes-kernel/linux/linux-ti-staging_5.10.bb    | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
> index d4104b6d..a6f104a2 100644
> --- a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
> +++ b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
> @@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.10:"
>  
>  BRANCH = "ti-rt-linux-5.10.y"
>  
> -SRCREV = "00634c794573abb7fcbbf44437b2969214edfc7a"
> -PV = "5.10.21+git${SRCPV}"
> +SRCREV = "bafb98f9e116d9f41e40299d4f900b66d6f673fe"
> +PV = "5.10.30+git${SRCPV}"
> diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
> index b4de40de..6121f912 100644
> --- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
> @@ -21,8 +21,8 @@ S = "${WORKDIR}/git"
>  
>  BRANCH = "ti-linux-5.10.y"
>  
> -SRCREV = "bdfd5b0c1ee5617c9a94bacad0d818920d95b486"
> -PV = "5.10.21+git${SRCPV}"
> +SRCREV = "d29eceaef9c09b732d8e95afb47429a9fe602275"
> +PV = "5.10.30+git${SRCPV}"
>  
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
>  MACHINE_KERNEL_PR_append = "a"
> 
> 
> 
> 
> 

