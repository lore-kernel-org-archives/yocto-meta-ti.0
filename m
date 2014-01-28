Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AFA93E003D7
	for <meta-ti@yoctoproject.org>; Mon, 27 Jan 2014 17:40:29 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0S1eSVU020115
	for <meta-ti@yoctoproject.org>; Mon, 27 Jan 2014 19:40:28 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0S1eSj3003525
	for <meta-ti@yoctoproject.org>; Mon, 27 Jan 2014 19:40:28 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 27 Jan 2014 19:40:27 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0S1eR2s001376;
	Mon, 27 Jan 2014 19:40:27 -0600
Date: Mon, 27 Jan 2014 20:40:27 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <sam.nelson@ti.com>
Message-ID: <20140128014027.GA6814@edge>
References: <1387410879-23769-1-git-send-email-sam.nelson@ti.com>
	<1390850892-23833-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1390850892-23833-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] cmem: numerous generic recipe fixes
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
X-List-Received-Date: Tue, 28 Jan 2014 01:40:31 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Sam,

Please see my comments inline explaining what changes I've made.


On Mon, Jan 27, 2014 at 02:28:12PM -0500, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Sam, please review these fixes that I made on top of your submission. This is
> just for your reference to illustrate the feedback comments given previously.
> Feel free to ask questions. I'll squash this patch before pushing changes in.
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  recipes-bsp/cmem/cmem-mod_git.bb | 20 ++++----------------
>  recipes-bsp/cmem/cmem.inc        |  4 +++-
>  recipes-bsp/cmem/cmem_git.bb     |  4 +---
>  3 files changed, 8 insertions(+), 20 deletions(-)
> 
> diff --git a/recipes-bsp/cmem/cmem-mod_git.bb b/recipes-bsp/cmem/cmem-mod_git.bb
> index 5809d08..2bdf9c0 100644
> --- a/recipes-bsp/cmem/cmem-mod_git.bb
> +++ b/recipes-bsp/cmem/cmem-mod_git.bb
> @@ -1,24 +1,12 @@
> -DESCRIPTION="Contiguous memory allocation kernel module for contiguous memory allocation from userspace "
> +DESCRIPTION = "Kernel module for contiguous memory allocation from userspace"

Not important, just a cosmetic one.


>  include cmem.inc
>  
>  # This package builds a kernel module, use kernel PR as base and append a local
> +MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
>  PR = "${MACHINE_KERNEL_PR}"
> -PR_append = "a"

This is to revert the order of PR and MACHINE_KERNEL_PR assignments, so it 
works when machine_kernel_pr.bbclass is not inherited (i.e. for distros other 
than Arago or Angstrom)...


> -S = "${WORKDIR}/git"

This moved to cmem.inc


>  inherit module
>  
> -do_compile () {
> -    unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
> -    cd ${S}
> -    make -f lu.mak modules_clean
> -    make -f lu.mak module KERNEL_INSTALL_DIR=${STAGING_KERNEL_DIR} TOOLCHAIN_PREFIX=${CROSS_COMPILE}
> -}
> -
> -do_install () {
> -    unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
> -    cd ${S}
> -    make -f lu.mak modules_install KERNEL_INSTALL_DIR="${STAGING_KERNEL_DIR}" EXEC_DIR="${D}/lib/modules/${KERNEL_VERSION}/extra" INSTALL_MOD_PATH="${D}"
> -}

Ok, this is the major change - module.bbclass already provides do_compile() 
and do_install() functions with most of the code in there. All we need is to 
pass few additional variables.


> +EXTRA_OEMAKE += '-f lu.mak KERNEL_INSTALL_DIR="${STAGING_KERNEL_DIR}" TOOLCHAIN_PREFIX="${TOOLCHAIN_PREFIX}" EXEC_DIR="${D}/lib/modules/${KERNEL_VERSION}/extra"'

This is the list of additional variables to pass to "make" when running 
do_compile() and do_install(). I reduced it to bare minimum that cmem 
Makefiles require.


> +MAKE_TARGETS = "module"

This is the default target for do_compile() function.


> diff --git a/recipes-bsp/cmem/cmem.inc b/recipes-bsp/cmem/cmem.inc
> index b1f441a..7927839 100644
> --- a/recipes-bsp/cmem/cmem.inc
> +++ b/recipes-bsp/cmem/cmem.inc
> @@ -1,4 +1,4 @@
> -HOMEPAGE="http://processors.wiki.ti.com/index.php/Category:CMEM"
> +HOMEPAGE = "http://processors.wiki.ti.com/index.php/Category:CMEM"

Again, just a cosmetic change.


>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://include/ti/cmem.h;beginline=1;endline=30;md5=b86138d4028fb8310b3b983024edc620"
> @@ -8,3 +8,5 @@ BRANCH ?= "master"
>  SRCREV = "0b68dfe9f155a1978cdb2178e052dc0d6f1e705b"
>  
>  SRC_URI = "git://git.ti.com/ipc/ludev.git;protocol=git;branch=${BRANCH}"
> +
> +S = "${WORKDIR}/git"

Consolidate S assignment in one place.


> diff --git a/recipes-bsp/cmem/cmem_git.bb b/recipes-bsp/cmem/cmem_git.bb
> index ca3ed89..bab9238 100644
> --- a/recipes-bsp/cmem/cmem_git.bb
> +++ b/recipes-bsp/cmem/cmem_git.bb
> @@ -1,11 +1,9 @@
> -DESCRIPTION="The cmem component supports contiguous memory allocation from userspace "
> +DESCRIPTION = "The cmem component supports contiguous memory allocation from userspace"

One more cosmetic change.


>  include cmem.inc
>  
>  RDEPENDS_${PN} = "cmem-mod"
>  
> -S = "${WORKDIR}/git"

Moved to cmem.inc


>  PR = "r0"
>  
>  PACKAGES =+ "${PN}-test"
> -- 
> 1.8.3.2
> 

