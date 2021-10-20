Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.6095.1634724873827944867
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 20 Oct 2021 03:14:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=KE8gwvMv;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: yogeshs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19KAEPaa064127;
	Wed, 20 Oct 2021 05:14:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1634724865;
	bh=JINCDiK234s44NWc3y1tCG6pNPSjmWa9U5hqcnn68yY=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=KE8gwvMv/S6RbZAorrr+i9rljq5m94cekmjPvESZPbTHHL1Esy1Fr+DeLgZO72jOn
	 uTL/Vw4saTNemE0cYS/MDvKVVKJA02OxlG3PDnJS+1HBAvyeGbjo9lP+N98azvFM4i
	 IKuWNIPogHnGhqH2YsmzC0QybeGcErZA0rucVdy4=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19KAEP3h088671
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 20 Oct 2021 05:14:25 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 20
 Oct 2021 05:14:25 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 20 Oct 2021 05:14:25 -0500
Received: from [10.250.35.146] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19KAEP3G028818;
	Wed, 20 Oct 2021 05:14:25 -0500
Subject: Re: [dunfell-next PATCH v2] prusw-fw-am65x-sr2: Add recipe for ICSSG Switch mode firmware for AM65x SR2.0
To: Vignesh Raghavendra <vigneshr@ti.com>
CC: <denis@denix.org>, <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Kishon Vijay Abraham I
	<kishon@ti.com>
References: <20211020090522.17590-1-vigneshr@ti.com>
From: "Yogesh Siraswar" <yogeshs@ti.com>
Message-ID: <55e21713-6ade-280d-ab11-b79f580b2f9b@ti.com>
Date: Wed, 20 Oct 2021 05:14:25 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211020090522.17590-1-vigneshr@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 10/20/2021 4:05 AM, Vignesh Raghavendra wrote:
> From: Vignesh Raghavedra <vigneshr@ti.com>
> 
> Add AM65x SR2.0 ICSSG Switch firmware. Base version is 02.02.09.06
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---
> v2:
> 
> Drop DUAL EMAC firmware recipe update as its now auto rev'd
> 
>   .../prusw-fw/prusw-fw-am65x-sr2_git.bb        | 34 +++++++++++++++++++
>   recipes-kernel/linux/kernel-rdepends.inc      |  2 +-
>   2 files changed, 35 insertions(+), 1 deletion(-)
>   create mode 100644 recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
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

Will the PRUSW FW version always be same as PRUETH FW?

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
>   RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti43x = " prueth-fw pruhsr-fw pruprp-fw"
>   RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti33x = " prueth-fw pruhsr-fw pruprp-fw"
>   RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am65xx = " prueth-fw-am65x"
> -RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am65xx-evm = " prueth-fw-am65x-sr2"
> +RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am65xx-evm = " prueth-fw-am65x-sr2 prusw-fw-am65x-sr2"
>   RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am64xx-evm = " prueth-fw-am65x-sr2"
>   
>   # Add run-time dependency for Cadence MHDP firmware to the rootfs
> 
