Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 43469E00B18; Fri, 16 Jun 2017 09:09:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [198.47.27.80 listed in list.dnswl.org]
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CC896E009A0
	for <meta-ti@yoctoproject.org>; Fri, 16 Jun 2017 09:09:46 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v5GG9kac016932
	for <meta-ti@yoctoproject.org>; Fri, 16 Jun 2017 11:09:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1497629386;
	bh=CJD1YqBPXyM/vU7zGhvKHxtN3hR3wg+/W1uJCFIIBzw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=xtSrWnE16fYvHmvgmT+BRsVjL0wRvO+bNKhyOVCODH/soForlwMCzP3amptQFxMUj
	KGQ8iBrlh7OlJQ9uG9ejUxLS2Zxly+DDRCVliElGMF5p/IqF72EjI2LuKGOpaJ7D4g
	F0txg8z4+HSXZwWR9qHsRe5uOhwqfq2j0Hc2RAyU=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5GG9jju001358
	for <meta-ti@yoctoproject.org>; Fri, 16 Jun 2017 11:09:46 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 16 Jun 2017 11:09:45 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5GG9jFI015344;
	Fri, 16 Jun 2017 11:09:45 -0500
Date: Fri, 16 Jun 2017 12:09:44 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Ivan Pang <i-pang@ti.com>
Message-ID: <20170616160944.GT21219@edge>
References: <1497629198-19239-1-git-send-email-i-pang@ti.com>
MIME-Version: 1.0
In-Reply-To: <1497629198-19239-1-git-send-email-i-pang@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] ti-sysbios: upgrade to version 6.46.5.55
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
X-List-Received-Date: Fri, 16 Jun 2017 16:09:48 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks, looks good.

On Fri, Jun 16, 2017 at 11:06:38AM -0500, Ivan Pang wrote:
> Signed-off-by: Ivan Pang <i-pang@ti.com>
> ---
>  .../bios/{ti-sysbios_6.46.01.38.bb => ti-sysbios_6.46.05.55.bb}   | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>  rename recipes-ti/bios/{ti-sysbios_6.46.01.38.bb => ti-sysbios_6.46.05.55.bb} (32%)
> 
> diff --git a/recipes-ti/bios/ti-sysbios_6.46.01.38.bb b/recipes-ti/bios/ti-sysbios_6.46.05.55.bb
> similarity index 32%
> rename from recipes-ti/bios/ti-sysbios_6.46.01.38.bb
> rename to recipes-ti/bios/ti-sysbios_6.46.05.55.bb
> index 407b3b4..e910d53 100644
> --- a/recipes-ti/bios/ti-sysbios_6.46.01.38.bb
> +++ b/recipes-ti/bios/ti-sysbios_6.46.05.55.bb
> @@ -1,12 +1,12 @@
>  require recipes-ti/bios/ti-sysbios.inc
>  
> -PV = "6_46_01_38"
> +PV = "6_46_05_55"
>  PR = "r0"
>  
> -LIC_FILES_CHKSUM = "file://manifest_bios_${PV}.html;md5=da86dca468e5dd80484dc83473ea32e3"
> +LIC_FILES_CHKSUM = "file://manifest_bios_${PV}.html;md5=1c88b63f0ce751d88354de0727623eba"
>  
> -SRC_URI[sysbiosbin.md5sum] = "5aee070f73eb6f3d9aab2ff9c483f396"
> -SRC_URI[sysbiosbin.sha256sum] = "3a04a584c3ee3221997b7d616ba45bbcc21ad241f4a4ab5c0f28c465d538af90"
> +SRC_URI[sysbiosbin.md5sum] = "8182effcbeea90778e393818ec4d65e8"
> +SRC_URI[sysbiosbin.sha256sum] = "2ad3432cafd1a93dd8cd1e56b722c979852d5c72f5defc29843d507cdd7b667a"
>  
>  TI_BIN_UNPK_CMDS=""
>  TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

