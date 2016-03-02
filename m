Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B3B07E00D6B; Wed,  2 Mar 2016 07:12:49 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 689D7E00CA6
	for <meta-ti@yoctoproject.org>; Wed,  2 Mar 2016 07:12:45 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u22FCjlC022090
	for <meta-ti@yoctoproject.org>; Wed, 2 Mar 2016 09:12:45 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u22FCjUD009051
	for <meta-ti@yoctoproject.org>; Wed, 2 Mar 2016 09:12:45 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 2 Mar 2016 09:12:44 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u22FCiZQ032616;
	Wed, 2 Mar 2016 09:12:44 -0600
Date: Wed, 2 Mar 2016 10:12:29 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20160302151229.GC7505@edge>
References: <1456891119-4169-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1456891119-4169-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] ti-ipc: Update to GA version IPC 3.42
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
X-List-Received-Date: Wed, 02 Mar 2016 15:12:49 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Mar 01, 2016 at 10:58:39PM -0500, Sam Nelson wrote:
> Updated to GA version and commit for IPC 3.42
> Added platform name for 6678
> Added additional platform for K2HK
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  recipes-ti/ipc/ti-ipc.inc | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
> index a7e1ed9..4620416 100644
> --- a/recipes-ti/ipc/ti-ipc.inc
> +++ b/recipes-ti/ipc/ti-ipc.inc
> @@ -6,18 +6,18 @@ LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9
>  
>  TI_IPC_GIT_URI = "git://git.ti.com/ipc/ipcdev.git"
>  TI_IPC_GIT_PROTOCOL = "git"
> -TI_IPC_GIT_BRANCH = "ipc-next"
> +TI_IPC_GIT_BRANCH = "3.42"
>  
> -#Corresponds to 3.42.00.00_eng
> -TI_IPC_SRCREV = "2b47e35ed72170e4e56906fb9ab93dd9ef385a38"
> +#Corresponds to 3.42.00.02
> +TI_IPC_SRCREV = "a520969994378fb2629d7dfc25f306c3a711b5bc"
>  
>  BRANCH = "${TI_IPC_GIT_BRANCH}"
>  SRC_URI = "${TI_IPC_GIT_URI};protocol=${TI_IPC_GIT_PROTOCOL};branch=${BRANCH}"
>  SRCREV = "${TI_IPC_SRCREV}"
>  
>  S = "${WORKDIR}/git"
> -PV = "3.42.00.00"
> -INC_PR = "r1"
> +PV = "3.42.00.02"
> +INC_PR = "r0"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> @@ -28,3 +28,6 @@ PLATFORM_k2hk-evm = "TCI6638"
>  PLATFORM_k2l-evm = "TCI6630"
>  PLATFORM_k2e-evm = "66AK2E"
>  PLATFORM_k2g-evm = "66AK2G"
> +PLATFORM_c667x-evm = "C6678"

There's no c667x-evm in meta-ti.


> +ALT_PLATFORM_k2hk-evm = "TCI6636"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

