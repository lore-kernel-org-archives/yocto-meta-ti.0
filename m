Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C4589E00988; Fri, 29 May 2015 12:31:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1C8C3E0086D
	for <meta-ti@yoctoproject.org>; Fri, 29 May 2015 12:31:46 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4TJVicq005695
	for <meta-ti@yoctoproject.org>; Fri, 29 May 2015 14:31:44 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4TJVifQ029451
	for <meta-ti@yoctoproject.org>; Fri, 29 May 2015 14:31:44 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 29 May 2015 14:31:44 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4TJVhMt029696;
	Fri, 29 May 2015 14:31:44 -0500
Date: Fri, 29 May 2015 15:31:41 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150529193141.GM16418@edge>
References: <1432723936-15053-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1432723936-15053-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] llvm-common: Extend to nativesdk class.
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
X-List-Received-Date: Fri, 29 May 2015 19:31:48 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ack

On Wed, May 27, 2015 at 06:52:16AM -0400, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
> * v2 changes:
>   - Change PR suffix.
> 
>  recipes-core/llvm/llvm-common.bbappend |    5 +++++
>  1 file changed, 5 insertions(+)
>  create mode 100644 recipes-core/llvm/llvm-common.bbappend
> 
> diff --git a/recipes-core/llvm/llvm-common.bbappend b/recipes-core/llvm/llvm-common.bbappend
> new file mode 100644
> index 0000000..ffe4dcb
> --- /dev/null
> +++ b/recipes-core/llvm/llvm-common.bbappend
> @@ -0,0 +1,5 @@
> +PR_append = "-ti0"
> +
> +SYSROOT_PREPROCESS_FUNCS_append_class-nativesdk = " llvm_common_sysroot_preprocess"
> +
> +BBCLASSEXTEND += "nativesdk"
> -- 
> 1.7.9.5
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

