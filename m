Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.140841.1598035204607091688
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 21 Aug 2020 11:40:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=AeBbZ9Rz;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: denys@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07LIe3Y3120689
	for <meta-ti@lists.yoctoproject.org>; Fri, 21 Aug 2020 13:40:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1598035203;
	bh=FDsbqXCHOC/4L/8pT+u1tWjdLaR25qy68GcLrr6cUzs=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=AeBbZ9Rz5QnUATn/TvIqb67W5AeEA87Rt/vq3Y3oPDCVJ4MkormCIcOkrCwYCtAvE
	 7YBoQk2gMR9j1m4KL+0zekWpUR4inE6UDZor/6QszIKF71A1BIJTVN+qon5L9BBmoE
	 rks8WqiG/iJYoMl2ctxAf92L8qXlqoUYWN6y0pUw=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07LIe30s010594
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 21 Aug 2020 13:40:03 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 21
 Aug 2020 13:40:03 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 21 Aug 2020 13:40:03 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07LIe2PL052025;
	Fri, 21 Aug 2020 13:40:03 -0500
Date: Fri, 21 Aug 2020 14:40:02 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: Lokesh Vutla <lokeshvutla@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Sekhar Nori <nsekhar@ti.com>,
        <m-erdahl@ti.com>, <m-karicheri2@ti.com>
Subject: Re: [PATCH 1/3] prueth-hsr/prp: Update hsr/prp firmwares to latest
Message-ID: <20200821184002.GJ29812@beryl>
References: <20200821073238.18926-1-lokeshvutla@ti.com>
 <20200821073238.18926-2-lokeshvutla@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200821073238.18926-2-lokeshvutla@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Aug 21, 2020 at 01:02:36PM +0530, Lokesh Vutla wrote:
> Update the hsr/prp firmwares to latest that includes support for
> timestamping rx packets. Unfortunately version number is not
> incremented for this update.
> 
> Also rename the bb file to add PV in it.

This is fine, but you need to choose which one provides the correct PV. 
Currently you have it duplicated:

pruhsr-fw_2.15.23.bb will set PV = "2.15.23" automatically from the filename, 
but you also have existing PV = "2.15.23" inside the recipe. Same for other 
recipe.

The recommendation is to set PV in the filename for released tarballs.

When the code is pulled directly from git, it is acceptable (and sometimes 
even preferred) to use _git in the filename and set PV explicitly inside the 
recipe. And if you expect these to be updated regularly, you can avoid churn 
of renaming the recipe with the new version. Also that's preferred for 
packages (probably not in this case) that need to be AUTOREV-ed to the latest 
for any nightly CI atuomation...

-- 
Denys
 

> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> ---
>  .../pruhsr-fw/{pruhsr-fw_git.bb => pruhsr-fw_2.15.23.bb}      | 4 +++-
>  .../pruprp-fw/{pruprp-fw_git.bb => pruprp-fw_2.15.23.bb}      | 4 +++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
>  rename recipes-bsp/pruhsr-fw/{pruhsr-fw_git.bb => pruhsr-fw_2.15.23.bb} (93%)
>  rename recipes-bsp/pruprp-fw/{pruprp-fw_git.bb => pruprp-fw_2.15.23.bb} (93%)
> 
> diff --git a/recipes-bsp/pruhsr-fw/pruhsr-fw_git.bb b/recipes-bsp/pruhsr-fw/pruhsr-fw_2.15.23.bb
> similarity index 93%
> rename from recipes-bsp/pruhsr-fw/pruhsr-fw_git.bb
> rename to recipes-bsp/pruhsr-fw/pruhsr-fw_2.15.23.bb
> index 0c7e7148..aebe255e 100644
> --- a/recipes-bsp/pruhsr-fw/pruhsr-fw_git.bb
> +++ b/recipes-bsp/pruhsr-fw/pruhsr-fw_2.15.23.bb
> @@ -7,11 +7,13 @@ PV = "2.15.23"
>  PE = "1"
>  PR = "r0"
>  
> +CLEANBROKEN = "1"
> +
>  COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|am57xx-hs-evm"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -SRCREV = "313e20f312a286bc07b97ef9aca70ef3ce96af29"
> +SRCREV = "7ba9722b74608ad4472790972917e1205eb3c049"
>  BRANCH ?= "ti-linux-firmware"
>  
>  SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
> diff --git a/recipes-bsp/pruprp-fw/pruprp-fw_git.bb b/recipes-bsp/pruprp-fw/pruprp-fw_2.15.23.bb
> similarity index 93%
> rename from recipes-bsp/pruprp-fw/pruprp-fw_git.bb
> rename to recipes-bsp/pruprp-fw/pruprp-fw_2.15.23.bb
> index 046e8dad..e0e36c2d 100644
> --- a/recipes-bsp/pruprp-fw/pruprp-fw_git.bb
> +++ b/recipes-bsp/pruprp-fw/pruprp-fw_2.15.23.bb
> @@ -7,11 +7,13 @@ PV = "2.15.23"
>  PE = "1"
>  PR = "r0"
>  
> +CLEANBROKEN = "1"
> +
>  COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|am57xx-hs-evm"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -SRCREV = "313e20f312a286bc07b97ef9aca70ef3ce96af29"
> +SRCREV = "7ba9722b74608ad4472790972917e1205eb3c049"
>  BRANCH ?= "ti-linux-firmware"
>  
>  SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
> -- 
> 2.23.0
> 
