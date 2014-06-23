Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D455BE00283; Mon, 23 Jun 2014 09:44:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AD22BE00283
	for <meta-ti@yoctoproject.org>; Mon, 23 Jun 2014 09:44:46 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5NGii5C009026;
	Mon, 23 Jun 2014 11:44:44 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5NGiirL021703;
	Mon, 23 Jun 2014 11:44:44 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 23 Jun 2014 11:44:44 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5NGihaa022694;
	Mon, 23 Jun 2014 11:44:44 -0500
Date: Mon, 23 Jun 2014 12:44:43 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20140623164443.GA6700@edge>
References: <1403541806-12912-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1403541806-12912-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/2] linux: remove bbappends for old kernel recipes removed from meta-ti
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
X-List-Received-Date: Mon, 23 Jun 2014 16:44:55 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Sorry, wrong list...

On Mon, Jun 23, 2014 at 12:43:25PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../recipes-kernel/linux/linux-omap-psp_2.6.37.bbappend          | 7 -------
>  .../recipes-kernel/linux/linux-omapl138-psp_2.6.37.bbappend      | 9 ---------
>  2 files changed, 16 deletions(-)
>  delete mode 100644 meta-arago-distro/recipes-kernel/linux/linux-omap-psp_2.6.37.bbappend
>  delete mode 100644 meta-arago-distro/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bbappend
> 
> diff --git a/meta-arago-distro/recipes-kernel/linux/linux-omap-psp_2.6.37.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-omap-psp_2.6.37.bbappend
> deleted file mode 100644
> index 8948157..0000000
> --- a/meta-arago-distro/recipes-kernel/linux/linux-omap-psp_2.6.37.bbappend
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -MACHINE_KERNEL_PR_append = "-arago1"
> -
> -# KVER is used by arago-source-ipk.conf
> -KVER = "2.6.37"
> -PSPREL = "04.02.00.07"
> -
> -require copy-defconfig.inc
> diff --git a/meta-arago-distro/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bbappend
> deleted file mode 100644
> index 5d3c3f7..0000000
> --- a/meta-arago-distro/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bbappend
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -MACHINE_KERNEL_PR_append = "-arago3"
> -
> -FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
> -
> -# KVER is used by arago-source-ipk.conf
> -KVER = "2.6.37"
> -PSPREL = "03.21.00.04.sdk"
> -
> -require copy-defconfig.inc
> -- 
> 2.0.0
> 

