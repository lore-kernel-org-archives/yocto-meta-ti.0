Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.1330.1616782636035387172
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 26 Mar 2021 11:17:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=kHIXHOvt;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12QIHBCQ089509;
	Fri, 26 Mar 2021 13:17:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1616782631;
	bh=sV9PqSmJbNG2N58B49ZE+FACLg+LakzoBchXtYIlnmA=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=kHIXHOvtmA+hw/6NHtVK2z8t2N2/B98Z8s0NiR3bItBdppIrHULhfTWihhZIZIcTo
	 xaqgbNUQmRzquaYleurlSOJiLMMFPq1aksadJPaS6J/n/HohdeV29+Y9lbmw4Z5cwe
	 B3vQDuhoWPSVCP+QJKCO/F55oCSFrDqJ0cSf/KoI=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12QIHB55069713
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 26 Mar 2021 13:17:11 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 26
 Mar 2021 13:17:11 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 26 Mar 2021 13:17:11 -0500
Received: from [10.250.50.222] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12QIHBQd108898;
	Fri, 26 Mar 2021 13:17:11 -0500
Subject: Re: [dunfell/master][PATCH] ti-rtos-firmware: sign DM firmware for J721e HS platform
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <1616782492-14151-1-git-send-email-denis@denix.org>
From: "praneeth" <praneeth@ti.com>
Message-ID: <979bd500-6f89-d115-0c2d-9729912271fa@ti.com>
Date: Fri, 26 Mar 2021 13:17:11 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <1616782492-14151-1-git-send-email-denis@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/26/2021 1:14 PM, Denys Dmytriyenko wrote:
> From: Praneeth Bajjuri <praneeth@ti.com>
> 
> U-boot build process requires DM firmware to be signed for J7 HS.
> It's better for ti-rtos-firmware package (that delivers DM firmware) to sign
> it once and provide signed version to other packages, instead of U-boot needing
> to re-sign it during build in staging location.
> 
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>

Thanks denys, This looks much better than the earlier version i posted.
Will pull later today.


> ---
>   recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> index e85948b..38e9adc 100644
> --- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> @@ -74,6 +74,18 @@ SRC_URI[sha256sum] = "${CORESDK_RTOS_FIRMWARE_SHA256SUM}"
>   
>   FILES_${PN} += "${base_libdir}"
>   
> +TI_SECURE_DEV_PKG ?= ""
> +
> +DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
> +
> +do_install_prepend_j7-hs-evm() {
> +	export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
> +	( cd ${S}/firmware/pdk-ipc/; \
> +		mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
> +		${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
> +	)
> +}
> +
>   do_install() {
>   	CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
>   	install -d ${D}${base_libdir}
> 
