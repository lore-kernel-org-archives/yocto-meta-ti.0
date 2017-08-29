Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E7D04E00C14; Tue, 29 Aug 2017 13:44:49 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9759CE008D2
	for <meta-ti@yoctoproject.org>; Tue, 29 Aug 2017 13:44:48 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7TKilY7009891
	for <meta-ti@yoctoproject.org>; Tue, 29 Aug 2017 15:44:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504039487;
	bh=NeoazuDMWlNheEQsvjdpM1ovMIkivflV8NBDDD1Eia4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Xll6NAFdeaB5tKdJDRQiKb9Rqa/Tr/sAisdiXXsK6SIaE8bydIBlvSOMyJgHytNA1
	zwPEHXQeMe/797M9Pc8jk6Lc8rW8ULisfWhdqm2UyLvZBnSZGK6L43ZR/PRjLneoQs
	O3GHziuYEejvwwfI+a0wmSY01cH5GY38ehXOtKMU=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7TKilDI031859
	for <meta-ti@yoctoproject.org>; Tue, 29 Aug 2017 15:44:47 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 29 Aug 2017 15:44:47 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 29 Aug 2017 15:44:47 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7TKilFs024069;
	Tue, 29 Aug 2017 15:44:47 -0500
Date: Tue, 29 Aug 2017 16:44:43 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20170829204442.GP8304@edge>
References: <1504039303-40389-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1504039303-40389-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [morty/master][PATCH v2] multiprocmgr: Update to new version 3.0.4.0
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
X-List-Received-Date: Tue, 29 Aug 2017 20:44:50 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

This has already been fixed.

On Tue, Aug 29, 2017 at 04:41:43PM -0400, Sam Nelson wrote:
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> 
> ---
> Update from previous patch
> Removed extra spaces in commit
> ---
> ---
>  recipes-ti/multiprocmgr/multiprocmgr.inc | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-ti/multiprocmgr/multiprocmgr.inc b/recipes-ti/multiprocmgr/multiprocmgr.inc
> index 441f44a..998e550 100644
> --- a/recipes-ti/multiprocmgr/multiprocmgr.inc
> +++ b/recipes-ti/multiprocmgr/multiprocmgr.inc
> @@ -8,10 +8,10 @@ MULTIPROCMGR_GIT_URI = "git://git.ti.com/keystone-linux/multi-proc-manager.git"
>  MULTIPROCMGR_GIT_PROTOCOL = "git"
>  MULTIPROCMGR_GIT_BRANCH = "master"
>  
> -# The following commits correspond to DEV.MPM-3.00.03.00
> -MULTIPROCMGR_SRCREV = "c18c02bb655bae5c88d357b5810ccc69e6f1e128"
> +# The following commits correspond to DEV.MPM-3.00.04.00
> +MULTIPROCMGR_SRCREV = "21579a066b469ff4620e7cff12803ae152880bb5"
>  
> -PV = "3.0.3.0"
> +PV = "3.0.4.0"
>  INC_PR = "r0"
>  
>  BRANCH = "${MULTIPROCMGR_GIT_BRANCH}"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

