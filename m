Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B32A9E00566; Wed, 15 Aug 2018 12:09:57 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 434EBE00566
	for <meta-ti@yoctoproject.org>; Wed, 15 Aug 2018 12:09:57 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7FJ9uTa006392
	for <meta-ti@yoctoproject.org>; Wed, 15 Aug 2018 14:09:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534360196;
	bh=U5fZ5oSZpR0wjxzBa3CZ6kxBatu54gBqf657RdDdJtg=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=PAXOOpAJXAx0OQ1X6o2McXyalUeUbQPAIfl6/fLfi6hMiqFP6QHtQceKeMCe4y0pr
	ZGMjoORW49/jVfrn+eSuEdLmbOljg/y5UFUClnyvsYIErD1KhVj1gOAk0EiUeh9rtx
	Xkn2cF550/duWqeSI0K05YeRuCMdY9yeOxBjJEAk=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7FJ9uWE012897
	for <meta-ti@yoctoproject.org>; Wed, 15 Aug 2018 14:09:56 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 15 Aug 2018 14:09:56 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 15 Aug 2018 14:09:56 -0500
Received: from [172.22.176.241] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7FJ9uNl005738;
	Wed, 15 Aug 2018 14:09:56 -0500
To: Denys Dmytriyenko <denys@ti.com>
References: <20180815182141.25990-1-dmurphy@ti.com>
	<20180815190012.GM2547@beryl>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <b90a5e29-4188-5331-b5aa-867c20ff0737@ti.com>
Date: Wed, 15 Aug 2018 14:09:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180815190012.GM2547@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/2] linux-ti-staging: update ti2018.03-rc3 tag
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
X-List-Received-Date: Wed, 15 Aug 2018 19:09:57 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/15/2018 02:00 PM, Denys Dmytriyenko wrote:
> No RT bump?
> 

Nope.

> 
> On Wed, Aug 15, 2018 at 01:21:40PM -0500, Dan Murphy wrote:
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>  recipes-kernel/linux/linux-ti-staging_4.14.bb | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes-kernel/linux/linux-ti-staging_4.14.bb b/recipes-kernel/linux/linux-ti-staging_4.14.bb
>> index 6bb5c33b..9e092404 100644
>> --- a/recipes-kernel/linux/linux-ti-staging_4.14.bb
>> +++ b/recipes-kernel/linux/linux-ti-staging_4.14.bb
>> @@ -55,8 +55,8 @@ S = "${WORKDIR}/git"
>>  
>>  BRANCH = "ti-lsk-linux-4.14.y"
>>  
>> -SRCREV = "7364914505da7bc264d2f8a38c4ff4f865fcba03"
>> -PV = "4.14.61+git${SRCPV}"
>> +SRCREV = "3dcf448dbe396161f4633d0e38b9894fe5214786"
>> +PV = "4.14.62+git${SRCPV}"
>>  
>>  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
>>  MACHINE_KERNEL_PR_append = "b"
>> -- 
>> 2.17.0.582.gccdcbd54c
>>


-- 
------------------
Dan Murphy

