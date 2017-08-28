Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A1C8FE00C94; Mon, 28 Aug 2017 12:23:31 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B3E4DE00C88
	for <meta-ti@yoctoproject.org>; Mon, 28 Aug 2017 12:23:30 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7SJNKBT013337
	for <meta-ti@yoctoproject.org>; Mon, 28 Aug 2017 14:23:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1503948200;
	bh=sybTmk4XAlbnjQV1bcEPr+7541qf/aKAflsdpAW6+FE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=VkwZXT2U3VW44f21WeFLVdM57Cg+eJKkfyzy4v7jKqfBY87qPPQigiNybANc6YxoO
	0mfd4hN/70O54vIq//j5GIyF+arMj3pFyvIic/HgxI/e/dMgcbXh7wHLYENzuXSM7R
	v6yi6KqHfuE+63DGp67Wi+wxuqDr/WM6QEAf5oTs=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7SJNEYC002833
	for <meta-ti@yoctoproject.org>; Mon, 28 Aug 2017 14:23:14 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 28 Aug 2017 14:23:14 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 28 Aug 2017 14:23:14 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7SJNEGu021031;
	Mon, 28 Aug 2017 14:23:14 -0500
Date: Mon, 28 Aug 2017 15:23:10 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Dan Murphy <dmurphy@ti.com>
Message-ID: <20170828192310.GO4311@edge>
References: <20170828183745.32419-1-dmurphy@ti.com>
MIME-Version: 1.0
In-Reply-To: <20170828183745.32419-1-dmurphy@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/2] linux-ti-staging: update to ti2017.04-rc1 tag
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
X-List-Received-Date: Mon, 28 Aug 2017 19:23:31 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks. Do we need to add dra76-evm.dtb as well?


On Mon, Aug 28, 2017 at 01:37:44PM -0500, Dan Murphy wrote:
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  recipes-kernel/linux/linux-ti-staging-rt_4.9.bb | 2 +-
>  recipes-kernel/linux/linux-ti-staging_4.9.bb    | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb
> index 41c1c052..3ee1588a 100644
> --- a/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb
> +++ b/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb
> @@ -6,4 +6,4 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.9:"
>  
>  BRANCH = "ti-rt-linux-4.9.y"
>  
> -SRCREV = "79149b757ed45f1050b519ba353cd180dc48604c"
> +SRCREV = "e23d2cd3402ba7566ed2d7600be470a06d777495"
> diff --git a/recipes-kernel/linux/linux-ti-staging_4.9.bb b/recipes-kernel/linux/linux-ti-staging_4.9.bb
> index fc39dfec..03dbac4f 100644
> --- a/recipes-kernel/linux/linux-ti-staging_4.9.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_4.9.bb
> @@ -55,8 +55,8 @@ S = "${WORKDIR}/git"
>  
>  BRANCH = "ti-lsk-linux-4.9.y"
>  
> -SRCREV = "7448cce4e5c0163d96dae0040e51153fefc12c92"
> -PV = "4.9.41+git${SRCPV}"
> +SRCREV = "bf788c725a3db00226e78cce9e1c4b81c48e9652"
> +PV = "4.9.45+git${SRCPV}"
>  
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
>  MACHINE_KERNEL_PR_append = "c"
> -- 
> 2.14.0
> 

