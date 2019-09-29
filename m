Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4FB16E00998; Sun, 29 Sep 2019 09:40:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0DD32E00874
	for <meta-ti@yoctoproject.org>; Sun, 29 Sep 2019 09:40:41 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8TGeerx015472;
	Sun, 29 Sep 2019 11:40:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569775241;
	bh=l3vpaEZIKUmfHqPOCOc414upQNG2olK6FgWnGmPHv+k=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=S6RJDfT8wRERhPYxvp8reLKQYPQSuJqEU6A2Uk+/vNaP9iK4ZSjxFBMgVr27frGqP
	GeKQUK+JpeEIniHbIjOMuda0AhGw8iDRBPmkDeFKU2FPjtndVIAFEFZ+iQQ2tETB+/
	lrhncoWsoPaCzRH4rE6XHXE7ztSB9YuxV4m7MfKQ=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8TGeeMr031515
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 29 Sep 2019 11:40:40 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Sun, 29 Sep 2019 11:40:40 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Sun, 29 Sep 2019 11:40:31 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8TGeeNm059590;
	Sun, 29 Sep 2019 11:40:40 -0500
Date: Sun, 29 Sep 2019 12:40:40 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190929164040.GA10743@beryl>
References: <20190929154335.2646732-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190929154335.2646732-1-raj.khem@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/3] u-boot-ti: Drop using COREBASE
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Sun, 29 Sep 2019 16:40:43 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sun, Sep 29, 2019 at 08:43:33AM -0700, Khem Raj wrote:
> COREBASE is hardcoding the path and moreover its obsolete the better way
> is to use relative path which is automatically searched in BBPATH by
> bitbake

This was actually done on purpose - there are many versions of u-boot.bb and 
u-boot.inc in different OE layers:
https://layers.openembedded.org/layerindex/branch/master/recipes/?q=u-boot

To avoid any conflicts, I specifically include the one from OE-Core.

COREBASE itself is not obsolete, just ${COREBASE}/LICENSE is:
https://www.yoctoproject.org/docs/current/mega-manual/mega-manual.html#var-COREBASE
https://git.openembedded.org/openembedded-core/tree/meta/conf/layer.conf#n20
https://git.openembedded.org/openembedded-core/tree/meta/classes/insane.bbclass#n468

-- 
Denys


> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes-bsp/u-boot/u-boot-ti.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
> index f1187e64..f7434712 100644
> --- a/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -13,7 +13,7 @@ UBOOT_LOCALVERSION = "-g${@get_git_revision('${S}').__str__()[:10]}"
>  UBOOT_SUFFIX ?= "img"
>  SPL_BINARY ?= "MLO"
>  
> -require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
> +require recipes-bsp/u-boot/u-boot.inc
>  
>  FILESEXTRAPATHS_prepend := "${THISDIR}/u-boot:"
>  
> -- 
> 2.23.0
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

