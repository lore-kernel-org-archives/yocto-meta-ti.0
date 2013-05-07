Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3A023E0144E
	for <meta-ti@yoctoproject.org>; Tue,  7 May 2013 14:59:56 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r47LxtbP022669
	for <meta-ti@yoctoproject.org>; Tue, 7 May 2013 16:59:55 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r47LxtMr008272
	for <meta-ti@yoctoproject.org>; Tue, 7 May 2013 16:59:55 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 7 May 2013 16:59:55 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r47LxtcK004721;
	Tue, 7 May 2013 16:59:55 -0500
Date: Tue, 7 May 2013 17:59:54 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Murali Karicheri <m-karicheri2@ti.com>
Message-ID: <20130507215954.GG12982@edge>
References: <1367961859-6243-1-git-send-email-m-karicheri2@ti.com>
	<1367961859-6243-3-git-send-email-m-karicheri2@ti.com>
MIME-Version: 1.0
In-Reply-To: <1367961859-6243-3-git-send-email-m-karicheri2@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [RESEND: PATCH 3/3] keystone2: linux: add support for building 3.8.4 based Linux kernel
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
X-List-Received-Date: Tue, 07 May 2013 21:59:56 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, May 07, 2013 at 05:24:19PM -0400, Murali Karicheri wrote:
> This also allow support for switching between release tag and tip of the
> master/master for nightly builds.
> 
> Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
> ---
>  .../linux/linux-keystone-3.8.4/defconfig           |    1 +
>  recipes-kernel/linux/linux-keystone_3.8.4.bb       |   41 ++++++++++++++++++++
>  2 files changed, 42 insertions(+)
>  create mode 100644 recipes-kernel/linux/linux-keystone-3.8.4/defconfig
>  create mode 100644 recipes-kernel/linux/linux-keystone_3.8.4.bb
> 
> diff --git a/recipes-kernel/linux/linux-keystone-3.8.4/defconfig b/recipes-kernel/linux/linux-keystone-3.8.4/defconfig
> new file mode 100644
> index 0000000..04e6b17
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-keystone-3.8.4/defconfig
> @@ -0,0 +1 @@
> +use-kernel-config=keystone2_defconfig
> diff --git a/recipes-kernel/linux/linux-keystone_3.8.4.bb b/recipes-kernel/linux/linux-keystone_3.8.4.bb
> new file mode 100644
> index 0000000..0237e66
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-keystone_3.8.4.bb
> @@ -0,0 +1,41 @@
> +LICENSE = "GPLv2"
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
> +
> +COMPATIBLE_MACHINE = "keystone-evm"

Same as with u-boot, you should probably use "keystone" SOC family here.


> +inherit kernel
> +
> +do_deploy_append() {
> +    cd ${S}
> +}

This do_deploy_append() fix is no longer required.


> +require recipes-kernel/linux/linux-dtb.inc
> +require recipes-kernel/linux/setup-defconfig.inc
> +
> +MACHINE_KERNEL_PR_append = "a"
> +
> +CORTEXA8FIXUP = "no"
> +
> +KERNEL_DEVICETREE_keystone-evm = "arch/${ARCH}/boot/dts/k2hk-evm.dts"
> +
> +# The tree tends to rebase, use literal stable tags
> +# for nightly switch the two lines below
> +#SRCREV = "DEV.MCSDK-03.08.04.10"
> +SRCREV = "${AUTOREV}"
> +
> +BRANCH = "master/master"
> +#BRANCH = "releases/03.00.00.10"
> +
> +# for nightly switch the three lines below
> +#SRC_URI = "git://arago-project.org/git/projects/linux-keystone.git;protocol=git;branch=${BRANCH} \
> +#           file://defconfig \
> +#           "
> +SRC_URI = "git://gtgit01.gt.design.ti.com/git/projects/linux-keystone.git;protocol=git;branch=${BRANCH} \
> +           file://defconfig \
> +           "

Same comments for SRCREV and SRC_URI as with u-boot.


> +S = "${WORKDIR}/git"
> +
> +RDEPENDS_kernel-base = ""

You should probably move this line to an image recipe of distro/SDK config. 
There might be people wanting to build Kkeystone kernel and get the default 
/boot image installed. So, either put this in tisdk-server-rootfs-image 
(would be rootfs-specific) or better yet in conf/distro/include/branding-mcsdk.inc 
to be MCSDK-specific.

-- 
Denys

