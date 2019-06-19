Return-Path: <rogerq@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3DAB4E00DA7; Wed, 19 Jun 2019 05:39:13 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 969DCE00798
	for <meta-ti@yoctoproject.org>; Wed, 19 Jun 2019 05:39:12 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5JCdCvf072292
	for <meta-ti@yoctoproject.org>; Wed, 19 Jun 2019 07:39:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560947952;
	bh=XPuPI+UyDCp+gefC3UWznbEPdBol3y9e+aPq40pXrqY=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=yM2h8MfIjgMx4mz7xYm1xXTHNxE0SUnBxnhnvuTQDJ/73W6nNpVS5J1XmAJEi6FDz
	5VA3t+JBCesdryQPXhxVTe61CS//tXIc3x8XqHVMnilL63u6P8iEH51ZesY0j75LWd
	RxaIuDgglzD5VwAAVRI2J4Y2Z3mjjCDbtENwnZhM=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5JCdCGO104344
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 19 Jun 2019 07:39:12 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 19 Jun 2019 07:39:10 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 19 Jun 2019 07:39:10 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5JCd9t7100132;
	Wed, 19 Jun 2019 07:39:09 -0500
To: Denys Dmytriyenko <denys@ti.com>, Jacob Stiffler <j-stiffler@ti.com>
References: <1560884418-23216-1-git-send-email-j-stiffler@ti.com>
	<20190618221138.GC32001@beryl>
From: Roger Quadros <rogerq@ti.com>
Message-ID: <dd6319c5-f44e-834a-1e3c-392172c4eda2@ti.com>
Date: Wed, 19 Jun 2019 15:39:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190618221138.GC32001@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Thu, 20 Jun 2019 13:22:42 -0700
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
X-List-Received-Date: Wed, 19 Jun 2019 12:39:13 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Jake,

How do I test the ELF files that are generated from this series?

Denys,

Please wait for my Tested-by Tag before pulling in this series. Thanks.

cheers,
-roger

On 19/06/2019 01:11, Denys Dmytriyenko wrote:
> Jake,
> 
> You called the new recipe prueth-fw-am65x_git.bb (with 1 "x") but in 
> linux-ti-staging you RDEPENDS on "prueth-fw-am65xx" (with 2 "x").
> Since my next builds broke, I'll rebase and drop these patches for now. 
> Please test and re-submit the fixes. Thanks.
> 
> Denys
> 
> 
> On Tue, Jun 18, 2019 at 03:00:13PM -0400, Jacob Stiffler wrote:
>> Build prueth-fw for am65xx from sources and remove existing prebuilt
>> firmware recipe.
>>
>> Jacob Stiffler (5):
>>   emac-lld-rtos: update to version 01.00.03.15
>>   emac-lld: separate SRC_URI in inc file
>>   prueth-fw-am65xx: build am65xx prueth-fw from source
>>   linux-ti-staging: switch RDEPENDS to prueth-fw-am65xx
>>   prueth-fw-bin: remove prebuilt firmware recipe
>>
>>  recipes-bsp/emac-lld/emac-lld-rtos_git.bb     | 18 +++--------
>>  recipes-bsp/emac-lld/emac-lld.inc             | 17 +++++++++++
>>  recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb  | 44 +++++++++++++++++++++++++++
>>  recipes-bsp/prueth-fw/prueth-fw-bin_git.bb    | 32 -------------------
>>  recipes-kernel/linux/linux-ti-staging_4.19.bb |  2 +-
>>  5 files changed, 66 insertions(+), 47 deletions(-)
>>  create mode 100644 recipes-bsp/emac-lld/emac-lld.inc
>>  create mode 100644 recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
>>  delete mode 100644 recipes-bsp/prueth-fw/prueth-fw-bin_git.bb
>>
>> -- 
>> 2.7.4
>>
>> -- 
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

