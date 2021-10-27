Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.6281.1635300279056720946
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 26 Oct 2021 19:04:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=nhbklpPe;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: s-anna@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19R24cVb052501
	for <meta-ti@lists.yoctoproject.org>; Tue, 26 Oct 2021 21:04:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1635300278;
	bh=CMZou6fHyfN/jejfZs24tGrh2A2AA18Ro56O7g6yXCM=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=nhbklpPeoXA57+UCV2iIlJ7yrsSRt7UWsutAJeLvsCj8OWiznfpvkzWxLIJb+dAlm
	 GChKzvYAOQz7JmX2luYSQIaIrEaonyAOqX7KIP4qmDz39EZNcaMkeFLu8liXAIqmq9
	 FUcv7tLXY/MSUFcutc3SEKTnuVCqxJmQkrjoAvxc=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19R24bJT123860
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 26 Oct 2021 21:04:38 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 26
 Oct 2021 21:04:36 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 26 Oct 2021 21:04:37 -0500
Received: from [10.250.35.6] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19R24a3J102249;
	Tue, 26 Oct 2021 21:04:36 -0500
Subject: Re: [meta-ti][master/dunfell PATCH v1] ti-rtos-firmware: Update M4F binary for AM64x SoCs
To: <hnagalla@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <yogeshs@ti.com>, <praneeth@ti.com>
References: <20211027010032.12351-1-hnagalla@ti.com>
From: "Suman Anna" <s-anna@ti.com>
Message-ID: <d4b9b9e3-eef2-af1e-081f-a6a473438354@ti.com>
Date: Tue, 26 Oct 2021 21:04:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211027010032.12351-1-hnagalla@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Hari,

On 10/26/21 8:00 PM, Hari Nagalla via lists.yoctoproject.org wrote:
> AM46x SoCs have a Cortex-M4F core in MCU domain. This core is used a

%s/AM46x/AM64x/

Also, no need to add v1 for the first versions, you only need it on subsequent
revisions.


> standalone device for safety applications. For non safety applications,
> the device is exposed as a remote processor with Linux rpmsg framework.
> 
> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
> ---
>  recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> index 43de1ec2..adc218f1 100644
> --- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> @@ -62,6 +62,7 @@ do_install_prepend_am64xx() {
>                  mv am64-main-r5f0_1-fw ipc_echo_baremetal_test_mcu1_1_release_strip.xer5f; \
>                  mv am64-main-r5f1_0-fw ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f; \
>                  mv am64-main-r5f1_1-fw ipc_echo_baremetal_test_mcu2_1_release_strip.xer5f; \
> +                mv am64-mcu-m4f0_0-fw ipc_echo_baremetal_test_mcu3_0_release_strip.xer5f; \
>          )
>  }
>  
> @@ -124,6 +125,7 @@ ALTERNATIVE_${PN}_am64xx = "\
>                      am64-main-r5f0_1-fw \
>                      am64-main-r5f1_0-fw \
>                      am64-main-r5f1_1-fw \
> +                    am64-mcu-m4f0_0-fw \
>                      "
>  
>  ALTERNATIVE_${PN}_j7 = "\
> @@ -154,6 +156,7 @@ TARGET_MAIN_R5FSS0_0_am64xx = "am64-main-r5f0_0-fw"
>  TARGET_MAIN_R5FSS0_1_am64xx = "am64-main-r5f0_1-fw"
>  TARGET_MAIN_R5FSS1_0_am64xx = "am64-main-r5f1_0-fw"
>  TARGET_MAIN_R5FSS1_1_am64xx = "am64-main-r5f1_1-fw"
> +TARGET_MCU_R4FSS0_0_am64xx = "am64-mcu-m4f0_0-fw"

%s/R4FSS0/M4FSS0/

>  
>  TARGET_MCU_R5FSS0_0_j7 = "j7-mcu-r5f0_0-fw"
>  TARGET_MCU_R5FSS0_1_j7 = "j7-mcu-r5f0_1-fw"
> @@ -177,6 +180,7 @@ ALTERNATIVE_LINK_NAME[am64-main-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_M
>  ALTERNATIVE_LINK_NAME[am64-main-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_1}"
>  ALTERNATIVE_LINK_NAME[am64-main-r5f1_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_0}"
>  ALTERNATIVE_LINK_NAME[am64-main-r5f1_1-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_1}"
> +ALTERNATIVE_LINK_NAME[am64-mcu-m4f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_M4FSS0_0}"

ou have the variable name correct here. Makes me wonder if this patch is even
tested.

regards
Suman

>  
>  ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
>  ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
> @@ -202,6 +206,7 @@ ALTERNATIVE_TARGET[am64-main-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_e
>  ALTERNATIVE_TARGET[am64-main-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_baremetal_test_mcu1_1_release_strip.xer5f"
>  ALTERNATIVE_TARGET[am64-main-r5f1_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f"
>  ALTERNATIVE_TARGET[am64-main-r5f1_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_baremetal_test_mcu2_1_release_strip.xer5f"
> +ALTERNATIVE_TARGET[am64-mcu-m4f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_baremetal_test_mcu3_0_release_strip.xer5f"
>  
>  ALTERNATIVE_TARGET[j7-mcu-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_testb_mcu1_0_release_strip.xer5f"
>  ALTERNATIVE_TARGET[j7-mcu-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release_strip.xer5f"
> 
> 
> 
> 
> 

