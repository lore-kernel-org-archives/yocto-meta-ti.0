Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 26876E00952; Mon, 20 Apr 2015 13:18:03 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4A7A9E0079F
	for <meta-ti@yoctoproject.org>; Mon, 20 Apr 2015 13:18:01 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3KKI0Np011326
	for <meta-ti@yoctoproject.org>; Mon, 20 Apr 2015 15:18:00 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3KKHxwx021633
	for <meta-ti@yoctoproject.org>; Mon, 20 Apr 2015 15:17:59 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 20 Apr 2015 15:17:59 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3KKHxsV010142;
	Mon, 20 Apr 2015 15:17:59 -0500
Date: Mon, 20 Apr 2015 16:17:56 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20150420201756.GF23723@edge>
References: <1428939961-5679-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1428939961-5679-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] ipc: Update to new version 3.35.1.7
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
X-List-Received-Date: Mon, 20 Apr 2015 20:18:03 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Apr 13, 2015 at 11:46:01AM -0400, Sam Nelson wrote:
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  recipes-ti/ipc/ti-ipc_git.bb |    7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-ti/ipc/ti-ipc_git.bb b/recipes-ti/ipc/ti-ipc_git.bb
> index 6f46295..33715be 100644
> --- a/recipes-ti/ipc/ti-ipc_git.bb
> +++ b/recipes-ti/ipc/ti-ipc_git.bb
> @@ -6,14 +6,15 @@ LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9
>  
>  DEPENDS += "virtual/kernel"
>  
> -PV = "3.35.00.05"
> +PV = "3.35.01.07"
>  
>  BRANCH = "master"
>  SRC_URI = "git://git.ti.com/ipc/ipcdev.git;protocol=git;branch=${BRANCH} \
> +           file://0001-Patch-LAD-daemon-to-allow-different-cluster-IDs-for-.patch \

The patch referenced here is missing.


>             file://tiipclad-daemon.sh \
>             "
> -# Commit corresponds to 3.35.00.05
> -SRCREV = "ce35c999f5c3368e387740a38aef3358290579b3"
> +# Commit corresponds to 3.35.01.07
> +SRCREV = "358d966c9f5973faf9ab71fb1d7dfe5d3e08a8dc"
>  
>  S = "${WORKDIR}/git"
>  
> -- 
> 1.7.9.5
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

