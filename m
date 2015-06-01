Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5C1A2E00A3C; Mon,  1 Jun 2015 05:34:58 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 86A35E009A3
	for <meta-ti@yoctoproject.org>; Mon,  1 Jun 2015 05:34:55 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t51CYrsS021413
	for <meta-ti@yoctoproject.org>; Mon, 1 Jun 2015 07:34:53 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t51CYram013774
	for <meta-ti@yoctoproject.org>; Mon, 1 Jun 2015 07:34:53 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 1 Jun 2015 07:34:53 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t51CYrfJ020098;
	Mon, 1 Jun 2015 07:34:53 -0500
Message-ID: <556C516D.3020902@ti.com>
Date: Mon, 1 Jun 2015 08:34:53 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1432735838-7207-1-git-send-email-j-stiffler@ti.com>
	<1432735838-7207-4-git-send-email-j-stiffler@ti.com>
	<20150529200837.GD16418@edge>
In-Reply-To: <20150529200837.GD16418@edge>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 3/4] common-csl-ip.inc: Add source revision for dra7xx.
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
X-List-Received-Date: Mon, 01 Jun 2015 12:34:58 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 5/29/2015 4:08 PM, Denys Dmytriyenko wrote:
> Ack, but please explain below.
>
>
> On Wed, May 27, 2015 at 10:10:37AM -0400, Jacob Stiffler wrote:
>> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>> ---
>>   recipes-bsp/common-csl-ip/common-csl-ip.inc |   12 ++++++++++--
>>   1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes-bsp/common-csl-ip/common-csl-ip.inc b/recipes-bsp/common-csl-ip/common-csl-ip.inc
>> index 1fa34f3..cbf2c3c 100644
>> --- a/recipes-bsp/common-csl-ip/common-csl-ip.inc
>> +++ b/recipes-bsp/common-csl-ip/common-csl-ip.inc
>> @@ -2,9 +2,17 @@ DESCRIPTION = "Chip support library low level interface"
>>   LICENSE = "BSD-3-Clause"
>>   LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5857833e20836213677fac33f9aded21"
>>   
>> -COMPATIBLE_MACHINE = "keystone"
>> +COMPATIBLE_MACHINE = "keystone|dra7xx"
>> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>> +
>>   
>>   BRANCH="master"
>> -SRC_URI = "git://git.ti.com/keystone-rtos/common-csl-ip.git;protocol=git;branch=${BRANCH}"
>> +BRANCH_dra7xx = "releases/PROCESSOR-SDK.01.00.00"
>> +
>> +SRC_URI = "git://git.ti.com/keystone-rtos/common-csl-ip.git;protocol=git;branch=${BRANCH};destsuffix=${S}"
> Why do you need destsuffix?
>

The RTOS package requires the sources to be extracted into "ti/csl" for 
the xdc build to succeed.

>>   # commit ID corresponds to DEV.CSL_KEYSTONE2.02.01.00.07A
>>   SRCREV = "c78867df9165fdf8042fb692fcea776fc0102326"
>> +
>> +# commit ID corresponds to PROCESSOR-SDK-ALPHA-1
>> +SRCREV_dra7xx = "37c5311ddf289f83b1432a9422816722d264bf55"
>> -- 
>> 1.7.9.5
>>
>> -- 
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti


