Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.440.1610061384959768054
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 07 Jan 2021 15:16:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=JV5DCxa/;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: s-anna@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 107NGO8E032210
	for <meta-ti@lists.yoctoproject.org>; Thu, 7 Jan 2021 17:16:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1610061384;
	bh=2p1wgUiUdxAERtxV0jfqZ3MdIhT2pxrbUOyl8Q2pB08=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=JV5DCxa/CfASxYBX8Maltb2n8cLVfAS80l4vVPwvYuyY7gapyl9YqyxW6VJpenT01
	 Lsm9bsfuMZqkc3jXifyX5JjVBPHS19/8txhjl2fx81ZYYFHTj7g8fUeuaRa28ZOnCq
	 fRWqxEykUkPcinHvsHwKCN44HZYDXmkcDB3+V5Gc=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 107NGOPe124718
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 7 Jan 2021 17:16:24 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 7 Jan
 2021 17:16:23 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 7 Jan 2021 17:16:23 -0600
Received: from [10.250.33.36] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 107NGNSw128943;
	Thu, 7 Jan 2021 17:16:23 -0600
Subject: Re: [meta-ti] [master/dunfell PATCH V2] ti-sci-fw: am64x: Update image gen and sysfw to v2020.12
To: <praneeth@ti.com>, Dan Murphy <dmurphy@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20210107231438.18812-1-praneeth@ti.com>
From: "Suman Anna" <s-anna@ti.com>
Message-ID: <dc68d396-bc8f-82da-3ba7-1de6931ae846@ti.com>
Date: Thu, 7 Jan 2021 17:16:18 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210107231438.18812-1-praneeth@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/7/21 5:14 PM, praneeth via lists.yoctoproject.org wrote:
> From: Praneeth Bajjuri <praneeth@ti.com>
> 
> Update the image gen and sysfw commit SHAs so that am64x picks
> v2020.12 version.
> 
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>

Reviewed-by: Suman Anna <s-anna@ti.com>

> ---
> v2: update commit message
> 
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

