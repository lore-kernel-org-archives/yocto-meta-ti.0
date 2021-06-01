Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.54109.1622526926549677063
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 31 May 2021 22:55:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=KgdMCevH;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1515tOba121536
	for <meta-ti@lists.yoctoproject.org>; Tue, 1 Jun 2021 00:55:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1622526924;
	bh=XptWgNoNPJ/WfF2oyrvbzvGK23SA+Q3iBtxZnWL6mt4=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=KgdMCevHWP5XjLi656+h5vYotuZ6m8g/w7txaZYh6rTexKRshYu+SkFO/MGLvzOxT
	 Xh6bhcBI/wTUT0hQzw8xjC+9oOiqi9rgDJawQL2jgE9v3nlKWziqUa1jQBrFWWy2uW
	 P/DBr94UEIajgqSOIGf3PRI++q8dpMjan7hFXMr8=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1515tOio004334
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 1 Jun 2021 00:55:24 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 1 Jun
 2021 00:55:24 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 1 Jun 2021 00:55:24 -0500
Received: from [10.250.78.56] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1515tOLO116765;
	Tue, 1 Jun 2021 00:55:24 -0500
Subject: Re: [meta-ti PATCH] prueth-fw: am64xx-evm: add prebuilt PRU Ethernet FW
To: Grygorii Strashko <grygorii.strashko@ti.com>,
        <meta-ti@lists.yoctoproject.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Yogesh Siraswar <yogeshs@ti.com>
CC: Lokesh Vutla <lokeshvutla@ti.com>
References: <20210531153442.32342-1-grygorii.strashko@ti.com>
From: "praneeth" <praneeth@ti.com>
Message-ID: <925afb45-6988-1f67-1130-0976224d5588@ti.com>
Date: Tue, 1 Jun 2021 00:55:24 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210531153442.32342-1-grygorii.strashko@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/31/2021 10:34 AM, Grygorii Strashko wrote:
> Add prebuilt PRU Ethernet FW for am64xx-evm which is the same as
> for AM65x SR2.0.
> 
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>

Reviewed-by: Praneeth Bajjuri <praneeth@ti.com>

> ---
>   recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb | 2 +-
>   recipes-kernel/linux/kernel-rdepends.inc         | 1 +
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb b/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
> index 57cf37a2..9d579fa4 100644
> --- a/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
> +++ b/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
> @@ -7,7 +7,7 @@ PV = "02.02.08.02"
>   
>   CLEANBROKEN = "1"
>   
> -COMPATIBLE_MACHINE = "am65xx-evm"
> +COMPATIBLE_MACHINE = "am65xx-evm|am64xx-evm"
>   
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
> diff --git a/recipes-kernel/linux/kernel-rdepends.inc b/recipes-kernel/linux/kernel-rdepends.inc
> index 56dfe4b2..743b352c 100644
> --- a/recipes-kernel/linux/kernel-rdepends.inc
> +++ b/recipes-kernel/linux/kernel-rdepends.inc
> @@ -35,6 +35,7 @@ RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti43x = " prueth-fw pruhsr-fw pruprp
>   RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti33x = " prueth-fw pruhsr-fw pruprp-fw"
>   RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am65xx = " prueth-fw-am65x"
>   RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am65xx-evm = " prueth-fw-am65x-sr2"
> +RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am64xx-evm = " prueth-fw-am65x-sr2"
>   
>   # Add run-time dependency for Cadence MHDP firmware to the rootfs
>   RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7 = " cadence-mhdp-fw"
> 
