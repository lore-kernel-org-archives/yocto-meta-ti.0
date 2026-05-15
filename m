Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27B51CD4F25
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 15:10:03 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.14])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37127.1778857797748083890
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 15 May 2026 08:09:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=H01eFgGx;
 spf=pass (domain: ti.com, ip: 52.101.48.14, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eRAYFss+1yYZnYN5PSHDeHLvcf/6POkTYijb9H3XAgGGl2uHp9f9E8vgZGAbMOEeAtw4VXBv+O/jqc38CiijXVAgakNsS/xknd3sT12M3Kte4j9mxNWkRpXJ4qcyUzYHNVxaYZLqlifSTkb/ZCDdCzSD45XUe4ppudlBHNKiz1jtV2ClraL8BFi2/R8kp/DMv5eUmIOlAbD8eRPQj8tCC+Yvib63/WQHA5uJ3A0YTta0/WsJQKRgTvghGpX1NbUM0YjcEhaW3Ea/s2Btw/cNOtvAiczjRK3CowgEZ137n6OzRATBy0FIeiNiQv/55tPpuV9tJHc7XkJZTdsV9Zt9sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sxMmSR0vG1n1RIuV1P+eJGxN7OoNKINNgmV4znH5DGc=;
 b=JIHhqSNu1mt+42zBMdszNYzQUq8adQslOZ8hUpm5A3mylMgoPXww0zM/qzzATiUCRhysU3v0DJ22xzaFxoGsn+fBMVVToLx0S9E89Mm0lCIp5M1X91M5otTnld5h2n0eV3D4gmNFqDpY1N9Jb1LFf6c16edTBzg8xLCr22MNX2ZEgeNMv3IEGzE3e4IPBBU2Ynho0ycD5pJcGTb2rgEA3OAydIz7VSsWDls3UuJAXAOrPK8V99Mv1ECHA0k5+n47vi/xy/aLqzzLpubn5r9uJp1vejfo1OOr5S8kt9B/f9PDze05pR5wgn/ly+q+ikNyMYgwiVURQiZNbl4nh2Ac/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sxMmSR0vG1n1RIuV1P+eJGxN7OoNKINNgmV4znH5DGc=;
 b=H01eFgGxKfb+XJtJNoQVt9oBvuqzfcMisJ+/bbCLnmhjG2Rkrp7D9YMvziD50V3OswjRIARIVkcjLwa7Gt3JVEJdJ4QliRVS8m3Fn4vegZMZBvF2T63k0OUicPye5Sl6xxSVf6poIKCrqxwVmsp3DQvcmKJAOKaYJ8ZxK6CIUiY=
Received: from BL1PR13CA0065.namprd13.prod.outlook.com (2603:10b6:208:2b8::10)
 by SJ5PPFC2FD05DC0.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7c8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Fri, 15 May
 2026 15:09:55 +0000
Received: from MN1PEPF0000ECD7.namprd02.prod.outlook.com
 (2603:10b6:208:2b8:cafe::e) by BL1PR13CA0065.outlook.office365.com
 (2603:10b6:208:2b8::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.18 via Frontend Transport; Fri, 15
 May 2026 15:09:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MN1PEPF0000ECD7.mail.protection.outlook.com (10.167.242.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Fri, 15 May 2026 15:09:52 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 15 May
 2026 10:09:52 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 15 May
 2026 10:09:52 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 15 May 2026 10:09:52 -0500
Received: from [10.249.32.9] ([10.249.32.9])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64FF9psT473208;
	Fri, 15 May 2026 10:09:51 -0500
Message-ID: <c5e70581-f0e3-4b6b-a65e-e8e7b65725e2@ti.com>
Date: Fri, 15 May 2026 10:09:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH] meta-ti: optee: Update to 4.10.0 tag
To: Denys Dmytriyenko <denis@denix.org>, <s-joshi@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <kamlesh@ti.com>, <k-malarvizhi@ti.com>,
	<s-tripathi1@ti.com>, <praneeth@ti.com>, <m-chawdhry@ti.com>,
	<vishalm@ti.com>
References: <20260515062818.1468076-1-s-joshi@ti.com>
 <20260515145051.GC7941@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260515145051.GC7941@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD7:EE_|SJ5PPFC2FD05DC0:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e70e7f2-e91e-41b8-6562-08deb294045a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|4022899009|376014|3023799003|56012099003|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info: 
	d/sudlyWNiy2nvLJN0fQItvo5fSD4m8f0it8lOn5ipTPvINXQEpY5ORmd75/AdBjmm7MPxiexk6I/89HHmot3vBfnekLfsAy+AAU9BavSqEO54SechZ/qE6cgj3PciUXDAXw0EJez8ecVDPD/I5j68mh75mlM+e60QPQ4RecphkAYYycW2j1hZgvkjk8G2INzxsGjyy3l8/v4FcoFPF46WXhjqXc8E051/6miv/Agz4lGcOFOUTvponhk2KSEctD7xpALacmBWHY6+8PiuS9LTh7t+ZlY8cV+IW43+T22LPEub7/O119IYe1Bd5HO1Hv8/RZv0yGtctw+W4ao7zINCuMS0breUU3HU4nT34cr6xMokhZO7wNRPrum/9kelFn1ym/PTksC68UtM4KGGFpVI09ekc1XRqfEcOM86Y7vJvmtdnDnmk948a+lI26Z8xyJTj4z1b8h0QDwE6Y0TkV7ZK3oxqoCklB1cU3A9H7gdraVzmFefScqIBq1EL4/B+O82HGcgODADtEBI6SwL0nsmscnbTNTlYAA9na5KgM09xfmETY9C3vsikNZdJQuRCwkPvE69jEqOMQcZu7I31ja7jOAtnXrx9G1sBFLARVxHH26APve8o6ZjnovByYal03wquolGaj6KMAgCnj4tKgxr9yaSCCHXLATD9r8aMbBz7R+j8ih9vWap76v0359pqQ
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(4022899009)(376014)(3023799003)(56012099003)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	PdkF/oGtejmQ1dq8ThnK0bMnrPdFjBt6Gtd/NCE7itOUABnjo2uktWEGf/iMJvqcOTjz52M1mh1RE7BXf0JaIAsHIotl/BnAZPlOfCxd5+uzNiLCeJjnYLizX4w/sJMjZZeefXMM6MocBAdnHZVBslpzYKgyqdq9vl1fp1fzOGZNaZJyrmpGmJGNfLsZb+OkL5RTf7jCSdD89y3awCPkPIoCYboFArOyjAlBwpXe57ss0mT8XvZoDUFim7iyvbL98urlFFO5KVUpLvCDiko+W3dXn+toiinqhmnzl/WcyKyeGCsidqgngVurIaRSp9oW9YsiZqjobbNAUk0rrqq+khjR22Otsa58QLVZmnNrAuZPxiHrK7oCqbj9Q90UYBkLl8EO3hhw5XV6YoV98TyNYCcXcGkgVYLREMxHbzPUmgZkXcXFSO2Bg6Ro5Clf9AcP
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 15:09:52.9325
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e70e7f2-e91e-41b8-6562-08deb294045a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000ECD7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFC2FD05DC0
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 15 May 2026 15:10:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19936


I was just going to ask that. =)


On 5/15/2026 9:50 AM, Denys Dmytriyenko wrote:
> Should this also go into wrynose besides master?
> 
> 
> On Fri, May 15, 2026 at 11:58:18AM +0530, Suhaas Joshi via lists.yoctoproject.org wrote:
>> Update optee_os, optee_test, optee_client, optee_examples and optee_ftpm to
>> 4.10.0 tag.
>>
>> Signed-off-by: Suhaas Joshi <s-joshi@ti.com>
>> ---
>> Tested this on AM62L using `xtest`.
>> ---
>>   .../recipes-security/optee/optee-client-ti-version.inc        | 2 +-
>>   .../recipes-security/optee/optee-examples-ti-version.inc      | 2 +-
>>   meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc  | 2 +-
>>   meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc    | 4 ++--
>>   meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc  | 4 ++--
>>   5 files changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
>> index 68b6b262..7968f3fb 100644
>> --- a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
>> +++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
>> @@ -1,2 +1,2 @@
>> -PV = "4.9.0+git"
>> +PV = "4.10.0+git"
>>   SRCREV = "9f5e90918093c1d1cd264d8149081b64ab7ba672"
>> diff --git a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
>> index 6ec2a83d..eea7762f 100644
>> --- a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
>> +++ b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
>> @@ -1,2 +1,2 @@
>> -PV = "4.9.0+git"
>> +PV = "4.10.0+git"
>>   SRCREV = "934c7edb74a26e90f68024cf441073528444177f"
>> diff --git a/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc
>> index 350eb9c9..b961c70f 100644
>> --- a/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc
>> +++ b/meta-ti-bsp/recipes-security/optee/optee-ftpm-ti-version.inc
>> @@ -1,3 +1,3 @@
>> -PV = "4.9.0+git"
>> +PV = "4.10.0+git"
>>   OPTEE_TA_GIT_TAG = "${@'branch=master' if d.getVar('PV') == 'git' or d.getVar('PV').endswith('+git') else 'tag=%s;nobranch=1' % d.getVar('PV')}"
>>   SRCREV_optee-ta = "a09269b15de635e1816fe832e26adfbfb44c5455"
>> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
>> index db18c696..473c5282 100644
>> --- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
>> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
>> @@ -1,2 +1,2 @@
>> -PV = "4.9.0+git"
>> -SRCREV = "f2a7ad0638aeff5243593b33cc56ad064cae7615"
>> +PV = "4.10.0+git"
>> +SRCREV = "753afbbee1682f5d16fd30e87b31058a4fd4f4b8"
>> diff --git a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
>> index 15b43063..8a8e9ac8 100644
>> --- a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
>> +++ b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
>> @@ -1,4 +1,4 @@
>>   FILESEXTRAPATHS:prepend := "${THISDIR}/optee-test:"
>>   
>> -PV = "4.9.0+git"
>> -SRCREV = "b27648ea8472cceceb8dda368a965c709066f7aa"
>> +PV = "4.10.0+git"
>> +SRCREV = "88c93e87a5c172363ee986ded036a25cafcc9d2c"
>> -- 
>> 2.34.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#19935): https://lists.yoctoproject.org/g/meta-ti/message/19935
>> Mute This Topic: https://lists.yoctoproject.org/mt/119326045/6551054
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

