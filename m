Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.421.1588631544359070431
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 04 May 2020 15:32:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=LBzpGBrp;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: s-anna@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E23EBE01AE8; Mon,  4 May 2020 15:32:23 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1F084E01AE6
	for <meta-ti@yoctoproject.org>; Mon,  4 May 2020 15:32:21 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 044MWLkT030531
	for <meta-ti@yoctoproject.org>; Mon, 4 May 2020 17:32:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1588631541;
	bh=JrPEh3c0nm5tOnjaUXmjCGDHqzqTsX/3fHbkPhWgSo0=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=LBzpGBrpkSPdEWMgH34SaIujczi6FOJgOFkKWtNeZp8ZJRcx9HRKpH8sRKBkplGaL
	 isOH5BgKBGov1X2M+JOplP+yFxHzaPm/Vu/bavipQDJYXFqbS9JRbhlzcADAOgPlOR
	 34ivUhvddP6IdhaWxPgsm90kSxzYNZUgaY8oE3cs=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 044MWLPi023132
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 4 May 2020 17:32:21 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 4 May
 2020 17:32:21 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 4 May 2020 17:32:21 -0500
Received: from [10.250.70.56] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 044MWK9A087989;
	Mon, 4 May 2020 17:32:20 -0500
Subject: Re: [meta-ti][PATCH v2] pru-icss: update Manifest, PSSP, add am65x tx_pru
To: Nick Saulnier <nsaulnier@ti.com>, <meta-ti@yoctoproject.org>
CC: <denys@ti.com>, <j-stiffler@ti.com>
References: <20200504014418.9951-1-nsaulnier@ti.com>
From: s-anna@ti.com
Message-ID: <199d64f3-ec2a-a9a3-d62e-ab37d31f3b50@ti.com>
Date: Mon, 4 May 2020 17:32:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200504014418.9951-1-nsaulnier@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 5/3/20 8:44 PM, Nick Saulnier wrote:
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

Reviewed-by: Suman Anna <s-anna@ti.com>

> ---
>   recipes-bsp/pru/pru-icss_git.bb | 25 ++++++++++++++++++++-----
>   1 file changed, 20 insertions(+), 5 deletions(-)
> 
> diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_git.bb
> index 72888515273b..fc7b6f7dd345 100644
> --- a/recipes-bsp/pru/pru-icss_git.bb
> +++ b/recipes-bsp/pru/pru-icss_git.bb
> @@ -1,17 +1,17 @@
>   DESCRIPTION = "Programmable Real-time Unit Software Package"
>   HOMEPAGE = "http://processors.wiki.ti.com/index.php/PRU-ICSS"
> -LICENSE = "BSD-3-Clause & GPL-2.0 & PD"
> +LICENSE = "BSD-3-Clause & PD"
>   
> -LIC_FILES_CHKSUM = "file://PRU-Package-v6.0-Manifest.html;md5=ea854230556f47609efdaedca174b44c"
> +LIC_FILES_CHKSUM = "file://PRU-Package-v6.1-Manifest.html;md5=1e37797ebe9254922f4278bb6047211c"
>   
>   inherit update-alternatives
>   
>   BRANCH = "master"
>   SRC_URI = "git://git.ti.com/pru-software-support-package/pru-software-support-package.git;protocol=git;branch=${BRANCH}"
> -SRCREV = "ff252a5e174f1b6aa42931744939f20d25d8e070"
> +SRCREV = "a9bff6f43001cf66dc1ed3ef7e9dfb688b67f7bb"
>   
> -PV = "5.6.0"
> -PR = "r1"
> +PV = "5.7.0"
> +PR = "r0"
>   
>   require recipes-ti/includes/ti-paths.inc
>   
> @@ -119,6 +119,8 @@ do_install_append_am65xx() {
>                      ${D}/lib/firmware/pru
>           install -m 644 ${S}/examples/${PLATFORM}/RTU_Halt/gen/RTU${i}/RTU_Halt_${i}.out \
>                      ${D}/lib/firmware/pru
> +        install -m 644 ${S}/examples/${PLATFORM}/TX_PRU_Halt/gen/TX_PRU${i}/TX_PRU_Halt_${i}.out \
> +                   ${D}/lib/firmware/pru
>       done
>       for i in 0 1 2
>       do
> @@ -199,6 +201,12 @@ ALTERNATIVE_LINK_NAME[am65x-rtu1_0-fw] = "/lib/firmware/am65x-rtu1_0-fw"
>   ALTERNATIVE_LINK_NAME[am65x-rtu1_1-fw] = "/lib/firmware/am65x-rtu1_1-fw"
>   ALTERNATIVE_LINK_NAME[am65x-rtu2_0-fw] = "/lib/firmware/am65x-rtu2_0-fw"
>   ALTERNATIVE_LINK_NAME[am65x-rtu2_1-fw] = "/lib/firmware/am65x-rtu2_1-fw"
> +ALTERNATIVE_LINK_NAME[am65x-txpru0_0-fw] = "/lib/firmware/am65x-txpru0_0-fw"
> +ALTERNATIVE_LINK_NAME[am65x-txpru0_1-fw] = "/lib/firmware/am65x-txpru0_1-fw"
> +ALTERNATIVE_LINK_NAME[am65x-txpru1_0-fw] = "/lib/firmware/am65x-txpru1_0-fw"
> +ALTERNATIVE_LINK_NAME[am65x-txpru1_1-fw] = "/lib/firmware/am65x-txpru1_1-fw"
> +ALTERNATIVE_LINK_NAME[am65x-txpru2_0-fw] = "/lib/firmware/am65x-txpru2_0-fw"
> +ALTERNATIVE_LINK_NAME[am65x-txpru2_1-fw] = "/lib/firmware/am65x-txpru2_1-fw"
>   
>   ALTERNATIVE_LINK_NAME[j7-pru0_0-fw] = "/lib/firmware/j7-pru0_0-fw"
>   ALTERNATIVE_LINK_NAME[j7-pru0_1-fw] = "/lib/firmware/j7-pru0_1-fw"
> @@ -217,6 +225,7 @@ ALTERNATIVE_LINK_NAME[j7-txpru1_1-fw] = "/lib/firmware/j7-txpru1_1-fw"
>   ALTERNATIVE_pru-icss-halt = "${PRU_ICSS_ALTERNATIVES}"
>   
>   # Only Halt firmware images are supported for the Tx_PRU cores
> +ALTERNATIVE_pru-icss-halt_append_am65xx = "am65x-txpru0_0-fw am65x-txpru0_1-fw am65x-txpru1_0-fw am65x-txpru1_1-fw am65x-txpru2_0-fw am65x-txpru2_1-fw"
>   ALTERNATIVE_pru-icss-halt_append_j7 = " j7-txpru0_0-fw j7-txpru0_1-fw j7-txpru1_0-fw j7-txpru1_1-fw"
>   
>   ALTERNATIVE_TARGET_pru-icss-halt[am335x-pru0-fw] = "/lib/firmware/pru/PRU_Halt.out"
> @@ -249,6 +258,12 @@ ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu1_0-fw] = "/lib/firmware/pru/RTU_Halt_
>   ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu1_1-fw] = "/lib/firmware/pru/RTU_Halt_1.out"
>   ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu2_0-fw] = "/lib/firmware/pru/RTU_Halt_0.out"
>   ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu2_1-fw] = "/lib/firmware/pru/RTU_Halt_1.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru0_0-fw] = "/lib/firmware/pru/TX_PRU_Halt_0.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru0_1-fw] = "/lib/firmware/pru/TX_PRU_Halt_1.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru1_0-fw] = "/lib/firmware/pru/TX_PRU_Halt_0.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru1_1-fw] = "/lib/firmware/pru/TX_PRU_Halt_1.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru2_0-fw] = "/lib/firmware/pru/TX_PRU_Halt_0.out"
> +ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru2_1-fw] = "/lib/firmware/pru/TX_PRU_Halt_1.out"
>   
>   ALTERNATIVE_TARGET_pru-icss-halt[j7-pru0_0-fw] = "/lib/firmware/pru/PRU_Halt_0.out"
>   ALTERNATIVE_TARGET_pru-icss-halt[j7-pru0_1-fw] = "/lib/firmware/pru/PRU_Halt_1.out"
> 

