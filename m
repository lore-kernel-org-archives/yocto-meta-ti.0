Return-Path: <nikhil.nd@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7F797E0080A; Fri, 27 Sep 2019 01:14:49 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 50C4BE0049C
	for <meta-ti@yoctoproject.org>; Fri, 27 Sep 2019 01:14:48 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8R8ElM8062961
	for <meta-ti@yoctoproject.org>; Fri, 27 Sep 2019 03:14:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569572087;
	bh=WXFPW1FOAj0najHl8zcd1Jw6RkxkLeJtBN2iB0fCxq0=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=DeWsfsnqpOVIp+085iARxTVKkF2aKjQdT2PmVzqz+62yiFESNo9m/xW/KV5X2VNgZ
	TW9nSQLBUo8TQ5oQUs8ualQCUJCl0YHsFka3yVq/ZlLjMdkutI4/nPr4Xd8MFrRCLP
	rBxIfCV0lylCjQ68huTz7Uhzqo1VKUdKNd4i8+oM=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8R8ElsD050421
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 27 Sep 2019 03:14:47 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 27 Sep 2019 03:14:39 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 27 Sep 2019 03:14:47 -0500
Received: from [172.24.190.110] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8R8EjrI010502;
	Fri, 27 Sep 2019 03:14:46 -0500
To: Denys Dmytriyenko <denys@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
References: <1569514059-8832-1-git-send-email-nikhil.nd@ti.com>
	<20190926161310.GB5386@beryl>
From: Nikhil Devshatwar <a0132237@ti.com>
Message-ID: <56a06d6f-b692-4f9b-98c0-5725816e3bc9@ti.com>
Date: Fri, 27 Sep 2019 13:44:44 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190926161310.GB5386@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [thud/master PATCH v1] recipes-kernel: jailhouse: update SRCREV to ti2019.04-rc2 tag
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
X-List-Received-Date: Fri, 27 Sep 2019 08:14:49 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 26/09/19 9:43 PM, Denys Dmytriyenko wrote:
> On Thu, Sep 26, 2019 at 09:37:39PM +0530, Nikhil Devshatwar wrote:
>> /work/nikhil/ybd/k3-yocto-26-Sep/sources/meta-ti/recipes-kernel/jailhouse/jailhouse_git.bb
> What's this for?
Sorry about that. I have setup some automation to detect SRCREV updates and send patches.
Needs some more cleanup.
Will resend manually.
Nikhil D
>
>
>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>> ---
>>   recipes-kernel/jailhouse/jailhouse_git.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-kernel/jailhouse/jailhouse_git.bb b/recipes-kernel/jailhouse/jailhouse_git.bb
>> index 32aecf8..409b325 100644
>> --- a/recipes-kernel/jailhouse/jailhouse_git.bb
>> +++ b/recipes-kernel/jailhouse/jailhouse_git.bb
>> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = " \
>>   "
>>   
>>   PV = "0.10+git${SRCPV}"
>> -SRCREV = "6dce20f902f73fe9ce53ba0c41262a4defa8d328"
>> +SRCREV = "8858ba60ab078d8e3e5317fd644f09c560775a99"
>>   BRANCH = "ti-jailhouse-0.10"
>>   
>>   SRC_URI = " \
>> -- 
>> 1.9.1
>>
>> -- 
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti


