Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.11222.1634656594699820855
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 19 Oct 2021 08:16:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=cDym1Ie0;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: vigneshr@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19JFGWMT006899;
	Tue, 19 Oct 2021 10:16:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1634656592;
	bh=v7KOZ01QpH9g4v09scKSvZ1aR+hOKZAjsUe6dsaywFY=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=cDym1Ie0zbkdRhHT+p/G4I/unzo9kYrVGUxlwkUC4pSeMshaCJSyUp2NfDNrCliW3
	 OGVaWAu/Qm99QaipCUI00xlholv9QSfKqu+dBQ3IL1XNlRm8f+8HQuQhkQJ1YbS7DJ
	 L7YmWsSJARP+gdQXbo26Ij+UjcVUXwYsDnRJj1aw=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19JFGWZK031766
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 19 Oct 2021 10:16:32 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 19
 Oct 2021 10:16:32 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 19 Oct 2021 10:16:31 -0500
Received: from [10.250.234.228] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19JFGTXa040528;
	Tue, 19 Oct 2021 10:16:30 -0500
Subject: Re: [EXTERNAL] [meta-ti][master/dunfell][PATCH v2] ti-linux-fw: Support common inc for all firmware
To: <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20211019131951.18210-1-yogeshs@ti.com>
From: "Vignesh Raghavendra" <vigneshr@ti.com>
Message-ID: <727cc120-9113-42d6-f1dd-d4d9f31d9b6f@ti.com>
Date: Tue, 19 Oct 2021 20:46:29 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211019131951.18210-1-yogeshs@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 10/19/21 6:49 PM, Yogesh Siraswar via lists.yoctoproject.org wrote:
> Change to support common INC for all firmware
> This will help with:
> 1) Eliminating requirement to change multiple recipes for firmware
> update
> 2) This will help support AUTOREV
> 
> Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
> ---

[...]
> diff --git a/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb b/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
> index d447df33..246b872e 100644
> --- a/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
> +++ b/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
> @@ -1,9 +1,9 @@
>  SUMMARY = "PRU Ethernet firmware for AM65x SR1.0"
>  
> -LICENSE = "TI-TFL"
> -LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
> +require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>  
> -PV = "08.00.00.20"
> +PV = "${PRUETH_FW_AM65x_SR2_VERSION}"

Should be

	PV = "${PRUETH_FW_AM65x_VERSION}"

> +PR = "${INC_PR}.0"
>  
>  CLEANBROKEN = "1"
>  
[...]
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> similarity index 75%
> rename from recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> rename to recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> index 9ce9f6c8..a910af2c 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
> +++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> @@ -4,9 +4,18 @@ LICENSE = "TI-TFL"
>  LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
>  
>  PV = "2021.05"
> -INC_PR = "r0"
> -# RTOS firmware version
> +INC_PR = "r1"
> +
> +# Firmware versions
>  CORESDK_RTOS_VERSION = "08.00.00.32"
> +SERDES_FW_VERSION = "3.3.0.2c"
> +NETCP_SA_FW_VERSION = "1.0.0"
> +NETCP_PA_FW_VERSION = "3.0.2.3"
> +QMSS_PDSP_FW_VERSION = "1.0.0.9"
> +PRUETH_FW_AM65X_VERSION = "08.00.00.20"

^^^

> +PRUETH_FW_AM65x_SR2_VERSION = "02.02.09.03"
> +GOODIX_FW_VERSION = "1.0.0.0"
> +CADENCE_MHDP_FW_VERSION = "1.2.17"
>  
>  SRCREV = "793309716bce2e443f798dd5c5f0d8dd310970c0"
>  BRANCH ?= "ti-linux-firmware"

[...]
Regards
Vignesh
