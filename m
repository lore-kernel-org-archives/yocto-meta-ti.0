Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3889FE0050B; Mon, 27 Feb 2017 10:20:12 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 91BCBE00405
	for <meta-ti@yoctoproject.org>; Mon, 27 Feb 2017 10:20:09 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v1RIK948009393
	for <meta-ti@yoctoproject.org>; Mon, 27 Feb 2017 12:20:09 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v1RIK9Zh018600
	for <meta-ti@yoctoproject.org>; Mon, 27 Feb 2017 12:20:09 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 27 Feb 2017 12:20:09 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v1RIK8OK028275;
	Mon, 27 Feb 2017 12:20:09 -0600
Date: Mon, 27 Feb 2017 13:20:08 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20170227182008.GB11106@edge>
References: <1487994622-87927-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
In-Reply-To: <1487994622-87927-1-git-send-email-a0393906@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org, "Anna, Suman" <s-anna@ti.com>
Subject: Re: [krogoth] ti-ipc: update to 3.45.00.00
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
X-List-Received-Date: Mon, 27 Feb 2017 18:20:12 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Karthik,

Why are you upgrading IPC in krogoth to 3.45? I thought that was mainly to 
work with 4.9 kernel...

-- 
Denys


On Sat, Feb 25, 2017 at 09:20:22AM +0530, Karthik Ramanan wrote:
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  recipes-ti/ipc/ti-ipc-common.inc |  2 +-
>  recipes-ti/ipc/ti-ipc-rtos.inc   | 10 +++++-----
>  recipes-ti/ipc/ti-ipc.inc        |  6 +++---
>  3 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/recipes-ti/ipc/ti-ipc-common.inc b/recipes-ti/ipc/ti-ipc-common.inc
> index 8a2aa0a..6aa08c5 100644
> --- a/recipes-ti/ipc/ti-ipc-common.inc
> +++ b/recipes-ti/ipc/ti-ipc-common.inc
> @@ -1,4 +1,4 @@
> -PV = "3.44.01.01"
> +PV = "3.45.00.00"
>  INC_PR = "r0"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.inc
> index 1c509b0..332f238 100644
> --- a/recipes-ti/ipc/ti-ipc-rtos.inc
> +++ b/recipes-ti/ipc/ti-ipc-rtos.inc
> @@ -25,16 +25,16 @@ protocol=${TI_IPC_METADATA_GIT_PROTOCOL};\
>  branch=${TI_IPC_METADATA_GIT_BRANCH};\
>  name=${TI_IPC_METADATA_NAME}"
>  
> -# Corresponds to tag: 3.44.01.01
> -SRCREV_ipc-examples = "b19a3b7a003aa3304a12599a498d9b3a24f20c6e"
> +# Corresponds to tag: 3.45.00.00
> +SRCREV_ipc-examples = "3a8ee1841ec36117a9bcd3d45bb2781bbd53ecf8"
>  
> -# Corresponds to tag: 3.44.01.01
> -SRCREV_ipc-metadata = "a21264bdbb1b64d41bbcb4e6bb17d2c1d4ccb839"
> +# Corresponds to tag: 3.45.00.00
> +SRCREV_ipc-metadata = "30b83f09be1877f86b22c971d978cb478fc7dd6e"
>  
>  S_ipc-examples = "${WORKDIR}/git/ipc-examples"
>  S_ipc-metadata = "${WORKDIR}/git/ipc-metadata"
>  
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
>  
>  DEPENDS_append_keystone = " ti-cgt6x-native \
>                              gcc-arm-none-eabi-native \
> diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
> index 3ac8bf5..ea256d2 100644
> --- a/recipes-ti/ipc/ti-ipc.inc
> +++ b/recipes-ti/ipc/ti-ipc.inc
> @@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9
>  
>  TI_IPC_GIT_URI = "git://git.ti.com/ipc/ipcdev.git"
>  TI_IPC_GIT_PROTOCOL = "git"
> -TI_IPC_GIT_BRANCH = "ipc-3.44-next"
> +TI_IPC_GIT_BRANCH = "master"
>  
> -#Corresponds to 3.44.01.01
> -TI_IPC_SRCREV = "cff640a4c7e083f78116266ef681cec49d9b584b"
> +#Corresponds to 3.45.00.00
> +TI_IPC_SRCREV = "1584985938884bf6cb1d839779578354b1865ea4"
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

