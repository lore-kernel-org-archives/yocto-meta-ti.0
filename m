Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D5B7DE00B0B; Wed, 26 Apr 2017 04:20:56 -0700 (PDT)
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
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EAAD3E00B03
	for <meta-ti@yoctoproject.org>; Wed, 26 Apr 2017 04:20:53 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3QBKq7n026015
	for <meta-ti@yoctoproject.org>; Wed, 26 Apr 2017 06:20:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493205652;
	bh=BG2IYeYFamqtomvNRAQjL4hAG3uc/X3Mb2GKcTG5CTA=;
	h=Subject:To:References:CC:From:Date:In-Reply-To;
	b=m0BO1jvDdvy9cPrGcZh/lvIo9uLIlqcuM1TtZE6h8kUO84xm0IYbZyUk4FuEIgt8a
	SdxWYec9yHQzh9ogO4YhgSbwPSVpuMrc5tvTl+ochxTr88yZtFMqUdo8+9Ackm9E7g
	CFBhql8/ILV0xXFJiJ0XtizYrJIz+/z7IxENWUUQ=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3QBKqeW023693
	for <meta-ti@yoctoproject.org>; Wed, 26 Apr 2017 06:20:52 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 26 Apr 2017 06:20:52 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3QBKput020793;
	Wed, 26 Apr 2017 06:20:52 -0500
To: Karthik Ramanan <a0393906@ti.com>, "Pang, Ivan" <i-pang@ti.com>,
	"Dmytriyenko, Denys" <denys@ti.com>, "R, Karthik" <karthik.ramanan@ti.com>
References: <1493119564-36769-1-git-send-email-a0393906@ti.com>
	<20170425231916.GT31608@edge>
	<C45960711C772449A33A51ED1374F08A4060D136@DFLE08.ent.ti.com>
	<590036BC.4010306@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <26eecf02-370c-de7a-eb49-94cff6b5da9c@ti.com>
Date: Wed, 26 Apr 2017 07:20:51 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <590036BC.4010306@ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [morty v3 1/3] ti-cgt-arm: add recipe for 16.9.2
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
X-List-Received-Date: Wed, 26 Apr 2017 11:20:56 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 4/26/2017 1:57 AM, Karthik Ramanan wrote:
>
> On 26-Apr-17 5:09 AM, Pang, Ivan wrote:
>> Karthik, Denys,
>>
>>>> +PV = "16.9.2"
>>   > Would it be better to have this in the recipe filename? I'm not 
>> sure if there is a preference.
>>
>> Sorry, I haven't kept up with the patch mails. There was a specific 
>> reason I moved the PV out of the filename and into the .inc file - I 
>> had multiple recipes in RTOS that would need to align with this PV 
>> (see ti-cgt-arm-linux.bb and ti-cgt-arm-windows.bb). This would let 
>> us update only the .inc file whenever we want to bump up the version.
>>
>> Ivan
> Ivan,
>
> Since we decided to remove the linux and windows on the meta-ti 
> context, we decided to move out the PV to the filename.
> I think we should merge the recipe in its current form and then work 
> on subsequent changes. Would you be fine with that approach?

Ivan,

the "linux" and "windows" recipe variants simply package the installer, 
correct?

If this is the case, you can always create the "linux" and "windows" 
packages from the current recipe through a bbappend.

- Jake

>>
>> -----Original Message-----
>> From: meta-ti-bounces@yoctoproject.org 
>> [mailto:meta-ti-bounces@yoctoproject.org] On Behalf Of Dmytriyenko, 
>> Denys
>> Sent: Tuesday, April 25, 2017 6:19 PM
>> To: R, Karthik
>> Cc: meta-ti@yoctoproject.org
>> Subject: Re: [meta-ti] [morty v3 1/3] ti-cgt-arm: add recipe for 16.9.2
>>
>> Karthik,
>>
>> This looks much better!
>>
>> I would have said there's no reason to split it into a recipe and 
>> .inc anymore, but we'll probably also need a -nativesdk recipe, so 
>> keeping .inc for now.
>>
>> There are couple cosmetic nitpicks - there's no space between SUMMARY 
>> and = sign; and BINFILE variable is defined twice. I'll fix those on 
>> merge though.
> Thank you Denys, I will make a note on these points. The recipe went 
> through a lot of rework and I overlooked these aspects.
>>
>> -- 
>> Denys
>>
>>
>> On Tue, Apr 25, 2017 at 04:56:02PM +0530, Karthik Ramanan wrote:
>>> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
>>> ---
>>>   recipes-ti/devtools/ti-cgt-arm-native_16.9.2.bb |  8 ++++++
>>>   recipes-ti/devtools/ti-cgt-arm.inc              | 35 
>>> +++++++++++++++++++++++++
>>>   2 files changed, 43 insertions(+)
>>>   create mode 100644 recipes-ti/devtools/ti-cgt-arm-native_16.9.2.bb
>>>   create mode 100644 recipes-ti/devtools/ti-cgt-arm.inc
>>>
>>> diff --git a/recipes-ti/devtools/ti-cgt-arm-native_16.9.2.bb 
>>> b/recipes-ti/devtools/ti-cgt-arm-native_16.9.2.bb
>>> new file mode 100644
>>> index 0000000..c4fc7f0
>>> --- /dev/null
>>> +++ b/recipes-ti/devtools/ti-cgt-arm-native_16.9.2.bb
>>> @@ -0,0 +1,8 @@
>>> +include ti-cgt-arm.inc
>>> +
>>> +LIC_FILES_CHKSUM = 
>>> "file://ti-cgt-arm_${PV}.LTS/README.txt;md5=c32eadd03472353c042a8a7c4568438b"
>>> +
>>> +BINFILE_MD5 = "7b73e51e9548a4a0bf3923a336b1a974"
>>> +BINFILE_SHA256 = 
>>> "d1a5c255319088be7d75b3fce1b16a2e3d60c75023db7dad16cab6d4d3425d06"
>>> +
>>> +PR_append = "r2"
>>> diff --git a/recipes-ti/devtools/ti-cgt-arm.inc 
>>> b/recipes-ti/devtools/ti-cgt-arm.inc
>>> new file mode 100644
>>> index 0000000..8cc1ca4
>>> --- /dev/null
>>> +++ b/recipes-ti/devtools/ti-cgt-arm.inc
>>> @@ -0,0 +1,35 @@
>>> +SUMMARY= "TI ARM Code Generation Tools"
>>> +HOMEPAGE = 
>>> "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
>>> +LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & 
>>> BSD-3-Clause & BSL-1.0 & Hewlett-Packard & AFL-3.0 & MIT & 
>>> BSD-2-Clause & PD & BSD-4-Clause"
>>> +
>>> +inherit native
>>> +require recipes-ti/includes/ti-unpack.inc
>>> +require recipes-ti/includes/ti-staging.inc
>>> +require recipes-ti/includes/ti-paths.inc
>>> +
>>> +S = "${WORKDIR}/ti-cgt-arm-${PV}"
>>> +
>>> +SRC_URI = 
>>> "http://software-dl.ti.com/codegen/esd/cgt_public_sw/TMS470/${PV}.LTS/${BINFILE};name=${BINFILE_NAME}"
>>> +
>>> +BINFILE = "ti_cgt_tms470_${PV}.LTS_linux_installer_x86.bin"
>>> +TI_BIN_UNPK_ARGS = "--prefix ${S}"
>>> +TI_BIN_UNPK_CMDS = ""
>>> +
>>> +do_install() {
>>> +    install -d ${D}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}
>>> +    cp -r ${S}/ti-cgt-arm*/. ${D}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}
>>> +}
>>> +
>>> +SRC_URI[cgt_arm_installer.md5sum] = "${BINFILE_MD5}"
>>> +SRC_URI[cgt_arm_installer.sha256sum] = "${BINFILE_SHA256}"
>>> +
>>> +BINFILE_NAME = "cgt_arm_installer"
>>> +BINFILE = "ti_cgt_tms470_${PV}.LTS_linux_installer_x86.bin"
>>> +
>>> +FILES_${PN} += "${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}"
>>> +
>>> +INHIBIT_PACKAGE_STRIP = "1"
>>> +INHIBIT_SYSROOT_STRIP = "1"
>>> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>>> +
>>> +INSANE_SKIP_${PN} += "arch staticdev"
>>> -- 
>>> 1.9.1
>>>
>>> -- 
>>> _______________________________________________
>>> meta-ti mailing list
>>> meta-ti@yoctoproject.org
>>> https://lists.yoctoproject.org/listinfo/meta-ti
>


