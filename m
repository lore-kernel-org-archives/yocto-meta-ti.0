Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A677BE00DA9; Wed, 19 Jun 2019 05:41:28 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7693BE00DA7
	for <meta-ti@yoctoproject.org>; Wed, 19 Jun 2019 05:41:27 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5JCfQGq084091
	for <meta-ti@yoctoproject.org>; Wed, 19 Jun 2019 07:41:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560948086;
	bh=gBKYFfczBn0LV4V9MczeOSJUx9v/ugpnbyVpZhFvrBI=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=d/vNN1I+T6fEk9plv+fXDOnsDgxhr/ninK/2oKUySb5SRHdOsJExEcb9tboBrV+qJ
	pv8E+qOmcJ06IY6m/Y4yTGUtJrHIAfKBoYloGRcQ9FQIxyI1n4pq2trXuNEvC1y4DR
	XfPziE/pPMQ34qL3H120DtooifsvU6o59BOu4MdE=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5JCfQCT113600
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 19 Jun 2019 07:41:26 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 19 Jun 2019 07:41:26 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 19 Jun 2019 07:41:26 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5JCfQHm021086;
	Wed, 19 Jun 2019 07:41:26 -0500
To: Roger Quadros <rogerq@ti.com>, Denys Dmytriyenko <denys@ti.com>
References: <1560884418-23216-1-git-send-email-j-stiffler@ti.com>
	<20190618221138.GC32001@beryl>
	<dd6319c5-f44e-834a-1e3c-392172c4eda2@ti.com>
	<3c652eb6-135a-a08f-1e88-249db9c4b25a@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <9c6d2582-e1aa-1079-bd70-bed3f37db67e@ti.com>
Date: Wed, 19 Jun 2019 08:41:26 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <3c652eb6-135a-a08f-1e88-249db9c4b25a@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [master/thud][PATCH 0/5] Build am65xx prueth-fw from source
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
X-List-Received-Date: Wed, 19 Jun 2019 12:41:28 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 6/19/2019 8:40 AM, Roger Quadros wrote:
> On 19/06/2019 15:39, Roger Quadros wrote:
>> Jake,
>>
>> How do I test the ELF files that are generated from this series?
> Sorry, I should have asked, how do I get the ELF files?
> I don't have local build setup.


I can provide you with the one's I have built.


- Jake


> cheers,
> -roger
>
>> Denys,
>>
>> Please wait for my Tested-by Tag before pulling in this series. Thanks.
>>
>> cheers,
>> -roger
>>
>> On 19/06/2019 01:11, Denys Dmytriyenko wrote:
>>> Jake,
>>>
>>> You called the new recipe prueth-fw-am65x_git.bb (with 1 "x") but in
>>> linux-ti-staging you RDEPENDS on "prueth-fw-am65xx" (with 2 "x").
>>> Since my next builds broke, I'll rebase and drop these patches for now.
>>> Please test and re-submit the fixes. Thanks.
>>>
>>> Denys
>>>
>>>
>>> On Tue, Jun 18, 2019 at 03:00:13PM -0400, Jacob Stiffler wrote:
>>>> Build prueth-fw for am65xx from sources and remove existing prebuilt
>>>> firmware recipe.
>>>>
>>>> Jacob Stiffler (5):
>>>>    emac-lld-rtos: update to version 01.00.03.15
>>>>    emac-lld: separate SRC_URI in inc file
>>>>    prueth-fw-am65xx: build am65xx prueth-fw from source
>>>>    linux-ti-staging: switch RDEPENDS to prueth-fw-am65xx
>>>>    prueth-fw-bin: remove prebuilt firmware recipe
>>>>
>>>>   recipes-bsp/emac-lld/emac-lld-rtos_git.bb     | 18 +++--------
>>>>   recipes-bsp/emac-lld/emac-lld.inc             | 17 +++++++++++
>>>>   recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb  | 44 +++++++++++++++++++++++++++
>>>>   recipes-bsp/prueth-fw/prueth-fw-bin_git.bb    | 32 -------------------
>>>>   recipes-kernel/linux/linux-ti-staging_4.19.bb |  2 +-
>>>>   5 files changed, 66 insertions(+), 47 deletions(-)
>>>>   create mode 100644 recipes-bsp/emac-lld/emac-lld.inc
>>>>   create mode 100644 recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
>>>>   delete mode 100644 recipes-bsp/prueth-fw/prueth-fw-bin_git.bb
>>>>
>>>> -- 
>>>> 2.7.4
>>>>
>>>> -- 
>>>> _______________________________________________
>>>> meta-ti mailing list
>>>> meta-ti@yoctoproject.org
>>>> https://lists.yoctoproject.org/listinfo/meta-ti

