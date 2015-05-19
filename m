Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3EEE6E0051B; Tue, 19 May 2015 11:03:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D01C6E0027F
	for <meta-ti@yoctoproject.org>; Tue, 19 May 2015 11:03:37 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4JI3Zkr031902
	for <meta-ti@yoctoproject.org>; Tue, 19 May 2015 13:03:35 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4JI3ZTQ022447
	for <meta-ti@yoctoproject.org>; Tue, 19 May 2015 13:03:35 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 19 May 2015 13:03:35 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4JI3ZHG030479;
	Tue, 19 May 2015 13:03:35 -0500
Message-ID: <555B7AF7.7040605@ti.com>
Date: Tue, 19 May 2015 14:03:35 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1432034821-22913-1-git-send-email-j-stiffler@ti.com>
	<20150519173908.GV31845@edge> <555B794D.3050403@ti.com>
	<20150519180100.GY31845@edge>
In-Reply-To: <20150519180100.GY31845@edge>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v2 1/3] debugss-module-drv: Add version 1.2.0
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
X-List-Received-Date: Tue, 19 May 2015 18:03:39 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 5/19/2015 2:01 PM, Denys Dmytriyenko wrote:
> On Tue, May 19, 2015 at 01:56:29PM -0400, Jacob Stiffler wrote:
>>
>> On 5/19/2015 1:39 PM, Denys Dmytriyenko wrote:
>>> On Tue, May 19, 2015 at 07:26:59AM -0400, Jacob Stiffler wrote:
>>>> * The debugss-module-drv is require for the dsptop utility.
>>>>
>>>> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>>>> ---
>>>> * v2 changes:
>>>>    - Add support for k2hk-evm
>>>>    - Reorganize file based on oe-stylize.
>>>>
>>>>   recipes-bsp/dsptop/debugss-module-drv_git.bb |   22 ++++++++++++++++++++++
>>>>   recipes-bsp/dsptop/dsptop.inc                |    8 ++++++++
>>>>   2 files changed, 30 insertions(+)
>>>>   create mode 100644 recipes-bsp/dsptop/debugss-module-drv_git.bb
>>>>   create mode 100644 recipes-bsp/dsptop/dsptop.inc
>>>>
>>>> diff --git a/recipes-bsp/dsptop/debugss-module-drv_git.bb b/recipes-bsp/dsptop/debugss-module-drv_git.bb
>>>> new file mode 100644
>>>> index 0000000..c4edb8d
>>>> --- /dev/null
>>>> +++ b/recipes-bsp/dsptop/debugss-module-drv_git.bb
>>>> @@ -0,0 +1,22 @@
>>>> +DESCRIPTION = "Debug Sub-System (DebugSS) driver for Keystone and DRA7xx devices"
>>>> +LICENSE = "GPLv2"
>>>> +LIC_FILES_CHKSUM = "file://COPYING.txt;md5=9d4316fe434ba450dca4da25348ca5a3"
>>>> +
>>>> +# This package builds a kernel module, use kernel PR as base and append a local
>>>> +MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
>>>> +PR = "${MACHINE_KERNEL_PR}"
>>>> +
>>>> +S = "${WORKDIR}/git/debugss_module/debugss-mod"
>>>> +
>>>> +inherit module
>>>> +
>>>> +PLATFORM = ""
>>>> +PLATFORM_dra7xx = "DRA7xx_PLATFORM"
>>>> +PLATFORM_k2hk-evm = "KEYSTONE_PLATFORM"
>>>> +
>>>> +EXTRA_OEMAKE = "'PLATFORM=${PLATFORM}'"
>>>> +
>>>> +COMPATIBLE_MACHINE = "dra7xx|k2hk-evm"
>>> So, is it really only limited to k2hk and not other Keystones?
>>>
>> I briefly looked through the source to get the platform options, and
>> I noticed that "K2H" is used in many of the #defines. Looking
>> closer, I see that KEYSTONE_PLATFORM appears to general to the
>> keystone family.
>>
>> In other recipes, DEVICE is used. This appears to be specific to
>> individual MACHINEs.
> Ok, can we use generic "keystone" SOC family when KEYSTONE_PLATFORM is used
> and a more stricter "k2hk-evm" machine when K2H DEVICE is used?
>

Sure. I'll make the changes in the v3.

>>>> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>>>> +
>>>> +include dsptop.inc
>>>> diff --git a/recipes-bsp/dsptop/dsptop.inc b/recipes-bsp/dsptop/dsptop.inc
>>>> new file mode 100644
>>>> index 0000000..4b9e3fa
>>>> --- /dev/null
>>>> +++ b/recipes-bsp/dsptop/dsptop.inc
>>>> @@ -0,0 +1,8 @@
>>>> +# This corresponds to version 1.2.0
>>>> +SRCREV = "9893486936626e2d3de721f429a67fcac8a68151"
>>>> +PV = "1.2.0"
>>>> +INC_PR = "r0"
>>>> +
>>>> +SRC_URI = "git://git.ti.com/sdo-emu/dsptop.git;protocol=git;branch=${BRANCH}"
>>>> +
>>>> +BRANCH = "master"
>>>> -- 
>>>> 1.7.9.5
>>>>
>>>> -- 
>>>> _______________________________________________
>>>> meta-ti mailing list
>>>> meta-ti@yoctoproject.org
>>>> https://lists.yoctoproject.org/listinfo/meta-ti


