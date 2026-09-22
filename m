Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5A15C982FA
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 19:09:19 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3928.1790104157339213311
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 22 Sep 2026 12:09:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=pe9GUUw5;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=JgtkFifs;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MIwGLq2960744;
	Tue, 22 Sep 2026 14:09:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=PrwUpLXPd4FTGH3VZvXCCGW2GLI23KQ8M1XpTHpBh
	X8=; b=pe9GUUw5dY3DQYQ8PtTHt5QE+bzW0+lUa+ePG4FBqNpQdiCexA6077QQl
	VbxJOGwx6GIHT7nY9xXtgTl4uYUu/+KapwNBVLVUSNeC7nxRxQeCtHAxuBiJlwSL
	BlVga+nxYnQt21GXg5EcOtOBqo7H/YgydhX1igZce8Iyhlv330Tn/xe+ZyuqZjJb
	uh3y9YMmrK1XYqm1BeC1MNRYPJKsozcL2GTs5ewrYEolMhPq+rov2WjhggNwrs38
	XQUq2Qxo/u6O6sr5rrG6s00sLloOtvQ+9EO6GMgiGiyoTsqcosB884qxhAUfgRCJ
	U809yTQ2xa9uCC1vTnq5kCb1f23eg==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011023.outbound.protection.outlook.com [52.101.57.23])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gugxm5ets-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 14:09:12 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o+CVGl0pECDU8yU/hz3A/bO1OxOFdX056V9ZV9D5lxOS80E3eWXu8B+2/jSh0pUbWF2CjdrR/EtwxHhMiQqrnbjGzJwIOYBQfDFWZvT3VzAYhJeDj53LOsM1FhL4cNbaa+vKipDIgJDqBGcSqy8suEkUuffJzurhnINH6jefSrmh3aXoYU7zUputxiFfKt07MQ+hdSqbMYb/JO6ofY5xoY+5q7lO2WjD8cLYcIH4S8Sj9ir4pE0b3iod2Cx1XnvnySconbXoSJgGZfJhucORrr+COcZzG5n+HMCWNV/7cr79L+qUkHUDAxqFjJQ/fm69g+ov0ReYwfJXlWY10d2W7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PrwUpLXPd4FTGH3VZvXCCGW2GLI23KQ8M1XpTHpBhX8=;
 b=wK26jb6ov/DLvjYvAWJjYdH2Xxh09IkoTaFisdi4jmSFAbdf+lHI2ZABanfZlzaFIfarMKzYdxoIJtZIck2S7hh2Hxl2O55ISAWdBO6c4LJexJcE5R5fw4c7Swq8RtTm/5UBZIQBWGxDyWrgV/SJ3wVWywbJNZwUjA412oExRL4FTqiXUBFtjnAcdjWvx/bWZVYDknoIhNms9cd5rTgIYAOAycQ+BQWsrxnPkN76MDiZi/cf5EML6CkwibB4AAj4baELKKsW3z4H0XXJ4ybMpjy2ZYpibepFnjb4y7TI0zSapIFtQ+fBLUKfFDUa7xY1oOTM+LVlXFVYZswDEIIjfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PrwUpLXPd4FTGH3VZvXCCGW2GLI23KQ8M1XpTHpBhX8=;
 b=JgtkFifsWZb99o5hplA5T5cwcoaO2tnEyMJGRTGX/pBvxNSOa0LInd4LiFMmQuypI4d2Dv+AvgK0/j57ImHOl/pt53vUZyeeyf1gtG+rlI5mH2qqUioMNHncxeemYRbDqLvj0lKnQfWxjaJP+JwmCl4SgjxnyoXovDKJ48w7oLE=
Received: from SJ0PR13CA0177.namprd13.prod.outlook.com (2603:10b6:a03:2c7::32)
 by SN4PR10MB5607.namprd10.prod.outlook.com (2603:10b6:806:20a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 19:09:08 +0000
Received: from BY1PEPF0001AE18.namprd04.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::37) by SJ0PR13CA0177.outlook.office365.com
 (2603:10b6:a03:2c7::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.13 via Frontend Transport; Tue,
 22 Sep 2026 19:09:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BY1PEPF0001AE18.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 19:09:05 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 14:08:47 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 14:08:46 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 22 Sep 2026 14:08:46 -0500
Received: from [10.249.33.88] ([10.249.33.88])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68MJ8kq9550947;
	Tue, 22 Sep 2026 14:08:46 -0500
Message-ID: <11c3365e-2482-40d8-96eb-87b10f901e54@ti.com>
Date: Tue, 22 Sep 2026 14:08:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master/wrynose][PATCH] recipes-multimedia: Add PipeWire bbappend
 for config files
To: Denys Dmytriyenko <denis@denix.org>
CC: Paresh Bhagat <p-bhagat@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <praneeth@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <j-sahu@ti.com>,
        <p-gupta5@ti.com>, <r-soni@ti.com>, <s-kapoor@ti.com>,
        <s-sinha@ti.com>, <sen@ti.com>, <y-hegde@ti.com>
References: <20260922103002.3723697-1-p-bhagat@ti.com>
 <cd12b7db-e3aa-49bd-bf16-465002cc0a85@ti.com>
 <20260922185543.GB4190@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260922185543.GB4190@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE18:EE_|SN4PR10MB5607:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a3f1dfd-1626-409d-0b46-08df18dcf8a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|23010399003|10067099003|56012099006|6133799003|3023799007|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info: 
	YE/j+XE6xgD1FyoZHA2QfP+YaazO/SyEBGGbhdNGoKhNVi8guChw+CelFiQwXNputx9ScZ2tHbTPDomHLLjA5cdn6wHzTLAeT+k4UDo/TJDmZSplYor49gSlwUejUYJ32qtoYBtG3Wr2QB8awHWSP46ADnG5NETrY20kEaBHWzV5Ypnyjsg54JawkCeAEvyr8BzUEDrumglIIhH5/SpxOGJ9Zzvc0VBbOJPXpO/nYf6yt+5hYQPhtldad/xXbxkiDRF2kke86rBpw9WfffLS3k6Mh38xIkfu9xn7lhacrsLlcXi042S6qQA7NYlI0EmsW71ho3UBnsiFBbtVhV2RLdorwd5iymPlqZCICt7dvKKWgdP5KgftXNYOH+YA9UTe21MJllLqUAgsRtMrTA6er5+Qcn/ebrPsNfpDSlJ6FxDoPSiWsD4bQMcXov3DJ40hkXxl92tXiEzEnhtY3FvrqWJzE01rlgU4I4O5jKY6QaUyckJNkFXvJDo6EjCnXxl48uVxa9rr9dCjAh9taCoUyxdxdzgh/EN5iE8+lqVIIlWA/luUa9KDnB1ozCAZSzZeZmauhj2WHgUOVbry3ZacfV1Xb5AGWhdow5MEV2ISSdDKKyAVW0nxoDLi0lRpxoYvbtjqfpLw/eWrpz+1Gq0fd0iDnwRFwDszRllVbo8ifWvmaWE2bLLGndPvJpQKV0zPPjo6VEHpWafDVzWs/riwcw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(6133799003)(3023799007)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	hw/UN/tE6j5iu8IaNcFyE7c8xzG+IK/hOm2Wq2k0A+M4PA0wcvjrYM6x8UG261f+SEt5jmXT7G7RGNvyjhoV1RhJ2IFC8bj9k/hGsgdxdjgFoIiEPiGwoWh0aMki2ZPu8tJJPNSB4fv06GnauzfQwGxTKtsK+PXf7DUhBS4WN/bJp3bGz/iS5WyMCzCKMu9Cf6MHSTM7TMaY1+Q5Y6fJeBcKy6dlfM9g3BZpUVc+X6ZYuAf940s6qdHZPHe+jUlU8TWEEbDR4xpEefRfI+9fDfKolAtVk7yd04W0hWjmih2T1GWVQzFoy0fcErbnvS1BCFidj+ZqUcIJX0I+52r3XTq6YDeLWsgZQ8zoc479J7lJ5BkFA4aLOJEvwplaWVx5QHLuATxMxTWkIGDbUbH6nHYeR9wszn2rqVCi6GJBNFbY8KyNf4JXYCAaxR2Us31e
X-Exchange-RoutingPolicyChecked: 
	Wsr84S8o2/0R/DlVepN/SOpk1VLyLTOTSDXYCY3TXyMykRw1ZW2L6/BP7wWNLXOBC7whVJTp3ofSTCqSIO8fqkVUiQBQHEw5VqYwXOgammRfLRZIpiPDmts9NiR73T2fTji3q8cCw6fbXn57S6YzledskAx1Vho8d6EZDWt7yzzzuJI4Ilf1vXvqIaMYy3cJm/Hwbfp4b22v4lHIF47P8ws+jbdKMiXfPgIaXT/JgkXuFnTbkhcTfB47hMsERkrPtWRNp9+b85vNKFLyUQBn/octPg6ikvtcB5hnqEGrhz0yqkFxjWblGqSDSlvyHnW6wrq1sUpVnvDY5iQTHjB/Jw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 19:09:05.2038
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a3f1dfd-1626-409d-0b46-08df18dcf8a5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BY1PEPF0001AE18.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5607
X-Proofpoint-ORIG-GUID: r4_yYyfHdnPEa5SKVwMFWmIKrbbQs1IS
X-Proofpoint-GUID: r4_yYyfHdnPEa5SKVwMFWmIKrbbQs1IS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI4MCBTYWx0ZWRfXyNesfP8aifMM
 6H6l9rCrhUT0r0va2qIDYNlAlXQneJ9HE7pKnFReb0eUhzKfkeQs/GzsS0suvphHqYfYmCJ7G+x
 3bhJrWhayXCDJa1ZRo8FUwoNF2Plwj5GF3DtddrvBRRqDjQtsblSHYFOG3nx1uaEr1QDlYzKKWK
 I63NtyTA5MLI4NdSIN3dUBDILC7bC7OCg65TJYOGtdXkqtoRb3vio8hZrVWSxFK/zQt1sOeAAQb
 RMTCGw+3Q6PjJ3wkM2o8lLArYzpOXmNN0J88O2DwVKFChFtOVNKOuL9LL2Y7OMkV5prxW0uoW9L
 +ZR+Kz5A00x5+SDFVMTg8/ZDpTi+koBlEn5Tq+Ma07RWZcXWFZOZiadf/0K0vK4iuE0Q2BGq1Qu
 CqJXVHyDZe7QxaPqbSVsoqK9/pJsNN3du2m9NQZ+7zmQNkAyIvHutDitXGEJ0EB3j5mFnCxvbSY
 NoNGiEfUQ01SsyTXJFA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI4MCBTYWx0ZWRfX5o0WNGEWI8Ij
 +333KBeSSezeQJFl9m9T1cZoFHkACVupOx3rHuUpRJ9offVhs4esteU7G29W41Xgs6i3zUImM69
 ncw8HdAMEnyESy6hcK67BueHMvH3pLM=
X-Authority-Analysis: v=2.4 cv=INeXmQvG c=1 sm=1 tr=0 ts=6ab2d258 cx=c_pps
 a=n8CZQ1v8Y1OZ9xNCwzzv5Q==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8
 a=CiFI_wMXjhDzNFL4IbIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220280
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 22 Sep 2026 19:09:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20398



On 9/22/2026 1:55 PM, Denys Dmytriyenko wrote:
> On Tue, Sep 22, 2026 at 01:44:16PM -0500, Ryan Eatmon wrote:
>>
>> With this patch in here we will need to add a layer dependency
>> between meta-ti-extras and meta-openembedded.  In
>> meta-ti/meta-ti-extras/conf/layer.conf you need to add a second
>> patch that make this change:
>>
>> LAYERDEPENDS_meta-ti-extras = " \
>>      meta-ti-bsp \
>>      openembedded-layer \
> 
> It's rather multimedia-layer, not openembedded-layer...

Doh.  You are right.  I misread the path...


> 
>> "
>>
>> Otherwise we will get errors when running the check layer script and
>> running afoul of the Yocto Project Compatible requirement.  That's
>> what the error in the PRC response is telling us.
>>
>> Can you send a v2 with a second patch that does this?  Make that
>> patch the first patch in the series with this one the second.
> 
> More generic question - do we want this to be a hard LAYERDEPENDS, or a soft
> LAYERRECOMMENDS with a dynamic layer setup?
> 
> 
>> On 9/22/2026 5:30 AM, Paresh Bhagat wrote:
>>> Extend the PipeWire recipe to add platform-specific ALSA configuration.
>>> Add sink and source configuration for 8-channel audio playback and
>>> capture on the AM62D2EVM as the default configuration is 2-channel.
>>>
>>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
>>> ---
>>>   .../pipewire/pipewire-ti.inc                  | 20 +++++++++++++++++++
>>>   .../am62dxx-evm/90-pipewire-sink.conf         | 17 ++++++++++++++++
>>>   .../am62dxx-evm/91-pipewire-source.conf       | 17 ++++++++++++++++
>>>   .../pipewire/pipewire_%.bbappend              |  4 ++++
>>>   4 files changed, 58 insertions(+)
>>>   create mode 100644 meta-ti-extras/recipes-multimedia/pipewire/pipewire-ti.inc
>>>   create mode 100644 meta-ti-extras/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf
>>>   create mode 100644 meta-ti-extras/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf
>>>   create mode 100644 meta-ti-extras/recipes-multimedia/pipewire/pipewire_%.bbappend
>>>
>>> diff --git a/meta-ti-extras/recipes-multimedia/pipewire/pipewire-ti.inc b/meta-ti-extras/recipes-multimedia/pipewire/pipewire-ti.inc
>>> new file mode 100644
>>> index 00000000..65a82671
>>> --- /dev/null
>>> +++ b/meta-ti-extras/recipes-multimedia/pipewire/pipewire-ti.inc
>>> @@ -0,0 +1,20 @@
>>> +PR:append = ".ti0"
>>> +
>>> +FILESEXTRAPATHS:prepend := "${THISDIR}/pipewire:"
>>> +
>>> +# AM62D-specific config files
>>> +SRC_URI:append:am62dxx-evm = " \
>>> +    file://90-pipewire-sink.conf \
>>> +    file://91-pipewire-source.conf \
>>> +"
>>> +
>>> +do_install:append:am62dxx-evm() {
>>> +    install -d ${D}${sysconfdir}/pipewire/pipewire.conf.d
>>> +    install -m 0644 ${UNPACKDIR}/90-pipewire-sink.conf ${D}${sysconfdir}/pipewire/pipewire.conf.d/
>>> +    install -m 0644 ${UNPACKDIR}/91-pipewire-source.conf ${D}${sysconfdir}/pipewire/pipewire.conf.d/
>>> +}
>>> +
>>> +FILES:${PN}:append:am62dxx-evm = " \
>>> +    ${sysconfdir}/pipewire/pipewire.conf.d/90-pipewire-sink.conf \
>>> +    ${sysconfdir}/pipewire/pipewire.conf.d/91-pipewire-source.conf \
>>> +"
>>> diff --git a/meta-ti-extras/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf b/meta-ti-extras/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf
>>> new file mode 100644
>>> index 00000000..857c344e
>>> --- /dev/null
>>> +++ b/meta-ti-extras/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf
>>> @@ -0,0 +1,17 @@
>>> +# PipeWire sink configuration for AM62D.
>>> +
>>> +context.objects = [
>>> +    {
>>> +        factory = adapter
>>> +        args = {
>>> +            factory.name           = api.alsa.pcm.sink
>>> +            node.name              = "alsa_audio_sink"
>>> +            node.description       = "Audio Output"
>>> +            media.class            = "Audio/Sink"
>>> +            api.alsa.path          = "hw:AM62D2EVM,0"
>>> +            audio.rate             = 48000
>>> +            audio.channels         = 8
>>> +            audio.position         = [ FL FR FC LFE RL RR SL SR ]
>>> +        }
>>> +    }
>>> +]
>>> diff --git a/meta-ti-extras/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf b/meta-ti-extras/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf
>>> new file mode 100644
>>> index 00000000..ac7635de
>>> --- /dev/null
>>> +++ b/meta-ti-extras/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf
>>> @@ -0,0 +1,17 @@
>>> +# PipeWire source configuration for AM62D.
>>> +
>>> +context.objects = [
>>> +    {
>>> +        factory = adapter
>>> +        args = {
>>> +            factory.name           = api.alsa.pcm.source
>>> +            node.name              = "alsa_audio_source"
>>> +            node.description       = "Audio Input"
>>> +            media.class            = "Audio/Source"
>>> +            api.alsa.path          = "hw:AM62D2EVM,0"
>>> +            audio.rate             = 48000
>>> +            audio.channels         = 8
>>> +            audio.position         = [ FL FR FC LFE RL RR SL SR ]
>>> +        }
>>> +    }
>>> +]
>>> diff --git a/meta-ti-extras/recipes-multimedia/pipewire/pipewire_%.bbappend b/meta-ti-extras/recipes-multimedia/pipewire/pipewire_%.bbappend
>>> new file mode 100644
>>> index 00000000..f806d28f
>>> --- /dev/null
>>> +++ b/meta-ti-extras/recipes-multimedia/pipewire/pipewire_%.bbappend
>>> @@ -0,0 +1,4 @@
>>> +PIPEWIRE_TI = ""
>>> +PIPEWIRE_TI:ti-soc = "pipewire-ti.inc"
>>> +
>>> +require ${PIPEWIRE_TI}

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

