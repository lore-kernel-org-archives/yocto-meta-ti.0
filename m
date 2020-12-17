Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.637.1608229009911844526
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 17 Dec 2020 10:16:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=WQFcllJn;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: nm@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 1504038C1142
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2020 18:16:49 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BHIGmaX021728
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2020 12:16:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1608229008;
	bh=pSUPnY7GqpmM/fjoaEtBpv+laItpY1M5CmxCCoYKBBg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=WQFcllJnnMlYUtzu5m5NeCIykbk8leztTp38Khn8i2a/yFj/giWNFwOu+JK24ev7L
	 QFfE6wsAT7OfP17Kx43t5Jvlb2VMCHPADro6/BEQmL5eCrzrcaxX1L6KpUGKvo87sD
	 w8ILXr/XacaVFHjCZGlJOjl5gGYoDKMQg690ZfHA=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BHIGm79119553
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2020 12:16:48 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 17
 Dec 2020 12:16:48 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 17 Dec 2020 12:16:48 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BHIGm6q109437;
	Thu, 17 Dec 2020 12:16:48 -0600
Date: Thu, 17 Dec 2020 12:16:47 -0600
From: "Nishanth Menon" <nm@ti.com>
To: <dmurphy@ti.com>
CC: <meta-ti@yoctoproject.org>
Subject: Re: [meta-ti] [dunfell/master] [PATCH v2 09/10] ti-sci-fw: Update image gen and sysfw commit SHA
Message-ID: <20201217181647.voshz7uyuu6yk2nn@sloping>
References: <20201217133228.22886-1-dmurphy@ti.com>
 <20201217133228.22886-10-dmurphy@ti.com>
MIME-Version: 1.0
In-Reply-To: <20201217133228.22886-10-dmurphy@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 07:32-20201217, Dan Murphy via lists.yoctoproject.org wrote:
> Update the image gen and sysfw commit SHAs.
> Temporarily pick up the firmware-next branch to get the AM64x firmware.
> This branch change will need to be reverted once the firmware is merged.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  recipes-bsp/ti-sci-fw/ti-sci-fw.inc | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> index fe391e5fc40b..5f07ad19bd44 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> @@ -4,10 +4,11 @@ LICENSE = "TI-TFL"
>  LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
>  
>  PV = "2020.08b"
> +PV_am64xx-evm-k3r5 = "2020.23"
>  
> -SRCREV = "c26c279257c13a0ff5002b09113fcff0e1d18853"
> +SRCREV = "a4e232f9293be29ce1a684357112965365d6e285"

Should be https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/commit/?h=ti-linux-firmware&id=078c1bbf3d0a05b4045d4091c32e91ee1ae15ff8

>  BRANCH ?= "ti-linux-firmware"
> -SRCREV_imggen = "7b4fe13d642d69a559724349aede4817891008a7"
> +SRCREV_imggen = "6d023674b0655f1a7bba192d2600c08be314e9ef"
>  SRCREV_FORMAT = "imggen"
>  
>  SRC_URI = " \
> -- 
> 2.29.2
> 



Also Noticed in the recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb file:

SYSFW_PREFIX_7200-hs-evm-k3r5
.. should have been (j is missing - a typo):
SYSFW_PREFIX_j7200-hs-evm-k3r5

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
