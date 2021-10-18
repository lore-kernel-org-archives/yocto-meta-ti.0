Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.38317.1634572373791920298
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 18 Oct 2021 08:52:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=vepz2h94;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: yogeshs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19IFqlZs031018;
	Mon, 18 Oct 2021 10:52:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1634572367;
	bh=oaSHXs2VReUFf/O4BFs1ChRUdLomsbGLAwhg9etVmaE=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=vepz2h949mYWSCys8Lo26PTO7I8UXAY1/qrhJYDEpSgfR7UW4Y9qYr1J0dO1Mgf/U
	 Ybw1ADtaQgYtRB5JmiRyQIaVDFFh9liutk5ja18J6sZBc7kkVw7GkzMQVHiPx1NTom
	 neQrF3o/vjDs4ocNjBXHWBaG5EkApypzHYMqT/8c=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19IFqlFr040519
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 18 Oct 2021 10:52:47 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 18
 Oct 2021 10:52:46 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 18 Oct 2021 10:52:46 -0500
Received: from [10.250.38.160] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19IFqkJ7023835;
	Mon, 18 Oct 2021 10:52:46 -0500
Subject: Re: [meta-ti] [PATCH] meta-ti: Fix several errors introduced during override syntax changes
To: Denys Dmytriyenko <denis@denix.org>,
        Phil Sutherland
	<phil@sutherland.id.au>
CC: <meta-ti@lists.yoctoproject.org>
References: <CACpu_i6xMW1mW0hk6V2ghAivUnEdaB8EbaGgPba1rrg9wo6-Lw@mail.gmail.com>
 <CACpu_i5N9QR3=Km7ntUYU0hA8LmhNy0yrLtGLVTt+EyD2ZqaJw@mail.gmail.com>
 <16AB95A2DE031FCA.3789@lists.yoctoproject.org>
 <20211015190140.GB10132@denix.org>
From: "Yogesh Siraswar" <yogeshs@ti.com>
Message-ID: <cfcde2bf-1abc-946e-b7be-6e25ad48411c@ti.com>
Date: Mon, 18 Oct 2021 10:52:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20211015190140.GB10132@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Applied to master. Thanks

On 10/15/21 2:01 PM, Denys Dmytriyenko wrote:
> It appears this patch was corrupted, probably because it was sent by MUA and
> not with git-send-email. I just re-sent a corrected version.
> 
> 
> On Wed, Oct 06, 2021 at 07:43:32PM -0400, Denys Dmytriyenko wrote:
>> Missing Signed-off-by: line, but here it is - should be added by patchwork.
>>
>> Signed-off-by: Phil Sutherland <phil@sutherland.id.au>
>>
>> Looks good to me.
>>
>> Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>
>>
>> This is master-only.
>>
>>
>> On Wed, Oct 06, 2021 at 08:49:24AM +0800, Phil Sutherland wrote:
>>> ---
>>>   .../devtools/gcc-linaro-baremetal-aarch64-native.bb       | 4 ++--
>>>   recipes-ti/devtools/gcc-linaro-baremetal-native.bb        | 4 ++--
>>>   recipes-ti/devtools/ti-cgt-arm_18.12.5.bb                 | 2 +-
>>>   recipes-ti/devtools/ti-cgt-pru_2.3.2.bb                   | 4 ++--
>>>   recipes-ti/devtools/ti-cgt470.inc                         | 2 +-
>>>   recipes-ti/devtools/ti-cgt6x_8.3.2.bb                     | 8 ++++----
>>>   recipes-ti/devtools/ti-cgt7x_1.2.0.bb                     | 2 +-
>>>   recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-apps.sh       | 2 +-
>>>   recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-o3530_al.sh   | 2 +-
>>>   recipes-ti/dmai/ti-dmai/unloadmodules-ti-dmai-apps.sh     | 2 +-
>>>   10 files changed, 16 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/recipes-ti/devtools/gcc-linaro-baremetal-aarch64-native.bb
>>> b/recipes-ti/devtools/gcc-linaro-baremetal-aarch64-native.bb
>>> index f1596a8b..3b40c9bd 100644
>>> --- a/recipes-ti/devtools/gcc-linaro-baremetal-aarch64-native.bb
>>> +++ b/recipes-ti/devtools/gcc-linaro-baremetal-aarch64-native.bb
>>> @@ -1,6 +1,6 @@
>>>   include recipes-ti/devtools/gcc-linaro.inc
>>>
>>> -PACKAGE_DIR = "gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64:aarch64-elf"
>>> +PACKAGE_DIR = "gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64_aarch64-elf"
>>>   S = "${WORKDIR}/${PACKAGE_DIR}"
>>>
>>>   LIC_CHKSUM = "bc7fad4bba98e7a4cd5ab3042506493c"
>>> @@ -8,7 +8,7 @@ LIC_CHKSUM = "bc7fad4bba98e7a4cd5ab3042506493c"
>>>   inherit native
>>>   require recipes-ti/includes/ti-paths.inc
>>>
>>> -SRC_URI = "https://releases.linaro.org/components/toolchain/binaries/7.2-${GCC_ARM_YEAR}/aarch64-elf/gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64:aarch64-elf.tar.xz;name=gcc-linaro-aarch64"
>>> +SRC_URI = "https://releases.linaro.org/components/toolchain/binaries/7.2-${GCC_ARM_YEAR}/aarch64-elf/gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64_aarch64-elf.tar.xz;name=gcc-linaro-aarch64"
>>>
>>>   SRC_URI[gcc-linaro-aarch64.md5sum] = "4972f8943820bdd2f577f498de78964b"
>>>   SRC_URI[gcc-linaro-aarch64.sha256sum] =
>>> "30fb7d876bcb982c502057c593d9c1f11b35d5158a26d986718e2b998388c4c8"
>>> diff --git a/recipes-ti/devtools/gcc-linaro-baremetal-native.bb
>>> b/recipes-ti/devtools/gcc-linaro-baremetal-native.bb
>>> index d0683fe1..6d5ec197 100644
>>> --- a/recipes-ti/devtools/gcc-linaro-baremetal-native.bb
>>> +++ b/recipes-ti/devtools/gcc-linaro-baremetal-native.bb
>>> @@ -1,6 +1,6 @@
>>>   include recipes-ti/devtools/gcc-linaro.inc
>>>
>>> -PACKAGE_DIR = "gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64:arm-eabi"
>>> +PACKAGE_DIR = "gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64_arm-eabi"
>>>   S = "${WORKDIR}/${PACKAGE_DIR}"
>>>
>>>   LIC_CHKSUM = "bc7fad4bba98e7a4cd5ab3042506493c"
>>> @@ -8,7 +8,7 @@ LIC_CHKSUM = "bc7fad4bba98e7a4cd5ab3042506493c"
>>>   inherit native
>>>   require recipes-ti/includes/ti-paths.inc
>>>
>>> -SRC_URI = "https://releases.linaro.org/components/toolchain/binaries/7.2-${GCC_ARM_YEAR}/arm-eabi/gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64:arm-eabi.tar.xz;name=gcc-linaro"
>>> +SRC_URI = "https://releases.linaro.org/components/toolchain/binaries/7.2-${GCC_ARM_YEAR}/arm-eabi/gcc-linaro-${PV}-${GCC_ARM_YEAR}-x86_64_arm-eabi.tar.xz;name=gcc-linaro"
>>>
>>>   SRC_URI[gcc-linaro.md5sum] = "9a4a39cfc78c84375b1160aa93587aed"
>>>   SRC_URI[gcc-linaro.sha256sum] =
>>> "45fc4f90af2e2e9c3197a275f6005ef5639f7a1889fa3eb24c3125ccd70fcd3d"
>>> diff --git a/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb
>>> b/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb
>>> index 60b216f9..b7b6d9b1 100644
>>> --- a/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb
>>> +++ b/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb
>>> @@ -31,7 +31,7 @@ do_install() {
>>>   SRC_URI[cgt_arm_installer.md5sum] = "e9e668332cf86c965b4da9d1d488426b"
>>>   SRC_URI[cgt_arm_installer.sha256sum] =
>>> "da976143128c619a278cb4214a4295c409d100f9e65ad2f4d0d1039db7cf98f4"
>>>
>>> -BINFILE_NAME = "cgt:arm_installer"
>>> +BINFILE_NAME = "cgt_arm_installer"
>>>
>>>   FILES:${PN} += "${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}"
>>>
>>> diff --git a/recipes-ti/devtools/ti-cgt-pru_2.3.2.bb
>>> b/recipes-ti/devtools/ti-cgt-pru_2.3.2.bb
>>> index d14c1962..8b3e2a07 100644
>>> --- a/recipes-ti/devtools/ti-cgt-pru_2.3.2.bb
>>> +++ b/recipes-ti/devtools/ti-cgt-pru_2.3.2.bb
>>> @@ -8,12 +8,12 @@ LIC_FILES_CHKSUM:class-target =
>>> "file://usr/share/doc/ti/cgt-pru/PRU_Code_Genera
>>>   require recipes-ti/includes/ti-paths.inc
>>>   require recipes-ti/includes/ti-unpack.inc
>>>
>>> -BINFILE = "ti_cgt_pru_${PV}_linux_installer:x86.bin"
>>> +BINFILE = "ti_cgt_pru_${PV}_linux_installer_x86.bin"
>>>   BINFILE_NAME = "cgt-pru-x86"
>>>   TI_BIN_UNPK_ARGS = "--prefix ${S}"
>>>   TI_BIN_UNPK_CMDS = ""
>>>
>>> -BINFILE:class-target = "ti_cgt_pru_${PV}:armlinuxa8hf_busybox_installer.sh"
>>> +BINFILE:class-target = "ti_cgt_pru_${PV}_armlinuxa8hf_busybox_installer.sh"
>>>   BINFILE_NAME:class-target = "cgt-pru-arm"
>>>
>>>   SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/PRU/${PV}/${BINFILE};name=${BINFILE_NAME}"
>>> diff --git a/recipes-ti/devtools/ti-cgt470.inc
>>> b/recipes-ti/devtools/ti-cgt470.inc
>>> index c8f91271..f0992aa7 100644
>>> --- a/recipes-ti/devtools/ti-cgt470.inc
>>> +++ b/recipes-ti/devtools/ti-cgt470.inc
>>> @@ -13,7 +13,7 @@ S = "${WORKDIR}/cgt470_${PV}"
>>>
>>>   SRC_URI = "http://install.source.dir.local/ti_cgt_tms470_${PVwithdots}_setup_linux_x86.bin;name=cgt470bin"
>>>
>>> -BINFILE="ti_cgt_tms470_${PVwithdots}_setup_linux:x86.bin"
>>> +BINFILE="ti_cgt_tms470_${PVwithdots}_setup_linux_x86.bin"
>>>   TI_BIN_UNPK_CMDS="Y:qY:workdir: : "
>>>   TI_BIN_UNPK_WDEXT="/cgt470_${PV}"
>>>
>>> diff --git a/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
>>> b/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
>>> index 00221d84..fd34657a 100644
>>> --- a/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
>>> +++ b/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
>>> @@ -26,13 +26,13 @@ python __anonymous() {
>>>               raise bb.parse.SkipPackage("%s-%s ONLY supports hardfp
>>> mode for now" % (pkgn, pkgv))
>>>   }
>>>
>>> -BINFILE = "ti_cgt_c6000_${PV}_linux_installer:x86.bin"
>>> -BINFILE_NAME = "cgt6x:x86_installer"
>>> +BINFILE = "ti_cgt_c6000_${PV}_linux_installer_x86.bin"
>>> +BINFILE_NAME = "cgt6x_x86_installer"
>>>   TI_BIN_UNPK_ARGS = "--prefix ${S}"
>>>   TI_BIN_UNPK_CMDS = ""
>>>
>>> -BINFILE:class-target = "ti_cgt_c6000_${PV}:armlinuxa8hf_busybox_installer.sh"
>>> -BINFILE_NAME:class-target = "cgt6x:arm_installer"
>>> +BINFILE:class-target = "ti_cgt_c6000_${PV}_armlinuxa8hf_busybox_installer.sh"
>>> +BINFILE_NAME:class-target = "cgt6x_arm_installer"
>>>
>>>   SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/C6000/${PV}/${BINFILE};name=${BINFILE_NAME}"
>>>
>>> diff --git a/recipes-ti/devtools/ti-cgt7x_1.2.0.bb
>>> b/recipes-ti/devtools/ti-cgt7x_1.2.0.bb
>>> index 35b58d4c..b45b52a3 100644
>>> --- a/recipes-ti/devtools/ti-cgt7x_1.2.0.bb
>>> +++ b/recipes-ti/devtools/ti-cgt7x_1.2.0.bb
>>> @@ -20,7 +20,7 @@ COMPATIBLE_HOST:class-target = "null"
>>>   PE = "1"
>>>
>>>   BINFILE = "ti_cgt_c7000_${PV}.STS_linux_installer_x86.bin"
>>> -BINFILE_NAME = "cgt7x:x86_installer"
>>> +BINFILE_NAME = "cgt7x_x86_installer"
>>>
>>>   SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/C7000/${PV}.STS/${BINFILE};name=${BINFILE_NAME}"
>>>
>>> diff --git a/recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-apps.sh
>>> b/recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-apps.sh
>>> index 2bfd03c2..7120b744 100755
>>> --- a/recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-apps.sh
>>> +++ b/recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-apps.sh
>>> @@ -34,4 +34,4 @@ modprobe dsplinkk
>>>
>>>   # insert Local Power Manager driver
>>>   #
>>> -modprobe lpm:omap3530
>>> +modprobe lpm_omap3530
>>> diff --git a/recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-o3530_al.sh
>>> b/recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-o3530_al.sh
>>> index 094d23d1..076af072 100755
>>> --- a/recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-o3530_al.sh
>>> +++ b/recipes-ti/dmai/ti-dmai/loadmodules-ti-dmai-o3530_al.sh
>>> @@ -38,5 +38,5 @@ mknod /dev/dsplink c `awk "\\$2==\"dsplink\" {print
>>> \\$1}" /proc/devices` 0
>>>
>>>   # insert Local Power Manager driver
>>>   #
>>> -modprobe lpm:omap3530
>>> +modprobe lpm_omap3530
>>>
>>> diff --git a/recipes-ti/dmai/ti-dmai/unloadmodules-ti-dmai-apps.sh
>>> b/recipes-ti/dmai/ti-dmai/unloadmodules-ti-dmai-apps.sh
>>> index 81d00af8..793d727f 100644
>>> --- a/recipes-ti/dmai/ti-dmai/unloadmodules-ti-dmai-apps.sh
>>> +++ b/recipes-ti/dmai/ti-dmai/unloadmodules-ti-dmai-apps.sh
>>> @@ -1,7 +1,7 @@
>>>   # Unload modules - DMAI - OMAP3530
>>>
>>>   # remove lpm module
>>> -rmmod lpm:omap3530
>>> +rmmod lpm_omap3530
>>>
>>>   # remove DSP/BIOS Link driver
>>>   rmmod dsplinkk
>>> --
>>> 2.33.0
>>
>>
>>
>> 
>>
