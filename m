Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A5F93E00AA2; Mon,  1 May 2017 12:21:59 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 64840E00546
	for <meta-ti@yoctoproject.org>; Mon,  1 May 2017 12:21:55 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v41JLtDU032753
	for <meta-ti@yoctoproject.org>; Mon, 1 May 2017 14:21:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493666515;
	bh=//cHwDA6UNozmSTK1vKWpXESj8aJ8BYooQxX40qBmDU=;
	h=Subject:To:References:CC:From:Date:In-Reply-To;
	b=isnEP2M5fB1MQhYg02cs6kbCUb1vESjbdJa2AFvZknPucSx/kft2+IwOpNx/hPU2T
	pl8fgGX7GDNNJmFTZE09Y65uERYQxNNsIRwVJNnW1+SddJGjLFq1kwBUPx4fZYV9f2
	jQ/ifTVqJMuvUY3F3+Bkp1emOm3I73L5dNWc+fnw=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v41JLtnA010194
	for <meta-ti@yoctoproject.org>; Mon, 1 May 2017 14:21:55 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 1 May 2017 14:21:55 -0500
Received: from [172.22.109.252] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v41JLsn9010637;
	Mon, 1 May 2017 14:21:55 -0500
To: Denys Dmytriyenko <denys@ti.com>
References: <20170501190150.4110-1-dmurphy@ti.com>
	<20170501190150.4110-4-dmurphy@ti.com> <20170501190959.GU31608@edge>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <ac991d21-8bb8-c91a-0b12-651c6cfeea36@ti.com>
Date: Mon, 1 May 2017 14:21:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170501190959.GU31608@edge>
Cc: meta-ti@yoctoproject.org
Subject: Re: [v2 PATCH 4/4] boot-monitor: update to ti2017.01-rc2 tag
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
X-List-Received-Date: Mon, 01 May 2017 19:21:59 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

Denys

On 05/01/2017 02:10 PM, Denys Dmytriyenko wrote:
> On Mon, May 01, 2017 at 02:01:50PM -0500, Dan Murphy wrote:
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>
>> v2 - No changes
>>
>>  recipes-bsp/boot-monitor/boot-monitor_git.bb | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/recipes-bsp/boot-monitor/boot-monitor_git.bb b/recipes-bsp/boot-monitor/boot-monitor_git.bb
>> index e4ea67f6..1b6f3206 100644
>> --- a/recipes-bsp/boot-monitor/boot-monitor_git.bb
>> +++ b/recipes-bsp/boot-monitor/boot-monitor_git.bb
>> @@ -8,7 +8,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>>  DEPENDS = "u-boot-mkimage-native"
>>  
>>  SRC_URI = "git://git.ti.com/processor-firmware/ks2-boot-monitor.git;protocol=git;branch=${BRANCH}"
>> -SRC_URI += "file://0001-makedefs-Fix-issue-with-setting-CHECK-and-VERBOSE.patch"
> 
> Can you also remove the corresponding patch file please? ^^^
> 

Do I remove the whole files directory or just the file?

Dan

> 
>>  PV = "4.0+git${SRCPV}"
>>  
>> @@ -16,7 +15,7 @@ BRANCH = "master"
>>  
>>  S = "${WORKDIR}/git"
>>  
>> -SRCREV = "d7b2bbd419400228da621f445526e519b56aef93"
>> +SRCREV = "e1f885ab6dc544884728e333cc6e396f7eb08286"
>>  
>>  BOOT_MONITOR_IMAGE  ?= "skern-${BOOT_MONITOR_MAKE_TARGET}.bin"
>>  
>> -- 
>> 2.12.2
>>


-- 
------------------
Dan Murphy

