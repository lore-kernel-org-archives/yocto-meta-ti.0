Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.17468.1582910071674838335
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 28 Feb 2020 09:14:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=QfCFsiv7;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: denys@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01SHEUT1076935;
	Fri, 28 Feb 2020 11:14:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582910070;
	bh=wvQ5mKB8gEVBtyh7IaJ4JoK3/hUDnoBhwRFquiKkqU8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=QfCFsiv77B+jiCkM5/aofxDhwVIwk4+PIxuAFzJENAu+rHMrQrDn1NngVRyC/m+R9
	 HZw2Ny/RGm7rWUtuVo8xz9w1om88HocVbFFq8obtWxookiCxQofG43PX32dwFuz+rp
	 kR0h6zN5bE3tCB8BHgfoMxMspqhshD+x9wlht5y8=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01SHEU5I069892;
	Fri, 28 Feb 2020 11:14:30 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 28
 Feb 2020 11:14:30 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 28 Feb 2020 11:14:29 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01SHETVv092554;
	Fri, 28 Feb 2020 11:14:29 -0600
Date: Fri, 28 Feb 2020 12:14:29 -0500
From: "Denys Dmytriyenko" <denys@ti.com>
To: <m-radhakrishnan2@ti.com>
CC: <meta-ti@yoctoproject.org>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] [thud/master][PATCH] ti-cgt-arm: Update to 18.12.5
Message-ID: <20200228171429.GF2466@beryl>
References: <20200228140556.27387-1-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200228140556.27387-1-m-radhakrishnan2@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Feb 28, 2020 at 09:05:56AM -0500, Mahesh Radhakrishnan via Lists.Yoctoproject.Org wrote:
> The License checksum has changed, but the license itself has not changed

Would be nice to mention why the checksum has changed. Year update?


> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>  .../{ti-cgt-arm_18.12.1.bb => ti-cgt-arm_18.12.5.bb}        | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename recipes-ti/devtools/{ti-cgt-arm_18.12.1.bb => ti-cgt-arm_18.12.5.bb} (81%)
> 
> diff --git a/recipes-ti/devtools/ti-cgt-arm_18.12.1.bb b/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb
> similarity index 81%
> rename from recipes-ti/devtools/ti-cgt-arm_18.12.1.bb
> rename to recipes-ti/devtools/ti-cgt-arm_18.12.5.bb
> index eecde58f..9e651819 100644
> --- a/recipes-ti/devtools/ti-cgt-arm_18.12.1.bb
> +++ b/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb
> @@ -2,7 +2,7 @@ SUMMARY = "TI ARM Code Generation Tools"
>  HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
>  LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 & Hewlett-Packard & Patrick-Powell & AFL-3.0 & MIT & BSD-2-Clause & PD & BSD-4-Clause"
>  
> -LIC_FILES_CHKSUM = "file://ti-cgt-arm_${PV}.LTS/README.txt;md5=ab7a61241e90fcd144a756d88294cf30"
> +LIC_FILES_CHKSUM = "file://ti-cgt-arm_${PV}.LTS/README.txt;md5=79631eb21b2e5b7190cd3ff1dfd41108"
>  
>  require recipes-ti/includes/ti-unpack.inc
>  require recipes-ti/includes/ti-staging.inc
> @@ -27,8 +27,8 @@ do_install() {
>      cp -r ${S}/ti-cgt-arm*/. ${D}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}
>  }
>  
> -SRC_URI[cgt_arm_installer.md5sum] = "af2378cf8d5d6f200ef3329f5a065529"
> -SRC_URI[cgt_arm_installer.sha256sum] = "d90ae2360cd5b22912715ae7898d99352da1b97fd655f9a55d0d19a2a46bab0e"
> +SRC_URI[cgt_arm_installer.md5sum] = "e9e668332cf86c965b4da9d1d488426b"
> +SRC_URI[cgt_arm_installer.sha256sum] = "da976143128c619a278cb4214a4295c409d100f9e65ad2f4d0d1039db7cf98f4"
>  
>  BINFILE_NAME = "cgt_arm_installer"
>  
> -- 
> 2.17.1
> 

> 

