Return-Path: <s-anna@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 43B89E0097C; Tue, 21 Aug 2018 17:52:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5EA32E008D9
	for <meta-ti@yoctoproject.org>; Tue, 21 Aug 2018 17:52:41 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7M0qeU2112272
	for <meta-ti@yoctoproject.org>; Tue, 21 Aug 2018 19:52:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534899160;
	bh=qLq8lwVN2ARcV9cwWteqBkQEpnUBWTnT4Z/9d1xlgBo=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=jOHFWC425n8DmST50+Wb5qISY0VPE2DhP78i6eqJbLomoyfCaOPlgZVKY+yJDM8UT
	KmRIE4TUPf6jTN79JChVA3+LyROrClssssW6huhudkdHc8Yb5THtZ6xk7Js494iDP+
	isQKfbzk4atz7u4U0xuoAfIhEaYGMnx3hfNSX3Wo=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7M0qeor002111
	for <meta-ti@yoctoproject.org>; Tue, 21 Aug 2018 19:52:40 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 21 Aug 2018 19:52:40 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 21 Aug 2018 19:52:40 -0500
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7M0qere030202;
	Tue, 21 Aug 2018 19:52:40 -0500
To: "Nelson, Sam" <sam.nelson@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
References: <1534893540-56123-1-git-send-email-sam.nelson@ti.com>
	<eb565605-0538-6124-df8b-5ee0579d2a75@ti.com>
	<31651cdce5594467b59d8311b4a947d7@ti.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <c40abddb-c51b-456d-99a7-e761b7120b9b@ti.com>
Date: Tue, 21 Aug 2018 19:52:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <31651cdce5594467b59d8311b4a947d7@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [rocko][PATCH v4] ti-ipc: Update to new version 3.50
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
X-List-Received-Date: Wed, 22 Aug 2018 00:52:42 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

>>
>> On 08/21/2018 06:19 PM, Sam Nelson wrote:
>>> Add AM65XX platform support
>>>
>>> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
>>>
>>> ---
>>> Change from previous version of patch
>>> - Update commit id and tag 3.50.01.00B with fixes
>>> NOTE: This patch depends on gcc-linaro-baremetal-aarch64-native patch to
>> be checked in
>>> ---
>>> ---
>>>  recipes-ti/ipc/ti-ipc-common.inc   |  3 ++-
>>>  recipes-ti/ipc/ti-ipc-examples.inc |  2 +-
>>>  recipes-ti/ipc/ti-ipc-rtos.inc     | 16 ++++++++++++----
>>>  recipes-ti/ipc/ti-ipc-rtos_git.bb  |  8 ++++++++
>>>  recipes-ti/ipc/ti-ipc.inc          |  6 +++---
>>>  5 files changed, 26 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/recipes-ti/ipc/ti-ipc-common.inc b/recipes-ti/ipc/ti-ipc-
>> common.inc
>>> index 7f93842..6aea8e6 100644
>>> --- a/recipes-ti/ipc/ti-ipc-common.inc
>>> +++ b/recipes-ti/ipc/ti-ipc-common.inc
>>> @@ -1,4 +1,4 @@
>>> -PV = "3.47.02.00"
>>> +PV = "3.50.01.00"
>>>  INC_PR = "r0"
>>>
>>>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>>> @@ -13,6 +13,7 @@ PLATFORM_k2g = "66AK2G"
>>>  PLATFORM_omapl138 = "OMAPL138"
>>>  PLATFORM_c667x-evm = "C6678"
>>>  PLATFORM_c665x-evm = "C6678"
>>> +PLATFORM_am65xx-evm = "AM65XX"
>>>
>>>  ALT_PLATFORM_k2hk = "TCI6636"
>>>  ALT_PLATFORM_am57xx-evm = "AM572X AM571X"
>>> diff --git a/recipes-ti/ipc/ti-ipc-examples.inc b/recipes-ti/ipc/ti-ipc-
>> examples.inc
>>> index cd2240c..022b13f 100644
>>> --- a/recipes-ti/ipc/ti-ipc-examples.inc
>>> +++ b/recipes-ti/ipc/ti-ipc-examples.inc
>>> @@ -3,7 +3,7 @@ require ti-ipc-common.inc
>>>  require ti-ipc-rtos.inc
>>>
>>>  LICENSE = "BSD"
>>> -LIC_FILES_CHKSUM = "file://${S_ipc-
>> examples}/src/makefile;beginline=1;endline=30;md5=fb83580b16bce88e8ed
>> 568a6005c8f02"
>>> +LIC_FILES_CHKSUM = "file://${S_ipc-
>> examples}/src/makefile;beginline=1;endline=30;md5=a52324bd5033bb49ea0
>> 7bade1244ac9a"
>>>
>>>  INSANE_SKIP_${PN} += "arch"
>>>
>>> diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.inc
>>> index 868743e..13b1914 100644
>>> --- a/recipes-ti/ipc/ti-ipc-rtos.inc
>>> +++ b/recipes-ti/ipc/ti-ipc-rtos.inc
>>> @@ -24,11 +24,11 @@ protocol=${TI_IPC_METADATA_GIT_PROTOCOL};\
>>>  branch=${TI_IPC_METADATA_GIT_BRANCH};\
>>>  name=${TI_IPC_METADATA_NAME}"
>>>
>>> -# Corresponds to tag: 3.47.02.00
>>> -SRCREV_ipc-metadata = "e8aff83111b8a0d64d7a77413b6f66d3106084d8"
>>> +# Corresponds to tag: 3.50.01.00
>>> +SRCREV_ipc-metadata = "19a8e70cf6ca4fe0984987e25d937c61a62c7658"
>>>
>>> -# Corresponds to tag: 3.47.02.00
>>> -SRCREV_ipc-examples = "351e9a6d94c68f7ff64b2c002ee6750242ece6d9"
>>> +# Corresponds to tag: 3.50.01.00
>>> +SRCREV_ipc-examples =
>> "1975687076426b587be8d2530df56c24425ca53a"
>>>
>>>  S_ipc-examples = "${WORKDIR}/git/ipc-examples"
>>>  S_ipc-metadata = "${WORKDIR}/git/ipc-metadata"
>>> @@ -50,6 +50,9 @@ DEPENDS_append_omapl138 = " ti-cgt6x-native \
>>>  DEPENDS_append_c66x = " ti-cgt6x-native \
>>>  "
>>>
>>> +DEPENDS_append_am65xx-evm = " ti-cgt-arm-native \
>>> +                              gcc-linaro-baremetal-aarch64-native"
>>> +
>>>  IPC_TARGETS = ""
>>>
>>>  IPC_TARGETS_omap-a15 = "\
>>> @@ -73,6 +76,11 @@ IPC_TARGETS_c66x = " \
>>>
>> ti.targets.elf.C66_big_endian="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
>> \
>>>  "
>>>
>>> +IPC_TARGETS_am65xx-evm = "\
>>> +
>> gnu.targets.arm.A53F="${GCC_LINARO_BAREMETAL_AARCH64_TOOLCHAIN}
>> " \
>>> +    ti.targets.arm.elf.R5F="${M4_TOOLCHAIN_INSTALL_DIR}" \
>>> +"
>>> +
>>>  EXTRA_OEMAKE = "\
>>>      PLATFORM=${PLATFORM} \
>>>      XDC_INSTALL_DIR="${XDC_INSTALL_DIR}" \
>>> diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bb b/recipes-ti/ipc/ti-ipc-rtos_git.bb
>>> index b292d67..c374bb1 100644
>>> --- a/recipes-ti/ipc/ti-ipc-rtos_git.bb
>>> +++ b/recipes-ti/ipc/ti-ipc-rtos_git.bb
>>> @@ -122,3 +122,11 @@ pkg_postinst_${PN}-fw_omapl138 () {
>>>  pkg_postrm_${PN}-fw_omapl138 () {
>>>    update-alternatives --remove rproc-dsp-fw
>> ipc/ti_platforms_evmOMAPL138_DSP/messageq_single.xe674
>>>  }
>>> +
>>> +pkg_postinst_${PN}-fw_am65xx-evm () {
>>> +  update-alternatives --install /lib/firmware/am65x-mcu-r5f0-fw am65x-
>> mcu-r5f0-fw ipc/ti_platforms_cortexR_AM65X/messageq_single.xer5f
>> ${ALTERNATIVE_PRIORITY}
>>> +}
>>> +
>>> +pkg_postrm_${PN}-fw_am65xx-evm () {
>>> +  update-alternatives --remove am65x-mcu-r5f0-fw
>> ipc/ti_platforms_cortexR_AM65X/messageq_single.xe674
>>> +}
>>> diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
>>> index e8038a5..494c605 100644
>>> --- a/recipes-ti/ipc/ti-ipc.inc
>>> +++ b/recipes-ti/ipc/ti-ipc.inc
>>> @@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://${S}/ipc-
>> linux.mak;beginline=1;endline=30;md5=7b327f9
>>>
>>>  TI_IPC_GIT_URI = "git://git.ti.com/ipc/ipcdev.git"
>>>  TI_IPC_GIT_PROTOCOL = "git"
>>> -TI_IPC_GIT_BRANCH = "3.47"
>>> +TI_IPC_GIT_BRANCH = "3.50"
>>>
>>> -#Corresponds to 3.47.02.00
>>> -TI_IPC_SRCREV = "24c36385d096613af123d1e1696fb2fee652ef36"
>>> +#Corresponds to 3.50.01.00B
>>
>> Thanks for the update. This should be an usable version across all
>> platforms.
>>
>> Please update the tag on the tree accordingly. Currently tag is one
>> commit behind w.r.t the below commit.
> 
> I just looked at git.ti.com and tag is at the right commit. Can you refresh and check?
> 

Yes, refreshing it matches. Thanks.

regards
Suman


