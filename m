Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.811.1607756558999534596
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 11 Dec 2020 23:02:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=iAjfOs0p;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: s-anna@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BC72bNH019622
	for <meta-ti@lists.yoctoproject.org>; Sat, 12 Dec 2020 01:02:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607756557;
	bh=S57qT2BqVM+PM3WgTOKD96TmXrgWKJNUhvjE83gUGuE=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=iAjfOs0pmEhUuyt3P5qtjRCpjFR/oRp/0fFYxiHH3aSJcvF3Qz+IGLsBJcXih+iVC
	 9jUd1YZAUIF3u7xk9FgTIlWVG/bAUd4XR0kGL13bHuG2/UIV08QCUOCVn4Xxsw8b57
	 Q7jKBHRMvVfK/rdZcpc9XqVYkwyEUWGxEOdggvyA=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BC72bcV110791
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Sat, 12 Dec 2020 01:02:37 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sat, 12
 Dec 2020 01:02:37 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sat, 12 Dec 2020 01:02:37 -0600
Received: from [10.250.64.202] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BC72atI028750;
	Sat, 12 Dec 2020 01:02:36 -0600
Subject: Re: [meta-ti] [PATCH 1/4] machine: am64xx-evm.conf: Add machine definition for AM64xx platform
To: <dmurphy@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20201211133201.10923-1-dmurphy@ti.com>
From: "Suman Anna" <s-anna@ti.com>
Message-ID: <6c09c266-0113-1bb4-2cc4-180ea61b1091@ti.com>
Date: Sat, 12 Dec 2020 01:02:36 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201211133201.10923-1-dmurphy@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Dan,

On 12/11/20 7:31 AM, Dan Murphy via lists.yoctoproject.org wrote:
> The AM64 is a follow on device of the AM65xx K3 multicore SoC architecture.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  conf/machine/am64xx-evm-k3r5.conf | 13 +++++++++++++
>  conf/machine/am64xx-evm.conf      |  7 +++++++
>  conf/machine/include/am64xx.inc   | 21 +++++++++++++++++++++
>  3 files changed, 41 insertions(+)
>  create mode 100644 conf/machine/am64xx-evm-k3r5.conf
>  create mode 100644 conf/machine/am64xx-evm.conf
>  create mode 100644 conf/machine/include/am64xx.inc
> 
> diff --git a/conf/machine/am64xx-evm-k3r5.conf b/conf/machine/am64xx-evm-k3r5.conf
> new file mode 100644
> index 000000000000..26230da499af
> --- /dev/null
> +++ b/conf/machine/am64xx-evm-k3r5.conf
> @@ -0,0 +1,13 @@
> +#@TYPE: Machine
> +#@NAME: AM64xx EVM (R5F)
> +#@DESCRIPTION: Machine configuration for the TI AM64xx EVM (R5F core)
> +
> +require conf/machine/include/k3r5.inc
> +
> +# UPdate for am64
> +SYSFW_SOC = "am65x"

Guess you are going to wait until ti-sci-fw recipe is updated. Alternatively,
name this correctly, and do not include the ti-sci-fw recipe for now for AM64xx.
This should be ready the next business day.

> +SYSFW_CONFIG = "evm"
> +SYSFW_SUFFIX = "gp"
> +SYSFW_SYMLINK = "sysfw.itb"
> +
> +UBOOT_MACHINE = "am64x_evm_r5_defconfig"
> diff --git a/conf/machine/am64xx-evm.conf b/conf/machine/am64xx-evm.conf
> new file mode 100644
> index 000000000000..c6ba2a8735f3
> --- /dev/null
> +++ b/conf/machine/am64xx-evm.conf
> @@ -0,0 +1,7 @@
> +#@TYPE: Machine
> +#@NAME: AM64xx EVM
> +#@DESCRIPTION: Machine configuration for the TI AM64xx EVM
> +
> +require conf/machine/include/am64xx.inc
> +
> +UBOOT_MACHINE = "am64x_evm_a53_defconfig"
> diff --git a/conf/machine/include/am64xx.inc b/conf/machine/include/am64xx.inc
> new file mode 100644
> index 000000000000..a96bda1c71e7
> --- /dev/null
> +++ b/conf/machine/include/am64xx.inc
> @@ -0,0 +1,21 @@
> +require conf/machine/include/k3.inc
> +SOC_FAMILY_append = ":am64xx"
> +
> +MACHINE_FEATURES += "screen touchscreen gpu"

Hmm, is this list accurate actually? AFAIK, there's no GPU or does this signify
something else?

> +
> +SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS1"
> +SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
> +
> +KERNEL_DEVICETREE = " \
> +    ti/k3-am642-evm.dtb \
> +"
> +
> +#IMAGE_BOOT_FILES += "sysfw-am64x-evm.itb"

Get rid of this line..

> +
> +OPTEEMACHINE = "k3-am65x"
> +OPTEEOUTPUTMACHINE = "k3"
> +
> +# Set the list of device targets for ti-pdk class recipes
> +TI_PDK_LIMIT_SOCS = "am64xx"
> +TI_PDK_LIMIT_BOARDS = "am64xx_evm"

The PDK SoC and board defined are am64x and am64x_evm as per the PDK sources.

> +TI_PDK_LIMIT_CORES = "mcu1_0 mpu1_0"

You need to add additional cores, mcu1_1 mcu2_0 and mcu2_1

regards
Suman

> 
> 
> 
> 
> 

