Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.15577.1588353916657617224
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 01 May 2020 10:25:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ynbKlDCG;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: denys@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 395B2E01AC1; Fri,  1 May 2020 10:25:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 814E4E01ABF
	for <meta-ti@yoctoproject.org>; Fri,  1 May 2020 10:25:12 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 041HPBHq035216
	for <meta-ti@yoctoproject.org>; Fri, 1 May 2020 12:25:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1588353911;
	bh=HJcpSMzPZTPUnXOcTgtOgJXJbaOrzbHvcWipak75FhQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ynbKlDCGyTlnb1C4zBTYuV/rdQ94SZH4L426i29uuLULIZeLzAn6ViQ2XZ9JDzTPr
	 xJkK8hVj6hXeW+rgU23qel8nVti7cpsTCX/G4FJi09bG6wAFmu5f4JV3Ljpslcq2ph
	 9LGO02dgN0wdaMkzTYXJ+TW3BVZQHFAYMA0eB7HE=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 041HPBKo024671
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 1 May 2020 12:25:11 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 1 May
 2020 12:25:11 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 1 May 2020 12:25:11 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 041HPBUK109032;
	Fri, 1 May 2020 12:25:11 -0500
Date: Fri, 1 May 2020 13:25:10 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: Nick Saulnier <nsaulnier@ti.com>
CC: <meta-ti@yoctoproject.org>
Subject: Re: [meta-ti][PATCH v1] pru-icss: update Manifest, PSSP, add am65x tx_pru
Message-ID: <20200501172510.GH11212@beryl>
References: <20200501171139.13087-1-nsaulnier@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200501171139.13087-1-nsaulnier@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Nick,

Thanks. This does not apply to master. I think you are missing addition of J7 HS.

Denys


On Fri, May 01, 2020 at 12:11:39PM -0500, Nick Saulnier wrote:
> - Updated the Software Manifest from 6.0 -> 6.1
> 	removes GPL-2.0 license from package
> 	adds j7 processor
> 
> - Updated to PRU Software Support Package v5.7.0
> 	Updated AM65x code for AM65x Silicon Revision 2.0
> 	Updated software manifest & code to remove GPL-2.0 license
> 	Minor README improvements
> 
> - Add AM65x SR2.0 TX_PRU cores & firmware to recipe
> 
> Signed-off-by: Nick Saulnier <nsaulnier@ti.com>
> ---
>  recipes-bsp/pru/pru-icss_git.bb | 25 ++++++++++++++++++++-----
>  1 file changed, 20 insertions(+), 5 deletions(-)
> 
> diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_git.bb
> index 88d28f37cc5b..1f918dd68857 100644
> --- a/recipes-bsp/pru/pru-icss_git.bb
> +++ b/recipes-bsp/pru/pru-icss_git.bb
> @@ -1,16 +1,16 @@
>  DESCRIPTION = "Programmable Real-time Unit Software Package"
>  HOMEPAGE = "http://processors.wiki.ti.com/index.php/PRU-ICSS"
> -LICENSE = "BSD-3-Clause & GPL-2.0 & PD"
> +LICENSE = "BSD-3-Clause & PD"
>  
> -LIC_FILES_CHKSUM = "file://PRU-Package-v6.0-Manifest.html;md5=ea854230556f47609efdaedca174b44c"
> +LIC_FILES_CHKSUM = "file://PRU-Package-v6.1-Manifest.html;md5=1e37797ebe9254922f4278bb6047211c"
>  
>  inherit update-alternatives
>  
>  BRANCH = "master"
>  SRC_URI = "git://git.ti.com/pru-software-support-package/pru-software-support-package.git;protocol=git;branch=${BRANCH}"
> -SRCREV = "ff252a5e174f1b6aa42931744939f20d25d8e070"
> +SRCREV = "a9bff6f43001cf66dc1ed3ef7e9dfb688b67f7bb"
>  
> -PV = "5.6.0"
> +PV = "5.7.0"
>  PR = "r1"
>  
>  require recipes-ti/includes/ti-paths.inc
> @@ -119,6 +119,8 @@ do_install_append_am65xx() {
>                     ${D}/lib/firmware/pru
>          install -m 644 ${S}/examples/${PLATFORM}/RTU_Halt/gen/RTU${i}/RTU_Halt_${i}.out \
>                     ${D}/lib/firmware/pru
> +	install -m 644 ${S}/examples/${PLATFORM}/TX_PRU_Halt/gen/TX_PRU${i}/TX_PRU_Halt_${i}.out \
> +		   ${D}/lib/firmware/pru
>      done
>      for i in 0 1 2
>      do
> @@ -199,6 +201,12 @@ ALTERNATIVE_LINK_NAME[am65x-rtu1_0-fw] = "/lib/firmware/am65x-rtu1_0-fw"
>  ALTERNATIVE_LINK_NAME[am65x-rtu1_1-fw] = "/lib/firmware/am65x-rtu1_1-fw"
>  ALTERNATIVE_LINK_NAME[am65x-rtu2_0-fw] = "/lib/firmware/am65x-rtu2_0-fw"
>  ALTERNATIVE_LINK_NAME[am65x-rtu2_1-fw] = "/lib/firmware/am65x-rtu2_1-fw"
> +ALTERNATIVE_LINK_NAME[am65x-txpru0_0-fw] = "/lib/firmware/am65x-txpru0_0-fw"
> +ALTERNATIVE_LINK_NAME[am65x-txpru0_1-fw] = "/lib/firmware/am65x-txpru0_1-fw"
> +ALTERNATIVE_LINK_NAME[am65x-txpru1_0-fw] = "/lib/firmware/am65x-txpru1_0-fw"
> +ALTERNATIVE_LINK_NAME[am65x-txpru1_1-fw] = "/lib/firmware/am65x-txpru1_1-fw"
> +ALTERNATIVE_LINK_NAME[am65x-txpru2_0-fw] = "/lib/firmware/am65x-txpru2_0-fw"
> +ALTERNATIVE_LINK_NAME[am65x-txpru2_1-fw] = "/lib/firmware/am65x-txpru2_1-fw"
>  
>  ALTERNATIVE_LINK_NAME[j7-pru0_0-fw] = "/lib/firmware/j7-pru0_0-fw"
>  ALTERNATIVE_LINK_NAME[j7-pru0_1-fw] = "/lib/firmware/j7-pru0_1-fw"
> @@ -217,7 +225,8 @@ ALTERNATIVE_LINK_NAME[j7-txpru1_1-fw] = "/lib/firmware/j7-txpru1_1-fw"
>  ALTERNATIVE_pru-icss-halt = "${PRU_ICSS_ALTERNATIVES}"
>  
>  # Only Halt firmware images are supported for the Tx_PRU cores
> -ALTERNATIVE_pru-icss-halt_append_j7-evm = " j7-txpru0_0-fw j7-txpru0_1-fw j7-txpru1_0-fw j7-txpru1_1-fw"
> +ALTERNATIVE_pru-icss-halt_append_am65xx = "am65x-txpru0_0-fw am65x-txpru0_1-fw am65x-txpru1_0-fw am65x-txpru1_1-fw am65x-txpru2_0-fw am65x-txpru2_1-fw"
> +ALTERNATIVE_pru-icss-halt_append_j7-evm = "j7-txpru0_0-fw j7-txpru0_1-fw j7-txpru1_0-fw j7-txpru1_1-fw"
>  
>  ALTERNATIVE_TARGET_pru-icss-halt[am335x-pru0-fw] = "/lib/firmware/pru/PRU_Halt.out"
>  ALTERNATIVE_TARGET_pru-icss-halt[am335x-pru1-fw] = "/lib/firmware/pru/PRU_Halt.out"
> @@ -249,6 +258,12 @@ ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu1_0-fw] = "/lib/firmware/pru/RTU_Halt_
>  ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu1_1-fw] = "/lib/firmware/pru/RTU_Halt_1.out"
>  ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu2_0-fw] = "/lib/firmware/pru/RTU_Halt_0.out"
>  ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu2_1-fw] = "/lib/firmware/pru/RTU_Halt_1.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru0_0-fw] = "/lib/firmware/pru/TX_PRU_Halt_0.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru0_1-fw] = "/lib/firmware/pru/TX_PRU_Halt_1.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru1_0-fw] = "/lib/firmware/pru/TX_PRU_Halt_0.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru1_1-fw] = "/lib/firmware/pru/TX_PRU_Halt_1.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru2_0-fw] = "/lib/firmware/pru/TX_PRU_Halt_0.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru2_1-fw] = "/lib/firmware/pru/TX_PRU_Halt_1.out"
>  
>  ALTERNATIVE_TARGET_pru-icss-halt[j7-pru0_0-fw] = "/lib/firmware/pru/PRU_Halt_0.out"
>  ALTERNATIVE_TARGET_pru-icss-halt[j7-pru0_1-fw] = "/lib/firmware/pru/PRU_Halt_1.out"
> -- 
> 2.17.1
> 
