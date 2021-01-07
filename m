Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.1211.1610045831671896645
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 07 Jan 2021 10:57:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=WZ2pMfGn;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: s-anna@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 107IvAtK071382
	for <meta-ti@lists.yoctoproject.org>; Thu, 7 Jan 2021 12:57:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1610045830;
	bh=9/48BlkQTTFKE2GbO80d8UxFEobIEygXju3P8hjSq8M=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=WZ2pMfGnFstVSbUWKIKCRA46dVnVQTOl7xrLnZ2ECvL2T5NuUyUndeqs87wZ0rlph
	 8/BpRYeqY2wL86Mw9aBsZg18OsgY27rd3EOXbdT13sv/KI+RFVWUAGkDhpGJG0Q/+p
	 NnluKdSe9hzEmk8a5ALms1nGQ7SYj7b8BUg5bjvs=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 107IvA8h042572
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 7 Jan 2021 12:57:10 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 7 Jan
 2021 12:57:09 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 7 Jan 2021 12:57:09 -0600
Received: from [10.250.33.36] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 107Iv9A8082191;
	Thu, 7 Jan 2021 12:57:09 -0600
Subject: Re: [meta-ti] [dunfell/master PATCH] ti-sci-fw: Update image gen and sysfw commit SHA
To: <praneeth@ti.com>, Dan Murphy <dmurphy@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20210107023726.5867-1-praneeth@ti.com>
From: "Suman Anna" <s-anna@ti.com>
Message-ID: <b7d04a45-a1d2-61be-e449-b10d8d708ff5@ti.com>
Date: Thu, 7 Jan 2021 12:57:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210107023726.5867-1-praneeth@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Praneeth,

On 1/6/21 8:37 PM, praneeth via lists.yoctoproject.org wrote:
> From: Praneeth Bajjuri <praneeth@ti.com>
> 
> Update the image gen and sysfw commit SHAs

Would prefer some meaningful commit message. Would be nice to see the upgrade
information of SYSFW 2020.12 for AM64x in the patch.

regards
Suman

> 
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> ---
>  recipes-bsp/ti-sci-fw/ti-sci-fw.inc | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> index 174d9539..ae22b7a5 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> @@ -4,11 +4,11 @@ LICENSE = "TI-TFL"
>  LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
>  
>  PV = "2020.08b"
> -PV_am64xx-evm-k3r5 = "2020.23"
> +PV_am64xx-evm-k3r5 = "2020.12"
>  
> -SRCREV = "078c1bbf3d0a05b4045d4091c32e91ee1ae15ff8"
> +SRCREV = "0c268f292f3b3a71d3bd0b367f492304b45e37b1"
>  BRANCH ?= "ti-linux-firmware"
> -SRCREV_imggen = "6d023674b0655f1a7bba192d2600c08be314e9ef"
> +SRCREV_imggen = "a4796e5f1304fe8197cba54ccea3d18b9998ff02"
>  SRCREV_FORMAT = "imggen"
>  
>  SRC_URI = " \
> 
> 
> 
> 
> 

