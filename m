Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.520.1584554393035119637
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 18 Mar 2020 10:59:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=nRsTH11w;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: denys@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02IHxqgP015077
	for <meta-ti@lists.yoctoproject.org>; Wed, 18 Mar 2020 12:59:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1584554392;
	bh=Ums+U2WN4mXaz+Sw4Y34dXNOH1/amDBjMM0ui26PfUQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=nRsTH11wgjFLkPmd8hNbZsx4Bc07V7lMY4xNQ0TVPDjT4p7LnfrnDPy7MIXk3Pkaz
	 0P1B1gEl9wqNodZcCbsiNmWDHtIZuLKYbkuKxLMnONrpUOI9xwPX0OWDFknVv6/WdU
	 kt+6MWzT2/VOgf5GDQLe9Ig48FMiI7etZkzQ8fzA=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02IHxqQr026492
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 18 Mar 2020 12:59:52 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 18
 Mar 2020 12:59:50 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 18 Mar 2020 12:59:49 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02IHxo1h043864;
	Wed, 18 Mar 2020 12:59:50 -0500
Date: Wed, 18 Mar 2020 13:59:49 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: <m-radhakrishnan2@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, "Stiffler, Jacob" <j-stiffler@ti.com>
Subject: Re: [meta-ti] [thud/master][PATCH v2] sciclient-rtos: SRCREV update, adding steps to generate sysfw.bin
Message-ID: <20200318175949.GE17003@beryl>
References: <20200310183305.39325-1-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200310183305.39325-1-m-radhakrishnan2@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

FYI, this now breaks Linux thud builds on am65xx-evm...


On Tue, Mar 10, 2020 at 02:33:05PM -0400, Mahesh Radhakrishnan via Lists.Yoctoproject.Org wrote:
> ---
>  recipes-bsp/sciclient/sciclient-rtos_git.bb | 41 +++++++++++++++++++--
>  1 file changed, 38 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-bsp/sciclient/sciclient-rtos_git.bb b/recipes-bsp/sciclient/sciclient-rtos_git.bb
> index 6a3d79c3..efb369bb 100644
> --- a/recipes-bsp/sciclient/sciclient-rtos_git.bb
> +++ b/recipes-bsp/sciclient/sciclient-rtos_git.bb
> @@ -7,14 +7,14 @@ TI_PDK_COMP = "ti.drv.sciclient"
>  PE = "1"
>  
>  LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://sciclient.h;beginline=1;endline=31;md5=7224b2eeca1444815f1737bfcdfa892a"
> +LIC_FILES_CHKSUM = "file://COPYING.txt;md5=99d7639a81c1ba1f16fd070a928ffddb"
>  
>  COMPATIBLE_MACHINE = "k3"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -PR = "r0"
> +PR = "r1"
>  
> -DEPENDS_append = " osal-rtos common-csl-ip-rtos"
> +DEPENDS_append = " osal-rtos common-csl-ip-rtos openssl-native"
>  
>  # Build with make instead of XDC
>  TI_PDK_XDCMAKE = "0"
> @@ -60,6 +60,41 @@ do_compile() {
>      tar -cf sciclient.tar --exclude='*.tar' ./*
>  }
>  
> +
> +do_compile_prepend_am65xx-hs-evm() {
> +
> +    cd ${SCICLIENT_ROOTPATH}
> +
> +    # Saving the GP firmware to a different GP name
> +    cp ${CP_ARGS} ./soc/V0/sysfw.bin ./soc/V0/sysfw-gp.bin
> +    
> +    cd ${SCICLIENT_ROOTPATH}/tools
> +    # Create the .bin file for HS
> +    ${SCICLIENT_ROOTPATH}/tools/firmwareHeaderGen.sh am65x-hs ${PDK_INSTALL_DIR}/packages
> +    cd -
> +}
> +
> +do_compile_prepend_am65xx-evm() {
> +
> +    cd ${SCICLIENT_ROOTPATH}/tools
> +
> +    # Create the .bin file for GP, PG1
> +    ${SCICLIENT_ROOTPATH}/tools/firmwareHeaderGen.sh am65x ${PDK_INSTALL_DIR}/packages
> +    # Create the .bin file for GP, PG2
> +    ${SCICLIENT_ROOTPATH}/tools/firmwareHeaderGen.sh am65x_pg2 ${PDK_INSTALL_DIR}/packages
> +    
> +    cd -
> +}
> +
> +
> +do_compile_prepend_j7-evm() {
> +
> +    cd ${SCICLIENT_ROOTPATH}/tools
> +    # Create the .bin file for GP
> +    ${SCICLIENT_ROOTPATH}/tools/firmwareHeaderGen.sh j721e ${PDK_INSTALL_DIR}/packages
> +    cd -
> +}
> +
>  do_install() {
>      cd ${SCICLIENT_ROOTPATH}
>      install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/sciclient
> -- 
> 2.17.1
> 

> 

