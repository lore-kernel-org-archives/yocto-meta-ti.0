Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 49A8BE00496
	for <meta-ti@yoctoproject.org>; Mon,  6 May 2013 19:28:26 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MME00F3OPIGKW97@vms173013.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 06 May 2013 21:28:07 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 2A80520091; Mon,
	06 May 2013 22:27:51 -0400 (EDT)
Date: Mon, 06 May 2013 22:27:51 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-id: <20130507022751.GA15692@denix.org>
References: <1367887887-1806-1-git-send-email-fcooper@ti.com>
MIME-version: 1.0
In-reply-to: <1367887887-1806-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v2] am33x-cm3: Split init script into its own package
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
X-List-Received-Date: Tue, 07 May 2013 02:28:26 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, May 06, 2013 at 07:51:27PM -0500, Franklin S. Cooper Jr wrote:
> * 3.8+ kernels use an init script to load the cm3 firmware.
> * 3.2 kernel require the cm3 firmware during compile time therefore no init
>  script is needed.
> * Separate the init script from the main package and place it in its own
>   package.
> ---
> Changes since v1:
> Instead of seperating the init script into its own recipe the init script is now
> seperated into its own package.
> 
> Drop the patchset number since the other patch in the set isn't needed.
> 
>  recipes-bsp/ti/am33x-cm3_git.bb              |    9 ++++++++-
>  recipes-kernel/linux/linux-ti-staging_3.8.bb |    4 ++--
>  2 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-bsp/ti/am33x-cm3_git.bb b/recipes-bsp/ti/am33x-cm3_git.bb
> index 4829b78..cf20160 100644
> --- a/recipes-bsp/ti/am33x-cm3_git.bb
> +++ b/recipes-bsp/ti/am33x-cm3_git.bb
> @@ -4,7 +4,7 @@ LICENSE = "TI-BSD"
>  LIC_FILES_CHKSUM = "file://License.txt;md5=858099c817e47ea63559fc6b67ae8d91"
>  
>  PV = "04.06.00.10"
> -PR = "r2"
> +PR = "r3"
>  
>  # SRCREV corresponds to tag "AM335xPSP_04.06.00.10-rc1"
>  SRCREV = "27ca4643e422245a95723de1df0247a00eada45b"
> @@ -15,6 +15,10 @@ INITSCRIPT_PARAMS = "defaults 96"
>  
>  inherit update-rc.d
>  
> +UPDATERCPN = "am33x-load-cm3"
> +
> +RDEPENDS_am33x-load-cm3 = "am33x-cm3"
> +
>  SRC_URI = "git://arago-project.org/git/projects/am33x-cm3.git;protocol=git;branch=${BRANCH} \
>             file://init-am33x-cm3 \
>            "
> @@ -34,5 +38,8 @@ do_install() {
>  	install -m 0755 ${WORKDIR}/init-am33x-cm3 ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
>  }
>  
> +PACKAGES =+ "am33x-load-cm3"

Any specific reason for that name? I was hoping for ${PN}-init or even 
${PN}-initscript name... Other than that looks very clean.

-- 
Denys


> +
>  FILES_${PN} += "${base_libdir}/firmware"
>  
> +FILES_am33x-load-cm3 = "${sysconfdir}/*"
> diff --git a/recipes-kernel/linux/linux-ti-staging_3.8.bb b/recipes-kernel/linux/linux-ti-staging_3.8.bb
> index 6fe52e2..e1cae20 100644
> --- a/recipes-kernel/linux/linux-ti-staging_3.8.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_3.8.bb
> @@ -11,7 +11,7 @@ require recipes-kernel/linux/setup-defconfig.inc
>  
>  # Add a run-time dependency for the PM firmware to be installed
>  # on the target file system.
> -RDEPENDS_ti33x += "am33x-cm3"
> +RDEPENDS_ti33x += "am33x-cm3 am33x-load-cm3"
>  
>  # Default is to package all dts files for ti33x devices unless building
>  # for the specific beaglebone machine.
> @@ -30,7 +30,7 @@ SRCREV = "23e7f725a6af4ca44660c06bc3569f6ce705d1d0"
>  PV = "3.8.8"
>  
>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
> -MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
> +MACHINE_KERNEL_PR_append = "c+gitr${SRCPV}"
>  
>  SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
>             file://defconfig \
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

