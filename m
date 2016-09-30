Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1D5BEE00D8D; Fri, 30 Sep 2016 09:35:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D00F7E00D7F
	for <meta-ti@yoctoproject.org>; Fri, 30 Sep 2016 09:35:24 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u8UGZNZs027394
	for <meta-ti@yoctoproject.org>; Fri, 30 Sep 2016 11:35:23 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u8UGZMtO026940
	for <meta-ti@yoctoproject.org>; Fri, 30 Sep 2016 11:35:22 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 30 Sep 2016 11:35:21 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u8UGZMeL024784;
	Fri, 30 Sep 2016 11:35:22 -0500
Date: Fri, 30 Sep 2016 12:35:21 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20160930163521.GR7475@edge>
References: <1474918148-21302-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1474918148-21302-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] ti-ipc-rtos: Remove M4F target for omap-a15
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
X-List-Received-Date: Fri, 30 Sep 2016 16:35:28 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Sam,

This doesn't apply - can you please rebase?

-- 
Denys


On Mon, Sep 26, 2016 at 03:29:08PM -0400, Sam Nelson wrote:
> - M4F target is not needed for omap-a15
> - This reduces build time for platform associated with omap-a15
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  recipes-ti/ipc/ti-ipc-rtos_git.bb | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bb b/recipes-ti/ipc/ti-ipc-rtos_git.bb
> index 5b26436..c377b7b 100644
> --- a/recipes-ti/ipc/ti-ipc-rtos_git.bb
> +++ b/recipes-ti/ipc/ti-ipc-rtos_git.bb
> @@ -35,7 +35,7 @@ SRCREV_ipc-metadata = "b6dd82a450d75b9483a7cc9b619a30cf3cc25ae6"
>  S_ipc-examples = "${WORKDIR}/git/ipc-examples"
>  S_ipc-metadata = "${WORKDIR}/git/ipc-metadata"
>  
> -PR = "${INC_PR}.1"
> +PR = "${INC_PR}.2"
>  
>  DEPENDS = "ti-xdctools ti-sysbios doxygen-native zip-native"
>  DEPENDS_append_keystone = " ti-cgt6x-native \
> @@ -61,7 +61,6 @@ IPC_TARGETS_omap-a15 = "\
>      ti.targets.elf.C66="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
>      ti.targets.elf.C66_big_endian="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
>      ti.targets.arm.elf.M4="${M4_TOOLCHAIN_INSTALL_DIR}" \
> -    ti.targets.arm.elf.M4F="${M4_TOOLCHAIN_INSTALL_DIR}" \
>  "
>  
>  IPC_TARGETS_keystone = " \
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

