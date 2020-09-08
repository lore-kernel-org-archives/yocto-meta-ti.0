Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.22886.1599579176852006397
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 08 Sep 2020 08:32:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=fHkFkGIi;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: denys@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 271FC38C11E1
	for <meta-ti@yoctoproject.org>; Tue,  8 Sep 2020 08:32:56 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 088FWtog064105
	for <meta-ti@yoctoproject.org>; Tue, 8 Sep 2020 10:32:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1599579175;
	bh=rtG9sFN2TGK/LSItqL3oKwf5Uc3RIAdoD5jWXvyNOW0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=fHkFkGIiHe5QHK0ViCmkE8bjoS2XBD1w2OeaJn/buBnIjyfuXJj0WM2HgjLPUKUNX
	 Ypn2+LyF5nuVASR4qZy6NHh4YmzTOTvR8+XY3z9vqxw/dNbRrE9VcWTdRleqkax2/n
	 h1/1pPlFCCmEU+7/ht/Jkh0Gpqknoie7Ek2PwBhE=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 088FWtlU084297
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 8 Sep 2020 10:32:55 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 8 Sep
 2020 10:32:54 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 8 Sep 2020 10:32:54 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 088FWssC081386;
	Tue, 8 Sep 2020 10:32:54 -0500
Date: Tue, 8 Sep 2020 11:32:54 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: Subhajit Paul <a0132170@ti.com>
CC: <meta-ti@yoctoproject.org>, <dmurphy@ti.com>, <m-radhakrishnan2@ti.com>
Subject: Re: [meta-ti][dunfell PATCH] ti-rtos: enable parallel make
Message-ID: <20200908153253.GA1562@beryl>
References: <20200907064007.23032-1-a0132170@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200907064007.23032-1-a0132170@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Has this been extensively tested on all platforms?


On Mon, Sep 07, 2020 at 12:10:07PM +0530, Subhajit Paul wrote:
> Signed-off-by: Subhajit Paul <a0132170@ti.com>
> ---
>  classes/ti-pdk.bbclass                      | 1 -
>  recipes-bsp/sciclient/sciclient-rtos_git.bb | 2 +-
>  recipes-bsp/udma-lld/udma-lld-rtos_git.bb   | 2 +-
>  3 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
> index 37305e89..a3685602 100644
> --- a/classes/ti-pdk.bbclass
> +++ b/classes/ti-pdk.bbclass
> @@ -72,7 +72,6 @@ TI_PDK_DOXYGEN_SUPPORT ?= "1"
>  TI_PDK_XDC_ARGS ?= "${TI_PDK_LIMIT_SOCS}"
>  
>  PARALLEL_XDC = "${@oe.utils.parallel_make_argument(d, '--jobs=%d')}"
> -PARALLEL_MAKE = ""
>  
>  def get_doxygen_support(d):
>      if d.getVar('TI_PDK_DOXYGEN_SUPPORT') == '1':
> diff --git a/recipes-bsp/sciclient/sciclient-rtos_git.bb b/recipes-bsp/sciclient/sciclient-rtos_git.bb
> index deaf0b12..26b09537 100644
> --- a/recipes-bsp/sciclient/sciclient-rtos_git.bb
> +++ b/recipes-bsp/sciclient/sciclient-rtos_git.bb
> @@ -59,7 +59,7 @@ do_compile() {
>      # make clean LIMIT_SOCS="${LIMSOCS}" LIMIT_BOARDS="${LIMBOARDS}"
>  
>      # Build am65xx libraries
> -    make lib xdc_meta doxygen LIMIT_SOCS="${TI_PDK_LIMIT_SOCS}" LIMIT_BOARDS="${TI_PDK_LIMIT_BOARDS}" LIMIT_CORES="${TI_PDK_LIMIT_CORES}"
> +    oe_runmake lib xdc_meta doxygen LIMIT_SOCS="${TI_PDK_LIMIT_SOCS}" LIMIT_BOARDS="${TI_PDK_LIMIT_BOARDS}" LIMIT_CORES="${TI_PDK_LIMIT_CORES}"
>  
>      #archive
>      tar -cf sciclient.tar --exclude='*.tar' ./*
> diff --git a/recipes-bsp/udma-lld/udma-lld-rtos_git.bb b/recipes-bsp/udma-lld/udma-lld-rtos_git.bb
> index a82eb362..797572d3 100644
> --- a/recipes-bsp/udma-lld/udma-lld-rtos_git.bb
> +++ b/recipes-bsp/udma-lld/udma-lld-rtos_git.bb
> @@ -48,7 +48,7 @@ do_compile() {
>      cd ${UDMA_LLD_ROOTPATH}
>  
>      # Build am65xx libraries
> -    make clean lib xdc_meta doxygen LIMIT_SOCS="${TI_PDK_LIMIT_SOCS}" LIMIT_BOARDS="${TI_PDK_LIMIT_BOARDS}" LIMIT_CORES="${TI_PDK_LIMIT_CORES}"
> +    oe_runmake clean lib xdc_meta doxygen LIMIT_SOCS="${TI_PDK_LIMIT_SOCS}" LIMIT_BOARDS="${TI_PDK_LIMIT_BOARDS}" LIMIT_CORES="${TI_PDK_LIMIT_CORES}"
>  
>      #archive
>      tar -cf udma_lld.tar --exclude='*.tar' ./*
> -- 
> 2.17.1
> 
