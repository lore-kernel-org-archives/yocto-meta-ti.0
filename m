Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C219BE01607
	for <meta-ti@yoctoproject.org>; Thu, 26 Sep 2013 06:29:31 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8QDTU0q004768
	for <meta-ti@yoctoproject.org>; Thu, 26 Sep 2013 08:29:30 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8QDTU6n005394;
	Thu, 26 Sep 2013 08:29:30 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 26 Sep 2013 08:29:29 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8QDTTlt019616;
	Thu, 26 Sep 2013 08:29:29 -0500
Date: Thu, 26 Sep 2013 09:29:29 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Deepak M <x0171695@ti.com>
Message-ID: <20130926132928.GB14528@edge>
References: <1380112791-22545-1-git-send-email-x0171695@ti.com>
	<1380112791-22545-3-git-send-email-x0171695@ti.com>
MIME-Version: 1.0
In-Reply-To: <1380112791-22545-3-git-send-email-x0171695@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: maulik@ti.com, meta-ti@yoctoproject.org, epos_dev@list.ti.com,
	nageswari@ti.com
Subject: Re: [meta-ti patch v3 2/3] am43xx: Added the u-boot recipe
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
X-List-Received-Date: Thu, 26 Sep 2013 13:29:31 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Sep 25, 2013 at 06:09:49PM +0530, Deepak M wrote:
> Added the LIC_FILES_CHKSUM in the recipe as the default
> checksum was pointing to the COPYING file which is moved to the
> Licenses/gpl-2.0.txt in the current source.
> 
> Signed-off-by: Deepak M <x0171695@ti.com>
> ---
> v3:
> 1. Changed the u-boot recipe name from u-boot-aegis to u-boot-am43xx.
> 2. Using externel source link.
> 
>  recipes-bsp/u-boot/u-boot-am43xx_2013.10.bb | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 recipes-bsp/u-boot/u-boot-am43xx_2013.10.bb
> 
> diff --git a/recipes-bsp/u-boot/u-boot-am43xx_2013.10.bb b/recipes-bsp/u-boot/u-boot-am43xx_2013.10.bb
> new file mode 100644
> index 0000000..58eb99a
> --- /dev/null
> +++ b/recipes-bsp/u-boot/u-boot-am43xx_2013.10.bb
> @@ -0,0 +1,20 @@
> +require u-boot-ti.inc
> +
> +DESCRIPTION = "u-boot bootloader for ARM MPU devices"
> +LIC_FILES_CHKSUM = "file://Licenses/gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +COMPATIBLE_MACHINE = "am437x-epos-evm"
> +
> +DEFAULT_PREFERENCE = "-1"
> +
> +PV = "2013.10"

The version 2013.10 of u-boot hasn't been released yet, so you can't use that 
for PV.


> +PR = "r0+gitr${SRCPV}"
> +
> +BRANCH = "v2013.10-rc2+"
> +
> +SRC_URI = "git://git.ti.com/~lokesh/ti-u-boot/u-boot-dev.git;protocol=git;branch=${BRANCH}"
> +
> +# Lock to the commit corresponding
> +SRCREV = "6514cf76a52ecce9b03ede098683a7eea97e2bce"
> +
> +# Set the name of the SPL that will built so that it is also packaged with u-boot.
> +SPL_BINARY = "MLO"
> -- 
> 1.8.1
> 

