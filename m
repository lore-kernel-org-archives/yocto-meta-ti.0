Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D98BBE00566; Wed, 22 Aug 2018 15:48:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 70536E00474
	for <meta-ti@yoctoproject.org>; Wed, 22 Aug 2018 15:48:43 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7MMmgta122584
	for <meta-ti@yoctoproject.org>; Wed, 22 Aug 2018 17:48:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534978123;
	bh=4cmBYh3t6Lx3XsuthcvY6hSOX9ihCNUW+OpTaz/lhDk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Kzq8Y3ubskxcw9qe5Ta2zL/5rY5WO0jSoDUaZmzxyFUg00TJ+27FJb9V61GDWQrw7
	GLandjIve4Kja7mHPWLh2SxUdpBdeW7R3RK/t3hoSzU3Cz6IArLMZy+BZYH8Xw16Om
	kRx1S9BFwxQpJ67DbBfVzvzR1BQGUPVYg2LYrXBI=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7MMmgaM013726
	for <meta-ti@yoctoproject.org>; Wed, 22 Aug 2018 17:48:42 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 22 Aug 2018 17:48:42 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 22 Aug 2018 17:48:42 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7MMmgst002743;
	Wed, 22 Aug 2018 17:48:42 -0500
Date: Wed, 22 Aug 2018 18:47:47 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20180822224747.GK29422@beryl>
References: <1534974652-28676-1-git-send-email-sam.nelson@ti.com>
	<1534974652-28676-2-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1534974652-28676-2-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [rocko][PATCH 2/4] common-csl-ip: Update to new version 05.01.00.00
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
X-List-Received-Date: Wed, 22 Aug 2018 22:48:43 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Aug 22, 2018 at 05:50:50PM -0400, Sam Nelson wrote:
> Adds support for am65xx
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb | 2 +-
>  recipes-bsp/common-csl-ip/common-csl-ip.inc         | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
> index 5f2dbd5..7da02a3 100644
> --- a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
> +++ b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
> @@ -2,7 +2,7 @@ require common-csl-ip.inc
>  PR = "${INC_PR}.6"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> -COMPATIBLE_MACHINE_append = "|c66x"
> +COMPATIBLE_MACHINE_append = "|c66x|am65xx-evm"

k3?


>  inherit ti-pdk
>  
> diff --git a/recipes-bsp/common-csl-ip/common-csl-ip.inc b/recipes-bsp/common-csl-ip/common-csl-ip.inc
> index 8387095..ed8078d 100644
> --- a/recipes-bsp/common-csl-ip/common-csl-ip.inc
> +++ b/recipes-bsp/common-csl-ip/common-csl-ip.inc
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5857833e20836213677fac33f9aded21"
>  
>  COMPATIBLE_MACHINE = "keystone|dra7xx|ti33x|ti43x|omapl1"
>  
> -PV = "03.03.00.11A"
> +PV = "05.01.00.00"
>  INC_PR = "r0"
>  
>  CSL_GIT_URI = "git://git.ti.com/keystone-rtos/common-csl-ip.git"
> @@ -12,8 +12,8 @@ CSL_GIT_PROTOCOL ="git"
>  CSL_GIT_BRANCH = "master"
>  CSL_GIT_DESTSUFFIX = "git"
>  
> -# Below commit ID corresponding to "DEV.CSL_PROCESSOR-SDK.03.03.00.11A"
> -CSL_SRCREV = "c7b021fd5e7efa2feb8f558b3a3fd63d5dee266f"
> +# Below commit ID corresponding to "DEV.CSL_PROCESSOR-SDK.05.01.00.00"
> +CSL_SRCREV = "8db3d673101a504fd7fb36d6c9c4981e1e15ff50"
>  
>  BRANCH="${CSL_GIT_BRANCH}"
>  SRC_URI = "${CSL_GIT_URI};protocol=${CSL_GIT_PROTOCOL};branch=${BRANCH};destsuffix=${CSL_GIT_DESTSUFFIX}"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

