Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFCD3C5AC7A
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 09:15:16 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38967.1786094107831254165
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 07 Aug 2026 02:15:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=UJIw9qkQ;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=dlNcqgmx;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: m-shah@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6777dDLG3187764;
	Fri, 7 Aug 2026 04:15:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=wK+dy8s1X/z5Lieubc4eN2pALxwVfBCZAnddO+ZVw
	PQ=; b=UJIw9qkQIeA+4+edEaDcW2n2NoCp9Sllr5Os9jSn1P0uLfRbt4wnVLb26
	FsMXEuAwZAgNdJ7jIzKdM9MWj5QTJEhJ8Xyoja8J3qb9zEqGTeqA+z0+gjjU4bek
	qKQlcO28W96TjuefWowyGV68mdDp363OvYWIltRTtpnj4EwFE4hSUcIOJmTyZMWj
	o5QpjuiOcnvUa7snIJDm84R8cuwFH0Q+zvhiR9Yeqxrq5CIeFJvBYtib8f2oSeMr
	7nt0btp6cFgV7bV3rJ8AMiwNJPYFwBpIbBitHG338yoNvRMyEtirD6aUGo0bDfEP
	Lpz4d848NHmDjVqCy1+GURx0u8mpg==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012061.outbound.protection.outlook.com [40.93.195.61])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fwb5p8fnc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 07 Aug 2026 04:15:05 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XU/O3TPBuhO+ZlwNWsTWSO44SQpaMnIh7F69t3arr5h55wnd4zZTNq7X+kU2WSM4wYTNAjgtdwmnqRWBDW1b6FF12tOmvqKCNh73WiqyNrOAEaK/Fn3P+wWJIUKgUXV8jCwCrltIIhcvsF+ghVHZP3jYjubATSD0VcKk/RAagT6sfD88ZehOlOn3ESMU6yAWbOCa9H2GYfXkxYAoPZkpma0BxoRR2voD9nmevvBkjFzsK4cRzOoQEmHNJk05u9Z0b14cWoB4hPPwXXLSWM+4LVvp48xLEXb+uqmK0te4nz8w5wBTIZUUX7fe1wYlzHkqep+OYoE8olvPwlnkrK/Tng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wK+dy8s1X/z5Lieubc4eN2pALxwVfBCZAnddO+ZVwPQ=;
 b=FT4ANxIMtovbB9vaSjvMykWsb3a2hiDrLigwG+110+876MhIQuk/+Yf2JjetdslcGIAq2FBiLnbq62ylb4xPquhM3v0mud7uu0oncxY1ul4arb15+aQuims8N43vKQ9Jix8DWytNKQTJ3ZMiRKMwtkVhIkrRUq1fi8ucQKiu6niGF/RQXwD3r9fP+BTESuHX5sIUK/KaUVzBwh7h6IVZ6pT2zx1I9NCnp+Rkxl4fZtwbFTV8rH4kuk/cfvJwMV0QQ1o5wL8l52Q7eHKeCXLVkQqX2gLMb6JhsxHcDB4kkyGDDnPG2Kso/fq8t6CTAnsvsea/EHkYvGjoEgaCONrwuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wK+dy8s1X/z5Lieubc4eN2pALxwVfBCZAnddO+ZVwPQ=;
 b=dlNcqgmxj0aRYJU59fuLfita5f9mtbkFg93afhWihBEydibmTIQpRYSvkAmeoHp4rv3qfidLCKiBdpp0478lzU7JPX7aV27NUIJ3t0T0yLI6H7KyFzWDD4YlDFav62l+4TLJkLydEVl7acM2MplWf4Tlcn+yMmuhr9BSntV5t9A=
Received: from CH2PR14CA0007.namprd14.prod.outlook.com (2603:10b6:610:60::17)
 by DS7PR10MB7297.namprd10.prod.outlook.com (2603:10b6:8:d8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Fri, 7 Aug
 2026 09:14:59 +0000
Received: from CH3PEPF0000000A.namprd04.prod.outlook.com
 (2603:10b6:610:60:cafe::90) by CH2PR14CA0007.outlook.office365.com
 (2603:10b6:610:60::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.21 via Frontend Transport; Fri, 7
 Aug 2026 09:14:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH3PEPF0000000A.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Fri, 7 Aug 2026 09:14:58 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 7 Aug
 2026 04:14:56 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 7 Aug
 2026 04:14:56 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 7 Aug 2026 04:14:56 -0500
Received: from [10.24.50.20] (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6779Er8a796060;
	Fri, 7 Aug 2026 04:14:54 -0500
Message-ID: <9e16f8f5-256c-4bb8-aa9f-799a8c95dd71@ti.com>
Date: Fri, 7 Aug 2026 14:44:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][PATCH v3 0/4] Backport ti-core-initramfs to
 scarthgap for j722s NFS boot
To: PRC Automation <prc@list.ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <u-kumar1@ti.com>,
        <s-vadapalli@ti.com>, <a-limaye@ti.com>, <gehariprasath@ti.com>,
        <denys@konsulko.com>
References: <20260807073837.1394655-1-m-shah@ti.com>
 <20260807074253.2214683-1-prc@list.ti.com>
Content-Language: en-US
From: Moteen Shah <m-shah@ti.com>
In-Reply-To: <20260807074253.2214683-1-prc@list.ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000A:EE_|DS7PR10MB7297:EE_
X-MS-Office365-Filtering-Correlation-Id: ba1168cd-9f32-4200-0b99-08def4645acb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|36860700016|1800799024|82310400026|13003099007|10067099003|5023799004|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	CDFKXMfcOXKYNCyRTEVlK8OBw/l0XqCblXqj7RDGzfGzp96/GR5u5ba/E92SybDPDg9Pq2XVkMHyQQcR+xAfA2hrPq0Sb4vcmAbOM+vI7UfOHKkmnSMYib+1sf4y3HGXPyTJATb0I1khrekWl6MjGu2ILv3is4cstU6dKdZF1cexfETN2BH6jrVG2PQlogpQMJYhmYi4X75Tw9HLBOuPp6mLsL9ZeGbD4OgWfclETYhqRocJkNPmRfGX1EHNu3kFoHNqBvmnRK62ZqAAfW1W/iD6UnJnzveq379sqKft3n4wgpoygBagqD5qZLTzSOMCy11ZhytfOup9jsshRFIKZ97J0IjdAodVWKirEuEXCuSfzIrVY/YxloloMZhONwcdZc+x2mV8b9kRx7VK5jkXjRMZsjAMrLELfiWnN2QR0Z4M9vod3eMxApBRh2+MI6uks/GJw425YmuCjN1roxQj11VMVCBaCeqIz2eAbeJyfzoDcjQhWpvCPN1VO4NHaeUPWvEh9J9hkX1YFTp2173UE2+ZPtCprQKgeACSe4kMUGvHZOf2gQTVnrgPTET0+Uk2hCLI4f6LTqzKVU8T3sWf9yUzXZkosOy1GP8vW8C3q1K3CbaGjcGXtl6xtbengrb+6RX+wbO2GWu36hXqrIwhd/hKSOgCOoF2+lQnHGRI20CP9TQEXIuEI1V/x+eatXW1Ya5viHraYLFVmT4KCfdVVw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(1800799024)(82310400026)(13003099007)(10067099003)(5023799004)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Jf9U6KbMuVWO22wy5K0ZyrNftme9eZ2qA2yjSik9u5rFpiSsNeLxO06SM35m+HZEoLEKernMGChh/k4m3Lcj3Cc3EcLIYuqvyjMsM/W1q+YfHDWJGZSTDfXn2Q9lYcB0r3qLzggg71B8l3rrAXNCZSDAE9jUneyQBEAvxQRHXeUkQmSIK+sJOVcB7MgM2fpzvV45zXDm4scFg8mTiYjRWfZeztqK3i/+56g2x3uG1nRMbMqkI3jTq0NyGOLGIBi2YeMXTywFahdNtlIR4SySPSFcJSbh38iev3vptLk+a++4uLHbMcM2atmuCsQARN2yA2TQb/8MiCDue0v+hwS6a4VzgLO0X7iMO21rw3HmepSODkteuglZypemNN+BtobJQFrx8ndkhgy2VSO3q2SJVV0bodPYXIxFqoDe4U6AJGp+7b146LKUoii6KTsKD0xE
X-Exchange-RoutingPolicyChecked: 
	HMmKkrlzc3LBEJ+lusaMSh5kFn2vQuhqSKu/mhL5GzWbGrusxtvmsVU6TCC97YMKgQjvpgb7OT+1apQBykoD/FLpjcw+3ZqHkUtts+eAcnVfYWoxlt8oDthb3AYPO88RYzo4DxTwHbjteW7x3cb7ZUdgydVJINH72Xkstii/j5nkfzGnAu/ndZROt6fYUo2O55fNRqHVaA/mUZuO0/0hvZ4XJpib3zuND7/dZD92meCO4kZQtsrWAwAs1970bfJFyQqtPIC7kueL7WvO/Huc2HblyCVe0OJ/Nc1wk8i3YEwT0d6pxhwqIBMuvTPXNP6HbYanNMtLvbYZBgXwV4WSLQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 09:14:58.9286
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba1168cd-9f32-4200-0b99-08def4645acb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF0000000A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7297
X-Proofpoint-ORIG-GUID: ihO56wH0olrDf7h5yMgaJ8uRh01YwMYI
X-Proofpoint-GUID: ihO56wH0olrDf7h5yMgaJ8uRh01YwMYI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA2OSBTYWx0ZWRfX9cvZR1F6LnVy
 OhTaXcLyPR0Bn4KSkwAWhxa3FTapYmBbPfKgs0VtmqTXPA0zA4MfYo9lDJzpwpvOXmf2TtZ/ogv
 jRBQfAmTo9WVL/pI2MQ2lupTzN2PAYCbZgqDVOMA/tfSUVObbguyhj7RZPCUjbgjve25j9Cs45/
 Ehoe4FQSeFszV677NvWbLVmkQDRfb6Hyhtii5jbWHR9EmTNoVuGhknuEzE4xVihRGNvqoORR0LC
 sp+kO1h2E2jz7T9iqnRKeGnrmzIKIamojbtMreN5liquEsZ5v4bLFNgclBxqUslyNPUbdLJ8M6A
 T558KTfTd3S6JLE5CtMjxvi/C9Vpv1/bQ97PirWTeIbR7wMilQUXApoW7IyrrIpeB2XO3sZQdyP
 AbIp8CEoS9gdQ645BdFRGkzcOdPxev64OHphfziTmb164nD33Erdv4tl9gLpobnSW5Cbx5384Kb
 hAhY84XLwkyQxKKK1JA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA2OSBTYWx0ZWRfX+x6M+kqIOECy
 5qzeiTVBz1HoUtwLnUNk8WDh+s8hmgcsBWv+r17P7Uxm3eVyOLR1RXGZyMO82IRKaSJOEvj25pg
 RMbkS1D5/mJUx9soI3EVcyIN1ZDvVVg=
X-Authority-Analysis: v=2.4 cv=XOgAjwhE c=1 sm=1 tr=0 ts=6a75a219 cx=c_pps
 a=N7UEZcGu6nKKiVkixTDHSg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=iGHA9ds3AAAA:8
 a=sozttTNsAAAA:8 a=k-42gJp3AAAA:8 a=cN9th1_XAAAA:8 a=nPowp21Hr939_jWbaPIA:9
 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=uCSXFHLys93vLW5PjgO_:22
 a=5HybKBhn8h5UT_hmDMpx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070069
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Aug 2026 09:15:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20241


On 07/08/26 13:12, PRC Automation wrote:
> meta-ti / na / 20260807073837.1394655-1-m-shah
>
> PRC Results: FAIL
>
> =========================================================
>    check-yocto-patches: PASS
> =========================================================
> Patches
> ----------------------------------------
> WARN - [meta-ti][scarthgap][PATCH v3 2/4] k3: fix weak IMAGE_BOOT_FILES assignment
>      WARN: Revised patch missing a comment. (REVISION-1)
>          patch
>      
>      For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887
> WARN - [meta-ti][scarthgap][PATCH v3 3/4] initramfs-module-netsetup: add recipe for DHCP before NFS root mount
>      WARN: Revised patch missing a comment. (REVISION-1)
>          patch
>      
>      For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887
> WARN - [meta-ti][scarthgap][PATCH v3 4/4] initramfs-module-netsetup: add j722s CPSW proxy-client kernel modules
>      WARN: Revised patch missing a comment. (REVISION-1)
>          patch
>      
>      For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887
>
>
>
> =========================================================
>    apply-yocto-patch: PASS
> =========================================================
> scarthgap
> =====================
> Summary:
> - Patch Series: [meta-ti][scarthgap][PATCH v3 0/4] Backport ti-core-initramfs to scarthgap for j722s NFS boot
> - Submitter: From: Moteen Shah <m-shah@ti.com>
> - Date: Date: Fri, 7 Aug 2026 13:08:33 +0530
> - Num Patches: 4
> - Mailing List (public inbox) Commit SHA: 302eea507c00c061dfcbf75fea1e6f4d22c77b5a
>
> Applied to:
> - Repository: lcpd-prc-meta-ti
> - Base Branch: scarthgap-wip
> - Commit Author: Denys Dmytriyenko (TI) <denys@konsulko.com>
> - Commit Subject: meta-beagle: linux-bb.org: upgrade 6.12.43 -> 6.12.57
> - Commit SHA: 7ff810824442c56ef59fa2d705d64a03ade5f5f7
>
> Patches
> ----------------------------------------
> All patches applied
>
>
>
> =========================================================
>    check-yocto-repo: PASS
> =========================================================
> scarthgap
> =====================
> PASS
>
>
>
> =========================================================
>    yocto-check-layers: FAIL
> =========================================================
> scarthgap - FAIL
> =====================
> ERROR: Nothing RPROVIDES '${VIRTUAL-RUNTIME_dev_manager}' (but <build-dir>/sources/meta-ti/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb RDEPENDS on or otherwise requires it)
> ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.

I dont understand the failure fully, how can I reproduce it locally?
@Ryan and @Denys any inputs?

Regards,
Moteen

>
>

