Return-Path: <denis@denix.org>
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1CBA1E013A8
	for <meta-ti@yoctoproject.org>; Tue, 17 Apr 2012 13:51:26 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M2N00B655WV52S0@vms173009.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 17 Apr 2012 15:50:56 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 5A147201A7; Tue,
	17 Apr 2012 16:50:54 -0400 (EDT)
Date: Tue, 17 Apr 2012 16:50:54 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-id: <20120417205054.GC8228@denix.org>
References: <1334666866-24955-1-git-send-email-koen@dominion.thruhere.net>
	<1334666866-24955-3-git-send-email-koen@dominion.thruhere.net>
MIME-version: 1.0
In-reply-to: <1334666866-24955-3-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org, denys@ti.com
Subject: Re: [PATCH v2 3/7] beaglebone-capes: userspace support for capes
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Apr 2012 20:51:26 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Apr 17, 2012 at 02:47:42PM +0200, Koen Kooi wrote:
> Not everything can be done inside the kernel yet, so have a script that does the userspace portion.
> Only the LCD3 cape is supported currently, more will follow later.
> 
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  recipes-ti/beagleboard/beaglebone-capes.bb         |   23 ++++++++++++++++++++
>  .../beagleboard/beaglebone-capes/cape.service      |    8 +++++++
>  recipes-ti/beagleboard/beaglebone-capes/cape.sh    |   12 ++++++++++
>  3 files changed, 43 insertions(+), 0 deletions(-)
>  create mode 100644 recipes-ti/beagleboard/beaglebone-capes.bb
>  create mode 100644 recipes-ti/beagleboard/beaglebone-capes/cape.service
>  create mode 100755 recipes-ti/beagleboard/beaglebone-capes/cape.sh
> 
> diff --git a/recipes-ti/beagleboard/beaglebone-capes.bb b/recipes-ti/beagleboard/beaglebone-capes.bb
> new file mode 100644
> index 0000000..88d4a17
> --- /dev/null
> +++ b/recipes-ti/beagleboard/beaglebone-capes.bb
> @@ -0,0 +1,23 @@
> +DESCRIPTION = "Userspace setup for beaglebone capes"
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
> +
> +inherit allarch

Should there be "inherit systemd" and SYSTEMD_SERVICE_${PN} = "cape.service"?

-- 
Denys


> +SRC_URI = "file://cape.service \
> +           file://cape.sh \
> +          "
> +
> +do_install() {
> +	install -d ${D}${base_libdir}/systemd/system/
> +	install -m 0644 ${WORKDIR}/cape.service ${D}${base_libdir}/systemd/system
> +
> +	install -d ${D}${base_libdir}/systemd/system/basic.target.wants
> +	ln -sf ../cape.service ${D}${base_libdir}/systemd/system/basic.target.wants/
> +
> +	install -d ${D}${bindir}
> +	install -m 0755 ${WORKDIR}/cape.sh ${D}${bindir}
> +}
> +
> +FILES_${PN} += "${base_libdir}/systemd/system"
> diff --git a/recipes-ti/beagleboard/beaglebone-capes/cape.service b/recipes-ti/beagleboard/beaglebone-capes/cape.service
> new file mode 100644
> index 0000000..44a2a38
> --- /dev/null
> +++ b/recipes-ti/beagleboard/beaglebone-capes/cape.service
> @@ -0,0 +1,8 @@
> +[Unit]
> +Description=Beaglebone cape support
> +
> +[Service]
> +ExecStart=/usr/bin/cape.sh
> +
> +[Install]
> +WantedBy=basic.target
> diff --git a/recipes-ti/beagleboard/beaglebone-capes/cape.sh b/recipes-ti/beagleboard/beaglebone-capes/cape.sh
> new file mode 100755
> index 0000000..69accff
> --- /dev/null
> +++ b/recipes-ti/beagleboard/beaglebone-capes/cape.sh
> @@ -0,0 +1,12 @@
> +#!/bin/sh
> +for eeprom in /sys/bus/i2c/devices/3-005*/eeprom ; do
> +	PARTNUMBER=$(hexdump -e '8/1 "%c"' $eeprom -s 58 -n16)
> +	case $PARTNUMBER in
> +		"BB-BONE-LCD3-01.")
> +				echo "Turning on backlight for LCD3 cape"
> +				i2cset -f -y 1 0x24 0x07 0x09
> +				i2cset -f -y 1 0x24 0x08 0x60;;
> +		*)
> +				echo "unknown cape: $PARTNUMBER";;
> +	esac
> +done
> -- 
> 1.7.2.5
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

