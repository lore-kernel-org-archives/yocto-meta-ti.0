Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C5077E01496
	for <meta-ti@yoctoproject.org>; Thu, 18 Apr 2013 11:04:04 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MLG004I9Q644V23@vms173005.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 18 Apr 2013 13:03:51 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id D8287201AD; Thu,
	18 Apr 2013 14:03:40 -0400 (EDT)
Date: Thu, 18 Apr 2013 14:03:40 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Chase Maupin <Chase.Maupin@ti.com>
Message-id: <20130418180340.GB21029@denix.org>
References: <1366306821-17167-1-git-send-email-Chase.Maupin@ti.com>
MIME-version: 1.0
In-reply-to: <1366306821-17167-1-git-send-email-Chase.Maupin@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/2] am33x-cm3: use init script to load firmware
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
X-List-Received-Date: Thu, 18 Apr 2013 18:04:04 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Apr 18, 2013 at 12:40:20PM -0500, Chase Maupin wrote:
> * The PM firmware is now loaded using an init script so make
>   the init script installation part of the firmware package.
> * Fix up the SRC_URI to the proper format.
> 
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  recipes-bsp/ti/am33x-cm3/init-am33x-cm3 |    6 ++++++
>  recipes-bsp/ti/am33x-cm3_git.bb         |   17 +++++++++++++++--
>  2 files changed, 21 insertions(+), 2 deletions(-)
>  create mode 100644 recipes-bsp/ti/am33x-cm3/init-am33x-cm3
> 
> diff --git a/recipes-bsp/ti/am33x-cm3/init-am33x-cm3 b/recipes-bsp/ti/am33x-cm3/init-am33x-cm3
> new file mode 100644
> index 0000000..56c17b3
> --- /dev/null
> +++ b/recipes-bsp/ti/am33x-cm3/init-am33x-cm3
> @@ -0,0 +1,6 @@
> +#!/bin/sh
> +
> +# Load the PM CM3 firmware
> +echo 1 > /sys/devices/ocp.2/44d00000.wkup_m3/firmware/am335x-pm-firmware.bin/loading
> +cat /lib/firmware/am335x-pm-firmware.bin > /sys/devices/ocp.2/44d00000.wkup_m3/firmware/am335x-pm-firmware.bin/data
> +echo 0 > /sys/devices/ocp.2/44d00000.wkup_m3/firmware/am335x-pm-firmware.bin/loading
> diff --git a/recipes-bsp/ti/am33x-cm3_git.bb b/recipes-bsp/ti/am33x-cm3_git.bb
> index 247ba4d..489fcdf 100644
> --- a/recipes-bsp/ti/am33x-cm3_git.bb
> +++ b/recipes-bsp/ti/am33x-cm3_git.bb
> @@ -4,9 +4,18 @@ LICENSE = "TI-BSD"
>  LIC_FILES_CHKSUM = "file://License.txt;md5=858099c817e47ea63559fc6b67ae8d91"
>  
>  PV = "04.06.00.07"
> +PR = "r1"
>  SRCREV = "cf07b841d6e8c5e026eecb259d143f3dff412c8e"
> +BRANCH ?= "master"
>  
> -SRC_URI = "git://arago-project.org/git/projects/am33x-cm3.git"
> +INITSCRIPT_NAME = "am335x-pm-firmware-load"
> +INITSCRIPT_PARAMS = "defaults 96"
> +
> +inherit update-rc.d
> +
> +SRC_URI = "git://arago-project.org/git/projects/am33x-cm3.git;protocol=git;branch=${BRANCH} \
> +           file://init-am33x-cm3 \
> +          "
>  
>  S = "${WORKDIR}/git"
>  
> @@ -17,7 +26,11 @@ do_compile() {
>  do_install() {
>  	install -d ${D}${base_libdir}/firmware
>  	install -m 0644 bin/am335x-pm-firmware.bin ${D}${base_libdir}/firmware/
> +
> +    # Install the init script to load the PM firmware at boot
> +    install -d ${D}${sysconfdir}/init.d
> +    install -m 0755 ${WORKDIR}/init-am33x-cm3 ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}

Please match the whitespaces - the above code uses tabs.


>  }
>  
> -FILES_${PN} = "${base_libdir}/firmware"
> +FILES_${PN} += "${base_libdir}/firmware"
>  
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

