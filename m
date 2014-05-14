Return-Path: <hzhang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 35794E00B83; Wed, 14 May 2014 12:00:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=RCVD_IN_DNSWL_HI,RDNS_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Greylist: delayed 70 seconds by postgrey-1.32 at yocto-www;
	Wed, 14 May 2014 12:00:01 PDT
Received: from comal.ext.ti.com (unknown [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E5501E00B83
	for <meta-ti@yoctoproject.org>; Wed, 14 May 2014 12:00:01 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4EIwopY025495
	for <meta-ti@yoctoproject.org>; Wed, 14 May 2014 13:58:51 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4EIwojg008199
	for <meta-ti@yoctoproject.org>; Wed, 14 May 2014 13:58:50 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 14 May 2014 13:58:50 -0500
Received: from [158.218.103.104] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4EIwoij009766;
	Wed, 14 May 2014 13:58:50 -0500
Message-ID: <5373BCEB.9020808@ti.com>
Date: Wed, 14 May 2014 14:58:51 -0400
From: Hao Zhang <hzhang@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1400092189-13946-1-git-send-email-hzhang@ti.com>
	<20140514184018.GO18053@edge>
In-Reply-To: <20140514184018.GO18053@edge>
X-Enigmail-Version: 1.6
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] boot-monitor: add K2L and K2E boot monitor build support
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
X-List-Received-Date: Wed, 14 May 2014 19:00:05 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 5/14/2014 2:40 PM, Denys Dmytriyenko wrote:
> On Wed, May 14, 2014 at 02:29:49PM -0400, hzhang@ti.com wrote:
>> From: Hao Zhang <hzhang@ti.com>
>>
>> ---
>>  recipes-bsp/boot-monitor/boot-monitor_git.bb |   18 +++++++++++++-----
>>  1 file changed, 13 insertions(+), 5 deletions(-)
>>
>> diff --git a/recipes-bsp/boot-monitor/boot-monitor_git.bb b/recipes-bsp/boot-monitor/boot-monitor_git.bb
>> index 7c5e9cf..2c3aa43 100644
>> --- a/recipes-bsp/boot-monitor/boot-monitor_git.bb
>> +++ b/recipes-bsp/boot-monitor/boot-monitor_git.bb
>> @@ -3,8 +3,12 @@ EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX}"
>>  
>>  LICENSE = "BSD"
>>  
>> -BOOT_MONITOR_BINARY ?= "skern.bin"
>> -BOOT_MONITOR_IMAGE  ?= "skern-${MACHINE}.bin"
>> +BOOT_MONITOR_BINARY_K2HK ?= "skern-k2hk.bin"
>> +BOOT_MONITOR_IMAGE_k2HK  ?= "skern-k2hk-${MACHINE}.bin"
>> +BOOT_MONITOR_BINARY_K2L ?= "skern-k2l.bin"
>> +BOOT_MONITOR_IMAGE_k2L  ?= "skern-k2l-${MACHINE}.bin"
>> +BOOT_MONITOR_BINARY_K2E ?= "skern-k2e.bin"
>> +BOOT_MONITOR_IMAGE_k2E  ?= "skern-k2e-${MACHINE}.bin"
> 
> Have you tested it? You mix case in the above variables - one has K2HK 
> uppercase, another has k2HK lowercase. Same for k2l...
> 
> 

Yes, I tested it. I will correct the lowercase error and re-submit the
patch.

>>  BOOT_MONITOR_MAKE_TARGET  ?= "all"
>>  
>>  LIC_FILES_CHKSUM = "file://COPYING;md5=25fe219a6febf6e5bb45beda1b2eb315"
>> @@ -14,7 +18,7 @@ COMPATIBLE_MACHINE = "keystone-evm"
>>  SRC_URI = "git://git.ti.com/keystone-linux/boot-monitor.git;protocol=git;branch=${BRANCH}"
>>  
>>  PV = "2.0"
>> -PR = "r0+gitr${SRCPV}"
>> +PR = "r1+gitr${SRCPV}"
>>  
>>  BRANCH = "master"
>>  
>> @@ -27,7 +31,9 @@ do_compile () {
>>  	unset LDFLAGS
>>  	unset CFLAGS
>>  	unset CPPFLAGS
>> -	oe_runmake ${BOOT_MONITOR_MAKE_TARGET}
>> +	oe_runmake k2hk
>> +	oe_runmake k2l
>> +	oe_runmake k2e
>>  }
>>  
>>  inherit deploy
>> @@ -36,5 +42,7 @@ addtask deploy before do_build after do_compile
>>  
>>  do_deploy () {
>>  	install -d ${DEPLOYDIR}
>> -	install ${S}/${BOOT_MONITOR_BINARY} ${DEPLOYDIR}/${BOOT_MONITOR_IMAGE}
>> +	install ${S}/${BOOT_MONITOR_BINARY_K2HK} ${DEPLOYDIR}/${BOOT_MONITOR_IMAGE_K2HK}
>> +	install ${S}/${BOOT_MONITOR_BINARY_K2L}	${DEPLOYDIR}/${BOOT_MONITOR_IMAGE_K2L}
>> +	install ${S}/${BOOT_MONITOR_BINARY_K2E}	${DEPLOYDIR}/${BOOT_MONITOR_IMAGE_K2E}
>>  }
>> -- 
>> 1.7.9.5
>>
>> -- 
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti


