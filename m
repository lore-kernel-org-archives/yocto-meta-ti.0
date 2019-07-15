Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6ECE5E00D35; Mon, 15 Jul 2019 13:12:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E46D6E00B9C
	for <meta-ti@yoctoproject.org>; Mon, 15 Jul 2019 13:12:27 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6FKCQYW033902;
	Mon, 15 Jul 2019 15:12:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1563221546;
	bh=zGc7++B63cvJ5+OjonwEs/Hj+rd2iQGMz5zbQYXNT8c=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=LH9a0y0rNe4ytBYoEJALmN8uQn59k0IMn7ZHKh9uLXb+0evgo3rTWplxs05kwj0pu
	yiq8+ytfA/hcwBoPct+2UKNtPD4eJ6r7mR3dYycnofOnw5L4UJVwwkrjX54j3MNLvT
	CQPaTLLj6ndOoVKtmltJH4caQBSFWBvynEbpWi30=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6FKCQ8M076026
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 15 Jul 2019 15:12:26 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 15 Jul 2019 15:12:26 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 15 Jul 2019 15:12:26 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6FKCQQP108352;
	Mon, 15 Jul 2019 15:12:26 -0500
Date: Mon, 15 Jul 2019 16:12:25 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190715201225.GJ9038@beryl>
References: <20190713004324.12695-1-raj.khem@gmail.com>
	<20190713004324.12695-3-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190713004324.12695-3-raj.khem@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 3/4] jailhouse: Replace tabs with spaces in python code
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
X-List-Received-Date: Mon, 15 Jul 2019 20:12:29 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

I had to do this one differently, all others are now in "next" for testing. 
Thanks.

Denys


On Fri, Jul 12, 2019 at 05:43:23PM -0700, Khem Raj wrote:
> Fixes
> WARNING: python should use 4 spaces indentation, but found tabs in jailhouse_git.bb, line 85
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes-kernel/jailhouse/jailhouse_git.bb | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes-kernel/jailhouse/jailhouse_git.bb b/recipes-kernel/jailhouse/jailhouse_git.bb
> index 753664ed..db31bb7d 100644
> --- a/recipes-kernel/jailhouse/jailhouse_git.bb
> +++ b/recipes-kernel/jailhouse/jailhouse_git.bb
> @@ -82,10 +82,10 @@ do_compile() {
>  }
>  
>  python __anonymous () {
> -	d.appendVarFlag('do_install', 'depends', ' virtual/kernel:do_deploy')
> -	initrd = d.getVar('INITRAMFS_IMAGE', True)
> -	if initrd:
> -		d.appendVarFlag('do_install', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
> +        d.appendVarFlag('do_install', 'depends', ' virtual/kernel:do_deploy')
> +        initrd = d.getVar('INITRAMFS_IMAGE', True)
> +        if initrd:
> +                d.appendVarFlag('do_install', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
>  }
>  
>  do_install() {
> -- 
> 2.22.0
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

