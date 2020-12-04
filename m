Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.140.1607114188169417260
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Dec 2020 12:36:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=lSag6dOc;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: dmurphy@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B4KaRDC086486;
	Fri, 4 Dec 2020 14:36:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607114187;
	bh=5qT7z1dhhngXkTRy/ezCPgy0/H4ru/RFlsoAbUXdafg=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=lSag6dOceyCwZH4b3ydkql5ENwUY81zzvGCRgJWmUm/FFllhiIeMiAKySpHVEyymp
	 Gg8uidA6ofpWkUCHd2HoOk5n4076d9h+tE2OjTOTMb05ggD1tnOB4G+KYVGu4ZfkBo
	 bH2kTAd/rtN4ycdjLV8Z0APHYlxuZyHST6ckNs8o=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B4KaR8r104211
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 4 Dec 2020 14:36:27 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 4 Dec
 2020 14:36:27 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 4 Dec 2020 14:36:27 -0600
Received: from [10.250.70.26] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B4KaQnl070051;
	Fri, 4 Dec 2020 14:36:26 -0600
Subject: Re: [dunfell/master PATCH] Revert "u-boot-ti-staging_2020.01: Fix build on hosts with gcc10 on them"
To: Suman Anna <s-anna@ti.com>, <praneeth@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Khem Raj <raj.khem@gmail.com>
References: <20201204202816.16990-1-praneeth@ti.com>
 <b7560c02-8c13-50bd-be51-4ca719c3fc0d@ti.com>
From: "Dan Murphy" <dmurphy@ti.com>
Message-ID: <05230455-b1e4-925b-02f6-f075dd65b43f@ti.com>
Date: Fri, 4 Dec 2020 14:36:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b7560c02-8c13-50bd-be51-4ca719c3fc0d@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Praneeth

On 12/4/20 2:33 PM, Suman Anna wrote:
> On 12/4/20 2:28 PM, praneeth@ti.com wrote:
>> From: Praneeth Bajjuri <praneeth@ti.com>
>>
>> This reverts commit 83f29e8b99144b69ed51ff69f41ab5a50f00fc5f.
>>
>> The mentioned fix is now pulled to ti-u-boot.git in
>> ti-u-boot-2020.01 branch
>> commit a6904f563f ("Remove redundant YYLOC global declaration")
>>
>> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
>> ---
>>   ...e-redundant-YYLOC-global-declaration.patch | 28 -------------------
>>   .../u-boot/u-boot-ti-staging_2020.01.bb       |  4 +--
>>   2 files changed, 1 insertion(+), 31 deletions(-)
>>   delete mode 100644 recipes-bsp/u-boot/files/0001-Remove-redundant-YYLOC-global-declaration.patch
>>
>> diff --git a/recipes-bsp/u-boot/files/0001-Remove-redundant-YYLOC-global-declaration.patch b/recipes-bsp/u-boot/files/0001-Remove-redundant-YYLOC-global-declaration.patch
>> deleted file mode 100644
>> index 4973ea9d..00000000
>> --- a/recipes-bsp/u-boot/files/0001-Remove-redundant-YYLOC-global-declaration.patch
>> +++ /dev/null
>> @@ -1,28 +0,0 @@
>> -From b436a29de12d3f1da579edf3e3d4d42a60b9e58a Mon Sep 17 00:00:00 2001
>> -From: Peter Robinson <pbrobinson@gmail.com>
>> -Date: Thu, 30 Jan 2020 09:37:15 +0000
>> -Subject: [PATCH] Remove redundant YYLOC global declaration
>> -
>> -Same as the upstream fix for building dtc with gcc 10.
>> -
>> -Upstream-Status: Backport [https://github.com/u-boot/u-boot/commit/018921ee79d3f30893614b3b2b63b588d8544f73]
>> -Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
>> ----
>> - scripts/dtc/dtc-lexer.l | 1 -
>> - 1 file changed, 1 deletion(-)
>> -
>> -diff --git a/scripts/dtc/dtc-lexer.l b/scripts/dtc/dtc-lexer.l
>> -index fd825ebba6..24af549977 100644
>> ---- a/scripts/dtc/dtc-lexer.l
>> -+++ b/scripts/dtc/dtc-lexer.l
>> -@@ -38,7 +38,6 @@ LINECOMMENT	"//".*\n
>> - #include "srcpos.h"
>> - #include "dtc-parser.tab.h"
>> -
>> --YYLTYPE yylloc;
>> - extern bool treesource_error;
>> -
>> - /* CAUTION: this will stop working if we ever use yyless() or yyunput() */
>> ---
>> -2.29.2
>> -
>> diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
>> index 29fa6ee6..991ba0ca 100644
>> --- a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
>> +++ b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
>> @@ -1,9 +1,7 @@
>>   require u-boot-ti.inc
>>   
>> -PR = "r23"
>> +PR = "r22"
>>   
>>   BRANCH = "ti-u-boot-2020.01"
>>   
>>   SRCREV = "3c9ebdb87d65aacc4ec302be8bef3df15364bacd"
> Please resubmit after updating the SRCREV that includes the picked up patch
> along with the rest of the changes..

Thanks for the patch.

+1 for Suman's comment.

Dan
