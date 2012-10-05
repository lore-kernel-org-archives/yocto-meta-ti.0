Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 400B0E00294
	for <meta-ti@yoctoproject.org>; Fri,  5 Oct 2012 15:08:04 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MBF00ET0XHF27R0@vms173011.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 05 Oct 2012 17:08:03 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 69E1620173; Fri,
	05 Oct 2012 18:08:03 -0400 (EDT)
Date: Fri, 05 Oct 2012 18:08:03 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
Message-id: <20121005220803.GE27533@denix.org>
References: <1349465081-10787-1-git-send-email-fcooper@ti.com>
MIME-version: 1.0
In-reply-to: <1349465081-10787-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] wl12xx-firmware: Port wl12xx-firmware recipe
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
X-List-Received-Date: Fri, 05 Oct 2012 22:08:04 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Oct 05, 2012 at 02:24:41PM -0500, Franklin S. Cooper Jr wrote:
> * Port wl12xx-firmware recipe from arago. This recipe was originally
>   named linux-firmware in arago.
> * Wl12xx-firmware provides the firmware files for use with the TI
>   Wi-Fi + Bluetooth module.
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  recipes-bsp/wl12xx-firmware/wl12xx-firmware_git.bb |   28 ++++++++++++++++++++
>  1 files changed, 28 insertions(+), 0 deletions(-)
>  create mode 100644 recipes-bsp/wl12xx-firmware/wl12xx-firmware_git.bb
> 
> diff --git a/recipes-bsp/wl12xx-firmware/wl12xx-firmware_git.bb b/recipes-bsp/wl12xx-firmware/wl12xx-firmware_git.bb
> new file mode 100644
> index 0000000..3fa9dbb
> --- /dev/null
> +++ b/recipes-bsp/wl12xx-firmware/wl12xx-firmware_git.bb
> @@ -0,0 +1,28 @@
> +DESCRIPTION = "Firmware files for use with TI wl12xx"
> +LICENSE = "TI-TSPA"
> +LIC_FILES_CHKSUM = "file://LICENCE;md5=ba590e1d103f891d0151609046aef9e8"
> +
> +PACKAGE_ARCH = "all"
> +
> +PR = "r0+gitr${SRCREV}"
> +
> +# This recipe provides the latest firmware files for wl12xx.
> +# Therefore, use the contents of this recipe instead of the contents
> +# of linux-firmware-wl12xx.
> +RCONFLICTS_${PN} = "linux-firmware-wl12xx"
> +RREPLACES_${PN}  = "linux-firmware-wl12xx"

BTW, the other thing to consider here, is also adding RPROVIDES_${PN} = 
"linux-firmware-wl12xx" as that should prevent mixing both in the same image 
by failing early on...

-- 
Denys


> +SRCREV = "38e0dd7999b9087e00d1a59306a7c22fd23246cf"
> +SRC_URI = "git://github.com/TI-ECS/ti-utils.git;protocol=git"
> +
> +S = "${WORKDIR}/git/hw/firmware"
> +
> +do_compile() {
> +	:
> +}
> +
> +do_install() {
> +	oe_runmake 'DEST_DIR=${D}' install
> +}
> +
> +FILES_${PN} = "/lib/firmware/ti-connectivity/*"
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

