Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.1263.1625079180918799763
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 30 Jun 2021 11:53:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D8DE740C90;
	Wed, 30 Jun 2021 18:52:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ftzUYUHWbud9; Wed, 30 Jun 2021 18:52:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 906DA40C1E;
	Wed, 30 Jun 2021 18:52:54 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5635517461F; Wed, 30 Jun 2021 14:52:54 -0400 (EDT)
Date: Wed, 30 Jun 2021 14:52:54 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: nm@ti.com
Cc: praneeth@ti.com, yogeshs@ti.com, denys@konsulko.com,
	Tom Rini <trini@konsulko.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [dunfell/master PATCH V2] ti-sci-fw: k3-image-gen: Revert SPL address change for mainline
Message-ID: <20210630185254.GG1528@denix.org>
References: <20210630175436.11343-1-nm@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210630175436.11343-1-nm@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 30, 2021 at 12:54:36PM -0500, Nishanth Menon via lists.yoctoproject.org wrote:
> Commit 02a2433c ("ti-sci-fw: Update image gen to latest") switched to a
> newer commit in k3-image-gen that also picked up TISCI firmware release,
> However, does include a change where the SPL address changed.
> 
> This switch in address has been queued for upstream in a future release
> (v5.14 + u-boot 2021.10) and current mainline formal tags do not support
> this address change. As a result, we have a broken AM64x mainline
> support.
> 
> Revert this specific change from k3-image-gen for mainline alone for
> now.
> 
> NOTE: This uses ARAGO_BRAND=mainline which is NOT accurate for meta-ti
> which is distro independent, hence without appropriate changes while
> using alternate distros, this change will not take effect.
> 
> Reported-by: Tom Rini <trini@konsulko.com>
> Suggested-by: Denys Dmytriyenko <denys@konsulko.com>
> Signed-off-by: Nishanth Menon <nm@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
> Changes since V1:
> * Added empty ARAGO_BRAND in case someone is using non-arago based
>   builds.
> 
> V1: https://lists.yoctoproject.org/g/meta-ti/topic/dunfell_master_patch/83878039?p=,,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,0,83878039
> 
>  ...-Makefile-Move-the-SPL-Load-address-.patch | 36 +++++++++++++++++++
>  recipes-bsp/ti-sci-fw/ti-sci-fw.inc           | 11 ++++++
>  2 files changed, 47 insertions(+)
>  create mode 100644 recipes-bsp/ti-sci-fw/files/0001-Revert-soc-am64x-Makefile-Move-the-SPL-Load-address-.patch
> 
> diff --git a/recipes-bsp/ti-sci-fw/files/0001-Revert-soc-am64x-Makefile-Move-the-SPL-Load-address-.patch b/recipes-bsp/ti-sci-fw/files/0001-Revert-soc-am64x-Makefile-Move-the-SPL-Load-address-.patch
> new file mode 100644
> index 000000000000..63a5796d6b82
> --- /dev/null
> +++ b/recipes-bsp/ti-sci-fw/files/0001-Revert-soc-am64x-Makefile-Move-the-SPL-Load-address-.patch
> @@ -0,0 +1,36 @@
> +From 83d29d5e346083254e71fbe483cb14f6657b9965 Mon Sep 17 00:00:00 2001
> +From: Nishanth Menon <nm@ti.com>
> +Date: Tue, 29 Jun 2021 12:03:29 -0500
> +Subject: [PATCH] Revert "soc: am64x: Makefile: Move the SPL Load address to
> + 0x70000000"
> +
> +This reverts commit e411dc16862b5bb2d8befb12496b03d7b01c87b2.
> +
> +Mainline is NOT ready for the change yet as of u-boot 2021.07 + v5.13,
> +So, this patch reverts the SPL address change.
> +
> +This patch needs to be dropped once mainline u-boot and kernel have
> +migrated over to newer releases.
> +
> +Upstream-Status: Not applicable
> +Signed-off-by: Nishanth Menon <nm@ti.com>
> +---
> + soc/am64x/Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/soc/am64x/Makefile b/soc/am64x/Makefile
> +index 45425428f9c6..e8747376f153 100644
> +--- a/soc/am64x/Makefile
> ++++ b/soc/am64x/Makefile
> +@@ -30,7 +30,7 @@
> + #  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> + #
> + 
> +-SBL_LOADADDDR ?= 0x70000000
> ++SBL_LOADADDDR ?= 0x70020000
> + COMBINED_SYSFW_BRDCFG_LOADADDR ?= 0x70000
> + LOADADDR  ?= 0x44000
> + SCIFS = sci
> +-- 
> +2.32.0
> +
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> index 4004d93f47c9..9e22e461354d 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> @@ -15,4 +15,15 @@ SRC_URI = " \
>  	git://git.ti.com/k3-image-gen/k3-image-gen.git;protocol=git;branch=master;destsuffix=imggen;name=imggen \
>  "
>  
> +# This is a protection in case the definition is not present in other distros.
> +ARAGO_BRAND ?= ""
> +
> +# Mainline u_boot 2021.07 and upstream kernel v5.13 tag cannot use new SPL address
> +# in K3-Imagegen
> +SRC_URI += "\
> +	${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '\
> +	file://0001-Revert-soc-am64x-Makefile-Move-the-SPL-Load-address-.patch;patchdir=../imggen \
> +	', '', d)} \
> +"
> +
>  S = "${WORKDIR}/git"
> -- 
> 2.32.0
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
