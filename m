Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D7EF3E009DA; Mon, 18 May 2015 10:40:35 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2EE2CE0094C
	for <meta-ti@yoctoproject.org>; Mon, 18 May 2015 10:40:32 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4IHeUsa016415
	for <meta-ti@yoctoproject.org>; Mon, 18 May 2015 12:40:30 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4IHeUCs004348
	for <meta-ti@yoctoproject.org>; Mon, 18 May 2015 12:40:30 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 18 May 2015 12:40:30 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4IHeTRr002736;
	Mon, 18 May 2015 12:40:30 -0500
Date: Mon, 18 May 2015 13:40:29 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150518174028.GD31845@edge>
References: <1431970376-24163-1-git-send-email-j-stiffler@ti.com>
	<1431970376-24163-2-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1431970376-24163-2-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/3] gdbserverproxy-module-drv: Add version 1.1.0
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
X-List-Received-Date: Mon, 18 May 2015 17:40:35 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, May 18, 2015 at 01:32:54PM -0400, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  recipes-devtools/gdbc6x/gdbc6x.inc                 |    9 ++++++
>  .../gdbc6x/gdbserverproxy-module-drv_git.bb        |   31 ++++++++++++++++++++
>  2 files changed, 40 insertions(+)
>  create mode 100644 recipes-devtools/gdbc6x/gdbc6x.inc
>  create mode 100644 recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
> 
> diff --git a/recipes-devtools/gdbc6x/gdbc6x.inc b/recipes-devtools/gdbc6x/gdbc6x.inc
> new file mode 100644
> index 0000000..ecdc11e
> --- /dev/null
> +++ b/recipes-devtools/gdbc6x/gdbc6x.inc
> @@ -0,0 +1,9 @@
> +BRANCH = "master"
> +
> +PV = "1.1.0"
> +INC_PR = "r0"
> +
> +# This corresponds to version 1.1.0    
> +SRCREV = "1ab06f8bcfe7540754558bac331a0312c4b59142"
> +
> +SRC_URI = "git://git.ti.com/sdo-emu/gdbc6x.git;protocol=git;branch=${BRANCH}"
> diff --git a/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb b/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
> new file mode 100644
> index 0000000..2b02236
> --- /dev/null
> +++ b/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
> @@ -0,0 +1,31 @@
> +DESCRIPTION="Interface for GDB to commincate witha TI C66X DSP"
> +
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING.txt;md5=75859989545e37968a99b631ef42722e"
> +
> +include gdbc6x.inc
> +
> +COMPATIBLE_MACHINE = "dra7xx"
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +# This package builds a kernel module, use kernel PR as base and append a local
> +MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
> +PR = "${MACHINE_KERNEL_PR}"
> +
> +PLATFORM = ""
> +PLATFORM_dra7xx = "DRA7xx_PLATFORM"
> +
> +EXTRA_OEMAKE = "PLATFORM=${PLATFORM}"
> +
> +S = "${WORKDIR}/git/kernel_module/gdbproxy-mod"
> +
> +module_autoload_gdbserverproxy = "gdbserverproxy"
> +
> +inherit module
> +
> +do_configure[noexec] = "1"
> +do_qa_configure[noexec] = "1"

What's the need for the above?


> +CREATE_SRCIPK = "1"
> +SRCIPK_INSTALL_DIR = "board-support/extra-drivers/${PN}-${PV}"
> +SRCIPK_PACKAGE_ARCH = "${MACHINE_ARCH}"

This is not the right place for these^^ either.

-- 
Denys

