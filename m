Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 76869E00D91; Fri, 24 Jun 2016 12:18:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 087EAE00D8A
	for <meta-ti@yoctoproject.org>; Fri, 24 Jun 2016 12:18:48 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u5OJIlga027483
	for <meta-ti@yoctoproject.org>; Fri, 24 Jun 2016 14:18:47 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5OJIlNs025166
	for <meta-ti@yoctoproject.org>; Fri, 24 Jun 2016 14:18:47 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 24 Jun 2016 14:18:47 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5OJIkqf018192;
	Fri, 24 Jun 2016 14:18:47 -0500
Date: Fri, 24 Jun 2016 15:18:46 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20160624191845.GV2177@edge>
References: <1466795093-32533-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1466795093-32533-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] ti-ipc: Update comment on IPC tag
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
X-List-Received-Date: Fri, 24 Jun 2016 19:18:51 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jun 24, 2016 at 03:04:53PM -0400, Sam Nelson wrote:
> Updated tag added to ipc dev branch to the same commit id
> to avoid confusion.
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  recipes-ti/ipc/ti-ipc.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
> index a74b4c1..910b09a 100644
> --- a/recipes-ti/ipc/ti-ipc.inc
> +++ b/recipes-ti/ipc/ti-ipc.inc
> @@ -8,7 +8,7 @@ TI_IPC_GIT_URI = "git://git.ti.com/ipc/ipcdev.git"
>  TI_IPC_GIT_PROTOCOL = "git"
>  TI_IPC_GIT_BRANCH = "3.43"
>  
> -#Corresponds to 3.43.00.01
> +#Corresponds to 3.43.01.02
>  TI_IPC_SRCREV = "9e6ebc02c14ed4150dad5d45d8a7e35258bf37ad"
>  
>  BRANCH = "${TI_IPC_GIT_BRANCH}"
> @@ -17,7 +17,7 @@ SRCREV = "${TI_IPC_SRCREV}"
>  
>  S = "${WORKDIR}/git"
>  PV = "3.43.01.02"
> -INC_PR = "r0"
> +INC_PR = "r1"

No need for PR bump in this case.


>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

