Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.1734.1601923486293144870
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 05 Oct 2020 11:44:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=q9+GpTMn;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: denys@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 095IijZZ067383
	for <meta-ti@lists.yoctoproject.org>; Mon, 5 Oct 2020 13:44:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1601923485;
	bh=Xqo2GotMCta/F1CR0XtaOawpWgg+pDQ9HZq6pXKl5yo=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=q9+GpTMnq1/HHdaOhvCinJl5yhh/Am2BGLtQHyHYvqBD1in4XTFQ6F/wXd/8uocJf
	 y7ythUJ2p91h/y5JZspGjVfrpTZADDNhxoBhDu7FsK9srACeAdn9dl2vf42Qg0n+w+
	 WcZzfSSPIAopRhQ5zchEV2/EjWRzlaNQBtOzTp6w=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 095Iij6q035679
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 5 Oct 2020 13:44:45 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 5 Oct
 2020 13:44:45 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 5 Oct 2020 13:44:45 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 095IiiTB022445;
	Mon, 5 Oct 2020 13:44:45 -0500
Date: Mon, 5 Oct 2020 14:44:44 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: Dan Murphy <dmurphy@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [PATCH v2] prueth-fw-am65x-sr2: Updating firmware to 02.02.07.02
Message-ID: <20201005184444.GO7434@beryl>
References: <20201005183853.17882-1-dmurphy@ti.com>
MIME-Version: 1.0
In-Reply-To: <20201005183853.17882-1-dmurphy@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Oct 05, 2020 at 01:38:53PM -0500, Dan Murphy wrote:
> From: "Dan Murphy via Lists.Yoctoproject.Org" <dmurphy=ti.com@lists.yoctoproject.org>

Hmm, I don't believe mailing list is supposed to mangle this part in the body, 
only the headers... E.g. the earlier patch from Praveen had this correct. You 
might want to check your local settings?


> Signed-off-by: Dan Murphy <dmurphy@ti.com>

Otherwise the patch looks good

Reviewed-by: Denys Dmytriyenko <denys@ti.com>


> ---
>  recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb b/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
> index 6e17c4aa5c7c..c66bee80d79c 100644
> --- a/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
> +++ b/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
> @@ -3,7 +3,7 @@ SUMMARY = "PRU Ethernet firmware for AM65xx SR2.0"
>  LICENSE = "TI-TFL"
>  LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
>  
> -PV = "2.2.0.1+2.2.0.2-rc1"
> +PV = "02.02.07.02"
>  
>  CLEANBROKEN = "1"
>  
> @@ -11,7 +11,7 @@ COMPATIBLE_MACHINE = "am65xx-evm"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -SRCREV = "ea4bf53ba0a4a30bb7e0e8b6138fdb22fe50372a"
> +SRCREV = "c911bcec682ef053a15f9c7d5867a0dd2da2632b"
>  BRANCH ?= "ti-linux-firmware"
>  
>  SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
> -- 
> 2.28.0.585.ge1cfff676549
> 
