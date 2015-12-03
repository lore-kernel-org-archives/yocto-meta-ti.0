Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 12518E008C8; Thu,  3 Dec 2015 10:20:53 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 91E10E00349
	for <meta-ti@yoctoproject.org>; Thu,  3 Dec 2015 10:19:52 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id tB3IJqOd021591
	for <meta-ti@yoctoproject.org>; Thu, 3 Dec 2015 12:19:52 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tB3IJqQJ024553
	for <meta-ti@yoctoproject.org>; Thu, 3 Dec 2015 12:19:52 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 3 Dec 2015 12:19:51 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id tB3IJpQL005570;
	Thu, 3 Dec 2015 12:19:51 -0600
Date: Thu, 3 Dec 2015 13:19:36 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Eric Ruei <e-ruei1@ti.com>
Message-ID: <20151203181935.GS6264@edge>
References: <1448984390-21457-1-git-send-email-e-ruei1@ti.com>
	<1448984390-21457-2-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
In-Reply-To: <1448984390-21457-2-git-send-email-e-ruei1@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH V2 1/2] conf/layer.conf: Build omapdrm-pvr only if SGX is included
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
X-List-Received-Date: Thu, 03 Dec 2015 18:20:53 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Dec 01, 2015 at 10:39:49AM -0500, Eric Ruei wrote:
> Enable non-SGX build for AM3/AM4:
> Build SGX DDK kernel module (omapdrm-pvr.ko) only if SGX is not
> included at MACHINE_FEATURES.
> 
> Signed-off-by: Eric Ruei <a0850410@uda0850410>

^^^^ Still problems with gitconfig?


> ---
>  conf/layer.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/conf/layer.conf b/conf/layer.conf
> index 51da372..f471e72 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -11,7 +11,7 @@ BBFILE_PRIORITY_meta-ti = "6"
>  LICENSE_PATH += "${LAYERDIR}/licenses"
>  
>  SIGGEN_EXCLUDERECIPES_ABISAFE += " \
> -    omapdrm-pvr \
> +    ${@base_contains('MACHINE_FEATURES', 'sgx', 'omapdrm-pvr', ' ', d)} \

You don't really need to do this.


>      omap5-sgx-ddk-um-linux \
>      ti-ipc \
>      cmem-mod \
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

