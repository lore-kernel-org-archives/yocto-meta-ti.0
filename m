Return-Path: <karthik.ramanan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D0E69E00AE4; Tue, 25 Apr 2017 04:29:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E6767E00A9B
	for <meta-ti@yoctoproject.org>; Tue, 25 Apr 2017 04:29:26 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3PBTQIu006399
	for <meta-ti@yoctoproject.org>; Tue, 25 Apr 2017 06:29:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493119766;
	bh=uc5ETrupP7pE1hXAMNXXqo1a2EfDwRSQvsd102zMHsI=;
	h=Subject:To:References:CC:From:Date:In-Reply-To;
	b=k9RRnjDwUeL08v3EZzgWhafAGdKwmGj6Xn/RJ/wy+GylJ4niDGD9rQllNSkrebijR
	FiEg6larj4C9OKXvk3rUTdmvyl+Mx7rvkUWYggN53Enarn5DGzvXJ6/v9Qrf2UeF9S
	KIyjChoH1pfV3iquLRjf+ie+wTNrsKFHtJhewQaw=
Received: from dbdlxv05.itg.ti.com (dbdlxv05.itg.ti.com [172.24.171.60])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3PBTPw3008570
	for <meta-ti@yoctoproject.org>; Tue, 25 Apr 2017 06:29:25 -0500
Received: from DBDE72.ent.ti.com (dbdmailx.itg.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3PBTMdP013536
	for <meta-ti@yoctoproject.org>; Tue, 25 Apr 2017 16:59:23 +0530
Received: from [172.24.159.169] (172.24.159.169) by DBDE72.ent.ti.com
	(172.24.171.97) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 25 Apr 2017 16:59:22 +0530
To: Denys Dmytriyenko <denys@ti.com>
References: <1492784105-58653-1-git-send-email-a0393906@ti.com>
	<1492784105-58653-2-git-send-email-a0393906@ti.com>
	<20170424173732.GD24846@edge>
From: Karthik Ramanan <a0393906@ti.com>
Message-ID: <58FF3312.2010401@ti.com>
Date: Tue, 25 Apr 2017 16:59:22 +0530
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <20170424173732.GD24846@edge>
X-Originating-IP: [172.24.159.169]
Cc: meta-ti@yoctoproject.org
Subject: Re: [morty PATCH v2 2/3] Remove CCS dependencies for all components
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
X-List-Received-Date: Tue, 25 Apr 2017 11:29:28 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Oh ok, I understand your comment now.
Posted v3 with the change included.

On 24-Apr-17 11:07 PM, Denys Dmytriyenko wrote:
> Looks like you missed my comment here for v1. Do you want to remove
> CCSV6_INSTALL_DIR* variables here or in patch #3? Doing it here might break
> bisectability...
>
>
> On Fri, Apr 21, 2017 at 07:45:04PM +0530, Karthik Ramanan wrote:
>> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
>> ---
>>   classes/ti-pdk.bbclass                      | 2 +-
>>   recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb | 2 +-
>>   recipes-bsp/ipumm-fw/ipumm-fw_git.bb        | 2 +-
>>   recipes-ti/includes/ti-paths.inc            | 2 --
>>   recipes-ti/ipc/ti-ipc-rtos.inc              | 2 +-
>>   5 files changed, 4 insertions(+), 6 deletions(-)
>>
>> diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
>> index fd7c3e7..eca3652 100644
>> --- a/classes/ti-pdk.bbclass
>> +++ b/classes/ti-pdk.bbclass
>> @@ -5,7 +5,7 @@ inherit perlnative
>>   
>>   DEPENDS = "ti-xdctools ti-cg-xml-native ti-sysbios common-csl-ip-rtos libxml-simple-perl-native gcc-arm-none-eabi-native ti-cgt6x-native ti-pdk-build-rtos"
>>   
>> -DEPENDS_append_omap-a15 = " ti-ccsv6-native"
>> +DEPENDS_append_omap-a15 = " ti-cgt-arm-native"
>>   DEPENDS_remove_ti33x = "ti-cgt6x-native"
>>   DEPENDS_remove_ti43x = "ti-cgt6x-native"
>>   
>> diff --git a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
>> index 6a01d0b..ce9ef85 100644
>> --- a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
>> +++ b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
>> @@ -4,7 +4,7 @@ require recipes-ti/includes/ti-staging.inc
>>   
>>   PR = "${INC_PR}.0"
>>   
>> -DEPENDS = "ti-sysbios ti-xdctools gcc-arm-none-eabi-native ti-ccsv6-native ti-cgt6x-native"
>> +DEPENDS = "ti-sysbios ti-xdctools gcc-arm-none-eabi-native ti-cgt-arm-native ti-cgt6x-native"
>>   
>>   COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone"
>>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>> diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
>> index 1a5d285..1291e69 100644
>> --- a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
>> +++ b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
>> @@ -29,7 +29,7 @@ require recipes-ti/includes/ti-staging.inc
>>   
>>   inherit update-alternatives
>>   
>> -DEPENDS = "ti-xdctools ti-sysbios ti-codec-engine ti-framework-components ti-xdais ti-ccsv6-native ti-ipc-rtos"
>> +DEPENDS = "ti-xdctools ti-sysbios ti-codec-engine ti-framework-components ti-xdais ti-cgt-arm-native ti-ipc-rtos"
>>   
>>   export HWVERSION="ES10"
>>   export BIOSTOOLSROOT="${STAGING_DIR_TARGET}/usr/share/ti"
>> diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-paths.inc
>> index e7d3e82..a7ea9a7 100644
>> --- a/recipes-ti/includes/ti-paths.inc
>> +++ b/recipes-ti/includes/ti-paths.inc
>> @@ -46,7 +46,6 @@ export XDC_INSTALL_DIR_RECIPE        = "${installdir}/ti-xdctools-tree"
>>   export PDK_INSTALL_DIR_RECIPE        = "${installdir}/ti-pdk-tree"
>>   export OSAL_INSTALL_DIR_RECIPE       = "${installdir}/ti-osal-tree"
>>   export M4_TOOLCHAIN_INSTALL_DIR_RECIPE    = "${installdir}/ti-cgt-arm"
>> -export CCSV6_INSTALL_DIR_RECIPE           = "${installdir}/ccsv6"
>>   export GCC_ARM_NONE_TOOLCHAIN_RECIPE      = "${installdir}/gcc-arm-none-eabi"
>>   export TI_CGT_PRU_INSTALL_DIR_RECIPE      = "${installdir}/cgt-pru"
>>   export DSPLIB_C66_INSTALL_DIR_RECIPE      = "${installdir}/ti-dsplib-c66x-tree"
>> @@ -93,7 +92,6 @@ export XDC_INSTALL_DIR        = "${STAGING_DIR_TARGET}${XDC_INSTALL_DIR_RECIPE}"
>>   export PDK_INSTALL_DIR        = "${STAGING_DIR_TARGET}${PDK_INSTALL_DIR_RECIPE}"
>>   export OSAL_INSTALL_DIR       = "${STAGING_DIR_TARGET}${OSAL_INSTALL_DIR_RECIPE}"
>>   export M4_TOOLCHAIN_INSTALL_DIR    = "${STAGING_DIR_NATIVE}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}"
>> -export CCSV6_INSTALL_DIR           = "${STAGING_DIR_NATIVE}${CCSV6_INSTALL_DIR_RECIPE}"
>>   export GCC_ARM_NONE_TOOLCHAIN      = "${STAGING_DIR_NATIVE}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}"
>>   export TI_CGT_PRU_INSTALL_DIR      = "${STAGING_DIR_NATIVE}${TI_CGT_PRU_INSTALL_DIR_RECIPE}"
>>   export DSPLIB_C66_INSTALL_DIR      = "${STAGING_DIR_TARGET}${DSPLIB_C66_INSTALL_DIR_RECIPE}"
>> diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.inc
>> index b29e984..696a897 100644
>> --- a/recipes-ti/ipc/ti-ipc-rtos.inc
>> +++ b/recipes-ti/ipc/ti-ipc-rtos.inc
>> @@ -43,7 +43,7 @@ DEPENDS_append_keystone = " ti-cgt6x-native \
>>                               gcc-arm-none-eabi-native \
>>   "
>>   DEPENDS_append_omap-a15 = " ti-cgt6x-native \
>> -                            ti-ccsv6-native \
>> +                            ti-cgt-arm-native \
>>                               gcc-arm-none-eabi-native \
>>   "
>>   IPC_TARGETS = ""
>> -- 
>> 1.9.1
>>
>> -- 
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti


