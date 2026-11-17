Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20022.1794927923131262111
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Nov 2026 07:05:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=UxuXgYjF;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=QLijUkS7;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6AHEFgdF075213;
	Tue, 17 Nov 2026 09:05:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=kxcvd+15+1TVX7wG57Yzzl74PLDS0Rhqk7OobyEt7
	BY=; b=UxuXgYjFzYRFDWdI3RhGZZ64cNULmbZGInmSUrrxFGL4+m4M+vxYphLND
	+l4wP9G3REyxYlayGHLbeFqckqI97uO+waPtInM/UiIDUxyqY+9us6w1J0Swz4y5
	HsyGKk/9gsEGirxvjt9mVwHFgQ/P80pdkkpizw3SxoXQ+U+k9zLmHof9ydE2JR4s
	FvNeFNqUaihXtox77xUOX5J8p3bOX/1uhm3kTT9lc+JFd/yjUd0XKKBv5rHymFAE
	BRfua4Saq6u2RB042MiMT9PKhF6QVmmv/voXzVCcV1Wfu53BvOkpthgMWOnBvob3
	t/BdDHmjsjPKKmZ5wPIJUKNAxZKxg==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010004.outbound.protection.outlook.com [52.101.61.4])
	by m0380145.ppops.net (PPS) with ESMTPS id 4j0kye1yp7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 09:05:18 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cCMekEEJ2PLSP0vrAi7lwigVOTf61dzZ92odVzLsc0Ij4mj2YrtJyGxmFZ3rmnjKII5lYE8KAWeSLZLNcU9YRxBqttcVnOcR2nux+qwj2xAl/TGxHf3wJ+6DZ5q8TFwwffShc5HpUXhTuehBlE1ZA03v2O2j4DdhHZeA5Wweq18fetBiVFNL0ny2uyRQ0J34XcXCeCPIxT4dglfdcUhVdSOcGr4bdLSlK1+dQHNFRjuRF+e4gK8qbQlIt8j6buBDbYVKO4JO0v1f0V6mrm2VXeJ6wKjWkYcvzELLBnBG4fxB70nBOgs2rr2PdGlXAl+LYKoE9iR8dVKJ41QoZHQeyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kxcvd+15+1TVX7wG57Yzzl74PLDS0Rhqk7OobyEt7BY=;
 b=zLxhnkb5f2IfN98I7q3NLm2Rs30oQbczkp7kK1RmQmp38YcypVl1gNOS17e2zGNKXAKqFo8YOLumWavKP4Qm9luwXJ1oQmFlBB/ViEGsP6o09QaP/pQ9vcKCk6V1OTozNBkWd4X81Ypd6YO7ntYYz2YLma4gjdR05+1vyQvC4nIdcQsGfUNp/Fu79rn7tiKCNW146xwNOKD/6ywpq1JreYtRxm9bw8c0Af3vM5ahrMt3cJPlxnrrO2mqN7Na0Kmd2Lq0Rm8MalAbQRjsZCpNv9xeWry7nErSfro8HfeZRwYnNXnJqeADbxhBHv8ONoRIZn3a6cwOhHrabbd1gb+8ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kxcvd+15+1TVX7wG57Yzzl74PLDS0Rhqk7OobyEt7BY=;
 b=QLijUkS79cEmcwhGK/GfQDF/w6qOHRkxKAeXPEOvNk8GrFH+6pYtZJDXDtzb74VXhyqMQZ/0sOuRsoSUrAAqZjtut4lPBYyTLtj3GJVOGBtuLBOQH1p7FpvCIgvWea8avfOq0gL0cDspn9O9D0dRwEhib10M3c6dcQHgzCXlK/Y=
Received: from MW4PR04CA0267.namprd04.prod.outlook.com (2603:10b6:303:88::32)
 by PH7PR10MB6282.namprd10.prod.outlook.com (2603:10b6:510:1a8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 15:04:32 +0000
Received: from SJ1PEPF000037B9.namprd05.prod.outlook.com
 (2603:10b6:303:88:cafe::47) by MW4PR04CA0267.outlook.office365.com
 (2603:10b6:303:88::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Tue,
 17 Nov 2026 15:04:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF000037B9.mail.protection.outlook.com (10.167.244.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 15:04:32 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 17 Nov
 2026 09:03:39 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 17 Nov
 2026 09:03:39 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 17 Nov 2026 09:03:39 -0600
Received: from [10.249.66.236] ([10.249.66.236])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AHF3dmZ3165471;
	Tue, 17 Nov 2026 09:03:39 -0600
Message-ID: <4200f915-6db7-4e20-a0bd-320482269679@ti.com>
Date: Tue, 17 Nov 2026 09:03:39 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master][PATCH v3] k3r5.conf: adjust
 SPDX_DEPLOY_SBOM_NAME to avoid clash
To: Denys Dmytriyenko <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
CC: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
References: <20261115195411.4926-1-denis@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20261115195411.4926-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037B9:EE_|PH7PR10MB6282:EE_
X-MS-Office365-Filtering-Correlation-Id: a9fc71d0-0fb7-446b-b907-08df44bc15f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|1800799024|82310400026|36860700016|376014|23010399003|18002099003|22082099003|3023799007|56012099006|10067099003|261022105027099003|261026140227099003|261028144727099003|261026121527099003|261022075727099003|261022115727099003|261021121427099003|261009223027099003|261102123227099003;
X-Microsoft-Antispam-Message-Info: cre6Zgo77w0cNcxco18CZcHXAguISVDrRkYR+jkeYwrsiYSm7TZ1bEt2n8UAI3tiQRQPg+6EXDJ7C3nDZhCDKuZ+TmDe89Yc0xgtA4YQJsxkRwb2dH+ZkERZsMMUr9m4Y7ykXjn7qD852bt+D+DBdMFChnDTODT2u87Bs/SPnkfOFNMJ27+5A0rZhQtYuHStQiBIAh+2jrrOXtuKlin9z7WnjRgFG1Ga3JPfTJm0YXF44y/LV+gqRghO2rK9btpIZvsOuLTQ5rudbdSshVABuvY/QZWl9qLIhI15wTkKOG7MsF9diD8VEBF5Y3yChQMBY3JZspPpmnsSAgpgXY7XlKScagwWhTGs1ERroL4fl4RyvE0ubkkxnneVFi2q+l0OvJpSg06d9L4ArCZDf7+ZmCnhslGiAm32jUODTTnP9Bee4AcRpx46sv4Ku3qCkcar0+DZFfuVn/IHipqOQdbAbbj7IYfy9UqvB+05/oV2VG76vhxijZJSsx6V22q/egrIhXJm5xqjCD53W3K4wyABsQ5+iCJ6a4Cmx0gNN7Ivhz3RD+V9L1LfuA6y6VEhN7Xy1hVuudViNelDOZcogW44UrbW7mwdVhxGO8Vu4fjVYj6JAjcL/24BkgG/LzqQ/02XlHC7OyoA3Xexl9XYN7a0Rg==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(18002099003)(22082099003)(3023799007)(56012099006)(10067099003)(261022105027099003)(261026140227099003)(261028144727099003)(261026121527099003)(261022075727099003)(261022115727099003)(261021121427099003)(261009223027099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: IK/2YNw3eq9E8o1+KOfLlkNnF4dAAm2bLsS4RmrafR18XJDir/s/GlkxBDnPkw0ffmtItAo8AvUT7u8Tk9M3P1nAJ4/1ewCKVNISvfPu2m4/7MoV6euPASdP5LKXmoPGuhTexoW4FP+T6+PFFG0PZq9F1E/Sg+8F9JaMoiFMpL3m2aGIxQpU3yjFCPQrU2EjzdhZ0Xw2n1tHrhkBKImHln6XYtpNfBMZOoDPVh0335WGPJmNdKeakv+xTLsPI6+zFSWPQOYF4j0IZYdRXN8ZoAqOFhLADEZSc0J4msyu5JGd0SsvjB7OQ8yODMnHzSmy9KzIFaqmaHVzCzUNyrg6SM9k/EWhJgCI/lQcwsdGTpMbpx9Ni3aVaIfNzoZpjPMGX+0CchpN8IrXLt8ygIoXTqB+sSTxc2cYSyKjKJrpRAN23zuhU+d/puyTK0MfsUbd
X-Exchange-RoutingPolicyChecked: GGvBdVTfGSBShB5KcoSE/Y78koJs1QQSoMaNokaC9YyRL65k/t4FQI6x/dWQ+BBNMHW4elkUhArAyUxKM/N45yrRUurCzmyqnYJtlc3potVzXd/uGvNfqFOOzfLdTB0lKpCZg82MqxhGKk+/95x0vJTFvjGb6xPDH6QfQygQyr4vY7jLzATBGD0q2/Pr6EefwZAv8JEO0i6+WlHJLANz7ufJp/iXSr3+i/vhp9LHLkt2xs/HLm0a7ph+pnMQGWSwSTnqT5LVlw0OAVwvUhu02FqKZ8aPpz57ix+faoJlAmMsoUCu0NEkSXf2/NrEIpMh+ZFSKA0NAFCoGraND5fwxQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 15:04:32.1834
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9fc71d0-0fb7-446b-b907-08df44bc15f8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000037B9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6282
X-Authority-Analysis: v=2.4 cv=bsTZl0ai c=1 sm=1 tr=0 ts=6afc6d2e cx=c_pps
 a=R4qMYQySjg0trGpnu7oNJw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=iGHA9ds3AAAA:8
 a=k-42gJp3AAAA:8 a=sozttTNsAAAA:8 a=NEAV23lmAAAA:8 a=XYZVueBqiyoOKJHXZp4A:9
 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=uCSXFHLys93vLW5PjgO_:22
X-Proofpoint-GUID: hLmdukzUHMQnPguak2zPZU068-m3epkS
X-Proofpoint-ORIG-GUID: hLmdukzUHMQnPguak2zPZU068-m3epkS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA2MCBTYWx0ZWRfXwWP44ELAC9B5
 DclP3j3mxvVlI+r3dTMNLnYyF9Jv+rUT5BdwRtnCDFsO/vmzBXU1cyA+PMKz+TgK7tKEkzuDqoN
 jUT55E7S2pwXM251Y6vFVcevMWc+SyOSJMA8yMovw61NabNcYjY/X4DdQhH8a8b27up61QhJoWi
 S7+AXfEs9GIarqFtr83mFz172ZVQK4iUP/m4UVLhApCgeGGW4xwXFvmikMyZN9UWp2QUgWymPjX
 Y2K0qMT58X4wfqJ0acMecJTjeKLsOITOidcW+NMCTKLSMpUY29v7kr2HYAZUq58GdTIzvWzO0uo
 71MK4NYh20ovFBu+eWl1SOAlydXDTtV+r6+ZOj+M2Vk6KEVExrJe2Jg1Et/IixLmH4Yq0Bl0/3C
 BII3Qq+rUCo2AiraRofBOLwJ7FVKBlekcVfyXVHablf5X/l5oQmWh8XWYq371UO+dOn27ALLGL3
 c/inRu6C5D36ULkty8w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA2MCBTYWx0ZWRfX9nrFXMJR3Xsq
 e3mKgUGOXUH9dYVi8QB2/2mib5kLehiROarSfC/rlRrwyWNSP+LDtgDgTBZkTwCmFPfpaYff26e
 DL+E+XafrIYPnYgLYblnZvSZgRO0L8Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170060
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Tue, 17 Nov 2026 15:05:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20554

Ooops.  We promoted before I could get to dropping the v2 and doing the 
v3.  I'll send the fix up patch.


On 11/15/2026 1:54 PM, Denys Dmytriyenko wrote:
> From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
> 
> When the same recipe deploys something in both multiconfigs (default
> and k3r5), the corresponding SBOM SPDX files will clash inside our
> common TI_COMMON_DEPLOY/images/MAINMACHINE. Let's name them uniquely.
> 
> Also, deploy the SBOM SPDX files into its own sbom/ subdirectory in
> TI_COMMON_DEPLOY/images/MAINMACHINE.
> 
> Signed-off-by: Denys Dmytriyenko (TI) <denys@konsulko.com>
> ---
> v3 - add guard to fix yocto-check-layer
> 
>   meta-ti-bsp/conf/layer.conf            | 1 +
>   meta-ti-bsp/conf/multiconfig/k3r5.conf | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
> index c92e927c..97aa97da 100644
> --- a/meta-ti-bsp/conf/layer.conf
> +++ b/meta-ti-bsp/conf/layer.conf
> @@ -44,6 +44,7 @@ DEPLOY_DIR_IMAGE:ti-soc = "${TI_COMMON_DEPLOY}/images/${MACHINE}"
>   SDK_DEPLOY:ti-soc = "${TI_COMMON_DEPLOY}/sdk"
>   PSEUDO_IGNORE_PATHS:append:ti-soc = ",${TI_COMMON_DEPLOY}"
>   BB_BASEHASH_IGNORE_VARS:append:ti-soc = " TI_COMMON_DEPLOY"
> +SPDX_DEPLOY_SBOM_NAME:ti-soc = "sbom/${PN}-deploy-sbom"
>   
>   MIRRORS += " \
>       git://git.ti.com/.* git://github.com/TexasInstruments/BASENAME;protocol=https \
> diff --git a/meta-ti-bsp/conf/multiconfig/k3r5.conf b/meta-ti-bsp/conf/multiconfig/k3r5.conf
> index fd871dca..a995b46e 100644
> --- a/meta-ti-bsp/conf/multiconfig/k3r5.conf
> +++ b/meta-ti-bsp/conf/multiconfig/k3r5.conf
> @@ -8,5 +8,6 @@ TI_TMPDIR_APPEND ?= "-k3r5"
>   TMPDIR:append = "${TI_TMPDIR_APPEND}"
>   
>   SDKPKGSUFFIX = "k3r5-nativesdk"
> +SPDX_DEPLOY_SBOM_NAME = "sbom/${PN}-k3r5-deploy-sbom"
>   
>   EXTRA_OECONF:pn-gcc-cross-${TARGET_ARCH}:append = " --without-headers"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#20550): https://lists.yoctoproject.org/g/meta-ti/message/20550
> Mute This Topic: https://lists.yoctoproject.org/mt/122283296/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

