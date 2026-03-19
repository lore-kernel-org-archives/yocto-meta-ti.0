Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A619F1090239
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 14:59:11 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13077.1773932346252444926
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Mar 2026 07:59:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=juyykBbM;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.52.44, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iqQe5sXQu2eIyfvA/X7C0YqrCah/TRl8JntzjW7zxtQIwvg5iGtgIoPRJ7pzxiVUxSWmBTgMTCDv7mwrueAatW62Q9cMgDskkwzDIfDLBb3/QDzdD80HGK2n8NkLWFA2eQOfA1gM1B+mJC2U/jBifGM4mGFfxVkss2tiME8Sr88fyU0YgA0vwhbCfVe+Ea/OVikN2CzvjeFYFtIuTxtFT6uIgQp8X6obvVqD9FZ/vjJ9ModTwIuQ/ZkTbrrmFuOgSWdBJnJ6Gm1NNbS0K2n3DRnW2xFEoFs8IPnCGCGCzWmeik6G6AnmdIQh7AKf/FmnuSWbXTovukZ14wj7E+77eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gZLgR/O3vM5M23XW5Bfc6x5wRIrRysNFXqkcgrEDVk4=;
 b=QZkXIzMoqZMaW7My0nxEwhXMiR42gW5Vicp0KNdVIJvjXSXEv5ojF/IgdCWUtDXCQdZC4J14Pd6lfleZV/PEXx+t1agY2i6wPtPMmsWzlhlXb56sBHl0Vyr1/4fNzbkx7R2Y8V+u8AYrj19uLCKIdh7q+sRNTYv2urCfeMEpjuQXwhCAA6qhKY0xJfHHiF1TnQuzA7yYIJ66AhQ4y3cT5yrVIMYsBOEJbw/3mEPX6EXzv1ZBL0UmjHZGkNq65XLqNJ3C/Md5lQbKl1LM+2NrvpYof25xriWsHWKPOD1g0r31eu/i5ms20+o85ccw69DGegc7Ilv7R+pJ1XFdf4XzcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=criticallink.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gZLgR/O3vM5M23XW5Bfc6x5wRIrRysNFXqkcgrEDVk4=;
 b=juyykBbMxG+j/y1leGypCpjLASR0pdi+gXV5pK0lzJnc9qn6K+dZUb8d/VnK6BR7JA8eXbUDGnWhuZfYXqNQPG8lS2qyZPtDJYSyz+tuX+sxHD8e8MnDbIBPYzEUVv8Wud/wIxRiH4fO/q3gE4BbSQ1z6wM4ZSd9jGoFr2E0Hoo=
Received: from CH2PR05CA0031.namprd05.prod.outlook.com (2603:10b6:610::44) by
 SJ0PR10MB4718.namprd10.prod.outlook.com (2603:10b6:a03:2dd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 14:59:02 +0000
Received: from DS3PEPF000099DF.namprd04.prod.outlook.com
 (2603:10b6:610:0:cafe::47) by CH2PR05CA0031.outlook.office365.com
 (2603:10b6:610::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Thu,
 19 Mar 2026 14:59:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS3PEPF000099DF.mail.protection.outlook.com (10.167.17.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 14:59:00 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 09:58:49 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 09:58:48 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Mar 2026 09:58:48 -0500
Received: from [10.249.32.190] ([10.249.32.190])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62JEwmVh2731494;
	Thu, 19 Mar 2026 09:58:48 -0500
Message-ID: <b3cbeafa-b864-4435-9984-907138dd0ed6@ti.com>
Date: Thu, 19 Mar 2026 09:58:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH v7 3/3] conf: Enable dynamic security
 layer for LUKS
To: Denys Dmytriyenko <denis@denix.org>
CC: Shiva Tripathi <s-tripathi1@ti.com>, <meta-ti@lists.yoctoproject.org>,
	<rs@ti.com>, <jcormier@criticallink.com>, <praneeth@ti.com>,
	<kamlesh@ti.com>, <vishalm@ti.com>, <k-malarvizhi@ti.com>, <vigneshr@ti.com>,
	<afd@ti.com>
References: <20260319103533.2431033-1-s-tripathi1@ti.com>
 <20260319103533.2431033-4-s-tripathi1@ti.com>
 <d9e195a7-5735-410c-be03-734eff2a7497@ti.com>
 <20260319145527.GP11121@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260319145527.GP11121@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DF:EE_|SJ0PR10MB4718:EE_
X-MS-Office365-Filtering-Correlation-Id: abc49448-edc5-41ed-e150-08de85c80dbf
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	jWjmqQhKPy8x8UP8UFPsUUBWovEA/J6ffaOo7OdXhG69OChdnsE6YKfivl3eiN8VS+jn6bJfJXO0zjZOBYTLrYMJnLAskKWKjBuzaBMhx3ZRGOM7eINOoLxaSRhrj1jCxFiMtCtzV1m+/3sbSkCznWoS3UqZcupQ3KJ+5j+R0E4cCOIl/6ICpeNO/2CW5kSErOWZZt5v36HOjLKS9yBvZv2w0r/48w66XcttWaUW2l8HvI03N3r2E5DC/ZUTy7E19CAC1N9JQqFJZrxPVGwgg0m87+4N8q2IY7EfSWxgPtH/ObRDT3Y4kTzal7Ddf+tvMjjXzoJ25gyuirgzXo3qvv1lpjycJoycjrAiSc3EM5xMzNMuCnv7aHQkdCvNueJP5ShPzA5NkhhUiuZCvHyrtpS+mdlTntdwXaqSpTPmiD6fM9ExeYgJ6KW5R3jLz0pWA3NaRL1ScSkWTICciGchUlctEyOUFfT/TqSF/UnEuo9QoGNEhmb2QkVpZK+FAOplrhvRXey4wmRaceGVbD3E/Ri5hiFNHW3FKEtXl6Dnd6lyyvKYWVG/9TdS1c4rlSNN1T8AkJnPQssJctpxBc45dJDyGXbUtZ6RwlOlkK1hnkJz0fgmDDHmmkbita5Bd8QXUVPtxPoUDAAE8x/ahmCBt5wMLrxequLHlAslGIx4rFyFUfF/lE5gllb1b/POE+VHAV13gpPwriuagP1W0JGqh1oHMiZAnWQpfxYBzMR8/Ipf6wtqW4nh+5j2DX4bDhBK2gc+vGxTFVpFs4dHZFDo/g==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	wUUHr/AIuHRWUwB7uMHjKoBvYe+s7K4vYyAYyrKB2dl0lDkfX924cLick+k3uzO53eGs9L8JdBv0hNyT9ZromFZC5frGjnT7PPxkLkSywzeCQbD4XCtPqKJJfaFBqdzRC7k+BuN8G4aKOZXNh6MroSnBn6HT+O8d69KRYS/yyT15hR53+EtQ4QY+O8ximNzl6ld+lOJ15xGi4x9OV0BQUmyPMo84WcCt9NQfu/f5PgPq5ftHGmvm2iKMvUFzITs1nI1kvTc7VZCghgk6R/BejhAIZILWkH+bNawhvjVWxw2+eK3RpQl87qLD25tnKCKScO76Sw4pRf3/NZvV/HezsbxF7WQMO07C+pBRH5c50P58ZVrLfF6Noa7HFx2p6zbOfblGPK9e+RKKagVuNf+Bp7tD39xEapuvvAJoVLh9LlC3GwE2yjv4TMBzApb6H28a
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 14:59:00.2865
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abc49448-edc5-41ed-e150-08de85c80dbf
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4718
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Mar 2026 14:59:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19780



On 3/19/2026 9:55 AM, Denys Dmytriyenko wrote:
> On Thu, Mar 19, 2026 at 08:59:24AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>>
>>
>> On 3/19/2026 5:35 AM, Shiva Tripathi wrote:
>>> Register dynamic-layers/security in layer.conf with BBFILES_DYNAMIC
>>> for both 'security' and 'tpm-layer' collections to conditionally
>>> build LUKS encryption support when meta-security/meta-tpm layers
>>> are present.
>>>
>>> Add meta-security to LAYERRECOMMENDS to document the optional
>>> dependency for LUKS functionality.
>>>
>>> Update ti-core-initramfs.inc to auto-enable initramfs generation
>>> when DISTRO_FEATURES contains 'luks'.
>>>
>>> Signed-off-by: Shiva Tripathi <s-tripathi1@ti.com>
>>> ---
>>>   meta-ti-bsp/conf/layer.conf                            | 5 +++++
>>>   meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc | 2 +-
>>>   2 files changed, 6 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
>>> index f78da573..36d05b5a 100644
>>> --- a/meta-ti-bsp/conf/layer.conf
>>> +++ b/meta-ti-bsp/conf/layer.conf
>>> @@ -20,10 +20,15 @@ LAYERDEPENDS_meta-ti-bsp = " \
>>>   LAYERRECOMMENDS_meta-ti-bsp = " \
>>>       openembedded-layer \
>>> +    meta-security \
>>>   "
>>
>> The layer should be same as below:  security and tpm-layer  I was
>> just using meta-security as a placeholder.
> 
> Yeah, it's quite unfortunate that layer's collection name could be different
> from layer's directory name. Some maintainers keep them the same (e.g.
> meta-ti-bsp), but some make them different (e.g. meta-security -> security
> and meta-tpm -> tpm-layer). It could be rather confusing...
> 
> 
>>>   BBFILES_DYNAMIC += " \
>>>       openembedded-layer:${LAYERDIR}/dynamic-layers/openembedded-layer/recipes*/*/*.bbappend \
>>> +    security:${LAYERDIR}/dynamic-layers/security/recipes*/*/*.bb \
>>> +    security:${LAYERDIR}/dynamic-layers/security/recipes*/*/*.bbappend \
>>> +    tpm-layer:${LAYERDIR}/dynamic-layers/security/recipes*/*/*.bb \
>>> +    tpm-layer:${LAYERDIR}/dynamic-layers/security/recipes*/*/*.bbappend \
> 
> Moreover - is there really a need to set up security top level layer here? If
> only TPM tools are needed, then just tpm-layer should be enough, even when it
> comes from within meta-security git repository.
> 
> E.g., we set up openembedded-layer here, but that's not meta-openembedded top
> level, but instead meta-oe sub-layer inside meta-openembedded. There are
> sub-layers in there, which are not needed for meta-ti-bsp dependency. Same
> thought goes to tpm-layer.

Then we would only be including the tpm-layer in the layer setup, so we 
should change the dynamic layer name to match in the second patch.


> 
>>>   "
>>>   SIGGEN_EXCLUDERECIPES_ABISAFE += " \
>>> diff --git a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc b/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
>>> index 9d3cc612..15c05e04 100644
>>> --- a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
>>> +++ b/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
>>> @@ -5,7 +5,7 @@
>>>   #   TI_CORE_INITRAMFS_ENABLED = "0"
>>>   #
>>>   #------------------------------------------------------------------------------
>>> -TI_CORE_INITRAMFS_ENABLED ?= "${@ '1' if d.getVar('TI_CORE_INITRAMFS_KERNEL_MODULES') or d.getVar('TI_CORE_INITRAMFS_EXTRA_INSTALL') else '0'}"
>>> +TI_CORE_INITRAMFS_ENABLED ?= "${@ '1' if d.getVar('TI_CORE_INITRAMFS_KERNEL_MODULES') or d.getVar('TI_CORE_INITRAMFS_EXTRA_INSTALL') or bb.utils.contains('DISTRO_FEATURES', 'luks', True, False, d) else '0'}"
>>>   TI_CORE_INITRAMFS_KERNEL_MODULES ?= ""
>>>   TI_CORE_INITRAMFS_EXTRA_INSTALL ?= ""

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

