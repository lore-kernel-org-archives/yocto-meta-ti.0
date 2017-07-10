Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 430B8E00B8B; Mon, 10 Jul 2017 12:24:14 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BA6CDE00B8B
	for <meta-ti@yoctoproject.org>; Mon, 10 Jul 2017 12:24:12 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6AJO1AP010353
	for <meta-ti@yoctoproject.org>; Mon, 10 Jul 2017 14:24:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499714641;
	bh=PHsQpzoUc+ZPUl1/egQFdnCdK9/zAwlyTNf/qN1Zx/c=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=UKjvKWShZtuZ+TJqkvwR8wuLCKAEF+AUClOIa6jFTnFmgc715tuQ3dD8ct8h1sohb
	+EchSNJERFJoqzrNKzwfFDNNNPn8R9lRCXwXXlq8PqU2Wm2UVXgfyoGNH21DLywOid
	N9fXYBN1zreejSuzhyk7CK2185STC8uE3T/vlLg4=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6AJNula003043
	for <meta-ti@yoctoproject.org>; Mon, 10 Jul 2017 14:23:56 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 10 Jul 2017 14:23:55 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6AJNtSt017782;
	Mon, 10 Jul 2017 14:23:55 -0500
Date: Mon, 10 Jul 2017 15:23:53 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
Message-ID: <20170710192353.GD14665@edge>
References: <1499357178-23074-1-git-send-email-m-radhakrishnan2@ti.com>
	<C45960711C772449A33A51ED1374F08A40626766@DFLE08.ent.ti.com>
	<5130E41A1BA9D145BA0F3B18D5CFB0A74379C51F@DFLE12.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <5130E41A1BA9D145BA0F3B18D5CFB0A74379C51F@DFLE12.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] ti-staging: Inhibiting sysroot strip & package	debug split
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
X-List-Received-Date: Mon, 10 Jul 2017 19:24:14 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Jul 06, 2017 at 05:26:54PM +0000, Radhakrishnan, Mahesh wrote:
> The board module failed without this patch.
> So, the references to ti-staging.inc needs to be removed from ALL the recipes?

In many existing cases including this file is not even required at all! I 
started cleaning this up recently:

http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?h=morty&id=7b51cf71bf4c51cc0aeff42c2d8a8522e37828ce
http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?h=morty&id=71f6beaa00039bf3add48fe0b42e100b01d81e45
http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?h=morty&id=d3d5c5c5130ca2ac61e81dd39ccba8fe87e05a1c
http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?h=morty&id=f2cd25abd2f5912069f907d9ab7385be3935258b
http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?h=morty&id=d4e2ecba1a8c9445b31c9b68aeb5a6ca1ccc9580

In some cases that do need to set INHIBIT vars, those should be set in 
corresponding recipes on a case-by-case basis, i.e. not in bulk!

-- 
Denys


> -----Original Message-----
> From: Pang, Ivan 
> Sent: Thursday, July 06, 2017 1:08 PM
> To: Radhakrishnan, Mahesh; meta-ti@yoctoproject.org
> Subject: RE: [meta-ti] [PATCH] ti-staging: Inhibiting sysroot strip & package debug split
> 
> We had a previous discussion on this ti-staging.inc file and the conclusion is that removing this file is the better way going forward.
> Are there specific recipes that needed this patch?
> 
> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject.org] On Behalf Of Radhakrishnan, Mahesh
> Sent: Thursday, July 06, 2017 11:06 AM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] [PATCH] ti-staging: Inhibiting sysroot strip & package debug split
> 
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>  recipes-ti/includes/ti-staging.inc | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/recipes-ti/includes/ti-staging.inc b/recipes-ti/includes/ti-staging.inc
> index b588805..ae523ce 100644
> --- a/recipes-ti/includes/ti-staging.inc
> +++ b/recipes-ti/includes/ti-staging.inc
> @@ -1,4 +1,6 @@
>  INHIBIT_PACKAGE_STRIP = "1"
> +INHIBIT_SYSROOT_STRIP = "1"
> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>  
>  ALLOW_EMPTY_${PN} = "1"
>  ALLOW_EMPTY_${PN}-dev = "1"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

