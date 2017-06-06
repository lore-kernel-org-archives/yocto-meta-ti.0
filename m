Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2B869E00BAF; Tue,  6 Jun 2017 04:51:18 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E32C9E00BAB
	for <meta-ti@yoctoproject.org>; Tue,  6 Jun 2017 04:51:10 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v56BpAbT028931
	for <meta-ti@yoctoproject.org>; Tue, 6 Jun 2017 06:51:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1496749870;
	bh=FrD4YLXbo3PuTg3ZX6u4p4ow9+5xKnKKxwYSWSHL+DA=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=UAIV6pbOa7VkGLwxLUm755iocTCeYIU9oQKfjBW9NyqS5Gmh/JcCzms6Owg0RfAgb
	mEwaJobmhjG62e85xE/jw5bY8JA4AVcRwiBG6DDhRcS1hu5f3R4SbxXHw0OO2J/3f7
	zLFlS7coy01KGPg8X7XrKhjdFFKWykxUuaMeXbrY=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v56BpAdf030040
	for <meta-ti@yoctoproject.org>; Tue, 6 Jun 2017 06:51:10 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 6 Jun 2017 06:51:09 -0500
Received: from [172.22.138.215] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v56Bp9so013279;
	Tue, 6 Jun 2017 06:51:09 -0500
To: Denys Dmytriyenko <denys@ti.com>
References: <20170605144709.3342-1-dmurphy@ti.com>
	<20170605144709.3342-2-dmurphy@ti.com> <20170605223214.GW9756@edge>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <a07ceb7f-bca5-3507-87d1-5170293c5354@ti.com>
Date: Tue, 6 Jun 2017 06:51:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <20170605223214.GW9756@edge>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 2/3] uboot-ti-staging: update to ti2017.02-rc1 tag
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
X-List-Received-Date: Tue, 06 Jun 2017 11:51:18 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Denys

The commit is there

http://git.ti.com/gitweb/?p=ti-u-boot/ti-u-boot.git;a=commit;h=5147c6edfb017e6cd337c5c13a5b5af2bc2c2654

Dan

On 06/05/2017 05:32 PM, Denys Dmytriyenko wrote:
> Dan,
> 
> This commit doesn't seem to exist and it breaks the build.
> 
> 
> On Mon, Jun 05, 2017 at 09:47:08AM -0500, Dan Murphy wrote:
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>  recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
>> index c0d81b7d..5114fe31 100644
>> --- a/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
>> +++ b/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
>> @@ -1,7 +1,7 @@
>>  require u-boot-ti.inc
>>  
>> -PR = "r4"
>> +PR = "r5"
>>  
>>  BRANCH = "ti-u-boot-2017.01"
>>  
>> -SRCREV = "9fd60700db4562ffac00317a9a44761b8c3255f1"
>> +SRCREV = "5147c6edfb017e6cd337c5c13a5b5af2bc2c2654"
>> -- 
>> 2.12.2
>>


-- 
------------------
Dan Murphy

