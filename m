Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.617.1588372299645526193
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 01 May 2020 15:31:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=H3jTNdaW;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: denys@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 09317E01AC0; Fri,  1 May 2020 15:31:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED,URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	*  0.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7F360E01A40
	for <meta-ti@yoctoproject.org>; Fri,  1 May 2020 15:31:36 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 041MVavC030677
	for <meta-ti@yoctoproject.org>; Fri, 1 May 2020 17:31:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1588372296;
	bh=Y7D0rWOpOBcmSFa6FyRX7VpTmKq2ZDFY0kqxLWCjIdQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=H3jTNdaWYw9OpfjRzyaO3ubsznTCy4aK08skfX+Mq06oEk4BobVLKs/B2wmzJ6DsI
	 ThGSnDyzANoqg7uLhVVMgq6O6F5lFbfsCoxJSBhMPk2zjolyLUbxmcHU99A1/7BhOn
	 cMMQkqvowslg0v6E0zLzHAnA6j8flbsQMAH5R+ko=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 041MVaxQ018602
	for <meta-ti@yoctoproject.org>; Fri, 1 May 2020 17:31:36 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 1 May
 2020 17:31:36 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 1 May 2020 17:31:36 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 041MVaWw077763;
	Fri, 1 May 2020 17:31:36 -0500
Date: Fri, 1 May 2020 18:31:35 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: Gowtham Tammana <g-tammana@ti.com>
CC: <meta-ti@yoctoproject.org>
Subject: Re: [meta-ti][zeus/master][PATCH] ti-img-rogue-umlibs: Update srcrev to pick latest
Message-ID: <20200501223135.GL11212@beryl>
References: <20200501222339.6078-1-g-tammana@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200501222339.6078-1-g-tammana@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks! This also looks good, but won't apply to master due to J7 HS addition. 
Can you please rebase? Thanks.


On Fri, May 01, 2020 at 05:23:39PM -0500, Gowtham Tammana wrote:
> Updating srcrev to pick latest libs
> 
>   - Support for surfaceless EGL display token
>   - RGBA4444 format support as window surface
> 
> Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
> ---
>  recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb
> index 0e0335b4..9e241b73 100644
> --- a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb
> +++ b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb
> @@ -6,12 +6,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7232b98c1c58f99e3baa03de5207e76f"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  COMPATIBLE_MACHINE = "j7-evm"
>  
> -PR = "r6"
> +PR = "r7"
>  
>  BRANCH = "linuxws/zeus/k5.4/${PV}"
>  
>  SRC_URI = "git://git.ti.com/graphics/ti-img-rogue-umlibs.git;branch=${BRANCH}"
> -SRCREV = "0721cdfc1fc86f40c93745159e3f1bcad5beda17"
> +SRCREV = "20748df00f123d56079cab07f83b0133e3378b53"
>  
>  PVR_SOC ?= "j721e_linux"
>  PVR_BUILD ?= "release"
> -- 
> 2.17.1
> 
