Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AE26AE00B92; Tue, 18 Dec 2018 16:11:18 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 259A0E00B92
	for <meta-ti@yoctoproject.org>; Tue, 18 Dec 2018 16:11:17 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBJ0BHMd078292
	for <meta-ti@yoctoproject.org>; Tue, 18 Dec 2018 18:11:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1545178277;
	bh=szYCePIopBifv4nbj3ERSRwOee2npNuaEWY2JXilM9Q=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=esh7bkhztxxhSEWS9RBL7LKh4bn2WhkYBT7m93TJnW50USDQO8DCcRXqXQcWM5TLI
	zYgiJRWTM4BpFsKz2+UfRg6VsG9CyaPkJCo78Falc4curJCl0XEZJL5DG8QPuM/+HU
	ennOhNktyZgY6QTrx6W8IeWaOOje3qpAMSAQH4DQ=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBJ0BH75033003
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 18 Dec 2018 18:11:17 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 18 Dec 2018 18:11:17 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Tue, 18 Dec 2018 18:11:17 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wBJ0BHdc003711;
	Tue, 18 Dec 2018 18:11:17 -0600
Date: Tue, 18 Dec 2018 19:11:16 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
Message-ID: <20181219001116.GJ517@beryl>
References: <1545171996-17507-1-git-send-email-m-radhakrishnan2@ti.com>
	<1545171996-17507-3-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
In-Reply-To: <1545171996-17507-3-git-send-email-m-radhakrishnan2@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [rocko/master][PATCH 2/7] common-csl-ip: SRCREV update to 03.03.00.13A
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
X-List-Received-Date: Wed, 19 Dec 2018 00:11:18 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Dec 18, 2018 at 05:26:31PM -0500, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>  recipes-bsp/common-csl-ip/common-csl-ip.inc | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-bsp/common-csl-ip/common-csl-ip.inc b/recipes-bsp/common-csl-ip/common-csl-ip.inc
> index 201a524..ab94aee 100644
> --- a/recipes-bsp/common-csl-ip/common-csl-ip.inc
> +++ b/recipes-bsp/common-csl-ip/common-csl-ip.inc
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5857833e20836213677fac33f9aded21"
>  
>  COMPATIBLE_MACHINE = "keystone|dra7xx|ti33x|ti43x|omapl1"
>  
> -PV = "03.03.00.13"
> +PV = "03.03.00.13A"
>  INC_PR = "r0"
>  PE = "0"

Does not apply - you did not rebase your patch.


> @@ -13,8 +13,8 @@ CSL_GIT_PROTOCOL ="git"
>  CSL_GIT_BRANCH = "release"
>  CSL_GIT_DESTSUFFIX = "git"
>  
> -# Below commit ID corresponding to "DEV.CSL_PROCESSOR-SDK.03.03.00.13"
> -CSL_SRCREV = "463b1f31dfc79e6fe393fcb9027c612872d4f7b1"
> +# Below commit ID corresponding to "DEV.CSL_PROCESSOR-SDK.03.03.00.13A"
> +CSL_SRCREV = "6c52da764788e8611d763391f63616e085dae049"
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

