Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C2942E00C1E; Tue,  9 Apr 2019 13:24:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 262BFE00AD5
	for <meta-ti@yoctoproject.org>; Tue,  9 Apr 2019 13:24:28 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x39KOSUC090564
	for <meta-ti@yoctoproject.org>; Tue, 9 Apr 2019 15:24:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1554841468;
	bh=BrGxD12+EQfEGe1mpjgE1HkbzU3FxBjxx6tY2wCYit8=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=DHI1hEjWfsT1lNuFmM/rAA0MQsDhwsnH7Yt5VygU/3jId43okVPiZ9xw00SUeNI5L
	RUHZ/IPqm49gLbyt+Q3TOm2niYUZgszlXBV909GxaA57cuLOyX7Pohl1MZUSm7dKOs
	RG0Gubb0Yp0Y4STe8zZ0hbWmwrxB7VhmAFME9bMk=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x39KOSaO097056
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 9 Apr 2019 15:24:28 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 9 Apr 2019 15:24:28 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 9 Apr 2019 15:24:28 -0500
Received: from [10.250.81.84] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x39KOR6h096118;
	Tue, 9 Apr 2019 15:24:28 -0500
To: Denys Dmytriyenko <denys@ti.com>
References: <20190409183847.5457-1-dmurphy@ti.com>
	<20190409201329.GA21998@beryl>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <4477b2f2-e6ea-b0f7-7b6a-55777fd9ca78@ti.com>
Date: Tue, 9 Apr 2019 15:24:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190409201329.GA21998@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] linux-ti-staging: update to ti2019.00 tag
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
X-List-Received-Date: Tue, 09 Apr 2019 20:24:29 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys

Correct we can ignore this patch

Dan


On 4/9/19 3:13 PM, Denys Dmytriyenko wrote:
> Dan,
>
> This patch looks incorrect - release tag is the same as RC5, but you are
> changing it to the HEAD...
>
>
> On Tue, Apr 09, 2019 at 01:38:47PM -0500, Dan Murphy wrote:
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>   recipes-kernel/linux/linux-ti-staging-rt_4.19.bb | 2 +-
>>   recipes-kernel/linux/linux-ti-staging_4.19.bb    | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.19.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.19.bb
>> index adb4976b..5d2a2846 100644
>> --- a/recipes-kernel/linux/linux-ti-staging-rt_4.19.bb
>> +++ b/recipes-kernel/linux/linux-ti-staging-rt_4.19.bb
>> @@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.19:"
>>   
>>   BRANCH = "ti-rt-linux-4.19.y"
>>   
>> -SRCREV = "dd79f85919e94693a894edd21cae767d74751961"
>> +SRCREV = "e3bbce7978e3a0b0e3a1a0072ebfaa34e23d4b11"
>>   PV = "4.19.25+git${SRCPV}"
>> diff --git a/recipes-kernel/linux/linux-ti-staging_4.19.bb b/recipes-kernel/linux/linux-ti-staging_4.19.bb
>> index 3cd1a878..e5fcb72c 100644
>> --- a/recipes-kernel/linux/linux-ti-staging_4.19.bb
>> +++ b/recipes-kernel/linux/linux-ti-staging_4.19.bb
>> @@ -56,7 +56,7 @@ S = "${WORKDIR}/git"
>>   
>>   BRANCH = "ti-linux-4.19.y"
>>   
>> -SRCREV = "85f9077a5ff8ee28e1415be4c5174c6fd71ee968"
>> +SRCREV = "f95e1cb61f787ab00fa93182e03598d2470eff4b"
>>   PV = "4.19.25+git${SRCPV}"
>>   
>>   # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
>> -- 
>> 2.14.0
>>

