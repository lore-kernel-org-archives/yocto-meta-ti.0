Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F08D9E00843; Thu, 31 May 2018 16:50:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.80 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D9D92E00843
	for <meta-ti@yoctoproject.org>; Thu, 31 May 2018 16:50:05 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w4VNo4q3003656
	for <meta-ti@yoctoproject.org>; Thu, 31 May 2018 18:50:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1527810604;
	bh=QAZcuDcSTwubRTTFeOJ15RY6vS69yyv+MV10AdSUYWo=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=YY+/riwUhqts5YGMCujot+7cbTGhOUCbxWhBLPaw91VaTYXKOKI+xguXqQ7xRrBmu
	frjhlmbAZGbO8o+MwJZCtTuFbVRYqfq/UvcyeSvjhiuNL497KahZ+0S6zLX3p+sKW+
	BxP5QKchRm4DCLcjLM0mD4rvaSy+cxh2kB4xRuwU=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4VNo4Bf030686
	for <meta-ti@yoctoproject.org>; Thu, 31 May 2018 18:50:04 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 31 May 2018 18:50:04 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 31 May 2018 18:50:04 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4VNo4iu021109;
	Thu, 31 May 2018 18:50:04 -0500
Date: Thu, 31 May 2018 19:48:57 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sinthu Raja <x0257345@ti.com>
Message-ID: <20180531234856.GA15048@beryl>
References: <20180531133010.12772-1-x0257345@ti.com>
MIME-Version: 1.0
In-Reply-To: <20180531133010.12772-1-x0257345@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [rocko][PATCH] update ti-pdk.bbclass file to include script packages for all components
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
X-List-Received-Date: Thu, 31 May 2018 23:50:07 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

NAK.

ti-pdk-setup is not part of meta-ti.

Also, please follow the patch submission guidelines.

-- 
Denys


On Thu, May 31, 2018 at 07:00:10PM +0530, Sinthu Raja wrote:
> From: Sinthu Raja M <x0257345@ti.com>
> 
>  Export RULES_MAKE that points to packages/Rules.make
>  Includes ti-pdk-setup to include script package for all components
> ---
>  classes/ti-pdk.bbclass | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
> index 540a665c..ee2cc1e1 100644
> --- a/classes/ti-pdk.bbclass
> +++ b/classes/ti-pdk.bbclass
> @@ -3,7 +3,10 @@ require recipes-ti/includes/ti-staging.inc
>  
>  inherit perlnative
>  
> -DEPENDS = "ti-xdctools-native ti-cg-xml-native ti-sysbios common-csl-ip-rtos libxml-simple-perl-native gcc-arm-none-eabi-native ti-cgt6x-native ti-cgt-pru-native ti-pdk-build-rtos doxygen-native"
> +#Export RULES_MAKE that points to top level Rules.make
> +export RULES_MAKE = "{PDK_INSTALL_DIR}/packages/Rules.make"
> +
> +DEPENDS = "ti-xdctools-native ti-cg-xml-native ti-sysbios common-csl-ip-rtos libxml-simple-perl-native gcc-arm-none-eabi-native ti-cgt6x-native ti-cgt-pru-native ti-pdk-build-rtos ti-pdk-setup doxygen-native"
>  
>  DEPENDS_append_omap-a15 = " ti-cgt-arm-native"
>  DEPENDS_remove_ti33x = "ti-cgt6x-native"
> -- 
> 2.13.3.windows.1
> 
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

