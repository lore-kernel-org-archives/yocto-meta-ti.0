Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C53FEE0076A; Mon, 23 Nov 2015 11:53:55 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 553F3E00343
	for <meta-ti@yoctoproject.org>; Mon, 23 Nov 2015 11:53:48 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id tANJrmIA021042
	for <meta-ti@yoctoproject.org>; Mon, 23 Nov 2015 13:53:48 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tANJrlUT008549
	for <meta-ti@yoctoproject.org>; Mon, 23 Nov 2015 13:53:48 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 23 Nov 2015 13:53:48 -0600
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id tANJrlE3018605;
	Mon, 23 Nov 2015 13:53:47 -0600
Message-ID: <56536ECB.1090304@ti.com>
Date: Mon, 23 Nov 2015 14:53:47 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>, Sam Nelson <sam.nelson@ti.com>
References: <1447991699-23623-1-git-send-email-sam.nelson@ti.com>	<20151123041421.GK18230@edge>	<20151123171258.GM18230@edge>
	<565366D6.8000306@ti.com>
In-Reply-To: <565366D6.8000306@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v6] ipc: ti-ipc, ti-ipc-rtos: Update to new version of IPC 3.41.0.3_eng
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
X-List-Received-Date: Mon, 23 Nov 2015 19:53:55 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

It seems the error is in the DEPEDNS: "DEPENDS_append_omap-15 += ..." 
which should be "...-a15...". Looks like we got lucky in our nightly.

I am checking if this is the only issue, and I will submit a patch once 
it has compiled.

On 11/23/2015 2:19 PM, Jacob Stiffler wrote:
> Our nightly succeeded with the new ti-ipc-rtos... I'll see if I can 
> recreate the issue with the arago-fido-config.
>
> On 11/23/2015 12:12 PM, Denys Dmytriyenko wrote:
>> Ping. Anyone looking into this one? Any ETA on a fix? This is 
>> blocking our
>> nightly builds for am5/j6...
>>
>>
>> On Sun, Nov 22, 2015 at 11:14:21PM -0500, Denys Dmytriyenko wrote:
>>> Now it fails with this error:
>>>
>>>
>>> DEBUG: Executing shell function do_compile
>>> NOTE: make -j 12 PLATFORM=DRA7XX 
>>> XDC_INSTALL_DIR=/home/jenkins/tisdk-build-fido-rt/build-CORTEX_1/arago-tmp-external-linaro-toolchain/sysroots/am57xx-evm/usr/share/ti/ti-xdctools-tree 
>>> BIOS_INSTALL_DIR=/home/jenkins/tisdk-build-fido-rt/build-CORTEX_1/arago-tmp-external-linaro-toolchain/sysroots/am57xx-evm/usr/share/ti/ti-sysbios-tree 
>>> gnu.targets.arm.A15F=/home/jenkins/tisdk-build-fido-rt/build-CORTEX_1/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/share/ti/gcc-arm-none-eabi 
>>> ti.targets.elf.C66=/home/jenkins/tisdk-build-fido-rt/build-CORTEX_1/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/share/ti/cgt-c6x 
>>> ti.targets.arm.elf.M4=/home/jenkins/tisdk-build-fido-rt/build-CORTEX_1/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/share/ti/ti-cgt-arm 
>>> ti.targets.arm.elf.M4F=/home/jenkins/tisdk-build-fido-rt/build-CORTEX_1/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/share/ti/ti-cgt-arm 
>>> -f ipc-bios.mak clean
>>> cleaning ipc packages ...
>>> making clean: Sun Nov 22 06:06:32 EST 2015 ...
>>> ======== clean [./packages/ti/deh] ========
>>> ======== clean [./packages/ti/grcm] ========
>>> making package.mak (because of package.bld) in order to clean ...
>>> js: 
>>> "/home/jenkins/tisdk-build-fido-rt/build-CORTEX_1/arago-tmp-external-linaro-toolchain/sysroots/am57xx-evm/usr/share/ti/ti-sysbios-tree/packages/gnu/targets/arm/ITarget.xs", 
>>> line 63: Error: Directory 
>>> '/home/jenkins/tisdk-build-fido-rt/build-CORTEX_1/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/share/ti/gcc-arm-none-eabi/bin' 
>>> cannot be found. Ensure that rootDir for the A15F target is set 
>>> correctly in 
>>> '/home/jenkins/tisdk-build-fido-rt/build-CORTEX_1/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/ti-ipc-rtos/3.41.00.03-r0.0/git/ipc-bios.bld'.
>>> "/home/jenkins/tisdk-build-fido-rt/build-CORTEX_1/arago-tmp-external-linaro-toolchain/sysroots/am57xx-evm/usr/share/ti/ti-sysbios-tree/packages/gnu/targets/_utils.xs", 
>>> line 31
>>> "/home/jenkins/tisdk-build-fido-rt/build-CORTEX_1/arago-tmp-external-linaro-toolchain/sysroots/am57xx-evm/usr/share/ti/ti-sysbios-tree/packages/gnu/targets/ITarget.xs", 
>>> line 164
>>> make[1]: *** Deleting file `package.mak'
>>> ======== clean [./packages/ti/ipc] ========
>>> ======== clean [./packages/ti/ipc/family/omap54xx] ========
>>> ======== clean [./packages/ti/ipc/family/omapl138] ========
>>> ======== clean [./packages/ti/ipc/family/tci6614] ========
>>> ======== clean [./packages/ti/ipc/family/tci6638] ========
>>> ======== clean [./packages/ti/ipc/family/vayu] ========
>>> ======== clean [./packages/ti/ipc/ipcmgr] ========
>>> ======== clean [./packages/ti/ipc/mm] ========
>>> ======== clean [./packages/ti/ipc/namesrv] ========
>>> ======== clean [./packages/ti/ipc/remoteproc] ========
>>> ======== clean [./packages/ti/ipc/rpmsg] ========
>>> ======== clean [./packages/ti/ipc/tests] ========
>>> ======== clean [./packages/ti/ipc/transports] ========
>>> ======== clean [./packages/ti/pm] ========
>>> ======== clean [./packages/ti/sdo/ipc] ========
>>> ======== clean [./packages/ti/sdo/ipc/family] ========
>>> ======== clean [./packages/ti/sdo/ipc/family/arctic] ========
>>> ======== clean [./packages/ti/sdo/ipc/family/c647x] ========
>>> ======== clean [./packages/ti/sdo/ipc/family/c6a8149] ========
>>> ======== clean [./packages/ti/sdo/ipc/family/da830] ========
>>> ======== clean [./packages/ti/sdo/ipc/family/dm6446] ========
>>> ======== clean [./packages/ti/sdo/ipc/family/omap3530] ========
>>> ======== clean [./packages/ti/sdo/ipc/family/omap4430] ========
>>> ======== clean [./packages/ti/sdo/ipc/family/tci663x] ========
>>> ======== clean [./packages/ti/sdo/ipc/family/tda3xx] ========
>>> ======== clean [./packages/ti/sdo/ipc/family/ti81xx] ========
>>> ======== clean [./packages/ti/sdo/ipc/family/vayu] ========
>>> ======== clean [./packages/ti/sdo/ipc/gates] ========
>>> ======== clean [./packages/ti/sdo/ipc/heaps] ========
>>> ======== clean [./packages/ti/sdo/ipc/interfaces] ========
>>> ======== clean [./packages/ti/sdo/ipc/notifyDrivers] ========
>>> ======== clean [./packages/ti/sdo/ipc/nsremote] ========
>>> ======== clean [./packages/ti/sdo/ipc/transports] ========
>>> ======== clean [./packages/ti/sdo/utils] ========
>>> ======== clean [./packages/ti/srvmgr] ========
>>> ======== clean [./packages/ti/srvmgr/omaprpc] ========
>>> ======== clean [./packages/ti/srvmgr/omx] ========
>>> ======== clean [./packages/ti/trace] ========
>>> cleaning complete: Sun Nov 22 06:06:53 EST 2015.
>>> NOTE: make -j 12 PLATFORM=DRA7XX 
>>> XDC_INSTALL_DIR=/home/jenkins/tisdk-build-fido-rt/build-CORTEX_1/arago-tmp-external-linaro-toolchain/sysroots/am57xx-evm/usr/share/ti/ti-xdctools-tree 
>>> BIOS_INSTALL_DIR=/home/jenkins/tisdk-build-fido-rt/build-CORTEX_1/arago-tmp-external-linaro-toolchain/sysroots/am57xx-evm/usr/share/ti/ti-sysbios-tree 
>>> gnu.targets.arm.A15F=/home/jenkins/tisdk-build-fido-rt/build-CORTEX_1/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/share/ti/gcc-arm-none-eabi 
>>> ti.targets.elf.C66=/home/jenkins/tisdk-build-fido-rt/build-CORTEX_1/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/share/ti/cgt-c6x 
>>> ti.targets.arm.elf.M4=/home/jenkins/tisdk-build-fido-rt/build-CORTEX_1/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/share/ti/ti-cgt-arm 
>>> ti.targets.arm.elf.M4F=/home/jenkins/tisdk-build-fido-rt/build-CORTEX_1/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/share/ti/ti-cgt-arm 
>>> -f ipc-bios.mak all
>>> building ipc packages ...
>>> making all: Sun Nov 22 06:06:53 EST 2015 ...
>>> ======== .interfaces [./packages/ti/deh/] ========
>>> making package.mak (because of package.bld) ...
>>> generating interfaces for package ti.deh (because 
>>> package/package.xdc.inc is older than package.xdc) ...
>>>      translating Deh
>>>      translating StackDbg
>>>      translating Watchdog
>>> ======== .interfaces [./packages/ti/grcm/] ========
>>> making package.mak (because of package.bld) ...
>>> js: 
>>> "/home/jenkins/tisdk-build-fido-rt/build-CORTEX_1/arago-tmp-external-linaro-toolchain/sysroots/am57xx-evm/usr/share/ti/ti-sysbios-tree/packages/gnu/targets/arm/ITarget.xs", 
>>> line 63: Error: Directory 
>>> '/home/jenkins/tisdk-build-fido-rt/build-CORTEX_1/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/share/ti/gcc-arm-none-eabi/bin' 
>>> cannot be found. Ensure that rootDir for the A15F target is set 
>>> correctly in 
>>> '/home/jenkins/tisdk-build-fido-rt/build-CORTEX_1/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/ti-ipc-rtos/3.41.00.03-r0.0/git/ipc-bios.bld'.
>>> "/home/jenkins/tisdk-build-fido-rt/build-CORTEX_1/arago-tmp-external-linaro-toolchain/sysroots/am57xx-evm/usr/share/ti/ti-sysbios-tree/packages/gnu/targets/_utils.xs", 
>>> line 31
>>> "/home/jenkins/tisdk-build-fido-rt/build-CORTEX_1/arago-tmp-external-linaro-toolchain/sysroots/am57xx-evm/usr/share/ti/ti-sysbios-tree/packages/gnu/targets/ITarget.xs", 
>>> line 164
>>> make[1]: *** Deleting file `package.mak'
>>> make[1]: *** No rule to make target `package.mak', needed by 
>>> `.interfaces'.  Stop.
>>> gmake: *** [packages/ti/grcm/,.interfaces] Error 2
>>> make: *** [all] Error 2
>>> ERROR: oe_runmake failed
>>> WARNING: 
>>> /home/jenkins/tisdk-build-fido-rt/build-CORTEX_1/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/ti-ipc-rtos/3.41.00.03-r0.0/temp/run.do_compile.10937:1 
>>> exit 1 from
>>>    exit 1
>>> ERROR: Function failed: do_compile (log file is located at 
>>> /home/jenkins/tisdk-build-fido-rt/build-CORTEX_1/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/ti-ipc-rtos/3.41.00.03-r0.0/temp/log.do_compile.10937)
>>>
>>>
>>> On Thu, Nov 19, 2015 at 10:54:59PM -0500, Sam Nelson wrote:
>>>> - Update to new version of IPC: 3.41.0.3_eng
>>>> - Add recipe to build ti-ipc-rtos from git repo
>>>> - Remove K2G hack
>>>>
>>>> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
>>>>
>>>> ---
>>>> Changes from the previous version of the patch
>>>> - Fix dependency of according to platform
>>>> - Moved -f ipc-bios.make to EXTRA_OE_MAKE
>>>> ---
>>>> ---
>>>>   recipes-ti/ipc/ti-ipc-rtos.inc           | 19 -----------
>>>>   recipes-ti/ipc/ti-ipc-rtos_3.40.01.08.bb |  9 ------
>>>>   recipes-ti/ipc/ti-ipc-rtos_git.bb        | 55 
>>>> ++++++++++++++++++++++++++++++++
>>>>   recipes-ti/ipc/ti-ipc.inc                | 26 +++++++++++++++
>>>>   recipes-ti/ipc/ti-ipc_git.bb             | 29 ++++-------------
>>>>   5 files changed, 87 insertions(+), 51 deletions(-)
>>>>   delete mode 100644 recipes-ti/ipc/ti-ipc-rtos.inc
>>>>   delete mode 100644 recipes-ti/ipc/ti-ipc-rtos_3.40.01.08.bb
>>>>   create mode 100644 recipes-ti/ipc/ti-ipc-rtos_git.bb
>>>>   create mode 100644 recipes-ti/ipc/ti-ipc.inc
>>>>
>>>> diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc 
>>>> b/recipes-ti/ipc/ti-ipc-rtos.inc
>>>> deleted file mode 100644
>>>> index d14c756..0000000
>>>> --- a/recipes-ti/ipc/ti-ipc-rtos.inc
>>>> +++ /dev/null
>>>> @@ -1,19 +0,0 @@
>>>> -DESCRIPTION = "TI Inter Process Communication (IPC) Mechanisms 
>>>> (for Uni- and Multi- Processor Configurations)"
>>>> -HOMEPAGE="http://processors.wiki.ti.com/index.php/Category:IPC"
>>>> -
>>>> -LICENSE = "BSD"
>>>> -
>>>> -require recipes-ti/includes/ti-paths.inc
>>>> -require recipes-ti/includes/ti-staging.inc
>>>> -
>>>> -SRC_URI = 
>>>> "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ipc/${PV}/exports/ipc_${PV}.zip;name=ipczip"
>>>> -
>>>> -S = "${WORKDIR}/ipc_${PV}"
>>>> -
>>>> -do_install() {
>>>> -    install -d ${D}${IPC_INSTALL_DIR_RECIPE}
>>>> -    cp -pPrf ${S}/* ${D}${IPC_INSTALL_DIR_RECIPE}
>>>> -}
>>>> -
>>>> -ALLOW_EMPTY_${PN} = "1"
>>>> -FILES_${PN}-dev += "${IPC_INSTALL_DIR_RECIPE}"
>>>> diff --git a/recipes-ti/ipc/ti-ipc-rtos_3.40.01.08.bb 
>>>> b/recipes-ti/ipc/ti-ipc-rtos_3.40.01.08.bb
>>>> deleted file mode 100644
>>>> index 7c93695..0000000
>>>> --- a/recipes-ti/ipc/ti-ipc-rtos_3.40.01.08.bb
>>>> +++ /dev/null
>>>> @@ -1,9 +0,0 @@
>>>> -require ti-ipc-rtos.inc
>>>> -
>>>> -PV = "3_40_01_08"
>>>> -PR = "r0"
>>>> -
>>>> -LIC_FILES_CHKSUM = 
>>>> "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9b710fd7c95e545b91cec79255"
>>>> -
>>>> -SRC_URI[ipczip.md5sum] = "738e1d54da9fab94899ad162f1ad78de"
>>>> -SRC_URI[ipczip.sha256sum] = 
>>>> "8cc7d40ad7eab916eae109b355dc7e7876c6ab82e3b40bf5b6bf60474312d6cf"
>>>> diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bb 
>>>> b/recipes-ti/ipc/ti-ipc-rtos_git.bb
>>>> new file mode 100644
>>>> index 0000000..2e9dba1
>>>> --- /dev/null
>>>> +++ b/recipes-ti/ipc/ti-ipc-rtos_git.bb
>>>> @@ -0,0 +1,55 @@
>>>> +require recipes-ti/includes/ti-paths.inc
>>>> +require recipes-ti/includes/ti-staging.inc
>>>> +require ti-ipc.inc
>>>> +
>>>> +PR = "${INC_PR}.0"
>>>> +
>>>> +DEPENDS = "ti-xdctools ti-sysbios"
>>>> +DEPENDS_append_keystone += "ti-cgt6x-native gcc-arm-none-eabi-native"
>>>> +DEPENDS_append_omap-15 += "ti-cgt6x-native ti-ccsv6-native 
>>>> gcc-arm-none-eabi-native"
>>>> +
>>>> +PACKAGES =+ "${PN}-fw"
>>>> +FILES_${PN}-fw = "${libdir}/firmware/*"
>>>> +FILES_${PN}-dev += "${IPC_INSTALL_DIR_RECIPE}"
>>>> +
>>>> +INSANE_SKIP_${PN}-fw += "arch"
>>>> +INSANE_SKIP_${PN}-dev += "arch"
>>>> +
>>>> +ALLOW_EMPTY_${PN} = "1"
>>>> +
>>>> +IPC_TARGETS = ""
>>>> +IPC_TARGETS_omap-a15 = "\
>>>> +    gnu.targets.arm.A15F="${GCC_ARM_NONE_TOOLCHAIN}" \
>>>> + ti.targets.elf.C66="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
>>>> +    ti.targets.arm.elf.M4="${M4_TOOLCHAIN_INSTALL_DIR}" \
>>>> +    ti.targets.arm.elf.M4F="${M4_TOOLCHAIN_INSTALL_DIR}" \
>>>> +"
>>>> +
>>>> +IPC_TARGETS_keystone = " \
>>>> +    gnu.targets.arm.A15F="${GCC_ARM_NONE_TOOLCHAIN}" \
>>>> + ti.targets.elf.C66="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
>>>> +"
>>>> +
>>>> +EXTRA_OEMAKE = "\
>>>> +    PLATFORM=${PLATFORM} \
>>>> +    XDC_INSTALL_DIR="${XDC_INSTALL_DIR}" \
>>>> +    BIOS_INSTALL_DIR="${SYSBIOS_INSTALL_DIR}" \
>>>> +    ${IPC_TARGETS} -f ipc-bios.mak\
>>>> +"
>>>> +
>>>> +do_compile() {
>>>> +  oe_runmake clean
>>>> +  oe_runmake all
>>>> +}
>>>> +
>>>> +do_compile_append() {
>>>> +  sourceipk_do_create_srcipk
>>>> +}
>>>> +
>>>> +do_install() {
>>>> +    install -d ${D}${IPC_INSTALL_DIR_RECIPE}
>>>> +    cp -pPrf ${S}/* ${D}${IPC_INSTALL_DIR_RECIPE}
>>>> +
>>>> +    install -d ${D}${libdir}/firmware
>>>> +    find . -name "*.xe66" -type f | xargs -I {} install -m 0644 {} 
>>>> ${D}${libdir}/firmware/
>>>> +}
>>>> diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
>>>> new file mode 100644
>>>> index 0000000..d41796d
>>>> --- /dev/null
>>>> +++ b/recipes-ti/ipc/ti-ipc.inc
>>>> @@ -0,0 +1,26 @@
>>>> +DESCRIPTION = "TI Inter Process Communication (IPC) Mechanisms 
>>>> (for Uni- and Multi- Processor Configurations)"
>>>> +HOMEPAGE="http://processors.wiki.ti.com/index.php/Category:IPC"
>>>> +
>>>> +LICENSE = "BSD"
>>>> +LIC_FILES_CHKSUM = 
>>>> "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9b710fd7c95e545b91cec79255"
>>>> +
>>>> +BRANCH = "ipc-next"
>>>> +
>>>> +SRC_URI = 
>>>> "git://git.ti.com/ipc/ipcdev.git;protocol=git;branch=${BRANCH}"
>>>> +
>>>> +#Corresponds to 3.41.00.03_eng
>>>> +SRCREV = "354db7d3b6aa397e6ab4b86fdbd312746fd46a07"
>>>> +
>>>> +S = "${WORKDIR}/git"
>>>> +PV = "3.41.00.03"
>>>> +INC_PR = "r0"
>>>> +
>>>> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>>>> +
>>>> +PLATFORM = "UNKNOWN"
>>>> +PLATFORM_omap5-evm = "OMAP54XX"
>>>> +PLATFORM_dra7xx = "DRA7XX"
>>>> +PLATFORM_k2hk-evm = "TCI6638"
>>>> +PLATFORM_k2l-evm = "TCI6630"
>>>> +PLATFORM_k2e-evm = "66AK2E"
>>>> +PLATFORM_k2g-evm = "66AK2G"
>>>> diff --git a/recipes-ti/ipc/ti-ipc_git.bb 
>>>> b/recipes-ti/ipc/ti-ipc_git.bb
>>>> index a6b6a90..f98df66 100644
>>>> --- a/recipes-ti/ipc/ti-ipc_git.bb
>>>> +++ b/recipes-ti/ipc/ti-ipc_git.bb
>>>> @@ -1,32 +1,15 @@
>>>>   DESCRIPTION = "TI Inter Process Communication (IPC) Mechanisms 
>>>> (for Uni- and Multi- Processor Configurations)"
>>>> HOMEPAGE="http://processors.wiki.ti.com/index.php/Category:IPC"
>>>>   -LICENSE = "BSD"
>>>> -LIC_FILES_CHKSUM = 
>>>> "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9b710fd7c95e545b91cec79255"
>>>> +require ti-ipc.inc
>>>>   -DEPENDS += "virtual/kernel"
>>>> +PR = "${INC_PR}.0"
>>>>   -PV = "3.41.00.02"
>>>> +DEPENDS += "virtual/kernel"
>>>>   -BRANCH = "ipc-next"
>>>> -SRC_URI = 
>>>> "git://git.ti.com/ipc/ipcdev.git;protocol=git;branch=${BRANCH} \
>>>> -           file://tiipclad-daemon.sh \
>>>> -           file://0001-Add-kernel-build-dir.patch \
>>>> +SRC_URI += "file://tiipclad-daemon.sh \
>>>> +            file://0001-Add-kernel-build-dir.patch \
>>>>              "
>>>> -# Commit corresponds to 3.41.00.02-eng
>>>> -SRCREV = "b34c8ada4ed243cd52e504bf2c6fb3451dc730f8"
>>>> -
>>>> -S = "${WORKDIR}/git"
>>>> -
>>>> -PACKAGE_ARCH = "${MACHINE_ARCH}"
>>>> -
>>>> -PLATFORM = "UNKNOWN"
>>>> -PLATFORM_omap5-evm = "OMAP54XX"
>>>> -PLATFORM_dra7xx = "DRA7XX"
>>>> -PLATFORM_k2hk-evm = "TCI6638"
>>>> -PLATFORM_k2l-evm = "TCI6630"
>>>> -PLATFORM_k2e-evm = "66AK2E"
>>>> -PLATFORM_k2g-evm = "66AK2E"
>>>>     DAEMON = "UNKNOWN"
>>>>   DAEMON_omap5-evm = "lad_omap54xx_smp"
>>>> @@ -34,7 +17,7 @@ DAEMON_dra7xx = "lad_dra7xx"
>>>>   DAEMON_k2hk-evm = "lad_tci6638"
>>>>   DAEMON_k2l-evm = "lad_tci6630"
>>>>   DAEMON_k2e-evm = "lad_66ak2e"
>>>> -DAEMON_k2g-evm = "lad_66ak2e"
>>>> +DAEMON_k2g-evm = "lad_66ak2g"
>>>>     inherit autotools-brokensep pkgconfig update-rc.d
>>>>   --
>>>> 1.9.1
>>>>
>>>> -- 
>>>> _______________________________________________
>>>> meta-ti mailing list
>>>> meta-ti@yoctoproject.org
>>>> https://lists.yoctoproject.org/listinfo/meta-ti
>>> -- 
>>> _______________________________________________
>>> meta-ti mailing list
>>> meta-ti@yoctoproject.org
>>> https://lists.yoctoproject.org/listinfo/meta-ti
>
>


