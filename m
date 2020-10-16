Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.25132.1602877280183057186
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 16 Oct 2020 12:41:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=qKSAE67s;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: denys@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09GJfICb079336
	for <meta-ti@lists.yoctoproject.org>; Fri, 16 Oct 2020 14:41:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1602877278;
	bh=ynsZAV7R3EXgtNSUQ7tApyO7DMvfEL0rF5UxF/ac6RQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=qKSAE67sPaVkE/sIFvYGqhoFDwMjldmvlMksf/LrN/AuIl31MHWPUYB1kQFb7xHSz
	 3JXyYKz6pj8nVinC2eV2VWWEQYLmfGkh33TgOLhPv0z3hiMGULeDpwa3xLOppdPoiW
	 N0CXS/jrdHO3cY4mHvIOafT2QN7+rBzNrTgNl2MQ=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09GJfIdJ039355
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 16 Oct 2020 14:41:18 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 16
 Oct 2020 14:41:18 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 16 Oct 2020 14:41:18 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09GJfIQf078106;
	Fri, 16 Oct 2020 14:41:18 -0500
Date: Fri, 16 Oct 2020 15:41:18 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: Dan Murphy <dmurphy@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [PATCH] prusw-fw: Update the firmware to 3.1.6 version
Message-ID: <20201016194118.GU14852@beryl>
References: <20201015115548.21626-1-dmurphy@ti.com>
MIME-Version: 1.0
In-Reply-To: <20201015115548.21626-1-dmurphy@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Oct 15, 2020 at 06:55:48AM -0500, Dan Murphy wrote:
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  recipes-bsp/prusw-fw/{prusw-fw_3.1.4.bb => prusw-fw_3.1.6.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename recipes-bsp/prusw-fw/{prusw-fw_3.1.4.bb => prusw-fw_3.1.6.bb} (93%)
> 
> diff --git a/recipes-bsp/prusw-fw/prusw-fw_3.1.4.bb b/recipes-bsp/prusw-fw/prusw-fw_3.1.6.bb
> similarity index 93%
> rename from recipes-bsp/prusw-fw/prusw-fw_3.1.4.bb
> rename to recipes-bsp/prusw-fw/prusw-fw_3.1.6.bb
> index b8897e4bb25b..684e77460021 100644
> --- a/recipes-bsp/prusw-fw/prusw-fw_3.1.4.bb
> +++ b/recipes-bsp/prusw-fw/prusw-fw_3.1.6.bb
> @@ -3,7 +3,7 @@ SUMMARY = "PRU Switch firmware for AM57xx, AM437x and AM335x"
>  LICENSE = "TI-TFL"
>  LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
>  
> -PR = "r0"
> +PR = "r1"

This is not strictly needed - you are already bumping PV from 3.1.4 to 3.1.6


>  CLEANBROKEN = "1"
>  
> @@ -11,7 +11,7 @@ COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|am57xx-hs-evm"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -SRCREV = "b19bf13a16d7f5c1260cf4d48cf967e5c7e15128"
> +SRCREV = "f95d048c0a007a5acac706edea4a3ffbfa8ca933"
>  BRANCH ?= "ti-linux-firmware"
>  
>  SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
> -- 
> 2.28.0.585.ge1cfff676549
> 
