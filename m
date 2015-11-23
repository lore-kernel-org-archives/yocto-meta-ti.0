Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D6B60E00985; Mon, 23 Nov 2015 11:19:55 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5A0A5E0076A
	for <meta-ti@yoctoproject.org>; Mon, 23 Nov 2015 11:19:51 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id tANJJp8J011019
	for <meta-ti@yoctoproject.org>; Mon, 23 Nov 2015 13:19:51 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tANJJpTw024626
	for <meta-ti@yoctoproject.org>; Mon, 23 Nov 2015 13:19:51 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 23 Nov 2015 13:19:51 -0600
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id tANJJo7P014642;
	Mon, 23 Nov 2015 13:19:50 -0600
Message-ID: <565366D6.8000306@ti.com>
Date: Mon, 23 Nov 2015 14:19:50 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>, Sam Nelson <sam.nelson@ti.com>
References: <1447991699-23623-1-git-send-email-sam.nelson@ti.com>	<20151123041421.GK18230@edge>
	<20151123171258.GM18230@edge>
In-Reply-To: <20151123171258.GM18230@edge>
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
X-List-Received-Date: Mon, 23 Nov 2015 19:19:55 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: quoted-printable

Our nightly succeeded with the new ti-ipc-rtos... I'll see if I can=20
recreate the issue with the arago-fido-config.

On 11/23/2015 12:12 PM, Denys Dmytriyenko wrote:
> Ping. Anyone looking into this one? Any ETA on a fix? This is blocking =
our
> nightly builds for am5/j6...
>
>
> On Sun, Nov 22, 2015 at 11:14:21PM -0500, Denys Dmytriyenko wrote:
>> Now it fails with this error:
>>
>>
>> DEBUG: Executing shell function do_compile
>> NOTE: make -j 12 PLATFORM=3DDRA7XX XDC_INSTALL_DIR=3D/home/jenkins/tis=
dk-build-fido-rt/build-CORTEX_1/arago-tmp-external-linaro-toolchain/sysro=
ots/am57xx-evm/usr/share/ti/ti-xdctools-tree BIOS_INSTALL_DIR=3D/home/jen=
kins/tisdk-build-fido-rt/build-CORTEX_1/arago-tmp-external-linaro-toolcha=
in/sysroots/am57xx-evm/usr/share/ti/ti-sysbios-tree gnu.targets.arm.A15F=3D=
/home/jenkins/tisdk-build-fido-rt/build-CORTEX_1/arago-tmp-external-linar=
o-toolchain/sysroots/x86_64-linux/usr/share/ti/gcc-arm-none-eabi ti.targe=
ts.elf.C66=3D/home/jenkins/tisdk-build-fido-rt/build-CORTEX_1/arago-tmp-e=
xternal-linaro-toolchain/sysroots/x86_64-linux/usr/share/ti/cgt-c6x ti.ta=
rgets.arm.elf.M4=3D/home/jenkins/tisdk-build-fido-rt/build-CORTEX_1/arago=
-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/share/ti/ti-cgt-=
arm ti.targets.arm.elf.M4F=3D/home/jenkins/tisdk-build-fido-rt/build-CORT=
EX_1/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/share/=
ti/ti-cgt-arm -f ipc-bios.mak clean
>> cleaning ipc packages ...
>> making clean: Sun Nov 22 06:06:32 EST 2015 ...
>> =3D=3D=3D=3D=3D=3D=3D=3D clean [./packages/ti/deh] =3D=3D=3D=3D=3D=3D=3D=
=3D
>> =3D=3D=3D=3D=3D=3D=3D=3D clean [./packages/ti/grcm] =3D=3D=3D=3D=3D=3D=
=3D=3D
>> making package.mak (because of package.bld) in order to clean ...
>> js: "/home/jenkins/tisdk-build-fido-rt/build-CORTEX_1/arago-tmp-extern=
al-linaro-toolchain/sysroots/am57xx-evm/usr/share/ti/ti-sysbios-tree/pack=
ages/gnu/targets/arm/ITarget.xs", line 63: Error: Directory '/home/jenkin=
s/tisdk-build-fido-rt/build-CORTEX_1/arago-tmp-external-linaro-toolchain/=
sysroots/x86_64-linux/usr/share/ti/gcc-arm-none-eabi/bin' cannot be found=
=2E Ensure that rootDir for the A15F target is set correctly in '/home/je=
nkins/tisdk-build-fido-rt/build-CORTEX_1/arago-tmp-external-linaro-toolch=
ain/work/am57xx_evm-linux-gnueabi/ti-ipc-rtos/3.41.00.03-r0.0/git/ipc-bio=
s.bld'.
>>      "/home/jenkins/tisdk-build-fido-rt/build-CORTEX_1/arago-tmp-exter=
nal-linaro-toolchain/sysroots/am57xx-evm/usr/share/ti/ti-sysbios-tree/pac=
kages/gnu/targets/_utils.xs", line 31
>>      "/home/jenkins/tisdk-build-fido-rt/build-CORTEX_1/arago-tmp-exter=
nal-linaro-toolchain/sysroots/am57xx-evm/usr/share/ti/ti-sysbios-tree/pac=
kages/gnu/targets/ITarget.xs", line 164
>> make[1]: *** Deleting file `package.mak'
>> =3D=3D=3D=3D=3D=3D=3D=3D clean [./packages/ti/ipc] =3D=3D=3D=3D=3D=3D=3D=
=3D
>> =3D=3D=3D=3D=3D=3D=3D=3D clean [./packages/ti/ipc/family/omap54xx] =3D=
=3D=3D=3D=3D=3D=3D=3D
>> =3D=3D=3D=3D=3D=3D=3D=3D clean [./packages/ti/ipc/family/omapl138] =3D=
=3D=3D=3D=3D=3D=3D=3D
>> =3D=3D=3D=3D=3D=3D=3D=3D clean [./packages/ti/ipc/family/tci6614] =3D=3D=
=3D=3D=3D=3D=3D=3D
>> =3D=3D=3D=3D=3D=3D=3D=3D clean [./packages/ti/ipc/family/tci6638] =3D=3D=
=3D=3D=3D=3D=3D=3D
>> =3D=3D=3D=3D=3D=3D=3D=3D clean [./packages/ti/ipc/family/vayu] =3D=3D=3D=
=3D=3D=3D=3D=3D
>> =3D=3D=3D=3D=3D=3D=3D=3D clean [./packages/ti/ipc/ipcmgr] =3D=3D=3D=3D=
=3D=3D=3D=3D
>> =3D=3D=3D=3D=3D=3D=3D=3D clean [./packages/ti/ipc/mm] =3D=3D=3D=3D=3D=3D=
=3D=3D
>> =3D=3D=3D=3D=3D=3D=3D=3D clean [./packages/ti/ipc/namesrv] =3D=3D=3D=3D=
=3D=3D=3D=3D
>> =3D=3D=3D=3D=3D=3D=3D=3D clean [./packages/ti/ipc/remoteproc] =3D=3D=3D=
=3D=3D=3D=3D=3D
>> =3D=3D=3D=3D=3D=3D=3D=3D clean [./packages/ti/ipc/rpmsg] =3D=3D=3D=3D=3D=
=3D=3D=3D
>> =3D=3D=3D=3D=3D=3D=3D=3D clean [./packages/ti/ipc/tests] =3D=3D=3D=3D=3D=
=3D=3D=3D
>> =3D=3D=3D=3D=3D=3D=3D=3D clean [./packages/ti/ipc/transports] =3D=3D=3D=
=3D=3D=3D=3D=3D
>> =3D=3D=3D=3D=3D=3D=3D=3D clean [./packages/ti/pm] =3D=3D=3D=3D=3D=3D=3D=
=3D
>> =3D=3D=3D=3D=3D=3D=3D=3D clean [./packages/ti/sdo/ipc] =3D=3D=3D=3D=3D=
=3D=3D=3D
>> =3D=3D=3D=3D=3D=3D=3D=3D clean [./packages/ti/sdo/ipc/family] =3D=3D=3D=
=3D=3D=3D=3D=3D
>> =3D=3D=3D=3D=3D=3D=3D=3D clean [./packages/ti/sdo/ipc/family/arctic] =3D=
=3D=3D=3D=3D=3D=3D=3D
>> =3D=3D=3D=3D=3D=3D=3D=3D clean [./packages/ti/sdo/ipc/family/c647x] =3D=
=3D=3D=3D=3D=3D=3D=3D
>> =3D=3D=3D=3D=3D=3D=3D=3D clean [./packages/ti/sdo/ipc/family/c6a8149] =
=3D=3D=3D=3D=3D=3D=3D=3D
>> =3D=3D=3D=3D=3D=3D=3D=3D clean [./packages/ti/sdo/ipc/family/da830] =3D=
=3D=3D=3D=3D=3D=3D=3D
>> =3D=3D=3D=3D=3D=3D=3D=3D clean [./packages/ti/sdo/ipc/family/dm6446] =3D=
=3D=3D=3D=3D=3D=3D=3D
>> =3D=3D=3D=3D=3D=3D=3D=3D clean [./packages/ti/sdo/ipc/family/omap3530]=
 =3D=3D=3D=3D=3D=3D=3D=3D
>> =3D=3D=3D=3D=3D=3D=3D=3D clean [./packages/ti/sdo/ipc/family/omap4430]=
 =3D=3D=3D=3D=3D=3D=3D=3D
>> =3D=3D=3D=3D=3D=3D=3D=3D clean [./packages/ti/sdo/ipc/family/tci663x] =
=3D=3D=3D=3D=3D=3D=3D=3D
>> =3D=3D=3D=3D=3D=3D=3D=3D clean [./packages/ti/sdo/ipc/family/tda3xx] =3D=
=3D=3D=3D=3D=3D=3D=3D
>> =3D=3D=3D=3D=3D=3D=3D=3D clean [./packages/ti/sdo/ipc/family/ti81xx] =3D=
=3D=3D=3D=3D=3D=3D=3D
>> =3D=3D=3D=3D=3D=3D=3D=3D clean [./packages/ti/sdo/ipc/family/vayu] =3D=
=3D=3D=3D=3D=3D=3D=3D
>> =3D=3D=3D=3D=3D=3D=3D=3D clean [./packages/ti/sdo/ipc/gates] =3D=3D=3D=
=3D=3D=3D=3D=3D
>> =3D=3D=3D=3D=3D=3D=3D=3D clean [./packages/ti/sdo/ipc/heaps] =3D=3D=3D=
=3D=3D=3D=3D=3D
>> =3D=3D=3D=3D=3D=3D=3D=3D clean [./packages/ti/sdo/ipc/interfaces] =3D=3D=
=3D=3D=3D=3D=3D=3D
>> =3D=3D=3D=3D=3D=3D=3D=3D clean [./packages/ti/sdo/ipc/notifyDrivers] =3D=
=3D=3D=3D=3D=3D=3D=3D
>> =3D=3D=3D=3D=3D=3D=3D=3D clean [./packages/ti/sdo/ipc/nsremote] =3D=3D=
=3D=3D=3D=3D=3D=3D
>> =3D=3D=3D=3D=3D=3D=3D=3D clean [./packages/ti/sdo/ipc/transports] =3D=3D=
=3D=3D=3D=3D=3D=3D
>> =3D=3D=3D=3D=3D=3D=3D=3D clean [./packages/ti/sdo/utils] =3D=3D=3D=3D=3D=
=3D=3D=3D
>> =3D=3D=3D=3D=3D=3D=3D=3D clean [./packages/ti/srvmgr] =3D=3D=3D=3D=3D=3D=
=3D=3D
>> =3D=3D=3D=3D=3D=3D=3D=3D clean [./packages/ti/srvmgr/omaprpc] =3D=3D=3D=
=3D=3D=3D=3D=3D
>> =3D=3D=3D=3D=3D=3D=3D=3D clean [./packages/ti/srvmgr/omx] =3D=3D=3D=3D=
=3D=3D=3D=3D
>> =3D=3D=3D=3D=3D=3D=3D=3D clean [./packages/ti/trace] =3D=3D=3D=3D=3D=3D=
=3D=3D
>> cleaning complete: Sun Nov 22 06:06:53 EST 2015.
>> NOTE: make -j 12 PLATFORM=3DDRA7XX XDC_INSTALL_DIR=3D/home/jenkins/tis=
dk-build-fido-rt/build-CORTEX_1/arago-tmp-external-linaro-toolchain/sysro=
ots/am57xx-evm/usr/share/ti/ti-xdctools-tree BIOS_INSTALL_DIR=3D/home/jen=
kins/tisdk-build-fido-rt/build-CORTEX_1/arago-tmp-external-linaro-toolcha=
in/sysroots/am57xx-evm/usr/share/ti/ti-sysbios-tree gnu.targets.arm.A15F=3D=
/home/jenkins/tisdk-build-fido-rt/build-CORTEX_1/arago-tmp-external-linar=
o-toolchain/sysroots/x86_64-linux/usr/share/ti/gcc-arm-none-eabi ti.targe=
ts.elf.C66=3D/home/jenkins/tisdk-build-fido-rt/build-CORTEX_1/arago-tmp-e=
xternal-linaro-toolchain/sysroots/x86_64-linux/usr/share/ti/cgt-c6x ti.ta=
rgets.arm.elf.M4=3D/home/jenkins/tisdk-build-fido-rt/build-CORTEX_1/arago=
-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/share/ti/ti-cgt-=
arm ti.targets.arm.elf.M4F=3D/home/jenkins/tisdk-build-fido-rt/build-CORT=
EX_1/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/share/=
ti/ti-cgt-arm -f ipc-bios.mak all
>> building ipc packages ...
>> making all: Sun Nov 22 06:06:53 EST 2015 ...
>> =3D=3D=3D=3D=3D=3D=3D=3D .interfaces [./packages/ti/deh/] =3D=3D=3D=3D=
=3D=3D=3D=3D
>> making package.mak (because of package.bld) ...
>> generating interfaces for package ti.deh (because package/package.xdc.=
inc is older than package.xdc) ...
>>      translating Deh
>>      translating StackDbg
>>      translating Watchdog
>> =3D=3D=3D=3D=3D=3D=3D=3D .interfaces [./packages/ti/grcm/] =3D=3D=3D=3D=
=3D=3D=3D=3D
>> making package.mak (because of package.bld) ...
>> js: "/home/jenkins/tisdk-build-fido-rt/build-CORTEX_1/arago-tmp-extern=
al-linaro-toolchain/sysroots/am57xx-evm/usr/share/ti/ti-sysbios-tree/pack=
ages/gnu/targets/arm/ITarget.xs", line 63: Error: Directory '/home/jenkin=
s/tisdk-build-fido-rt/build-CORTEX_1/arago-tmp-external-linaro-toolchain/=
sysroots/x86_64-linux/usr/share/ti/gcc-arm-none-eabi/bin' cannot be found=
=2E Ensure that rootDir for the A15F target is set correctly in '/home/je=
nkins/tisdk-build-fido-rt/build-CORTEX_1/arago-tmp-external-linaro-toolch=
ain/work/am57xx_evm-linux-gnueabi/ti-ipc-rtos/3.41.00.03-r0.0/git/ipc-bio=
s.bld'.
>>      "/home/jenkins/tisdk-build-fido-rt/build-CORTEX_1/arago-tmp-exter=
nal-linaro-toolchain/sysroots/am57xx-evm/usr/share/ti/ti-sysbios-tree/pac=
kages/gnu/targets/_utils.xs", line 31
>>      "/home/jenkins/tisdk-build-fido-rt/build-CORTEX_1/arago-tmp-exter=
nal-linaro-toolchain/sysroots/am57xx-evm/usr/share/ti/ti-sysbios-tree/pac=
kages/gnu/targets/ITarget.xs", line 164
>> make[1]: *** Deleting file `package.mak'
>> make[1]: *** No rule to make target `package.mak', needed by `.interfa=
ces'.  Stop.
>> gmake: *** [packages/ti/grcm/,.interfaces] Error 2
>> make: *** [all] Error 2
>> ERROR: oe_runmake failed
>> WARNING: /home/jenkins/tisdk-build-fido-rt/build-CORTEX_1/arago-tmp-ex=
ternal-linaro-toolchain/work/am57xx_evm-linux-gnueabi/ti-ipc-rtos/3.41.00=
=2E03-r0.0/temp/run.do_compile.10937:1 exit 1 from
>>    exit 1
>> ERROR: Function failed: do_compile (log file is located at /home/jenki=
ns/tisdk-build-fido-rt/build-CORTEX_1/arago-tmp-external-linaro-toolchain=
/work/am57xx_evm-linux-gnueabi/ti-ipc-rtos/3.41.00.03-r0.0/temp/log.do_co=
mpile.10937)
>>
>>
>> On Thu, Nov 19, 2015 at 10:54:59PM -0500, Sam Nelson wrote:
>>> - Update to new version of IPC: 3.41.0.3_eng
>>> - Add recipe to build ti-ipc-rtos from git repo
>>> - Remove K2G hack
>>>
>>> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
>>>
>>> ---
>>> Changes from the previous version of the patch
>>> - Fix dependency of according to platform
>>> - Moved -f ipc-bios.make to EXTRA_OE_MAKE
>>> ---
>>> ---
>>>   recipes-ti/ipc/ti-ipc-rtos.inc           | 19 -----------
>>>   recipes-ti/ipc/ti-ipc-rtos_3.40.01.08.bb |  9 ------
>>>   recipes-ti/ipc/ti-ipc-rtos_git.bb        | 55 +++++++++++++++++++++=
+++++++++++
>>>   recipes-ti/ipc/ti-ipc.inc                | 26 +++++++++++++++
>>>   recipes-ti/ipc/ti-ipc_git.bb             | 29 ++++-------------
>>>   5 files changed, 87 insertions(+), 51 deletions(-)
>>>   delete mode 100644 recipes-ti/ipc/ti-ipc-rtos.inc
>>>   delete mode 100644 recipes-ti/ipc/ti-ipc-rtos_3.40.01.08.bb
>>>   create mode 100644 recipes-ti/ipc/ti-ipc-rtos_git.bb
>>>   create mode 100644 recipes-ti/ipc/ti-ipc.inc
>>>
>>> diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-r=
tos.inc
>>> deleted file mode 100644
>>> index d14c756..0000000
>>> --- a/recipes-ti/ipc/ti-ipc-rtos.inc
>>> +++ /dev/null
>>> @@ -1,19 +0,0 @@
>>> -DESCRIPTION =3D "TI Inter Process Communication (IPC) Mechanisms (fo=
r Uni- and Multi- Processor Configurations)"
>>> -HOMEPAGE=3D"http://processors.wiki.ti.com/index.php/Category:IPC"
>>> -
>>> -LICENSE =3D "BSD"
>>> -
>>> -require recipes-ti/includes/ti-paths.inc
>>> -require recipes-ti/includes/ti-staging.inc
>>> -
>>> -SRC_URI =3D "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/ta=
rgetcontent/ipc/${PV}/exports/ipc_${PV}.zip;name=3Dipczip"
>>> -
>>> -S =3D "${WORKDIR}/ipc_${PV}"
>>> -
>>> -do_install() {
>>> -    install -d ${D}${IPC_INSTALL_DIR_RECIPE}
>>> -    cp -pPrf ${S}/* ${D}${IPC_INSTALL_DIR_RECIPE}
>>> -}
>>> -
>>> -ALLOW_EMPTY_${PN} =3D "1"
>>> -FILES_${PN}-dev +=3D "${IPC_INSTALL_DIR_RECIPE}"
>>> diff --git a/recipes-ti/ipc/ti-ipc-rtos_3.40.01.08.bb b/recipes-ti/ip=
c/ti-ipc-rtos_3.40.01.08.bb
>>> deleted file mode 100644
>>> index 7c93695..0000000
>>> --- a/recipes-ti/ipc/ti-ipc-rtos_3.40.01.08.bb
>>> +++ /dev/null
>>> @@ -1,9 +0,0 @@
>>> -require ti-ipc-rtos.inc
>>> -
>>> -PV =3D "3_40_01_08"
>>> -PR =3D "r0"
>>> -
>>> -LIC_FILES_CHKSUM =3D "file://${S}/ipc-linux.mak;beginline=3D1;endlin=
e=3D30;md5=3D7b327f9b710fd7c95e545b91cec79255"
>>> -
>>> -SRC_URI[ipczip.md5sum] =3D "738e1d54da9fab94899ad162f1ad78de"
>>> -SRC_URI[ipczip.sha256sum] =3D "8cc7d40ad7eab916eae109b355dc7e7876c6a=
b82e3b40bf5b6bf60474312d6cf"
>>> diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bb b/recipes-ti/ipc/ti-ip=
c-rtos_git.bb
>>> new file mode 100644
>>> index 0000000..2e9dba1
>>> --- /dev/null
>>> +++ b/recipes-ti/ipc/ti-ipc-rtos_git.bb
>>> @@ -0,0 +1,55 @@
>>> +require recipes-ti/includes/ti-paths.inc
>>> +require recipes-ti/includes/ti-staging.inc
>>> +require ti-ipc.inc
>>> +
>>> +PR =3D "${INC_PR}.0"
>>> +
>>> +DEPENDS =3D "ti-xdctools ti-sysbios"
>>> +DEPENDS_append_keystone +=3D "ti-cgt6x-native gcc-arm-none-eabi-nati=
ve"
>>> +DEPENDS_append_omap-15 +=3D "ti-cgt6x-native ti-ccsv6-native gcc-arm=
-none-eabi-native"
>>> +
>>> +PACKAGES =3D+ "${PN}-fw"
>>> +FILES_${PN}-fw =3D "${libdir}/firmware/*"
>>> +FILES_${PN}-dev +=3D "${IPC_INSTALL_DIR_RECIPE}"
>>> +
>>> +INSANE_SKIP_${PN}-fw +=3D "arch"
>>> +INSANE_SKIP_${PN}-dev +=3D "arch"
>>> +
>>> +ALLOW_EMPTY_${PN} =3D "1"
>>> +
>>> +IPC_TARGETS =3D ""
>>> +IPC_TARGETS_omap-a15 =3D "\
>>> +    gnu.targets.arm.A15F=3D"${GCC_ARM_NONE_TOOLCHAIN}" \
>>> +    ti.targets.elf.C66=3D"${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x=
" \
>>> +    ti.targets.arm.elf.M4=3D"${M4_TOOLCHAIN_INSTALL_DIR}" \
>>> +    ti.targets.arm.elf.M4F=3D"${M4_TOOLCHAIN_INSTALL_DIR}" \
>>> +"
>>> +
>>> +IPC_TARGETS_keystone =3D " \
>>> +    gnu.targets.arm.A15F=3D"${GCC_ARM_NONE_TOOLCHAIN}" \
>>> +    ti.targets.elf.C66=3D"${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x=
" \
>>> +"
>>> +
>>> +EXTRA_OEMAKE =3D "\
>>> +    PLATFORM=3D${PLATFORM} \
>>> +    XDC_INSTALL_DIR=3D"${XDC_INSTALL_DIR}" \
>>> +    BIOS_INSTALL_DIR=3D"${SYSBIOS_INSTALL_DIR}" \
>>> +    ${IPC_TARGETS} -f ipc-bios.mak\
>>> +"
>>> +
>>> +do_compile() {
>>> +  oe_runmake clean
>>> +  oe_runmake all
>>> +}
>>> +
>>> +do_compile_append() {
>>> +  sourceipk_do_create_srcipk
>>> +}
>>> +
>>> +do_install() {
>>> +    install -d ${D}${IPC_INSTALL_DIR_RECIPE}
>>> +    cp -pPrf ${S}/* ${D}${IPC_INSTALL_DIR_RECIPE}
>>> +
>>> +    install -d ${D}${libdir}/firmware
>>> +    find . -name "*.xe66" -type f | xargs -I {} install -m 0644 {} $=
{D}${libdir}/firmware/
>>> +}
>>> diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
>>> new file mode 100644
>>> index 0000000..d41796d
>>> --- /dev/null
>>> +++ b/recipes-ti/ipc/ti-ipc.inc
>>> @@ -0,0 +1,26 @@
>>> +DESCRIPTION =3D "TI Inter Process Communication (IPC) Mechanisms (fo=
r Uni- and Multi- Processor Configurations)"
>>> +HOMEPAGE=3D"http://processors.wiki.ti.com/index.php/Category:IPC"
>>> +
>>> +LICENSE =3D "BSD"
>>> +LIC_FILES_CHKSUM =3D "file://${S}/ipc-linux.mak;beginline=3D1;endlin=
e=3D30;md5=3D7b327f9b710fd7c95e545b91cec79255"
>>> +
>>> +BRANCH =3D "ipc-next"
>>> +
>>> +SRC_URI =3D "git://git.ti.com/ipc/ipcdev.git;protocol=3Dgit;branch=3D=
${BRANCH}"
>>> +
>>> +#Corresponds to 3.41.00.03_eng
>>> +SRCREV =3D "354db7d3b6aa397e6ab4b86fdbd312746fd46a07"
>>> +
>>> +S =3D "${WORKDIR}/git"
>>> +PV =3D "3.41.00.03"
>>> +INC_PR =3D "r0"
>>> +
>>> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>> +
>>> +PLATFORM =3D "UNKNOWN"
>>> +PLATFORM_omap5-evm =3D "OMAP54XX"
>>> +PLATFORM_dra7xx =3D "DRA7XX"
>>> +PLATFORM_k2hk-evm =3D "TCI6638"
>>> +PLATFORM_k2l-evm =3D "TCI6630"
>>> +PLATFORM_k2e-evm =3D "66AK2E"
>>> +PLATFORM_k2g-evm =3D "66AK2G"
>>> diff --git a/recipes-ti/ipc/ti-ipc_git.bb b/recipes-ti/ipc/ti-ipc_git=
=2Ebb
>>> index a6b6a90..f98df66 100644
>>> --- a/recipes-ti/ipc/ti-ipc_git.bb
>>> +++ b/recipes-ti/ipc/ti-ipc_git.bb
>>> @@ -1,32 +1,15 @@
>>>   DESCRIPTION =3D "TI Inter Process Communication (IPC) Mechanisms (f=
or Uni- and Multi- Processor Configurations)"
>>>   HOMEPAGE=3D"http://processors.wiki.ti.com/index.php/Category:IPC"
>>>  =20
>>> -LICENSE =3D "BSD"
>>> -LIC_FILES_CHKSUM =3D "file://${S}/ipc-linux.mak;beginline=3D1;endlin=
e=3D30;md5=3D7b327f9b710fd7c95e545b91cec79255"
>>> +require ti-ipc.inc
>>>  =20
>>> -DEPENDS +=3D "virtual/kernel"
>>> +PR =3D "${INC_PR}.0"
>>>  =20
>>> -PV =3D "3.41.00.02"
>>> +DEPENDS +=3D "virtual/kernel"
>>>  =20
>>> -BRANCH =3D "ipc-next"
>>> -SRC_URI =3D "git://git.ti.com/ipc/ipcdev.git;protocol=3Dgit;branch=3D=
${BRANCH} \
>>> -           file://tiipclad-daemon.sh \
>>> -           file://0001-Add-kernel-build-dir.patch \
>>> +SRC_URI +=3D "file://tiipclad-daemon.sh \
>>> +            file://0001-Add-kernel-build-dir.patch \
>>>              "
>>> -# Commit corresponds to 3.41.00.02-eng
>>> -SRCREV =3D "b34c8ada4ed243cd52e504bf2c6fb3451dc730f8"
>>> -
>>> -S =3D "${WORKDIR}/git"
>>> -
>>> -PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>> -
>>> -PLATFORM =3D "UNKNOWN"
>>> -PLATFORM_omap5-evm =3D "OMAP54XX"
>>> -PLATFORM_dra7xx =3D "DRA7XX"
>>> -PLATFORM_k2hk-evm =3D "TCI6638"
>>> -PLATFORM_k2l-evm =3D "TCI6630"
>>> -PLATFORM_k2e-evm =3D "66AK2E"
>>> -PLATFORM_k2g-evm =3D "66AK2E"
>>>  =20
>>>   DAEMON =3D "UNKNOWN"
>>>   DAEMON_omap5-evm =3D "lad_omap54xx_smp"
>>> @@ -34,7 +17,7 @@ DAEMON_dra7xx =3D "lad_dra7xx"
>>>   DAEMON_k2hk-evm =3D "lad_tci6638"
>>>   DAEMON_k2l-evm =3D "lad_tci6630"
>>>   DAEMON_k2e-evm =3D "lad_66ak2e"
>>> -DAEMON_k2g-evm =3D "lad_66ak2e"
>>> +DAEMON_k2g-evm =3D "lad_66ak2g"
>>>  =20
>>>   inherit autotools-brokensep pkgconfig update-rc.d
>>>  =20
>>> --=20
>>> 1.9.1
>>>
>>> --=20
>>> _______________________________________________
>>> meta-ti mailing list
>>> meta-ti@yoctoproject.org
>>> https://lists.yoctoproject.org/listinfo/meta-ti
>> --=20
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti



