Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C0732E00D32; Tue, 21 May 2019 12:33:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 717DAE00D32
	for <meta-ti@yoctoproject.org>; Tue, 21 May 2019 12:33:54 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4LJXsY5128844
	for <meta-ti@yoctoproject.org>; Tue, 21 May 2019 14:33:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1558467234;
	bh=bKuLJxRknpuFUGKQYyzClUmW2qTdzAAHfecrgmB4t2c=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=Io+ujZCrE5wYgWa4wWhbttdT6VSYRI7g82bKvr0MQkOucZS0oJP8qgTQ0+tWDSP+3
	arP6TBibPqwJ3scGD1GOdfb4Zxy7XCw/SI7hoZ3RF7VG8E26yLa+e1RmmZQ0ViiurH
	z1BIvTpgskmaX6E9BQFbVI6YfEd4DoQxmSL86UoY=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4LJXsJS095752
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 21 May 2019 14:33:54 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 21 May 2019 14:33:53 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 21 May 2019 14:33:53 -0500
Received: from [10.250.90.63] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4LJXraT027768;
	Tue, 21 May 2019 14:33:53 -0500
To: Denys Dmytriyenko <denys@ti.com>
References: <20190521184613.18443-1-dmurphy@ti.com>
	<20190521190715.GC19550@beryl>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <fd0a6752-c178-a238-c6e4-671b16885125@ti.com>
Date: Tue, 21 May 2019 14:33:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190521190715.GC19550@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] u-boot-ti-staging: update to ti2019.01-rc5 tag
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
X-List-Received-Date: Tue, 21 May 2019 19:33:55 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Denys

On 5/21/19 2:07 PM, Denys Dmytriyenko wrote:
> On Tue, May 21, 2019 at 01:46:13PM -0500, Dan Murphy wrote:
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>  recipes-bsp/u-boot/u-boot-ti-staging_2019.01.bb | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2019.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2019.01.bb
>> index ac219376..6ba8e24e 100644
>> --- a/recipes-bsp/u-boot/u-boot-ti-staging_2019.01.bb
>> +++ b/recipes-bsp/u-boot/u-boot-ti-staging_2019.01.bb
>> @@ -1,7 +1,7 @@
>>  require u-boot-ti.inc
>>  
>> -PR = "r10"
>> +PR = "r11"
>>  
>>  BRANCH = "ti-u-boot-2019.01"
>>  
>> -SRCREV = "859e3aec28a8f9de80f1abc0de63de50bfe513de"
>> +SRCREV = "291330731de984d05401cbab3d925818ebf7588b"
> 
> Wrong commit.

Forgot to commit the change

Resent v3

> 
> 
>> 2.21.0.5.gaeb582a983
>>

