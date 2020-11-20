Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.226.1605898451429558699
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 20 Nov 2020 10:54:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=gNXT30lA;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: s-anna@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AKIsA4K056866;
	Fri, 20 Nov 2020 12:54:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1605898450;
	bh=3NXV1I7SllTg4VPflvnMe4aEdNtbXSDPUZjq+N458s8=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=gNXT30lA9+7fJ4IHDZ9xGEnKJnYS+iTSOtnUE+LynYhSkHpwFmw3cI+7z21tiMlrQ
	 +RCErHYwUFNbp5BfUmlsn42xO7sr+Rn9vybtThaaxEAeuB9AW4wCtEXC7gefHTPchW
	 ySaTUhg5o7aOFheaOdzm8JovPrGwyrr1T3kDqZVs=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AKIsAmE086172
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 20 Nov 2020 12:54:10 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 20
 Nov 2020 12:54:09 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 20 Nov 2020 12:54:09 -0600
Received: from [10.250.38.244] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AKIs903029792;
	Fri, 20 Nov 2020 12:54:09 -0600
Subject: Re: [meta-ti] [PATCH] u-boot-ti-staging_2020.01: Fix build on hosts with gcc10 on them
To: Khem Raj <raj.khem@gmail.com>, <meta-ti@lists.yoctoproject.org>,
        "Murphy,
 Dan" <dmurphy@ti.com>, "Bajjuri, Praneeth" <praneeth@ti.com>
References: <20201113011308.604936-1-raj.khem@gmail.com>
 <CAMKF1spxTT2nH1Hjfg+M+XwMyg+xU0bpWvaBZfq73wUMmHXRvg@mail.gmail.com>
From: "Suman Anna" <s-anna@ti.com>
Message-ID: <601363f5-d1fd-ebd0-291e-8edddc03e75e@ti.com>
Date: Fri, 20 Nov 2020 12:54:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spxTT2nH1Hjfg+M+XwMyg+xU0bpWvaBZfq73wUMmHXRvg@mail.gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Praneeth,

On 11/18/20 9:03 PM, Khem Raj wrote:
> ping
> 
> On Thu, Nov 12, 2020 at 5:13 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Backport a patch from upstream to fix build on distros with gcc10+
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  ...e-redundant-YYLOC-global-declaration.patch | 28 +++++++++++++++++++
>>  .../u-boot/u-boot-ti-staging_2020.01.bb       |  4 ++-
>>  2 files changed, 31 insertions(+), 1 deletion(-)
>>  create mode 100644 recipes-bsp/u-boot/files/0001-Remove-redundant-YYLOC-global-declaration.patch
>>
>> diff --git a/recipes-bsp/u-boot/files/0001-Remove-redundant-YYLOC-global-declaration.patch b/recipes-bsp/u-boot/files/0001-Remove-redundant-YYLOC-global-declaration.patch
>> new file mode 100644
>> index 00000000..4973ea9d
>> --- /dev/null
>> +++ b/recipes-bsp/u-boot/files/0001-Remove-redundant-YYLOC-global-declaration.patch
>> @@ -0,0 +1,28 @@
>> +From b436a29de12d3f1da579edf3e3d4d42a60b9e58a Mon Sep 17 00:00:00 2001
>> +From: Peter Robinson <pbrobinson@gmail.com>
>> +Date: Thu, 30 Jan 2020 09:37:15 +0000
>> +Subject: [PATCH] Remove redundant YYLOC global declaration
>> +
>> +Same as the upstream fix for building dtc with gcc 10.
>> +
>> +Upstream-Status: Backport [https://github.com/u-boot/u-boot/commit/018921ee79d3f30893614b3b2b63b588d8544f73]

Please back-port this onto our U-Boot branch, so that we can drop this in the
next update.

regards
Suman

>> +Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
>> +---
>> + scripts/dtc/dtc-lexer.l | 1 -
>> + 1 file changed, 1 deletion(-)
>> +
>> +diff --git a/scripts/dtc/dtc-lexer.l b/scripts/dtc/dtc-lexer.l
>> +index fd825ebba6..24af549977 100644
>> +--- a/scripts/dtc/dtc-lexer.l
>> ++++ b/scripts/dtc/dtc-lexer.l
>> +@@ -38,7 +38,6 @@ LINECOMMENT  "//".*\n
>> + #include "srcpos.h"
>> + #include "dtc-parser.tab.h"
>> +
>> +-YYLTYPE yylloc;
>> + extern bool treesource_error;
>> +
>> + /* CAUTION: this will stop working if we ever use yyless() or yyunput() */
>> +--
>> +2.29.2
>> +
>> diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
>> index 991ba0ca..29fa6ee6 100644
>> --- a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
>> +++ b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
>> @@ -1,7 +1,9 @@
>>  require u-boot-ti.inc
>>
>> -PR = "r22"
>> +PR = "r23"
>>
>>  BRANCH = "ti-u-boot-2020.01"
>>
>>  SRCREV = "3c9ebdb87d65aacc4ec302be8bef3df15364bacd"
>> +
>> +SRC_URI += "file://0001-Remove-redundant-YYLOC-global-declaration.patch"
>> --
>> 2.29.2
>>
>>
>>
>> 
>>

