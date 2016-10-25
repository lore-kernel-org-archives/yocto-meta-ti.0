Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8F63AE0071C; Tue, 25 Oct 2016 11:43:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4F916E006D8
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2016 11:43:23 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u9PIhNfL009516;
	Tue, 25 Oct 2016 13:43:23 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u9PIhNA7010415;
	Tue, 25 Oct 2016 13:43:23 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 25 Oct 2016 13:43:22 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u9PIhMsA021230;
	Tue, 25 Oct 2016 13:43:22 -0500
Date: Tue, 25 Oct 2016 14:43:22 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20161025184321.GP12745@edge>
References: <20161025183600.22287-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20161025183600.22287-1-raj.khem@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] uim: Fix build breaks when toolchain is used from sstate
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
X-List-Received-Date: Tue, 25 Oct 2016 18:43:28 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks.

On Tue, Oct 25, 2016 at 11:36:00AM -0700, Khem Raj wrote:
> CC is being redefined here but its not considering
> the essential options to specify the sysroot as a result
> this breaks on systems tied to sstate servers where the toolchain
> might have had a different sysroot when built, in here
> it fails to find the standard headers due to missing sysroot
> options.
> 
> Deleting the extra oeconf works fine.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes-connectivity/uim/uim_8.5.bb | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/recipes-connectivity/uim/uim_8.5.bb b/recipes-connectivity/uim/uim_8.5.bb
> index ac9dc51..72e2166 100644
> --- a/recipes-connectivity/uim/uim_8.5.bb
> +++ b/recipes-connectivity/uim/uim_8.5.bb
> @@ -12,8 +12,6 @@ SRC_URI = "git://git.ti.com/ti-bt/uim.git"
>  
>  S = "${WORKDIR}/git"
>  
> -EXTRA_OEMAKE = "CC=${TARGET_PREFIX}gcc"
> -
>  do_install() {
>  	install -d ${D}${bindir}
>  	install -m 0755 uim ${D}${bindir}
> -- 
> 2.10.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

