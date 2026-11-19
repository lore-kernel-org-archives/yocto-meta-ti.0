Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5345.1795049536938236748
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 18 Nov 2026 16:52:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=VqumItdr;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=kXD+V7tK;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AILr52x4161869;
	Wed, 18 Nov 2026 18:52:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=HOMaOhjzWlhxq9lBcyMT53bZ0DM6Li3+UKD1KeDX6
	K0=; b=VqumItdrQhqJiyJ7Zyo6G1OsIfmrdaEdjlFKSTq/W3q/hJzX76rQuqG9V
	jAbWCeZEHsao/azlnP6k6EB/2mMoesyk3cW1KFYz2oSDTLka5FWKMmydFabJ+CgX
	smwTxSNVsMorlRidrBlLGB8q+3oq4lY0qnsbZ0R4cruWlL1NmSx7O1S0S6K3h/Mb
	YQTTw5PhFZ/J2VYe58CeTjlTVC9tTgV+vRtcLkxQdNNMGZhkO9ssSTU1zKuAjYuo
	93agSTnZEaKtyT7v5jWaSi641GrNg0+nEMRbjk2AXfU+bvp0C/A4SeJMAPXd772O
	jKiEsn4cUSH2WSJJoWbkbcE2I8ASA==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010026.outbound.protection.outlook.com [40.93.198.26])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4j19ft4rk0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Nov 2026 18:52:13 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BqOlqXarGBiq7s2klgCWmH53pud0ZDejX+s7sZWvVoNpKhlQZF8FfoDL3/DUTjQmRIKEj6aa1SUC/p+eJOwn6O+guTm3muQrrIyzpCuotkkz0HSBpQUz038NLKyqHHwMrQrluUWKHvhhZPzysFHRgEptftx33JpN3tqfdrMQk/yh81gZjz8+rOxceb0MRHhtYoumsrcJ3vk+NIDeilliCJ3wT2lF9aCTXhNFC6bE8UArZ4YTS//kEfWGgNggBC0jqN5ZsOrZprVWdiJLicV0a7F7DHDjO/7b1KJk/8F/2O6eGgTZ+oU/LCJvqRmgo4TNv60D61XPVIdZ0Mu8mdO3ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HOMaOhjzWlhxq9lBcyMT53bZ0DM6Li3+UKD1KeDX6K0=;
 b=qGIcd5xZHzzlkWlpIT3RcDtBGVp82PBMOUvqSuMzE+5/iS+2hBYKJ6YTNeocE3s7BpTa6Xd483fLagtvhngYGLHld7kx9u+hzMgJMpgjD93iZ5kK70dPKP+muWb5rYxpG+Qi+qVXKRI+dsszHIKSmMu7u8+clprXH628LwSX2i0xwKKZbJ2jLOtf91KGVE7kdGpy/P9GaJBB0C1SZ81vbCuX7pHGJ1xs/dsyeftmaqybodbD5Zu0aqpu+HCuigUWyGzeoubvRuZJOcCYwJ41X6/RzDR1YealQa8v7CRs8g8jxoyM2Veu7mPWs6tBJzSk26qqE2cP9KiIrGHBMUmZkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HOMaOhjzWlhxq9lBcyMT53bZ0DM6Li3+UKD1KeDX6K0=;
 b=kXD+V7tK+LWAEhQ0LbWvh2EMdniTqwqqro2+a6P4ISSU3o2cKkkuDenvbHvAibjeFw8lBgyjywRDptkwIXeno2268bteXkAfkmShhx68xWAIRHj3OqsPHHMNTzRjJcm2hzpMG69/4Z0010OiDYKaKzypNhIpUZIBK2VikcNkp45Y52zKtExTvwzs2WD+qgdN/oz1F+ZyjsqTHmSRx14IaFk+8tqQxwc4a3hk3f2sMdw6+Wd0S7eUXDImNd9ZDWWlfxtBma9kf1+5rMvVJPY5LF/qY8NlJadXLpTHC2zxYw8JQDaxONwFOHu4N8L/eS0rz5cW9OWnlqeIHa1ii5g4tQ==
Received: from CH0PR03CA0007.namprd03.prod.outlook.com (2603:10b6:610:b0::12)
 by SA2PR10MB4747.namprd10.prod.outlook.com (2603:10b6:806:110::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 00:52:10 +0000
Received: from MN1PEPF000793FF.namprd05.prod.outlook.com
 (2603:10b6:610:b0:cafe::1d) by CH0PR03CA0007.outlook.office365.com
 (2603:10b6:610:b0::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Thu,
 19 Nov 2026 00:52:09 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MN1PEPF000793FF.mail.protection.outlook.com (10.167.249.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 19 Nov 2026 00:52:08 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 18 Nov
 2026 18:51:29 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 18 Nov
 2026 18:51:29 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 18 Nov 2026 18:51:29 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AJ0pT4R3080613;
	Wed, 18 Nov 2026 18:51:29 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 19EC99A9C2; Wed, 18 Nov 2026 18:51:29 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: <rs@ti.com>
CC: <denis@denix.org>, <reatmon@ti.com>, <detheridge@ti.com>, <afd@ti.com>,
        <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master/wrynose][PATCH] ti-sgx-ddk-um: re-enable multisampling
Date: Wed, 18 Nov 2026 18:51:29 -0600
Message-ID: <20261119005129.945109-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261119003036.1552487-1-rs@ti.com>
References: <20261119003036.1552487-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF000793FF:EE_|SA2PR10MB4747:EE_
X-MS-Office365-Filtering-Correlation-Id: afd8635f-7bd8-401a-7813-08df45d756d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|56012099006|261026140227099003|10067099003|261028144727099003|261022105027099003|261026121527099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: ARrC0vsaljK5IDN+34AGe8+d/GKj+ptOvGgIkvxvEPk98nAY6gnOE1S3qFsnowuY9Fq94VS5iakfqfJndBvynzVwfxBg/+fht8FF0hl3gf+aVC3cRUVjEnJYW4MZrKwPta4dEAovfjufa185Z+2Ey+BHr0YLSbybibk2n6ak2uhF6r0lCVgJHZM+g1PmHSWqxjPrJ+JArJ0VyFQEKvKA2X4t6u0Z9ww5nv8z33gGZUTlBizGRWdxD996+309nBC1s7D05S6xme479qH5Tu0/chTYdak8pZvXsR2Ee1o//Cjtyvh+CxiYt8YtQW3XoG0gUzWwFszywPvt14K56LZEbJYUY5zL2hGSuNEr9WBNoLIrcqldxEyZquYoZsUnJrrF/elHWHu24vFr6j57aDGEnn+04aJXpeK+JZG4gUtyACKFavO/0FQgNgDS7Ei53q7E+PxDu4VkjCHoQ0vL2zPTG4swvAaAa317YJn+qBT7XsIU2bejeFolHWkGYzOrCslbQkRPA+eobXGbrMwvHHwwBp40DO6Ucp+VLCyiOtC8JRDAbkc9aaUl0rWp0WtEuWv1UD9MNhNaxuL1NFtoLXkUc7MktwaNBEe/RT1GeY6zY8G2W+j5PNEYspeZw35hl1fgAJ0EuBDIvGAn9TK7nsdfAhWXZ0GgXWAqjI3TBzEq6tnVgS03J4R+keozIge7RVjOFClA49lzCWt9KCMp5KpafQ==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(56012099006)(261026140227099003)(10067099003)(261028144727099003)(261022105027099003)(261026121527099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: x4z4KjBeg4radO1gUsGqOKUiNEIx2pTcHYe5ZQqgZdmg8EXxV2/U9yOZvXhXEO8KO/FjHSAUPQQ+GuQ5JUftViKrmcZkWSSkJG2X5zbnc3PTT2a1GH5h/CGdrORx62buJqV+k3W3PPd/+Xt2+aDBjl1MZ6lgyYJPBW/hXrKpR6+TPZeoriIomHFdct0FmOmlBbSCW56c3XmGG3jHvXmyhqYgGEBKKO/ojaD7S//fGl72lb3+bDL5AQ+zeadZCp09Mo8giI+6NHxILaiCuZ74gtzVcQOZSs/mDasxsf0MZvl0lcivRjmZbMmDOCyVbYTaS3MZ4jXrhrRvfqAatwnvLi+oqhe4cssbKTTNCSVZvZ475/VXgw0TKTrUD0JshwGKrXEdUt+K3RGnGAoAOJZOUj1zQdH9jk+l6iXwVNH1ZG58wZI7nAznVW6+5jTIrsT1
X-Exchange-RoutingPolicyChecked: 0E9lK6JIKQT/YWHoZPKiiBgSODVAv664rflFRCIp20fgO/ltJeuH/vXxVaAjgDLItjTVIwS5XgZOekP1ExNhf5qc0VQxEIU1Wfa5mCEh1d5kHYYlhLtePHLlMuVqzViWWrL9i+VbJ1c7c7oLhl9dwOH3eL2Tt6nCtCHQkb0FKH7VGmdpnAcjQMga5xSqdFuQWjKzDlGNV8bfm8S+VLf8KalLqUWJKpCUmVGsvPvkETlY2iqnzyqfJemZdMDxfPuHXRU7i7J5ss8XivBZzMYW2iG36qA9OILn3Vxfu41F/7LkUgVAUzXWsR798bqKx3JlP1RVB/8HW1wsOSyyzf9DrQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 00:52:08.5663
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afd8635f-7bd8-401a-7813-08df45d756d3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF000793FF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4747
X-Authority-Analysis: v=2.4 cv=NMFAaE6g c=1 sm=1 tr=0 ts=6afe483d cx=c_pps
 a=Ygqo7cOtIQGOrOEccxCoSQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=KEac-sJSY03UbB-KgC0A:9
X-Proofpoint-GUID: x_4AkTCTUvN8EHm0ceqxI9bgtD3WqTwf
X-Proofpoint-ORIG-GUID: x_4AkTCTUvN8EHm0ceqxI9bgtD3WqTwf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAwMyBTYWx0ZWRfX1gxoirPzjYsh
 WMxd6bSpTazktfj/XlLHzpkwwA++Y8nRC87xsnl7EMZPHW0rmpXvNfXk+rT8CvCnBjWxrYSMgUs
 DinqvnOpjOsSyBMrYogliLbT46dAUaU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAwMyBTYWx0ZWRfX+fT/+dBnlr3C
 2E/2DyyGLHIXZKCFvqV7lYK+6+eLxlLWYQ7Ai7GzUjD4lF2mOFzZjM4J8t7DVmGLXwKNngHCgEr
 KXmYjiS9ujpZqBYwMgxDG0Bv8hUexTQBbEJOKOGn+MwyYdFPx48R2guBKFdWfqcvt+zmEFEvzs+
 z1pdWmSJ4lyiIrsZargGz5fmKLaUttMJCjmgaLRs5zKVO2MkV4N85O95WTsYkbzTX1xxbWKqP4X
 r7m8LL6VButOckmithLNwsX+2NpWIKdPKo82GxpCZfw53rxW3a65Cnc7ZFe5IcWTvpW5/W1jWvl
 nOB/z+LyI7xKD0g5JffywUrFxF6jvSvlGa1kLGwjcB++2I/ahI9C+wo5k3ACOWGoYA2ZKG0yAcW
 pNFTN+5smKPgphSdLwVWF3Q4StjqaA6Q21nMEAq4mEkRVZIUV1cs1Do9bniNufGJgBUPYPmEfft
 Abm9vfO23AaPsfSCeLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_07,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190003
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Thu, 19 Nov 2026 00:52:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20558
Content-Type: text/plain; charset="utf-8"

meta-ti / na / 20261119003036.1552487-1-rs

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
All patches passed



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCH] ti-sgx-ddk-um: re-enable multisampling
- Submitter: From: <rs@ti.com>
From: Randolph Sapp <rs@ti.com>
- Date: Date: Wed, 18 Nov 2026 18:30:36 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: a816169d762f8d50938e7ba8bf89254fe8963724

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: u-boot: Fix uboot_config for am62lxx
- Commit SHA: 22d30bf87a4eaa69a6c87c45ffdba35359a04427

Patches
----------------------------------------
All patches applied

wrynose
=====================
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCH] ti-sgx-ddk-um: re-enable multisampling
- Submitter: From: <rs@ti.com>
From: Randolph Sapp <rs@ti.com>
- Date: Date: Wed, 18 Nov 2026 18:30:36 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: a816169d762f8d50938e7ba8bf89254fe8963724

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: Randolph Sapp <rs@ti.com>
- Commit Subject: ti-sgx-ddk-*: version bump to support wrynose
- Commit SHA: acb98c28b89ca3004b2a89b22c1615f56a3b561c

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS

wrynose
=====================
PASS



=========================================================
  yocto-check-layers: PASS
=========================================================
master - PASS
=====================
All checks passed

wrynose - PASS
=====================
All checks passed



