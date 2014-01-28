Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AB78DE005B4
	for <meta-ti@yoctoproject.org>; Mon, 27 Jan 2014 20:35:10 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0S4Z9p0024745
	for <meta-ti@yoctoproject.org>; Mon, 27 Jan 2014 22:35:09 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0S4Z9x7009878
	for <meta-ti@yoctoproject.org>; Mon, 27 Jan 2014 22:35:09 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 27 Jan 2014 22:35:08 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0S4Z8Oi013751;
	Mon, 27 Jan 2014 22:35:08 -0600
Date: Mon, 27 Jan 2014 23:35:08 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20140128043508.GC6814@edge>
References: <1390882969-22545-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1390882969-22545-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] linux-keystone: Create recipe for linux-keystone kernel version 3.10
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
X-List-Received-Date: Tue, 28 Jan 2014 04:35:14 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jan 27, 2014 at 11:22:49PM -0500, Sam Nelson wrote:
> - Updated Source URL & version
> - Added device tree file

Do you need to keep 3.8.4 version around? If not, why not upgrade instead?
Also, I would strongly recommend using linux-ti-kernel_3.12.bb as an example.


> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  recipes-kernel/linux/linux-keystone_3.10.bb |   36 +++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 recipes-kernel/linux/linux-keystone_3.10.bb
> 
> diff --git a/recipes-kernel/linux/linux-keystone_3.10.bb b/recipes-kernel/linux/linux-keystone_3.10.bb
> new file mode 100644
> index 0000000..b37a404
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-keystone_3.10.bb
> @@ -0,0 +1,36 @@
> +SECTION = "kernel"
> +DESCRIPTION = "Linux kernel for TI Keystone devices"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
> +
> +COMPATIBLE_MACHINE = "keystone"
> +
> +inherit kernel
> +
> +do_deploy_append() {
> +    cd ${S}
> +}

I don't remember if this is still needed...


> +require recipes-kernel/linux/linux-dtb.inc
> +require recipes-kernel/linux/setup-defconfig.inc
> +
> +MACHINE_KERNEL_PR_append = "a"
> +
> +CORTEXA8FIXUP = "no"
> +
> +KERNEL_DEVICETREE_keystone-evm = "arch/${ARCH}/boot/dts/k2hk-evm.dts"

You can use just "k2hk-evm.dtb" instead.


> +#This commit corresponds to "K2_LINUX_03.10.10_13.12"
> +SRCREV = "335d14b1c2ce23585835243126c6acba89067ecf"
> +
> +BRANCH = "master"
> +
> +# for nightly switch the three lines below

^^^ ?


> +SRC_URI = "git://git.ti.com/keystone-linux/linux.git;protocol=git;branch=${BRANCH}\
> +           file://defconfig\
> +           "
> +
> +S = "${WORKDIR}/git"
> +
> +RDEPENDS_kernel-base = ""
> +
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

