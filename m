Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 37BA6E00305
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 19 Dec 2011 11:59:19 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [108.48.17.70])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LWG002VUVIHGOS2@vms173005.mailsrvcs.net> for
	meta-ti@lists.yoctoproject.org; Mon, 19 Dec 2011 13:59:06 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id BCD46202C1; Mon,
	19 Dec 2011 14:41:14 -0500 (EST)
Date: Mon, 19 Dec 2011 14:41:14 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-id: <20111219194114.GC6128@denix.org>
References: <1324311340-16981-1-git-send-email-koen@dominion.thruhere.net>
	<1324311340-16981-3-git-send-email-koen@dominion.thruhere.net>
MIME-version: 1.0
In-reply-to: <1324311340-16981-3-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [PATCH 3/5] ti-dspbios: update to 5.41.11.38
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
X-List-Received-Date: Mon, 19 Dec 2011 19:59:19 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Dec 19, 2011 at 05:15:38PM +0100, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

Acked-by: Denys Dmytriyenko <denys@ti.com>


> ---
>  recipes-ti/bios/ti-dspbios.inc           |    5 ++---
>  recipes-ti/bios/ti-dspbios_5.41.07.24.bb |    8 --------
>  recipes-ti/bios/ti-dspbios_5.41.11.38.bb |    7 +++++++
>  3 files changed, 9 insertions(+), 11 deletions(-)
>  delete mode 100644 recipes-ti/bios/ti-dspbios_5.41.07.24.bb
>  create mode 100644 recipes-ti/bios/ti-dspbios_5.41.11.38.bb
> 
> diff --git a/recipes-ti/bios/ti-dspbios.inc b/recipes-ti/bios/ti-dspbios.inc
> index 4bad834..8519039 100644
> --- a/recipes-ti/bios/ti-dspbios.inc
> +++ b/recipes-ti/bios/ti-dspbios.inc
> @@ -3,14 +3,13 @@ HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/b
>  SECTION = "devel"
>  LICENSE = "TI"
>  
> -LIC_FILES_CHKSUM = "file://docs/license/TSPA_License_Agreement_DSP_BIOS_bios_5_41_07_24.html;md5=86096a08e4088ef291c98313d82b8742"
> +# We can't depend on license files to be present, so just use the TI logo
> +LIC_FILES_CHKSUM = "file://docs/tilogo.gif;md5=f049a774c576a5cef3fca4932d707b39"
>  
>  require ../includes/ti-paths.inc
>  require ../includes/ti-staging.inc
>  require ../includes/ti-eula-unpack.inc
>  
> -PR = "r1"
> -
>  S = "${WORKDIR}/bios_${PV}"
>  
>  SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/bios/dspbios/${PV}/exports/bios_setuplinux_${PV}.bin;name=biosbin"
> diff --git a/recipes-ti/bios/ti-dspbios_5.41.07.24.bb b/recipes-ti/bios/ti-dspbios_5.41.07.24.bb
> deleted file mode 100644
> index 536939e..0000000
> --- a/recipes-ti/bios/ti-dspbios_5.41.07.24.bb
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -require ti-dspbios.inc
> -
> -PV = "5_41_07_24"
> -
> -SRC_URI[biosbin.md5sum] = "18301d0e1d351bcece9ce97255b8ff1b"
> -SRC_URI[biosbin.sha256sum] = "1531dca674154fbe179ad5017555e963bcf3d74a47a0fbf10e8a7009639d6c34"
> -
> -
> diff --git a/recipes-ti/bios/ti-dspbios_5.41.11.38.bb b/recipes-ti/bios/ti-dspbios_5.41.11.38.bb
> new file mode 100644
> index 0000000..9e3b695
> --- /dev/null
> +++ b/recipes-ti/bios/ti-dspbios_5.41.11.38.bb
> @@ -0,0 +1,7 @@
> +require ti-dspbios.inc
> +
> +PV = "5_41_11_38"
> +
> +SRC_URI[biosbin.md5sum] = "7fab13740c25f5b34b331bcdc759536e"
> +SRC_URI[biosbin.sha256sum] = "96b8e090f79420a4c11d9c0c10d182d1d3b4afb48f11ec375c97b4c91970d0a0"
> +
> -- 
> 1.7.2.5
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

