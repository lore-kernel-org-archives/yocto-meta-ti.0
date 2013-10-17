Return-Path: <trini@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7BA30E016B5
	for <meta-ti@yoctoproject.org>; Thu, 17 Oct 2013 15:36:18 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9HMaIZa004054
	for <meta-ti@yoctoproject.org>; Thu, 17 Oct 2013 17:36:18 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9HMaI00026471
	for <meta-ti@yoctoproject.org>; Thu, 17 Oct 2013 17:36:18 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 17 Oct 2013 17:36:18 -0500
Received: from [172.24.52.43] (dbdp20.itg.ti.com [172.24.170.38])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9HMaDv5021047;
	Thu, 17 Oct 2013 17:36:15 -0500
Message-ID: <52606662.30207@ti.com>
Date: Thu, 17 Oct 2013 18:36:18 -0400
From: Tom Rini <trini@ti.com>
Organization: Texas Instruments
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1382026241-14979-1-git-send-email-Chase.Maupin@ti.com>
	<20131017153922.GC29355@edge> <20131017214749.GD30989@edge>
In-Reply-To: <20131017214749.GD30989@edge>
X-Enigmail-Version: 1.5.2
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] u-boot-ti-staging: update to 2013.10 release
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
X-List-Received-Date: Thu, 17 Oct 2013 22:36:19 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 10/17/2013 05:47 PM, Denys Dmytriyenko wrote:
> On Thu, Oct 17, 2013 at 11:39:23AM -0400, Denys Dmytriyenko wrote:
>> Yah, you beat me to it! Ack :)
>>
>> On Thu, Oct 17, 2013 at 11:10:41AM -0500, Chase Maupin wrote:
>>> * Update the U-Boot LICENSE md5sum for the new release.
>>>
>>> * Update the PV for the new U-Boot release
>>>
>>> * Add the SRCREV that points to the 2013.10 release
>>>
>>> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
>>> ---
>>>  recipes-bsp/u-boot/u-boot-ti-staging_git.bb |    7 ++++---
>>>  1 files changed, 4 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_git.bb b/recipes-bsp/u-boot/u-boot-ti-staging_git.bb
>>> index a5882b0..1da3c47 100644
>>> --- a/recipes-bsp/u-boot/u-boot-ti-staging_git.bb
>>> +++ b/recipes-bsp/u-boot/u-boot-ti-staging_git.bb
>>> @@ -2,16 +2,17 @@ require u-boot-ti.inc
>>>  
>>>  DESCRIPTION = "u-boot bootloader for TI devices"
>>>  
>>> -LIC_FILES_CHKSUM = "file://Licenses/README;md5=bc069111b5e5b1ed8bed98ae73b596ec"
>>> +LIC_FILES_CHKSUM = "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"
>>>  
>>> -PV = "2013.07+2013.10-rc4"
>>> +PV = "2013.10"
>>>  PR = "r0+gitr${SRCPV}"
>>>  
>>>  SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
>>>  
>>>  BRANCH ?= "master"
>>
>> Should we point to ti-u-boot-2013.10?
> 
> Ping! Copying Tom here for any guidance on U-boot branching.

If this recipe is to match the 3.12.y integration branch, yes,
ti-u-boot-2013.10 corresponds to ti-linux-3.12.y

-- 
Tom

