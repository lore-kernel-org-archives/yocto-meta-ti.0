Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0147DE00B4C; Mon, 19 Dec 2016 15:24:35 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B09ADE009BA
	for <meta-ti@yoctoproject.org>; Mon, 19 Dec 2016 15:24:31 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id uBJNOUCX022355
	for <meta-ti@yoctoproject.org>; Mon, 19 Dec 2016 17:24:30 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id uBJNOU0g008202
	for <meta-ti@yoctoproject.org>; Mon, 19 Dec 2016 17:24:30 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 19 Dec 2016 17:24:29 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id uBJNOT1m016923;
	Mon, 19 Dec 2016 17:24:30 -0600
Date: Mon, 19 Dec 2016 18:24:29 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20161219232429.GW28380@edge>
References: <1481943653-26769-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1481943653-26769-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v2] ti-ipc: Update to new patch release 3.44.01.01
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
X-List-Received-Date: Mon, 19 Dec 2016 23:24:35 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Dec 16, 2016 at 10:00:53PM -0500, Sam Nelson wrote:
> -Enables parallel build when rtos build invokes xdc to reduce build time

Thanks! That's a very welcome change!


> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> 
> ---
> Added missed patch to enable parallel build
> ---
> ---
>  recipes-ti/ipc/ti-ipc-common.inc |  4 ++--
>  recipes-ti/ipc/ti-ipc-rtos.inc   | 11 ++++++-----
>  recipes-ti/ipc/ti-ipc.inc        |  6 +++---
>  3 files changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/recipes-ti/ipc/ti-ipc-common.inc b/recipes-ti/ipc/ti-ipc-common.inc
> index ddb48bc..8a2aa0a 100644
> --- a/recipes-ti/ipc/ti-ipc-common.inc
> +++ b/recipes-ti/ipc/ti-ipc-common.inc
> @@ -1,5 +1,5 @@
> -PV = "3.44.00.00"
> -INC_PR = "r2"
> +PV = "3.44.01.01"
> +INC_PR = "r0"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.inc
> index e1abf36..1c509b0 100644
> --- a/recipes-ti/ipc/ti-ipc-rtos.inc
> +++ b/recipes-ti/ipc/ti-ipc-rtos.inc
> @@ -25,16 +25,16 @@ protocol=${TI_IPC_METADATA_GIT_PROTOCOL};\
>  branch=${TI_IPC_METADATA_GIT_BRANCH};\
>  name=${TI_IPC_METADATA_NAME}"
>  
> -# Corresponds to tag: 3.44.00.00C
> -SRCREV_ipc-examples = "1b73bc32c5bdd869b5121f86859afb122d286acc"
> +# Corresponds to tag: 3.44.01.01
> +SRCREV_ipc-examples = "b19a3b7a003aa3304a12599a498d9b3a24f20c6e"
>  
> -# Corresponds to tag: 3.44.00.00
> -SRCREV_ipc-metadata = "07a745d47ecd7b4b64860e7c5d0fbe4e89524f2e"
> +# Corresponds to tag: 3.44.01.01
> +SRCREV_ipc-metadata = "a21264bdbb1b64d41bbcb4e6bb17d2c1d4ccb839"
>  
>  S_ipc-examples = "${WORKDIR}/git/ipc-examples"
>  S_ipc-metadata = "${WORKDIR}/git/ipc-metadata"
>  
> -PR = "${INC_PR}.4"
> +PR = "${INC_PR}.0"
>  
>  DEPENDS_append_keystone = " ti-cgt6x-native \
>                              gcc-arm-none-eabi-native \
> @@ -62,4 +62,5 @@ EXTRA_OEMAKE = "\
>      XDC_INSTALL_DIR="${XDC_INSTALL_DIR}" \
>      BIOS_INSTALL_DIR="${SYSBIOS_INSTALL_DIR}" \
>      ${IPC_TARGETS} \
> +    JOBS="--jobs=${BB_NUMBER_THREADS}" \
>  "
> diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
> index 2d38367..3ac8bf5 100644
> --- a/recipes-ti/ipc/ti-ipc.inc
> +++ b/recipes-ti/ipc/ti-ipc.inc
> @@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9
>  
>  TI_IPC_GIT_URI = "git://git.ti.com/ipc/ipcdev.git"
>  TI_IPC_GIT_PROTOCOL = "git"
> -TI_IPC_GIT_BRANCH = "3.44"
> +TI_IPC_GIT_BRANCH = "ipc-3.44-next"
>  
> -#Corresponds to 3.44.00.00
> -TI_IPC_SRCREV = "a1852fc8b254ed207bd1c1c88f5b362c9b6cc454"
> +#Corresponds to 3.44.01.01
> +TI_IPC_SRCREV = "cff640a4c7e083f78116266ef681cec49d9b584b"
>  
>  BRANCH = "${TI_IPC_GIT_BRANCH}"
>  SRC_URI = "${TI_IPC_GIT_URI};protocol=${TI_IPC_GIT_PROTOCOL};branch=${BRANCH};name=ipcdev"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

