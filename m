Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 58115E007E2
	for <meta-ti@yoctoproject.org>; Wed, 15 Jan 2014 12:50:24 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [108.18.138.84])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MZG00LT8N7KBH50@vms173023.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 15 Jan 2014 14:50:08 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 4748F20387; Wed,
	15 Jan 2014 15:50:07 -0500 (EST)
Date: Wed, 15 Jan 2014 15:50:07 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Chase Maupin <Chase.Maupin@ti.com>
Message-id: <20140115205007.GA15907@denix.org>
References: <1389655987-31349-1-git-send-email-Chase.Maupin@ti.com>
MIME-version: 1.0
In-reply-to: <1389655987-31349-1-git-send-email-Chase.Maupin@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/3] vpe-vpdma: Package for VPE DMA FW and test app
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
X-List-Received-Date: Wed, 15 Jan 2014 20:50:31 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Jan 13, 2014 at 05:33:05PM -0600, Chase Maupin wrote:
> * This recipe will create the firmware and test application
>   packages.
> 
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  recipes-bsp/ti/vpe-vpdma_git.bb |   29 +++++++++++++++++++++++++++++
>  1 files changed, 29 insertions(+), 0 deletions(-)
>  create mode 100644 recipes-bsp/ti/vpe-vpdma_git.bb
> 
> diff --git a/recipes-bsp/ti/vpe-vpdma_git.bb b/recipes-bsp/ti/vpe-vpdma_git.bb
> new file mode 100644
> index 0000000..d506791
> --- /dev/null
> +++ b/recipes-bsp/ti/vpe-vpdma_git.bb
> @@ -0,0 +1,29 @@
> +DESCRIPTION = "VPE VPDMA firmware and test program"
> +
> +DEPENDS += "virtual/kernel"
> +
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=74d2f71d8898c54e3d1c9d0058c484aa"
> +
> +COMPATIBLE_MACHINE = "dra7xx-evm"
> +
> +PV = "1b8"
> +PR = "r0"
> +
> +SRCREV = "24a5487ec13bf560f0e7fb24a9d4747f9f358be2"

The repo seems to have been rebased and this commit is nowhere to be found, 
resulting in breakage...


> +BRANCH ?= "master"
> +
> +SRC_URI = "git://git.ti.com/vpe_tests/vpe_tests.git;protocol=git;branch=${BRANCH}"
> +
> +S = "${WORKDIR}/git"
> +
> +# The test application needs additional include headers from the kernel
> +EXTRA_OEMAKE = 'KDIR="${STAGING_KERNEL_DIR}/include/uapi -I${STAGING_KERNEL_DIR}/include"'
> +
> +do_install() {
> +    oe_runmake DESTDIR="${D}" install
> +}
> +
> +# Separate the firmware into it's own package.
> +PACKAGES =+ "${PN}-fw"
> +FILES_${PN}-fw += "${base_libdir}/firmware"
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

