Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A30A6E00BBC; Fri,  8 Mar 2019 07:46:12 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3953AE00950
	for <meta-ti@yoctoproject.org>; Fri,  8 Mar 2019 07:46:11 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x28FkAp4101588
	for <meta-ti@yoctoproject.org>; Fri, 8 Mar 2019 09:46:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1552059970;
	bh=GJQ1UfBwONUY83/2CftBhz3Klst9dhWHaDn/dso68Nc=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=XkLJ/wcGmktydLHZMwjE6yh4ipLoHLRKiJHHRCnzv+9MxEn8/lH6OWnIw4cjyG6hi
	uHm18HQ1UMFRaQj8feayJaDPbvAUWWjQoUTuLQpIY2INinSzCmEcShHMRg4/m+6hQ5
	lXZ3SHrE+jKdKIknYlRlM2DQZUK8VHSAqSwCx1pA=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x28FkA35102216
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 8 Mar 2019 09:46:10 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Fri, 8 Mar 2019 09:46:10 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Fri, 8 Mar 2019 09:46:10 -0600
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x28Fk9jp018166;
	Fri, 8 Mar 2019 09:46:09 -0600
To: Denys Dmytriyenko <denys@ti.com>
References: <1551460736-16483-1-git-send-email-denys@ti.com>
	<6f775973-d681-4da8-355f-9c3987526a1c@ti.com>
	<20190305005551.GS26081@beryl>
	<20190305021807.GY26081@beryl> <20190307220828.GF26081@beryl>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <58f72cf2-303d-c156-37dd-76f26961d408@ti.com>
Date: Fri, 8 Mar 2019 10:46:09 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190307220828.GF26081@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [EXTERNAL] [master][PATCH] gcc-arm-none-eabi: not supported on any target
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
X-List-Received-Date: Fri, 08 Mar 2019 15:46:12 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 3/7/2019 5:08 PM, Denys Dmytriyenko wrote:
> On Mon, Mar 04, 2019 at 09:18:08PM -0500, Denys Dmytriyenko wrote:
>> On Mon, Mar 04, 2019 at 07:55:52PM -0500, Denys Dmytriyenko wrote:
>>> On Mon, Mar 04, 2019 at 11:08:48AM -0500, Jacob Stiffler wrote:
>>>> On a different machine, I am seeing the package_qa errors for the nativesdk
>>>> package.
>>> Have you tried using the binaries?
>>>
>>>
>>>> Should I submit a patch on top of this one to suppress the QA warnings and
>>>> errors? Or should I combine this change with that patch?
>>> Not sure what you mean by combining...
>> Just realized you are probably looking at rocko and this change hasn't been
>> backported yet:
>> http://arago-project.org/git/?p=meta-ti.git;a=commitdiff;h=84b3ff8da8311138e534cfb8930c08aa4b417c3e
> Ping. Do we need this change backported to rocko?


We will need the updated version of this recipe, so I can add this 
change once that version is available.


>
>>>> Thank you,
>>>>
>>>> Jake
>>>>
>>>>
>>>> On 3/1/2019 12:18 PM, Denys Dmytriyenko wrote:
>>>>> This package is only meant for native and nativesdk usage.
>>>>>
>>>>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>>>>> ---
>>>>>   recipes-ti/devtools/gcc-arm-none-eabi_6-2017-q1-update.bb | 1 +
>>>>>   1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/recipes-ti/devtools/gcc-arm-none-eabi_6-2017-q1-update.bb b/recipes-ti/devtools/gcc-arm-none-eabi_6-2017-q1-update.bb
>>>>> index ae3d1d7..d08dd2f 100644
>>>>> --- a/recipes-ti/devtools/gcc-arm-none-eabi_6-2017-q1-update.bb
>>>>> +++ b/recipes-ti/devtools/gcc-arm-none-eabi_6-2017-q1-update.bb
>>>>> @@ -14,6 +14,7 @@ S = "${WORKDIR}/gcc-arm-none-eabi-6-2017-q1-update"
>>>>>   # only x86_64 is supported
>>>>>   COMPATIBLE_HOST = "x86_64.*-linux"
>>>>> +COMPATIBLE_HOST_class-target = "null"
>>>>>   do_install() {
>>>>>       install -d ${D}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}
>>> -- 
>>> _______________________________________________
>>> meta-ti mailing list
>>> meta-ti@yoctoproject.org
>>> https://lists.yoctoproject.org/listinfo/meta-ti
>> -- 
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti

