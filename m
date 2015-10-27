Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 22A0DE00A8C; Tue, 27 Oct 2015 07:41:49 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B1B33E009B8
	for <meta-ti@yoctoproject.org>; Tue, 27 Oct 2015 07:41:23 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9REfNjQ019262
	for <meta-ti@yoctoproject.org>; Tue, 27 Oct 2015 09:41:23 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9REfNiG026086
	for <meta-ti@yoctoproject.org>; Tue, 27 Oct 2015 09:41:23 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 27 Oct 2015 09:41:23 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9REfMMj023422;
	Tue, 27 Oct 2015 09:41:22 -0500
Message-ID: <562F8D12.7090407@ti.com>
Date: Tue, 27 Oct 2015 10:41:22 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Sam Nelson <sam.nelson@ti.com>, <meta-ti@yoctoproject.org>
References: <1445486410-29445-1-git-send-email-sam.nelson@ti.com>
In-Reply-To: <1445486410-29445-1-git-send-email-sam.nelson@ti.com>
Subject: Re: [PATCH v2] pa-lld: Update to new version 3.0.1.5
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
X-List-Received-Date: Tue, 27 Oct 2015 14:41:49 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 10/22/2015 12:00 AM, Sam Nelson wrote:
> - Add script to create device independent symbolic link to actual
>    device library
>
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
>
> ---
> Changes from previous version of patch
> - Reformatted symbolic link commands
> ---
> ---
>   recipes-bsp/pa-lld/pa-lld.inc    |    6 +++---
>   recipes-bsp/pa-lld/pa-lld_git.bb |   13 +++++++++++++
>   2 files changed, 16 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-bsp/pa-lld/pa-lld.inc b/recipes-bsp/pa-lld/pa-lld.inc
> index 7d922fb..b8ade64 100644
> --- a/recipes-bsp/pa-lld/pa-lld.inc
> +++ b/recipes-bsp/pa-lld/pa-lld.inc
> @@ -6,9 +6,9 @@ COMPATIBLE_MACHINE = "keystone"
>   BRANCH = "master"
>   SRC_URI = "git://git.ti.com/keystone-rtos/pa-lld.git;destsuffix=git/ti/drv/pa;protocol=git;branch=${BRANCH}"
>   
> -# Below Commit ID corresponds to "DEV.PA_LLD.03.00.01.04"
> -SRCREV = "92de8879be3712af684bd031ca0ed291c05d6050"
> -PV = "03.00.01.04"
> +# Below Commit ID corresponds to "DEV.PA_LLD.03.00.01.05A"
> +SRCREV = "ae3aa3e80ecf64fe5a16515d134a6bc217220e2e"
> +PV = "03.00.01.05"
>   PR = "r1"
>   
>   BASEDIR = "${WORKDIR}/git"
> diff --git a/recipes-bsp/pa-lld/pa-lld_git.bb b/recipes-bsp/pa-lld/pa-lld_git.bb
> index 63e34ad..468113b 100644
> --- a/recipes-bsp/pa-lld/pa-lld_git.bb
> +++ b/recipes-bsp/pa-lld/pa-lld_git.bb
> @@ -4,6 +4,13 @@ DEPENDS = "common-csl-ip rm-lld"
>   
>   include pa-lld.inc
>   
> +SRC_URI += "file://init_pa.sh"

This file does not exist.

> +
> +inherit update-rc.d
> +
> +INITSCRIPT_NAME = "init_pa.sh"
> +INITSCRIPT_PARAMS = "defaults 10"
> +
>   do_compile () {
>   #   Now build the lld in the updated directory
>   	make -f makefile_armv7 DEVICE=k2h clean lib PDK_INSTALL_PATH=${STAGING_INCDIR}
> @@ -12,4 +19,10 @@ do_compile () {
>   
>   do_install () {
>   	make -f makefile_armv7 install PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
> +#   Set the generic device library symbolic link
> +    ln -sf libpa.so.1.0.0 ${D}${libdir}/libpa_device.so.1
> +    ln -sf libpa_device.so.1 ${D}${libdir}/libpa_device.so
> +#   Copy init scripts
> +    install -d ${D}${sysconfdir}/init.d/
> +    install -c -m 755 ${WORKDIR}/${INITSCRIPT_NAME} ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
>   }


