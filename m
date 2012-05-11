Return-Path: <denis@denix.org>
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CCB13E0044A
	for <meta-ti@yoctoproject.org>; Thu, 10 May 2012 21:47:26 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.48.117.33])
	by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M3U00CN6DB1AIM0@vms173009.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 10 May 2012 23:47:26 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id CE29E20173; Fri,
	11 May 2012 00:47:25 -0400 (EDT)
Date: Fri, 11 May 2012 00:47:25 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Cliff Brake <cliff.brake@gmail.com>
Message-id: <20120511044725.GC26492@denix.org>
References: <1336686499-29891-1-git-send-email-cliff.brake@gmail.com>
MIME-version: 1.0
In-reply-to: <1336686499-29891-1-git-send-email-cliff.brake@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org, Cliff Brake <cbrake@bec-systems.com>
Subject: Re: [PATCH] u-boot 2011.12: add directory prefix to patch URIs
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
X-List-Received-Date: Fri, 11 May 2012 04:47:26 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Cliff,

Thanks for the patch. But it is already the case of proper paths being used in 
the recipe:

http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/diff/recipes-bsp/u-boot/u-boot_2011.12.bb?id=07913cca6cfd7f35a9bb5d6b2cca41c6b5f07ec3

diff --git a/recipes-bsp/u-boot/u-boot_2011.12.bb b/recipes-bsp/u-boot/u-boot_2011.12.bb
index 9616a05..45c64a6 100644
--- a/recipes-bsp/u-boot/u-boot_2011.12.bb
+++ b/recipes-bsp/u-boot/u-boot_2011.12.bb
@@ -6,7 +6,7 @@ UBOOT_IMAGE = "u-boot-${MACHINE}-${PV}-${PR}.img"
 UBOOT_SYMLINK = "u-boot-${MACHINE}.img"
 
 PV = "2011.12"
-PR = "r7"
+PR = "r8"
 
 # No patches for other machines yet
 COMPATIBLE_MACHINE = "(beagleboard|pandaboard|hawkboard|am3517-evm|am37x-evm|omap3evm)"
@@ -30,6 +30,9 @@ SRC_URI = "git://www.denx.de/git/u-boot.git;protocol=git \
            ${CACHEFIX} \
            file://2011.12/0009-Beagleboard-Correct-memory-size-on-rev-C4.patch \
            file://2011.12/0010-OMAP3-Correct-get_sdr_cs_offset-mask.patch \
+           file://2011.12/0011-ext2load-increase-read-speed.patch \
+           file://2011.12/0012-ext4fs-ls-load-support.patch \
+           file://2011.12/0013-beagleboard-switch-mmcroots-to-ext4.patch \
            ${FWENV} \
           "

Did you happen to pick an intermediate version from Koen's WIP tree on github? 
That's not how it was submitted and eventually went into the official tree. 
Sorry for confusion.

-- 
Denys


On Thu, May 10, 2012 at 05:48:19PM -0400, Cliff Brake wrote:
> From: Cliff Brake <cbrake@bec-systems.com>
> 
> 
> Signed-off-by: Cliff Brake <cbrake@bec-systems.com>
> ---
>  recipes-bsp/u-boot/u-boot_2011.12.bb |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-bsp/u-boot/u-boot_2011.12.bb b/recipes-bsp/u-boot/u-boot_2011.12.bb
> index 39f77bd..45c64a6 100644
> --- a/recipes-bsp/u-boot/u-boot_2011.12.bb
> +++ b/recipes-bsp/u-boot/u-boot_2011.12.bb
> @@ -30,9 +30,9 @@ SRC_URI = "git://www.denx.de/git/u-boot.git;protocol=git \
>             ${CACHEFIX} \
>             file://2011.12/0009-Beagleboard-Correct-memory-size-on-rev-C4.patch \
>             file://2011.12/0010-OMAP3-Correct-get_sdr_cs_offset-mask.patch \
> -           file://0011-ext2load-increase-read-speed.patch \
> -           file://0012-ext4fs-ls-load-support.patch \
> -           file://0013-beagleboard-switch-mmcroots-to-ext4.patch \
> +           file://2011.12/0011-ext2load-increase-read-speed.patch \
> +           file://2011.12/0012-ext4fs-ls-load-support.patch \
> +           file://2011.12/0013-beagleboard-switch-mmcroots-to-ext4.patch \
>             ${FWENV} \
>            "
>  
> -- 
> 1.7.1
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

