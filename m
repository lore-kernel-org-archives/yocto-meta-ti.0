Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 910E1E01162; Tue, 19 Jun 2018 13:58:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 18467E007AD
	for <meta-ti@yoctoproject.org>; Tue, 19 Jun 2018 13:58:38 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w5JKwclj024980
	for <meta-ti@yoctoproject.org>; Tue, 19 Jun 2018 15:58:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1529441918;
	bh=RKckSO/IGu52NGo/hz213noWEtv+6zH2P1nv6ElxSt4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=E9h8sZY0J+oW2BeKUpwAzIYgl1QpiyOtq0HU7V/VPJ2Wyj1hGSFf6CHIMHmbuD/Fo
	wdCw76uBpqBHXiFgWJ+U7oZxAPaP6cY4WhH6UckZ+AUlJ59PXPfRTnTdp6H5UToqCD
	snGEgyeF5+wUhr7WT2z/QPFnDm4Pd5gNUS6J29KM=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5JKwcgu005180
	for <meta-ti@yoctoproject.org>; Tue, 19 Jun 2018 15:58:38 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 19 Jun 2018 15:58:38 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 19 Jun 2018 15:58:38 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5JKwcr2010907;
	Tue, 19 Jun 2018 15:58:38 -0500
Date: Tue, 19 Jun 2018 16:57:33 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Djordje Senicic <x0157990@ti.com>
Message-ID: <20180619205733.GV3859@beryl>
References: <1529441821-3936-1-git-send-email-x0157990@ti.com>
MIME-Version: 1.0
In-Reply-To: <1529441821-3936-1-git-send-email-x0157990@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org, d-senicic1@ti.com
Subject: Re: [rocko/master/ti2018.01][PATCHv2] ti-pdk-build: New DEV.PDK_BUILD.01.00.00.08F
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
X-List-Received-Date: Tue, 19 Jun 2018 20:58:39 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

What's the difference from v1?


On Tue, Jun 19, 2018 at 04:57:01PM -0400, Djordje Senicic wrote:
> * Enhancements for semi-hosting support
> * Add TDA2x cascade board support
> * Adding arp32 makefile
> * Add McBSP component
> * mmwvedfp migration
> 
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> ---
>  recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
> index 0f60714..e81f6e8 100644
> --- a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
> +++ b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
> @@ -4,15 +4,15 @@ LIC_FILES_CHKSUM = "file://makerules/env.mk;beginline=1;endline=31;md5=10503e8de
>  
>  require recipes-ti/includes/ti-paths.inc
>  
> -PV = "01.00.00.08E"
> +PV = "01.00.00.08F"
>  PR = "r0"
>  
>  PDK_BUILD_GIT_URI = "git://git.ti.com/keystone-rtos/processor-pdk-build.git"
>  PDK_BUILD_GIT_PROTOCOL = "git"
>  PDK_BUILD_GIT_BRANCH = "master"
>  
> -# Below Commit ID corresponds to "DEV.PDK_BUILD.01.00.00.08E"
> -PDK_BUILD_SRCREV = "9622a097c143188cab74b8827461eafdf54f8ed9"
> +# Below Commit ID corresponds to "DEV.PDK_BUILD.01.00.00.08F"
> +PDK_BUILD_SRCREV = "4d41f3540af5850f1c7f57afcb8a7b4610cfc8f0"
>  
>  BRANCH = "${PDK_BUILD_GIT_BRANCH}"
>  SRC_URI = "\
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

