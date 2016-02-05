Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B7FDBE00D2A; Fri,  5 Feb 2016 11:39:12 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7241BE00BA4
	for <meta-ti@yoctoproject.org>; Fri,  5 Feb 2016 11:39:07 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u15Jd6b9002391
	for <meta-ti@yoctoproject.org>; Fri, 5 Feb 2016 13:39:06 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u15Jd3Qk019283
	for <meta-ti@yoctoproject.org>; Fri, 5 Feb 2016 13:39:06 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 5 Feb 2016 13:39:03 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u15Jd3ko013092;
	Fri, 5 Feb 2016 13:39:03 -0600
Date: Fri, 5 Feb 2016 14:38:48 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20160205193848.GW31480@edge>
References: <1454700538-7424-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1454700538-7424-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] ti-ipc: Update to new version 3.42.0.0_eng
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
X-List-Received-Date: Fri, 05 Feb 2016 19:39:12 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Is it backward-compatible? Will it break any existing IPC uses?


On Fri, Feb 05, 2016 at 02:28:58PM -0500, Sam Nelson wrote:
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  recipes-ti/ipc/ti-ipc.inc | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
> index 94a1657..f3b1bff 100644
> --- a/recipes-ti/ipc/ti-ipc.inc
> +++ b/recipes-ti/ipc/ti-ipc.inc
> @@ -4,15 +4,15 @@ HOMEPAGE="http://processors.wiki.ti.com/index.php/Category:IPC"
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9b710fd7c95e545b91cec79255"
>  
> -BRANCH = "3.41"
> +BRANCH = "ipc-next"
>  
>  SRC_URI = "git://git.ti.com/ipc/ipcdev.git;protocol=git;branch=${BRANCH}"
>  
> -#Corresponds to 3.41.00.08
> -SRCREV = "7370abce2e3f2a09fd4b057fbbf9e7d3d029c0df"
> +#Corresponds to 3.42.00.00_eng
> +SRCREV = "2b47e35ed72170e4e56906fb9ab93dd9ef385a38"
>  
>  S = "${WORKDIR}/git"
> -PV = "3.41.00.08"
> +PV = "3.42.00.00"
>  INC_PR = "r0"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

