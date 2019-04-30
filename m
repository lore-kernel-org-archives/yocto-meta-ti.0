Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 69344E00D00; Tue, 30 Apr 2019 15:10:57 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D303EE00BB7
	for <meta-ti@yoctoproject.org>; Tue, 30 Apr 2019 15:10:56 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3UMAupB115986
	for <meta-ti@yoctoproject.org>; Tue, 30 Apr 2019 17:10:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1556662256;
	bh=GcVaKFpliGuqS8mXp2QXf3beCEsom/cydfkqlcHqVys=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=TdQFnZ3vjmC01F/uQ5byEB4uHrQQVC5v4H32pETuHrFWS6Kazj3fQ+XeTyp8sUOUn
	OyMsdrNc7zSlQ9ZqjXIzc1Civ5P2LxNp+k7nYpXlLZUckw21EkyimiTCLtflUS33UO
	w5VQsrrDr8R3LeE2TlWugiwpc/S6xu/ogENSWzt0=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3UMAu0D026463
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 30 Apr 2019 17:10:56 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 30 Apr 2019 17:10:56 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 30 Apr 2019 17:10:56 -0500
Received: from [10.250.90.63] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3UMAtxc033816;
	Tue, 30 Apr 2019 17:10:55 -0500
To: Denys Dmytriyenko <denys@ti.com>
References: <20190430215720.27169-1-dmurphy@ti.com>
	<20190430220323.GA4119@beryl>
	<fb5dbb38-f8de-10ae-d92a-c5bf73f5cf81@ti.com>
	<20190430220843.GB4119@beryl>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <4dd315d2-628a-dd36-c5cc-565d23be90fe@ti.com>
Date: Tue, 30 Apr 2019 17:10:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190430220843.GB4119@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/3] ti-linux-firmware: Update am6 prueth firmware
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
X-List-Received-Date: Tue, 30 Apr 2019 22:10:57 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Denys

On 4/30/19 5:08 PM, Denys Dmytriyenko wrote:
> On Tue, Apr 30, 2019 at 05:05:44PM -0500, Dan Murphy wrote:
>> Denys
>>
>> On 4/30/19 5:03 PM, Denys Dmytriyenko wrote:
>>> ?
>>>
>>> On Tue, Apr 30, 2019 at 04:57:18PM -0500, Dan Murphy wrote:
>>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>>> ---
>>>>  recipes-bsp/prueth-fw/prueth-fw-bin_git.bb | 4 ++--
>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/recipes-bsp/prueth-fw/prueth-fw-bin_git.bb b/recipes-bsp/prueth-fw/prueth-fw-bin_git.bb
>>>> index d129620c..60dc0879 100644
>>>> --- a/recipes-bsp/prueth-fw/prueth-fw-bin_git.bb
>>>> +++ b/recipes-bsp/prueth-fw/prueth-fw-bin_git.bb
>>>> @@ -3,7 +3,7 @@ SUMMARY = "PRU Ethernet firmware for AM65xx"
>>>>  LICENSE = "TI-TFL"
>>>>  LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
>>>>  
>>>> -PV = "5.1.0.7"
>>>> +PV = "5.3.0.5"
>>>>  
>>>>  CLEANBROKEN = "1"
>>>>  
>>>> @@ -11,7 +11,7 @@ COMPATIBLE_MACHINE = "am65xx-evm"
>>>>  
>>>>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>>>>  
>>>> -SRCREV = "1e03f08e89bee6d29ffd25782f5ce45b1b4bf1e6"
>>>> +SRCREV = "534ba03becfa9b39ccbd42b97e091abd94a207e7"
>>
>> The AM6 prueth firmware was updated after rc1 tag.
> 
> Yes, and the recipe was already uipdated. Don't forget git update.
> 

Apparently I did.  I know I pulled new ref's but apparently not into my local branch

Please ignore this patch

Dan

> 
>> Dan
>>
>>>>  BRANCH ?= "ti-linux-firmware"
>>>>  
>>>>  SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
>>>> -- 
>>>> 2.21.0.5.gaeb582a983
>>>>

