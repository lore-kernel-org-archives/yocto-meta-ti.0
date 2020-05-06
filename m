Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.1562.1588728314671337855
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 05 May 2020 18:25:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=LK9JqVfE;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: denys@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 83B7AE01AF3; Tue,  5 May 2020 18:25:14 -0700 (PDT)
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
	*      [198.47.23.248 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 00799E01AF1
	for <meta-ti@yoctoproject.org>; Tue,  5 May 2020 18:25:12 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0461PCMS021606
	for <meta-ti@yoctoproject.org>; Tue, 5 May 2020 20:25:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1588728312;
	bh=dv12Y6R1Il2NIm46CMM2aa8u6j8NgvunXiq+gcSQ8uo=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=LK9JqVfEYyiRCsO4++D/60fh4xvHAO6eHLohjrqMG4ZzsYkXe4KvFDHNUHQnJM4w4
	 ijip1GdmSnTx+F0TQFKTeq2/ce6jVhxkMaaBgxoh7sq1WaewtKOkiuMe7nPTPFt+9s
	 +hKJZU8eGPEYMKkbYRWeEFFcl6AtHQmWOi63n+y8=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0461PCVo029711
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 5 May 2020 20:25:12 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 5 May
 2020 20:25:12 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 5 May 2020 20:25:11 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0461PBI8120015;
	Tue, 5 May 2020 20:25:11 -0500
Date: Tue, 5 May 2020 21:25:11 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: Nick Saulnier <nsaulnier@ti.com>
CC: <meta-ti@yoctoproject.org>, <j-stiffler@ti.com>, <s-anna@ti.com>
Subject: Re: [meta-ti][PATCH v2] pru-icss: update Manifest, PSSP, add am65x tx_pru
Message-ID: <20200506012511.GN2849@beryl>
References: <20200504014418.9951-1-nsaulnier@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200504014418.9951-1-nsaulnier@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

WARNING: pru-icss-5.7.0-r0 do_package: pru-icss: alternative target (/usr/bin/am65x-rtu2_1-fwam65x-txpru0_0-fw or /usr/bin/am65x-rtu2_1-fwam65x-txpru0_0-fw.pru-icss) does not exist, skipping...
WARNING: pru-icss-5.7.0-r0 do_package: pru-icss: NOT adding alternative provide /usr/bin/am65x-rtu2_1-fwam65x-txpru0_0-fw: /usr/bin/am65x-rtu2_1-fwam65x-txpru0_0-fw.pru-icss does not exist
WARNING: pru-icss-5.7.0-r0 do_package: pru-icss: alt_link == alt_target: /usr/bin/am65x-rtu2_1-fwam65x-txpru0_0-fw == /usr/bin/am65x-rtu2_1-fwam65x-txpru0_0-fw


On Sun, May 03, 2020 at 08:44:18PM -0500, Nick Saulnier wrote:
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
> index 72888515273b..fc7b6f7dd345 100644
> --- a/recipes-bsp/pru/pru-icss_git.bb
> +++ b/recipes-bsp/pru/pru-icss_git.bb
> @@ -1,17 +1,17 @@
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
> -PR = "r1"
> +PV = "5.7.0"
> +PR = "r0"
>  
>  require recipes-ti/includes/ti-paths.inc
>  
> @@ -119,6 +119,8 @@ do_install_append_am65xx() {
>                     ${D}/lib/firmware/pru
>          install -m 644 ${S}/examples/${PLATFORM}/RTU_Halt/gen/RTU${i}/RTU_Halt_${i}.out \
>                     ${D}/lib/firmware/pru
> +        install -m 644 ${S}/examples/${PLATFORM}/TX_PRU_Halt/gen/TX_PRU${i}/TX_PRU_Halt_${i}.out \
> +                   ${D}/lib/firmware/pru
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
> @@ -217,6 +225,7 @@ ALTERNATIVE_LINK_NAME[j7-txpru1_1-fw] = "/lib/firmware/j7-txpru1_1-fw"
>  ALTERNATIVE_pru-icss-halt = "${PRU_ICSS_ALTERNATIVES}"
>  
>  # Only Halt firmware images are supported for the Tx_PRU cores
> +ALTERNATIVE_pru-icss-halt_append_am65xx = "am65x-txpru0_0-fw am65x-txpru0_1-fw am65x-txpru1_0-fw am65x-txpru1_1-fw am65x-txpru2_0-fw am65x-txpru2_1-fw"
>  ALTERNATIVE_pru-icss-halt_append_j7 = " j7-txpru0_0-fw j7-txpru0_1-fw j7-txpru1_0-fw j7-txpru1_1-fw"
>  
>  ALTERNATIVE_TARGET_pru-icss-halt[am335x-pru0-fw] = "/lib/firmware/pru/PRU_Halt.out"
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
