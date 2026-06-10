Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADA82CD98C7
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 23:29:01 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34207.1781134138880396301
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 10 Jun 2026 16:28:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=qEsamBew;
 spf=pass (domain: ti.com, ip: 52.101.48.13, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AZY4XK/hxrHWkn8HI9F9omIYl/iOBljNKvUpm9C89ow1K9dLX//X3azKOo0loYnTEixc3Y3+pfc/b5NbiZA6AQ8bk36wLCjRawBH86U/qDGMF22C3LS+gpbX18TJOfQ8nAk0Ugbm87PfCSRHCxKKbhs6NmRPSH/S73UAtLFe//e/LCH7oShpg1YWOpf4oX3MOAk8n8Y3jV68FP64eAdp4lpNyERN2F/FgtK5TG5VN5pEPV95wEvgsq46zecyTRSv8wSQVpHnaJO7maZleK5EXY1DZzK1mLfRdnMFmZHDSLt0ThOv2QMkai4uf3iwDWcYJ7cGgGFfoThaGucSzzshoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D4v//CHWBvuEfaSNcS9MACq2nL6zugfauYRoEoRG8x0=;
 b=KnkKOKAIBjqm6QOOKaYjQCqT7OfNPwU5lt50RIrvzsWuZXg7YOaXMSe0vKA3e2GIcvdPGkKPnvdUXu5UNgzRKkICsuT95fTVwcgEMaRj1afB1iI6GpUsXCSqS38+fFkt3T3Z4UoB0oQJYBfqTs9esZaMn+b2M6PpcWSwcuWurmV6zM0CqFLXusj5ARIqCAv7isjrDjg+6QBjEsnfjffUYvnxK2+5UK9kNtwUjeE9l9wjLl902PReR3coKOj0yO1ik2sx8qTAomLQW9umukY7AJbfRtvWGQ8WtmI9QL5ajQzh0J59jSVGDJw3d8Kxf9DRWeIRA0kfJ32Mjpn6AZWdgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D4v//CHWBvuEfaSNcS9MACq2nL6zugfauYRoEoRG8x0=;
 b=qEsamBewOcNtqo2CPPngHLzoJb+Nnicc7cOgqJQb2OgU2QY9YhqL+jDkZWKEKuJHqERM8DixME4ns27KHS5mar39yeGA9a+XBr9H3C+dEhSCtYJsbtxFrOwMR/n8sGm6kuE71zV1+aRcIGGyt0tFZ0WhA0vjxIyHFvyRu6oDFHI=
Received: from PH3PEPF000040AA.namprd05.prod.outlook.com (2603:10b6:518:1::4c)
 by IA4PR10MB8635.namprd10.prod.outlook.com (2603:10b6:208:569::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Wed, 10 Jun
 2026 23:28:55 +0000
Received: from CY4PEPF0000E9DC.namprd05.prod.outlook.com
 (2a01:111:f403:f912::5) by PH3PEPF000040AA.outlook.office365.com
 (2603:1036:903:49::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.12 via Frontend Transport; Wed,
 10 Jun 2026 23:28:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000E9DC.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Wed, 10 Jun 2026 23:28:54 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 10 Jun
 2026 18:28:54 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 10 Jun
 2026 18:28:53 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 10 Jun 2026 18:28:53 -0500
Received: from [10.249.64.82] ([10.249.64.82])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65ANSr6V100368;
	Wed, 10 Jun 2026 18:28:53 -0500
Message-ID: <a84f838d-55a1-4bb0-8f98-acec3ceaa771@ti.com>
Date: Wed, 10 Jun 2026 18:28:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][wrynose/master][PATCH V2] mesa-pvr: Migration from
 v24.0.1 -> v25.2.8
To: <a-christidis@ti.com>
CC: <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <20260610225153.154945-1-a-christidis@ti.com>
 <20260610225547.1343744-1-prc@list.ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260610225547.1343744-1-prc@list.ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DC:EE_|IA4PR10MB8635:EE_
X-MS-Office365-Filtering-Correlation-Id: f91547f2-264a-41f1-28b1-08dec748098a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|36860700016|82310400026|18002099003|13003099007|6133799003|22082099003|4143699003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: 
	q65dXhvA6qIVf4Yq6FJi1ltbWFe0ymZ4QyakpFMrkuEBUlnS7RzvB2JhFULF+E2EDxbnr28Pm4yWlfUcPwC0bbzkMYkohMZ76SA8hjayPugj/FztJr0cSb9NkeeOUAL8dk6ma1GVLO5QCOXzejNHxb/drNK9P+sM7lUx78KZH8A2hEPrR9YG1T6pCOhyTzS5bTEBGNr42FPCPhfJmWQ/Ulu8Q4KX11hjs3nvahbZHw9Vp7j18CzsEQKouPSV8Lu1PHPZoClEvI01e2Q0jEQ7I2I40DSxE9V8TNKQ7KbJH36Wxi9V9Pok8pvGc0qLctB73x3QGVltwgAOMv3XAhrTZFcjbwZatDWR3FGiDfd2Yu5b6bBeuqK5WTrhrjO9zYLcsXsbLeYhJW5FNNyvTYWAtXSGLGmQAdqXI/upkDtL4SBAYMuJ8XUwdUzm8h3G708s5nuHGXHXAFr7z2XFKt4tDuVxwxOa86qzoy93Z/zBqOD/2qRbVOzxmPglvojfMgK97TupzfiJYIwuD1Q1/XTDAWsW3zVnYsGz1XRGBEfMu0SSEPahppVshrmv4aALaTmkUQXHGzXQ14nWr0WjI3iP1NXroAmu5cEywrbkcmeXk/0MUSWHD4giOL/5qy3nL8Ydq+XnrS9UszEofISDotHf1rB8Pa3T/wm8oxN8g4lYIRVPF7mdxYt0LX+kPNONXOsqM9JTpmhSlUMszkmZpPbWQTED850o5BpjX5Z8kEPHc80=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(36860700016)(82310400026)(18002099003)(13003099007)(6133799003)(22082099003)(4143699003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	m7Xe7XVqrZlJTfVGFx5bV99Uv3NeT8naKVkNRvR/vtAy89kuYUisvw7aiyilLeYYlWnLt/ZkzBvuGL2wLgWPIg8Z7a1wGKlMNZU4TlQ8fWuDmCwTZEI8fxPTEVRMcuR/08yiVbQ2HG92tnWuSjRYfWNzBIvE/PEpo0fVhjcQoEpLWW+oKqdtiniqX0e7q8XDlvzPWGxg6+pA9CYlkB04cbxZVQbn8cds1MoOQP+uOXjx+bSGnEm3zKBXzh09i7kXZZAGhmd3v/oFKfotiydlBZZwYhYDYfnIt0OUTbTWglJpnmUjQNSHkmrm3R0ww87noZWbnkJEbRLh34MPZj9Drtz6KlZkTzJl/9bWtM8HyiHptOb2dpA9Zdg6vQQ0KTXpvvI/782YWqX1qiMBr3DYC7nFvi988L8isdpwZNUFHEBakStApvfTlrjqLWugzXYu
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 23:28:54.3973
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f91547f2-264a-41f1-28b1-08dec748098a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9DC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8635
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 10 Jun 2026 23:29:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20016



On 6/10/2026 5:55 PM, PRC Automation wrote:
> meta-ti / na / 20260610225153.154945-1-a-christidis
> 
> PRC Results: FAIL
> 
> =========================================================
>    check-yocto-patches: PASS
> =========================================================
> Patches
> ----------------------------------------
> All patches passed
> 
> 
> 
> =========================================================
>    apply-yocto-patch: PASS
> =========================================================
> wrynose
> =====================
> Summary:
> - Patch Series: [meta-ti][wrynose/master][PATCH V2] mesa-pvr: Migration from v24.0.1 -> v25.2.8
> - Submitter: From: <a-christidis@ti.com>
> From: Antonios Christidis <a-christidis@ti.com>
> +From: Khem Raj <raj.khem@gmail.com>
> - Date: Date: Wed, 10 Jun 2026 17:51:53 -0500
> +Date: Mon, 13 Jan 2020 15:23:47 -0800
> - Num Patches: 1
> - Mailing List (public inbox) Commit SHA: 597a7c94355990e9d49ba59d995f90c009682575
> 
> Applied to:
> - Repository: lcpd-prc-meta-ti
> - Base Branch: wrynose-wip
> - Commit Author: Judith Mendez <jm@ti.com>
> - Commit Subject: conf: am62dxx-evm: Fixup packaged overlay list
> - Commit SHA: b5f503ddbff2cdd22d86cfb6769ebbcc11f1e60e
> 
> Patches
> ----------------------------------------
> All patches applied
> 
> master
> =====================
> Summary:
> - Patch Series: [meta-ti][wrynose/master][PATCH V2] mesa-pvr: Migration from v24.0.1 -> v25.2.8
> - Submitter: From: <a-christidis@ti.com>
> From: Antonios Christidis <a-christidis@ti.com>
> +From: Khem Raj <raj.khem@gmail.com>
> - Date: Date: Wed, 10 Jun 2026 17:51:53 -0500
> +Date: Mon, 13 Jan 2020 15:23:47 -0800
> - Num Patches: 1
> - Mailing List (public inbox) Commit SHA: 597a7c94355990e9d49ba59d995f90c009682575
> 
> Applied to:
> - Repository: lcpd-prc-meta-ti
> - Base Branch: master-next
> - Commit Author: Denys Dmytriyenko (TI) <denys@konsulko.com>
> - Commit Subject: meta-beagle: linux-bb.org: upgrade 6.12.43 -> 6.12.57
> - Commit SHA: dd0f9863bd65467d689ec895d96b386a034df660
> 
> Patches
> ----------------------------------------
> All patches applied
> 
> 
> 
> =========================================================
>    check-yocto-repo: FAIL
> =========================================================
> wrynose
> =====================
> FAIL

You need to also update the meta-ti/check_yocto_rules.json file since 
you renamed the file that we were looking for.  That will help clear up 
these warnings if you did that as part of this patch.


>      WARN: You might need a " " as the first character for the :append. (APPEND-2)
>          meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:117
>              VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
>      
>      WARN: You might need a " " as the first character for the :append. (APPEND-2)
>          meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:118
>              VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'broadcom', ',broadcom', '', d)}"
>      
>      WARN: You might need a " " as the first character for the :append. (APPEND-2)
>          meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:119
>              VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', ',swrast', '', d)}"
>      
>      WARN: You might need a " " as the first character for the :append. (APPEND-2)
>          meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:120
>              VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'imagination', ',imagination-experimental', '', d)}"
>      
>      WARN: You might need a " " as the first character for the :append. (APPEND-2)
>          meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:126
>              TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
>      
>      WARN: You might need a " " as the first character for the :append. (APPEND-2)
>          meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:127
>              TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
>      
>      WARN: You might need a " " as the first character for the :append. (APPEND-2)
>          meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:128
>              TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '', d)}"
>      
>      WARN: You might need a " " as the first character for the :append. (APPEND-2)
>          meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:129
>              TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'panfrost', ',panfrost', '', d)}"
>      
>      WARN: You might need a " " as the first character for the :append. (APPEND-2)
>          meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:130
>              TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'imagination', ',imagination', '', d)}"
>      
>      WARN: You might need a " " as the first character for the :append. (APPEND-2)
>          meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:133
>              TOOLS_DEPS:append = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ' ncurses libxml2 ', '', d)}"
>      
>      WARN: You might need a " " as the first character for the :append. (APPEND-2)
>          meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:170
>              GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
>      
>      WARN: You might need a " " as the first character for the :append. (APPEND-2)
>          meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:171
>              GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
>      
>      WARN: You might need a " " as the first character for the :append. (APPEND-2)
>          meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:172
>              GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'kmsro', ',kmsro', '', d)}"
>      
>      WARN: You might need a " " as the first character for the :append. (APPEND-2)
>          meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:173
>              GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'vc4', ',vc4', '', d)}"
>      
>      WARN: You might need a " " as the first character for the :append. (APPEND-2)
>          meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:174
>              GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'v3d', ',v3d', '', d)}"
>      
>      WARN: You might need a " " as the first character for the :append. (APPEND-2)
>          meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:175
>              GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'zink', ',zink', '', d)}"
>      
>      WARN: You might need a " " as the first character for the :append. (APPEND-2)
>          meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:188
>              GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', '${GALLIUMDRIVERS_LLVM}', '', d)}"
>      
>      WARN: You might need a " " as the first character for the :append. (APPEND-2)
>          meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:189
>              GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'r600', ',r600', '', d)}"
>      
>      WARN: You might need a " " as the first character for the :append. (APPEND-2)
>          meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:190
>              GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'virgl', ',virgl', '', d)}"
>      
>      WARN: You might need a " " as the first character for the :append. (APPEND-2)
>          meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:201
>              GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '', d)}"
>      
>      WARN: You might need a " " as the first character for the :append. (APPEND-2)
>          meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:204
>              GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'panfrost', ',panfrost', '', d)}"
>      
>      WARN: You might need a " " as the first character for the :append. (APPEND-2)
>          meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:207
>              GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'tegra', ',tegra,nouveau', '', d)}"
>      
>      For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887
> 
> master
> =====================
> FAIL
>      WARN: You might need a " " as the first character for the :append. (APPEND-2)
>          meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:117
>              VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
>      
>      WARN: You might need a " " as the first character for the :append. (APPEND-2)
>          meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:118
>              VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'broadcom', ',broadcom', '', d)}"
>      
>      WARN: You might need a " " as the first character for the :append. (APPEND-2)
>          meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:119
>              VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', ',swrast', '', d)}"
>      
>      WARN: You might need a " " as the first character for the :append. (APPEND-2)
>          meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:120
>              VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'imagination', ',imagination-experimental', '', d)}"
>      
>      WARN: You might need a " " as the first character for the :append. (APPEND-2)
>          meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:126
>              TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
>      
>      WARN: You might need a " " as the first character for the :append. (APPEND-2)
>          meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:127
>              TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
>      
>      WARN: You might need a " " as the first character for the :append. (APPEND-2)
>          meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:128
>              TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '', d)}"
>      
>      WARN: You might need a " " as the first character for the :append. (APPEND-2)
>          meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:129
>              TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'panfrost', ',panfrost', '', d)}"
>      
>      WARN: You might need a " " as the first character for the :append. (APPEND-2)
>          meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:130
>              TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'imagination', ',imagination', '', d)}"
>      
>      WARN: You might need a " " as the first character for the :append. (APPEND-2)
>          meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:133
>              TOOLS_DEPS:append = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ' ncurses libxml2 ', '', d)}"
>      
>      WARN: You might need a " " as the first character for the :append. (APPEND-2)
>          meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:170
>              GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
>      
>      WARN: You might need a " " as the first character for the :append. (APPEND-2)
>          meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:171
>              GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
>      
>      WARN: You might need a " " as the first character for the :append. (APPEND-2)
>          meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:172
>              GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'kmsro', ',kmsro', '', d)}"
>      
>      WARN: You might need a " " as the first character for the :append. (APPEND-2)
>          meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:173
>              GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'vc4', ',vc4', '', d)}"
>      
>      WARN: You might need a " " as the first character for the :append. (APPEND-2)
>          meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:174
>              GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'v3d', ',v3d', '', d)}"
>      
>      WARN: You might need a " " as the first character for the :append. (APPEND-2)
>          meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:175
>              GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'zink', ',zink', '', d)}"
>      
>      WARN: You might need a " " as the first character for the :append. (APPEND-2)
>          meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:188
>              GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', '${GALLIUMDRIVERS_LLVM}', '', d)}"
>      
>      WARN: You might need a " " as the first character for the :append. (APPEND-2)
>          meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:189
>              GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'r600', ',r600', '', d)}"
>      
>      WARN: You might need a " " as the first character for the :append. (APPEND-2)
>          meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:190
>              GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'virgl', ',virgl', '', d)}"
>      
>      WARN: You might need a " " as the first character for the :append. (APPEND-2)
>          meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:201
>              GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '', d)}"
>      
>      WARN: You might need a " " as the first character for the :append. (APPEND-2)
>          meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:204
>              GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'panfrost', ',panfrost', '', d)}"
>      
>      WARN: You might need a " " as the first character for the :append. (APPEND-2)
>          meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc:207
>              GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'tegra', ',tegra,nouveau', '', d)}"
>      
>      For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887
> 
> 
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

