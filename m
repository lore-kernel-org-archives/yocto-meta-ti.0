Return-Path: <hzhang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 974E2E00BA1; Fri, 16 May 2014 12:37:47 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=RCVD_IN_DNSWL_HI,RDNS_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from comal.ext.ti.com (unknown [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CDD7FE006EC
	for <meta-ti@yoctoproject.org>; Fri, 16 May 2014 12:37:43 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4GJbgpx005534
	for <meta-ti@yoctoproject.org>; Fri, 16 May 2014 14:37:42 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4GJbgOV025287
	for <meta-ti@yoctoproject.org>; Fri, 16 May 2014 14:37:42 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 16 May 2014 14:37:42 -0500
Received: from [158.218.103.104] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4GJbgG9032615;
	Fri, 16 May 2014 14:37:42 -0500
Message-ID: <53766905.6080308@ti.com>
Date: Fri, 16 May 2014 15:37:41 -0400
From: Hao Zhang <hzhang@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1400267639-24448-1-git-send-email-hzhang@ti.com>
	<20140516192150.GH18053@edge>
In-Reply-To: <20140516192150.GH18053@edge>
X-Enigmail-Version: 1.6
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 2/3] keystone: k2l-evm conf: add k2l-evm machine config
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
X-List-Received-Date: Fri, 16 May 2014 19:37:47 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 5/16/2014 3:21 PM, Denys Dmytriyenko wrote:
> On Fri, May 16, 2014 at 03:13:59PM -0400, hzhang@ti.com wrote:
>> From: Hao Zhang <hzhang@ti.com>
>>
>> k2l-evm machine config shares the same Keystone SoC family, it has K2L EVM
>> specific machine configuration for UBI image, boot monitor, U-boot, etc.
>>
>> Signed-off-by: Hao Zhang <hzhang@ti.com>
>> ---
>>  conf/machine/include/keystone.inc            |    2 --
>>  conf/machine/k2hk-evm.conf                   |    4 ++++
>>  conf/machine/k2l-evm.conf                    |   30 ++++++++++++++++++++++++++
>>  recipes-bsp/boot-monitor/boot-monitor_git.bb |    9 ++++----
>>  4 files changed, 38 insertions(+), 7 deletions(-)
>>  create mode 100644 conf/machine/k2l-evm.conf
>>
>> diff --git a/conf/machine/include/keystone.inc b/conf/machine/include/keystone.inc
>> index 63f069c..a9449b2 100644
>> --- a/conf/machine/include/keystone.inc
>> +++ b/conf/machine/include/keystone.inc
>> @@ -12,8 +12,6 @@ MACHINE_KERNEL_PR = "r7"
>>  
>>  KERNEL_IMAGETYPE = "uImage"
>>  
>> -UBOOT_MACHINE = "k2hk_evm_config"
>> -
>>  UBOOT_ENTRYPOINT = "0x80008000"
>>  UBOOT_LOADADDRESS = "0x80008000"
>>  
>> diff --git a/conf/machine/k2hk-evm.conf b/conf/machine/k2hk-evm.conf
>> index 088e524..2885335 100644
>> --- a/conf/machine/k2hk-evm.conf
>> +++ b/conf/machine/k2hk-evm.conf
>> @@ -4,6 +4,10 @@
>>  
>>  require conf/machine/include/keystone.inc
>>  
>> +UBOOT_MACHINE = "k2hk_evm_config"
>> +
>> +BOOT_MONITOR_MAKE_TARGET = "k2hk"
>> +
>>  IMAGE_FSTYPES += "ubi tar.gz cpio"
>>  
>>  SERIAL_CONSOLE = "115200 ttyS0"
>> diff --git a/conf/machine/k2l-evm.conf b/conf/machine/k2l-evm.conf
>> new file mode 100644
>> index 0000000..0824a09
>> --- /dev/null
>> +++ b/conf/machine/k2l-evm.conf
>> @@ -0,0 +1,30 @@
>> +#@TYPE: Machine
>> +#@NAME: Keystone 2 K2L machine
>> +#@DESCRIPTION: Machine configuration for the TI Keystone 2 K2L EVM
> 
> Same comment as to #1 - find-copies-harder would have detected this file being 
> very similar to the original, making review much easier.
> 
> 

K2L has different UBI configuration since it has a different NAND
device, I guess that's why git does not detect the file being copied.

>> +require conf/machine/include/keystone.inc
>> +
>> +UBOOT_MACHINE = "k2l_evm_config"
>> +
>> +BOOT_MONITOR_MAKE_TARGET = "k2hk"
>> +
>> +IMAGE_FSTYPES += "ubi tar.gz cpio"
>> +
>> +SERIAL_CONSOLE = "115200 ttyS0"
>> +
>> +SYSVINIT_ENABLED_GETTYS = ""
>> +
>> +# do ubiattach /dev/ubi_ctrl -m 4
>> +# From dmesg:
>> +# UBI: smallest flash I/O unit:    4096
>> +# UBI: logical eraseblock size:    253952 bytes
>> +# from ubiattach stdout:
>> +# UBI device number 0, total 1926 LEBs
>> +MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 1926"
>> +
>> +# do ubiattach /dev/ubi_ctrl -m 4
>> +# from dmesg:
>> +# UBI: smallest flash I/O unit:    4096
>> +# UBI: physical eraseblock size:   256 KiB
>> +# UBI: sub-page size:              4096
>> +UBINIZE_ARGS = "-m 4096 -p 256KiB -s 4096 -O 4096"
>> diff --git a/recipes-bsp/boot-monitor/boot-monitor_git.bb b/recipes-bsp/boot-monitor/boot-monitor_git.bb
>> index 0b559fa..0761d83 100644
>> --- a/recipes-bsp/boot-monitor/boot-monitor_git.bb
>> +++ b/recipes-bsp/boot-monitor/boot-monitor_git.bb
>> @@ -5,23 +5,22 @@ LICENSE = "BSD"
>>  
>>  BOOT_MONITOR_BINARY ?= "skern.bin"
>>  BOOT_MONITOR_IMAGE  ?= "skern-${MACHINE}.bin"
>> -BOOT_MONITOR_MAKE_TARGET  ?= "all"
>>  
>>  LIC_FILES_CHKSUM = "file://COPYING;md5=25fe219a6febf6e5bb45beda1b2eb315"
>>  
>> -COMPATIBLE_MACHINE = "k2hk-evm"
>> +COMPATIBLE_MACHINE = "k2hk-evm|k2l-evm"
> 
> Just do the entire SOC family:
> COMPATIBLE_MACHINE = "keystone"
> 
> 

Will use keystone machine name.

>>  SRC_URI = "git://git.ti.com/keystone-linux/boot-monitor.git;protocol=git;branch=${BRANCH}"
>>  
>>  PV = "2.0"
>> -PR = "r0+gitr${SRCPV}"
>> +PR = "r1+gitr${SRCPV}"
>>  
>>  BRANCH = "master"
>>  
>>  S = "${WORKDIR}/git"
>>  
>> -#Tag "K2_BM_13.11"
>> -SRCREV = "ba597d183423971e63295cdd59d3c90245e9170a"
>> +#Tag "K2_BM_14.05"
>> +SRCREV = "0e3ffe1ea4a0cee38ae2406901b7cf4d5324b5e9"
>>  
>>  do_compile () {
>>  	unset LDFLAGS
>> -- 
>> 1.7.9.5
>>
>> -- 
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti


