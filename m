Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2084.1634757385275215472
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 20 Oct 2021 12:16:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6CE7D40C2B;
	Wed, 20 Oct 2021 19:16:24 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8jIdnTAwy6SM; Wed, 20 Oct 2021 19:16:24 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3E96840027;
	Wed, 20 Oct 2021 19:16:19 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 094C717469F; Wed, 20 Oct 2021 15:16:19 -0400 (EDT)
Date: Wed, 20 Oct 2021 15:16:19 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: vigneshr@ti.com
Cc: yogeshs@ti.com, praneeth@ti.com, meta-ti@lists.yoctoproject.org,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [meta-ti] [dunfell-next PATCH v2] prusw-fw-am65x-sr2: Add recipe for ICSSG Switch mode firmware for AM65x SR2.0
Message-ID: <20211020191619.GY10132@denix.org>
References: <20211020090522.17590-1-vigneshr@ti.com>
MIME-Version: 1.0
In-Reply-To: <20211020090522.17590-1-vigneshr@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 20, 2021 at 02:35:22PM +0530, Vignesh Raghavendra via lists.yoctoproject.org wrote:
> From: Vignesh Raghavedra <vigneshr@ti.com>
> 
> Add AM65x SR2.0 ICSSG Switch firmware. Base version is 02.02.09.06
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---
> v2:
> 
> Drop DUAL EMAC firmware recipe update as its now auto rev'd

AUTOREV only happens for nightly builds, but you still need to update recipe 
versions for official releases...


>  .../prusw-fw/prusw-fw-am65x-sr2_git.bb        | 34 +++++++++++++++++++
>  recipes-kernel/linux/kernel-rdepends.inc      |  2 +-
>  2 files changed, 35 insertions(+), 1 deletion(-)
>  create mode 100644 recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
> 
> diff --git a/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb b/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
> new file mode 100644
> index 000000000000..8cb450acc2b6
> --- /dev/null
> +++ b/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
> @@ -0,0 +1,34 @@
> +SUMMARY = "PRU Ethernet Switch firmware for AM65xx SR2.0"
> +
> +require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> +
> +PV = "${PRUETH_FW_AM65X_SR2_VERSION}"
> +PR = "${INC_PR}.0"
> +
> +CLEANBROKEN = "1"
> +
> +COMPATIBLE_MACHINE = "am65xx-evm"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +S = "${WORKDIR}/git"
> +
> +TARGET = " \
> +    am65x-sr2-pru0-prusw-fw.elf \
> +    am65x-sr2-pru1-prusw-fw.elf \
> +    am65x-sr2-rtu0-prusw-fw.elf \
> +    am65x-sr2-rtu1-prusw-fw.elf \
> +    am65x-sr2-txpru0-prusw-fw.elf \
> +    am65x-sr2-txpru1-prusw-fw.elf \
> +"
> +
> +do_install() {
> +	install -d ${D}${base_libdir}/firmware/ti-pruss
> +	for f in ${TARGET}; do
> +		install -m 0644 ${S}/ti-pruss/$f ${D}${base_libdir}/firmware/ti-pruss/$f
> +	done
> +}
> +
> +FILES_${PN} = "${base_libdir}/firmware"
> +
> +INSANE_SKIP_${PN} = "arch"
> diff --git a/recipes-kernel/linux/kernel-rdepends.inc b/recipes-kernel/linux/kernel-rdepends.inc
> index 743b352c0b55..5e5241c9129d 100644
> --- a/recipes-kernel/linux/kernel-rdepends.inc
> +++ b/recipes-kernel/linux/kernel-rdepends.inc
> @@ -34,7 +34,7 @@ RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am57xx-hs-evm = " prueth-fw prusw-fw
>  RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti43x = " prueth-fw pruhsr-fw pruprp-fw"
>  RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti33x = " prueth-fw pruhsr-fw pruprp-fw"
>  RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am65xx = " prueth-fw-am65x"
> -RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am65xx-evm = " prueth-fw-am65x-sr2"
> +RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am65xx-evm = " prueth-fw-am65x-sr2 prusw-fw-am65x-sr2"
>  RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am64xx-evm = " prueth-fw-am65x-sr2"
>  
>  # Add run-time dependency for Cadence MHDP firmware to the rootfs
> -- 
> 2.33.1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
