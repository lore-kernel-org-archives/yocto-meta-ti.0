Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6091.1795211928958820525
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 20 Nov 2026 13:58:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=CPBzajQq;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=vEa13uD+;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6AKK1F71131080;
	Fri, 20 Nov 2026 15:58:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=9gvMX1k2K67WcMWVvZXETQDvKTE8zE5AdRfQPA/yS
	nE=; b=CPBzajQqq9Gfcvd4Y9SF++99I9KWrE7Zgs7d/cKiXiAPMMD52fI0W4jTI
	ouUMB8n6SNFRKkHl/8OnMqqXGgehdclcNZsfgB5utGo0pRzzpX6I3xEQPU8Xp9a7
	aZ7iE5giKsDAjWXOGoGf4kfDSfI+IOOcONghawwU/BVR75SYJUUjnzQl201ECziu
	P7jm/gZi/78liF+4LzbYB2+ZC/O5MM7lNny5Hi+4Ebo2x27niNKF7huLecVoTisK
	iZstrG/CB+8XBpf7c/EuTv6wYoxCviC3jFWkX/2kqoUmXLn/KoyYH8BeQVvmedWo
	+7RAzSXQXPCXYnX+3zYM6GtKps/Pg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012069.outbound.protection.outlook.com [52.101.43.69])
	by m0380145.ppops.net (PPS) with ESMTPS id 4j2km5bvv8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Nov 2026 15:58:47 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oidD++UB+UhVEeRUlp5dp5P8mpho6JzRWVOTUOBvMPPltDJ3oT/vpFPzAde6YI5luiEkPLyCv7OSZd9j2LDw4HZGCAmjLX+tzIefdcw8WoN7Jhfr4sWRo5J9L3u1gNsabIv+Zf9QJHo7W+yGY0+Mn0ln79+r11r4K5SzJ4QbV8RtR5B7USA9AGMzyFs36YKsMxQ/5uIouCUK/3lr+mZsLf3l7OnULmqrzlLQdErKXOUc2z+FjgUzM9fHidkldbroEDqU8SecX0Sy09kixC8bUd6sDa5Vp1a7Wc5hem8HLOuz42kjNAmVv7MVyGcZWRSdxRrPaQNLuZVRQ5s+yC2Pzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9gvMX1k2K67WcMWVvZXETQDvKTE8zE5AdRfQPA/ySnE=;
 b=rLDlV2ty02RhbSeSKHD+9Elb5oWXurgeCIYApiciTrrmqca55s1EFmtCEaABpCPWLitHLng2xsOOt6swtZcIQtU97heJngfVC54UN3Ectj9DwoeOgSkfqgqSvBeEeaMoGMnMHalf5foXR933vgmHp+Kw7AgLeqxNji7n9+UIRW14Q9VFFXn6seg80LBviMxgaKh2WnrYCaFwR+h+G+mYXMw1Eg+lUClmpjhfvX+vdHSSPKYf29Rd4icQnu/ko2/8Gq50KY8gH2LID+7q0Inv/YpMZGAr7/wdtPqbvnRKG0m2WCxdT8MGYyNJWw4JijEDA4hqPbu62KyoYoJLZoMkJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9gvMX1k2K67WcMWVvZXETQDvKTE8zE5AdRfQPA/ySnE=;
 b=vEa13uD+steLoFZ1w/nEU4JnXRei3ruFc/Fz+ohshha7PTatFb3GVRkkViNd2032BMCMDCgvpOg39Y0tTzbmHGoEMxSH8BLppM7P5uBOIqwa4sQ5RrdAKf1rJICCAwIuA4YmulV/vr12c2B2rnIRFhBpdjCGA7JTkJ+bcqJ0JpmpyUyU9N6SQeuhb5TCWk3nE/rCGqzpKG6h3coeTggr0tYHWp0K1BPl7FD3XPPpjIzGzpYH/IAdtNxZwb8/5JQOd5dgq/nMI/0kIns/zr17mopuyHQWtn3hvBdO2EvQGxaB7dhTYRp6x4OwSVQ5GgahhnZrbQwn8+kw6aOVPmMmtA==
Received: from BN0PR04CA0169.namprd04.prod.outlook.com (2603:10b6:408:eb::24)
 by CH3PR10MB7742.namprd10.prod.outlook.com (2603:10b6:610:1ae::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Fri, 20 Nov
 2026 21:58:44 +0000
Received: from BN5PEPF0004698B.namprd02.prod.outlook.com
 (2603:10b6:408:eb:cafe::59) by BN0PR04CA0169.outlook.office365.com
 (2603:10b6:408:eb::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 21:58:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN5PEPF0004698B.mail.protection.outlook.com (10.167.245.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 21:58:43 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 20 Nov
 2026 15:57:57 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 20 Nov
 2026 15:57:57 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 20 Nov 2026 15:57:57 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AKLvv3Z2117671;
	Fri, 20 Nov 2026 15:57:57 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 912CE9A9C3; Fri, 20 Nov 2026 15:57:56 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master/wrynose][PATCH 1/2] conf: am62l: Add ECDSA key signing
Date: Fri, 20 Nov 2026 15:57:56 -0600
Message-ID: <20261120215756.2364857-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261120214058.1819929-1-reatmon@ti.com>
References: <20261120214058.1819929-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN5PEPF0004698B:EE_|CH3PR10MB7742:EE_
X-MS-Office365-Filtering-Correlation-Id: 12602063-9afe-4f65-077c-08df475171cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|36860700016|1800799024|82310400026|10067099003|56012099006|261028144727099003|261026140227099003|261022105027099003|261026121527099003|261009223027099003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: Gyw+gL8fpqP1Bpldp6UQFGeKuzzlrv4CGyAHoHIV1fNEoNECZ8ND2akJo8PmuLfOSHtxWm8Z2o4KelJmCM2j4B/OSJG/CdieF800/ykGBtoREw6v6zWdqdt32vWpnBv8aU+YlsRP7LdNkwaV3rKknErfCYflXULDatJzHhAr8nGFF6L5iZRJFzZh6Hw78+fXmGa56XDmVPWewMWo+UkkLqfoVXBFZ05dwS4Scbm7RWXQJ3URRgtvE51CtU0iqTpA+E2i1yiITbh7zL9kZnoydbSENzbb4POH7DZ4aciHEx7aJY/SF+B3MNc/CHMAmX8ZujFJvDWvCXejXD4sG7u3TOVW1QrvpiQLsgWvzioB2rUzz4H8EEmUKWMuCypifgeZDUgT7xzSYewbfDtg7KmPHqulQY/v6ApvtGteNobTaBeWeaN1+XQU2dXvhbPpEuZQE6u33e08JvB9jcJ/vZ4YMTNpo3/eVsyIxaNlwnw2Nt9kkt6YlcarknozrxbQbwy+o1vXUFuxLKeQVInGNCr5IwB1OQJpRv2Zv4NTanK5RfuF4E4a71kRHNx86PT5kJRygsPEv65OwUiAKMV/l7W1+gj6Wg1m+CfubbWBokYc8aVjOZ7wA2/xHd0O97WPe8q8zQF80rsHRON1cFT9njzK6g==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(10067099003)(56012099006)(261028144727099003)(261026140227099003)(261022105027099003)(261026121527099003)(261009223027099003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: xs+uVUxf+irN/lApUv4VhcTb+pSnjweob1EbPjWzQVeO4MdDtLNjWQGREEA7QROu4PP3aXxZmYMbSs4Juxn17FLSKTukROq9zSAaHd+zxYBSA9d4p+dHdcI9bTM6MA2gkuI0tJlspV2ikHljZEC08tphw0aY7k5I5iIR/EVyaKariAgsiZs+bH3cUN3tnr8UawhyDLMKJnnswdfhgFiC555jxyNuLwrG0ZWcypr3APSR2CxLQfmOSLbEwtVs+Qv8fo71UYd9GEmKNda1wICact6kAsJSSeOt4uoaIw/Uhq7WpOYszhq28VvRaegTwO/lhr3x39uhu5NRb+lMGiHtA7r+mAD1WbIjmsMxW/bNCMp89awn3b1p7nljQRCqJRoBbtGnt9K/INzFvjLKwoPkRyisf4hJSdD1jjQWNALThF7SW7/GD8VgXe+K11miEc2b
X-Exchange-RoutingPolicyChecked: NgmJezDqIU4Xys1ZTEfeq9XLMqvd3IhkcJJqiSWgiRmN0kp+26qCfEjO5vv0rLWR13KzDMK1q/lFM68E99HPaDkayFZ2xUH2j09ncl8V8/85Pl+nfE9JAPHnhaLYMrykE2uOX4Zk+W2PTOFPaxKruu/y6JHW6JHP56iqOBMgUH2VyGvvrB5Q51SqX5xTDssMpSWVu9azMR4FGslPo3gRmGRqGRbOa4IYFuFsxPiTnZAA8GlJPv3D14q2txMYZDrPNOohQo26VxAzeLmJ3cwciw9r/LD+kd61fsb/O98KjUuqvlKXQ3LtzwNR+WIf4v8gmXmHcA3sWPqrZuZnDnCqJg==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 21:58:43.5908
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12602063-9afe-4f65-077c-08df475171cc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN5PEPF0004698B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7742
X-Proofpoint-ORIG-GUID: dlYeUuG5pv9xanYevWZ1vdp_ijfpIQSh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA4NyBTYWx0ZWRfXyeZy9Q/qvPFR
 9XbU/DNVqhoWtaRu0VlUI5abBGu2mcYKfa+rQEBZOEbl7lrX4cYqB59wd4i2gay3UOaA+B+HuxB
 UxQ3yyyyZZ1wcCnWxcm7nu1+d7Lj4vC2+7iYcGCMYhzzYZJuknPXeEG4Vm8vytH/Nw4ybGF89xp
 2tynjiwuZxhTLqyl3djo0puA2+dWUkJaheBOiANF6ZUrK+ryn5HvztA8olD+bLhlssy40Gv0OsD
 6kVwE9/VQ+GlhTwVhTM9GEFHoflIc1GXi0TGguZXi3V/Vrz/fcVtn7t8jYdzXlGs98y0DwfeJAb
 gx30oaOLrnUft2izq30pUAMz+QxElqGvbP412YmpinEkN5kT6X78cxDYf2aydDEzA0fj5q1bSoo
 8LZbhBe6ywJl/t0KcljEUJrXkSEE/Lnbb93u8TIq6LSNCHKkhu7/xCdpcgLmCXtUJ3W3W5a904V
 yTFj8cKcD3Yip/2Gn8A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA4NyBTYWx0ZWRfX4JCt5DnZv1MW
 tWt8H6eYy1YX7irMBRHJ9JPOBHl+KIIYsUoM6mZakvWQnfKo+aSW1EFK7ynzmO1v7DzpQjK8E+I
 xGvZwL43EHe/aF5POj9OG8AHmTxDV6I=
X-Authority-Analysis: v=2.4 cv=MPb1C8Zl c=1 sm=1 tr=0 ts=6b00c297 cx=c_pps
 a=gkvpKNK0ht0eUS52gBn1PA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=VkkHSWmPFM6PHLY5UBcA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: dlYeUuG5pv9xanYevWZ1vdp_ijfpIQSh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200087
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Fri, 20 Nov 2026 21:58:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20569
Content-Type: text/plain; charset="utf-8"

meta-ti / na / 20261120214058.1819929-1-reatmon

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][master/wrynose][PATCH 1/2] conf: am62l: Add ECDSA key signing
    WARN: Commit message does not include file/recipe name: conf: am62l: Add ECDSA key signing. (COMMIT-MESSAGE-2)
        patch
    
    WARN: Commit message should not include directory path to recipe: conf: am62l: Add ECDSA key signing.
              conf (COMMIT-MESSAGE-3)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCH 1/2] conf: am62l: Add ECDSA key signing
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Fri, 20 Nov 2026 15:40:57 -0600
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: ce4e4a2798c91469a04520dd66c8f89d850f0767

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: TEST: linux-ti-staging: Add testing dtbo and build command
- Commit SHA: 3fa492d8d22e348e7a1ea4058dec805aa1d3e6a5

Patches
----------------------------------------
All patches applied

wrynose
=====================
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCH 1/2] conf: am62l: Add ECDSA key signing
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Fri, 20 Nov 2026 15:40:57 -0600
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: ce4e4a2798c91469a04520dd66c8f89d850f0767

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.wrynose.202611191800
- Commit SHA: 06c8a2a00684d88aba4719f646c51b44c1424b76

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



