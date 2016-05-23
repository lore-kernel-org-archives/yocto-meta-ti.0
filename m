Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 869CBE004A0; Mon, 23 May 2016 10:01:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1F543E003D9
	for <meta-ti@yoctoproject.org>; Mon, 23 May 2016 10:01:37 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u4NH1a2Q009885
	for <meta-ti@yoctoproject.org>; Mon, 23 May 2016 12:01:36 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4NH1aD4031324
	for <meta-ti@yoctoproject.org>; Mon, 23 May 2016 12:01:36 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 23 May 2016 12:01:35 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4NH1Z9B006552;
	Mon, 23 May 2016 12:01:35 -0500
Date: Mon, 23 May 2016 13:01:20 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20160523170119.GL3287@edge>
References: <1464020188-22786-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1464020188-22786-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] k2g-evm: add opencl feature
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
X-List-Received-Date: Mon, 23 May 2016 17:01:41 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Jake,

Is everything else ready for k2g? It wasn't enabled previously in our 
packagegroups, hence I didn't add machine feature for it here.

-- 
Denys


On Mon, May 23, 2016 at 12:16:28PM -0400, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  conf/machine/k2g-evm.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/conf/machine/k2g-evm.conf b/conf/machine/k2g-evm.conf
> index 125a949..860324c 100644
> --- a/conf/machine/k2g-evm.conf
> +++ b/conf/machine/k2g-evm.conf
> @@ -4,7 +4,7 @@
>  
>  require conf/machine/include/keystone.inc
>  
> -MACHINE_FEATURES += "alsa"
> +MACHINE_FEATURES += "alsa opencl"
>  
>  UBOOT_MACHINE = "k2g_evm_config"
>  
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

