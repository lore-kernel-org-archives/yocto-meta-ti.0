Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E1839E00C89; Thu, 31 Aug 2017 16:28:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F078FE00C1A
	for <meta-ti@yoctoproject.org>; Thu, 31 Aug 2017 16:28:20 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7VNSJGv014162
	for <meta-ti@yoctoproject.org>; Thu, 31 Aug 2017 18:28:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504222099;
	bh=K4eoI+naucMIHpcWnSBVKYSxsnPaTeb+UtU3Z+KQDZA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=CtEL0fc82qBVhrtka4ImerQxyiEyEEAgollprJKfj/JCadCfIw29V9ACbjdhZTI/L
	68pQq1/mCMSbbYzqpO3ouHhAmXAOUF/AnkFLcYcYlYy/GR/pWlwFvmC1PV3C8qhWEr
	nlwzvv356u9ypLBKAIZ4zob7t/p5Z6ZvwKXm0jOo=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7VNSJQR000929
	for <meta-ti@yoctoproject.org>; Thu, 31 Aug 2017 18:28:19 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 31 Aug 2017 18:28:19 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 31 Aug 2017 18:28:19 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7VNSJXP008549;
	Thu, 31 Aug 2017 18:28:19 -0500
Date: Thu, 31 Aug 2017 19:28:15 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Hongmei Gou <a0271529@ti.com>
Message-ID: <20170831232814.GD8304@edge>
References: <1504133410-14907-1-git-send-email-a0271529@ti.com>
MIME-Version: 1.0
In-Reply-To: <1504133410-14907-1-git-send-email-a0271529@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] starterware: add starterware for linux which installs header files only
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
X-List-Received-Date: Thu, 31 Aug 2017 23:28:23 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Aug 30, 2017 at 06:50:10PM -0400, Hongmei Gou wrote:
> * starterware.inc is created to host the common information
> 
> Signed-off-by: Hongmei Gou <a0271529@ti.com>
> ---
>  recipes-bsp/starterware/starterware-rtos_git.bb | 22 ++--------------------
>  recipes-bsp/starterware/starterware.inc         | 21 +++++++++++++++++++++
>  recipes-bsp/starterware/starterware_git.bb      | 16 ++++++++++++++++
>  3 files changed, 39 insertions(+), 20 deletions(-)
>  create mode 100644 recipes-bsp/starterware/starterware.inc
>  create mode 100644 recipes-bsp/starterware/starterware_git.bb
> 
> diff --git a/recipes-bsp/starterware/starterware-rtos_git.bb b/recipes-bsp/starterware/starterware-rtos_git.bb
> index 5584cb2..88176bb 100644
> --- a/recipes-bsp/starterware/starterware-rtos_git.bb
> +++ b/recipes-bsp/starterware/starterware-rtos_git.bb
> @@ -1,28 +1,10 @@
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://Makefile;beginline=1;endline=35;md5=286cbb5dce3e348294b6b025cff969b3"
> +require starterware.inc
>  
> -COMPATIBLE_MACHINE = "ti33x|ti43x"
>  DEPENDS = "gcc-arm-none-eabi-native"
>  
>  require recipes-ti/includes/ti-paths.inc
>  
> -PACKAGE_ARCH = "${MACHINE_ARCH}"
> -
> -STARTERWARE_GIT_URI = "git://git.ti.com/keystone-rtos/starterware.git"
> -STARTERWARE_GIT_PROTOCOL = "git"
> -STARTERWARE_GIT_BRANCH = "master"
> -
> -# Below commit ID corresponds to "DEV.STARTERWARE.PROCSDK.02.01.01.03A"
> -STARTERWARE_SRCREV = "08f65ae3d5ccd19fbaf36040a99de971b685d144"
> -
> -BRANCH = "${STARTERWARE_GIT_BRANCH}"
> -SRC_URI = "${STARTERWARE_GIT_URI};protocol=${STARTERWARE_GIT_PROTOCOL};branch=${BRANCH}"
> -
> -SRCREV = "${STARTERWARE_SRCREV}"
> -PV = "02.01.01.03A"
> -PR = "r0"
> -
> -S = "${WORKDIR}/git"
> +PR = "${INC_PR}.0"
>  
>  PARTNO_ti33x = "am335x"
>  PARTNO_ti43x = "am437x"
> diff --git a/recipes-bsp/starterware/starterware.inc b/recipes-bsp/starterware/starterware.inc
> new file mode 100644
> index 0000000..c5d7655
> --- /dev/null
> +++ b/recipes-bsp/starterware/starterware.inc
> @@ -0,0 +1,21 @@
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://Makefile;beginline=1;endline=35;md5=286cbb5dce3e348294b6b025cff969b3"
> +
> +COMPATIBLE_MACHINE = "ti33x|ti43x"
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +STARTERWARE_GIT_URI = "git://git.ti.com/keystone-rtos/starterware.git"
> +STARTERWARE_GIT_PROTOCOL = "git"
> +STARTERWARE_GIT_BRANCH = "master"
> +
> +# Below commit ID corresponds to "DEV.STARTERWARE.PROCSDK.02.01.01.03A"
> +STARTERWARE_SRCREV = "08f65ae3d5ccd19fbaf36040a99de971b685d144"
> +
> +BRANCH = "${STARTERWARE_GIT_BRANCH}"
> +SRC_URI = "${STARTERWARE_GIT_URI};protocol=${STARTERWARE_GIT_PROTOCOL};branch=${BRANCH}"
> +
> +SRCREV = "${STARTERWARE_SRCREV}"
> +PV = "02.01.01.03A"
> +INC_PR = "r0"
> +
> +S = "${WORKDIR}/git"
> diff --git a/recipes-bsp/starterware/starterware_git.bb b/recipes-bsp/starterware/starterware_git.bb
> new file mode 100644
> index 0000000..d0c4396
> --- /dev/null
> +++ b/recipes-bsp/starterware/starterware_git.bb
> @@ -0,0 +1,16 @@
> +require starterware.inc
> +
> +PR = "${INC_PR}.0"
> +
> +ALLOW_EMPTY_${PN} = "1"
> +
> +CLEANBROKEN = "1"
> +
> +do_compile() {
> +    :
> +}
> +
> +do_install () {
> +    install -d ${D}${includedir}/ti/starterware
> +    find . -name "*.h" -type f | xargs -I {} cp --parents {} ${D}${includedir}/ti/starterware

Please pass --no-preserve=ownership to avoid host contamination warnings.


> +}
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

