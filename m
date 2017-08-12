Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 667C3E00C7F; Sat, 12 Aug 2017 10:08:12 -0700 (PDT)
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
	*      [198.47.19.16 listed in list.dnswl.org]
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CC987E008D2
	for <meta-ti@yoctoproject.org>; Sat, 12 Aug 2017 10:08:11 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7CH80Ki020373
	for <meta-ti@yoctoproject.org>; Sat, 12 Aug 2017 12:08:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1502557680;
	bh=TNIJZ2FkwJzJjRHRQ8CBnj3OC5DtDAks326V2YCefBc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=kubNHfvNLlO6ImUvR8SpsM7z0l4o/Ul6PzkAbzOkBdtf7LkUVaQInJQFX2L+YcZ7Z
	wtT0oCWlkJfM9AHRYmG0Sio7CUaR63x3EGdCwTyxDxFhcVjIVJ2EV35OhbN7QWu8Je
	S6tzjP+Oru3Nw+0nVPDQ8v6UTqUP8utIQgNVZ9Ms=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7CH7tra008829
	for <meta-ti@yoctoproject.org>; Sat, 12 Aug 2017 12:07:55 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Sat, 12 Aug 2017 12:07:55 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Sat, 12 Aug 2017 12:07:55 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7CH7tDS003800;
	Sat, 12 Aug 2017 12:07:55 -0500
Date: Sat, 12 Aug 2017 13:07:52 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20170812170751.GT19736@edge>
References: <1502397488-7241-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1502397488-7241-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [morty/master][PATCH] multiprocmgr: Update to new version 3.0.4.0
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
X-List-Received-Date: Sat, 12 Aug 2017 17:08:12 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Aug 10, 2017 at 04:38:08PM -0400, Sam Nelson wrote:
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  recipes-ti/multiprocmgr/multiprocmgr.inc | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-ti/multiprocmgr/multiprocmgr.inc b/recipes-ti/multiprocmgr/multiprocmgr.inc
> index 441f44a..0231aaf 100644
> --- a/recipes-ti/multiprocmgr/multiprocmgr.inc
> +++ b/recipes-ti/multiprocmgr/multiprocmgr.inc
> @@ -8,10 +8,10 @@ MULTIPROCMGR_GIT_URI = "git://git.ti.com/keystone-linux/multi-proc-manager.git"
>  MULTIPROCMGR_GIT_PROTOCOL = "git"
>  MULTIPROCMGR_GIT_BRANCH = "master"
>  
> -# The following commits correspond to DEV.MPM-3.00.03.00
> -MULTIPROCMGR_SRCREV = "c18c02bb655bae5c88d357b5810ccc69e6f1e128"
> +# The following commits correspond to DEV.MPM-3.00.04.00
> +MULTIPROCMGR_SRCREV = "	21579a066b469ff4620e7cff12803ae152880bb5"

Why are there leading spaces here ^^^ in SRCREV?


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

