Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BFDC9E00B44; Tue, 24 Nov 2015 11:29:00 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 035D8E00B44
	for <meta-ti@yoctoproject.org>; Tue, 24 Nov 2015 11:28:56 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id tAOJSsma010044;
	Tue, 24 Nov 2015 13:28:54 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAOJSsKt019264;
	Tue, 24 Nov 2015 13:28:54 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 24 Nov 2015 13:28:54 -0600
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAOJSr3q025122;
	Tue, 24 Nov 2015 13:28:54 -0600
Message-ID: <5654BA75.7020801@ti.com>
Date: Tue, 24 Nov 2015 14:28:53 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1448392297-15733-1-git-send-email-denis@denix.org>
	<5654B81E.30500@ti.com> <20151124192102.GQ18230@edge>
In-Reply-To: <20151124192102.GQ18230@edge>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] pmmc-fw: add initial PMMC firmware binary
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
X-List-Received-Date: Tue, 24 Nov 2015 19:29:00 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 11/24/2015 2:21 PM, Denys Dmytriyenko wrote:
> I had the same question, but I don't have an answer yet. Right now I'm running
> with the assumption it's not required, as we don't place any other FW images
> in deploy.

Since this image is needed to boot linux (along with dtb and zImage), 
this will need to be in the SDK's "prebuilt-images". I'm not sure how to 
get images there other than through DEPLOY_DIR_IMAGE.

>
> On Tue, Nov 24, 2015 at 02:18:54PM -0500, Jacob Stiffler wrote:
>> Will this firmware be placed in the DEPLOY_DIR_IMAGES?
>>
>> On 11/24/2015 2:11 PM, Denys Dmytriyenko wrote:
>>> From: Denys Dmytriyenko <denys@ti.com>
>>>
>>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>>> ---
>>>   recipes-bsp/pmmc-fw/pmmc-fw_git.bb | 27 +++++++++++++++++++++++++++
>>>   1 file changed, 27 insertions(+)
>>>   create mode 100644 recipes-bsp/pmmc-fw/pmmc-fw_git.bb
>>>
>>> diff --git a/recipes-bsp/pmmc-fw/pmmc-fw_git.bb b/recipes-bsp/pmmc-fw/pmmc-fw_git.bb
>>> new file mode 100644
>>> index 0000000..0363bf6
>>> --- /dev/null
>>> +++ b/recipes-bsp/pmmc-fw/pmmc-fw_git.bb
>>> @@ -0,0 +1,27 @@
>>> +DESCRIPTION = "PMMC firmware"
>>> +
>>> +LICENSE = "TI-TFL"
>>> +LIC_FILES_CHKSUM = "file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c"
>>> +
>>> +PR = "r0"
>>> +
>>> +CLEANBROKEN = "1"
>>> +
>>> +COMPATIBLE_MACHINE = "k2g-evm"
>>> +
>>> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>>> +
>>> +SRCREV = "474abaf61ef4778df84b74c4a50f740149b38115"
>>> +BRANCH ?= "master"
>>> +
>>> +SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
>>> +
>>> +S = "${WORKDIR}/git"
>>> +TARGET = "pmmc-firmware.bin"
>>> +
>>> +do_install() {
>>> +	mkdir -p ${D}/boot
>>> +	cp ${S}/ti-keystone/${TARGET} ${D}/boot/${TARGET}
>>> +}
>>> +
>>> +FILES_${PN} = "/boot"
>> -- 
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti


