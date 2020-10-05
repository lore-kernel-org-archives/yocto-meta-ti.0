Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.1492.1601922911562941233
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 05 Oct 2020 11:35:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=MygYRH5C;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: denys@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 095IZABh064013
	for <meta-ti@lists.yoctoproject.org>; Mon, 5 Oct 2020 13:35:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1601922910;
	bh=kFm6PhH6XhpkHEGfDL2swpR2DHIuYdAQLT6H3hZDlhc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=MygYRH5CrA4rQX6x17XKWG3ou394+/O1YD6/eLTFTVl1QvRHjz6+/e2gkNhAeS54E
	 b1hUwfvy+co/fhTbIRjrscuBb0iP9qflAtpMRWQnimLT1Tu9NB8RnV5gID3gIRiIyu
	 YryRrwlmINBFWTLX3DV2Jvx8r+f3a9QW7IcwW47w=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 095IZAqU043686
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 5 Oct 2020 13:35:10 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 5 Oct
 2020 13:34:10 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 5 Oct 2020 13:34:10 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 095IY9wi123031;
	Mon, 5 Oct 2020 13:34:10 -0500
Date: Mon, 5 Oct 2020 14:34:09 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: Dan Murphy <dmurphy@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [PATCH] prueth-fw-am65x-sr2: Updating firmware to 02.02.07.02
Message-ID: <20201005183409.GN7434@beryl>
References: <20201005182648.21308-1-dmurphy@ti.com>
MIME-Version: 1.0
In-Reply-To: <20201005182648.21308-1-dmurphy@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Oct 05, 2020 at 01:26:48PM -0500, Dan Murphy wrote:
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb b/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
> index 6e17c4aa5c7c..b4d7ae8b2576 100644
> --- a/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
> +++ b/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
> @@ -3,7 +3,7 @@ SUMMARY = "PRU Ethernet firmware for AM65xx SR2.0"
>  LICENSE = "TI-TFL"
>  LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
>  
> -PV = "2.2.0.1+2.2.0.2-rc1"
> +PV = "02.02.07.02+02.02.07.02-rc1"

This is not an RC, I believe it is final 2.2.7.2 or 02.02.07.02:

+PV = "02.02.07.02"

The strange versioning used before was a special Debian way of ensuring the 
proper version sorting:

1.2.3
1.2.3+1.2.4-rc1
1.2.4
1.2.4-rc1

As you see above, 1.2.4-rc1 would be sorted higher than 1.2.4 release. Hence 
1.2.3+1.2.4-rc1 is used - it is higher than 1.2.3 but lower than 1.2.4.

This is important for the binary packages and package feeds - ensures opkg 
upgrade pulls the correct latest version.


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
