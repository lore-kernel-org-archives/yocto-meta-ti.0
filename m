Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAD85CC6B30
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 02:11:38 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30655.1792030290324460539
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 14 Oct 2026 19:11:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=DAbD4M8x;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=YxsrQ8sb;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: t-lannynd@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F1N6DB3794072;
	Wed, 14 Oct 2026 21:11:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Zeu4p2I018M36sgE3z8Eyd2tx+MPgm2P1kse2cwyt
	38=; b=DAbD4M8xL+4OTEJzpJqvdxfAKK23OLA6hfAQ4is0FJW/f6iLjfuNm0vr9
	hy9LOB9XSZqe/kFOlQ5wrL+PcHWgRRP2hbN8ASMiBEmIaFKlbApNCQ3TYGjXdxAv
	b4BDGaahoIv7Kct/ooshJ3889e3lKnz9YbDzRHTtw7ZWFzqm7/oyVWLTdIuCM4+x
	n7z5nA+EcW7lEIPHz0cS1pnNVPjw70HLXaiyE8dOJJMO65fp/P76gr5Oc9ggEKKM
	PpE8pnnM8cj8k0ilEyo6pFnrrepXQzaK0rLNrL9uxU1Mj8LPG8YJaxdtuI4Wul41
	+UTjesf50FuJ5/riOLezCrd1OhejQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011041.outbound.protection.outlook.com [40.107.208.41])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4haf68a6st-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Oct 2026 21:11:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vJflqhvPL+lLLhSRO66UaBzQtU7ruB1u2TMEky+F5iQpa1kl4HllP82+Im/iF7HXHgp3sCSvGBbg0+t9nSi47NRejtDGOogCz0lPo5vzWNzchdZjcwXVjiPN3CrUEkb6EVYdH8A4mZ5NIg7jjqgw6IT98a7NMmT80oOB/gCzM79+SX9JsHLeZLuVYwt+befGC4Npx2oX+ByKK7xlBywXaIx07Zh+XJa0A2L1gt1ptKmtas4cOC0FIAFyK3kHys67vJp9zoUtnq6yW+2x4PQXmgRwUnJE6zv9ao/Q1FbmvOnnV+BNZ43dVnE30WUFoAT/5RAQ0YIZLzQGr3e9/7K6xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zeu4p2I018M36sgE3z8Eyd2tx+MPgm2P1kse2cwyt38=;
 b=rilaITZK/Xx+5uwRo0pBsvnoF6OqUnZ7/GqQuJJyZPmwQAi13d19P1xaZZKZlMf0Z4g12S1svdluSiKzeYQ/tCZlqDUreTJ/jb6/nqwqdLH/H6gmm0cUydYNDxqzOrITTrjBIwyjuEQGXMm9VBcEeGXO6USwVfcuvbDyf8MquaARnVXVkhMVLLIlBZMK4+Qe2EVIOBwjv142RQggCZUZqaa5URAgPSJLeZdPs/UqZ5aIiWaHcOzwhmP99aOH4TKkBglK/e9WH/1IDtrmCycQdBalgi/RW0ZSsBxwEoz2AYlWYenD+PJp4dnV0OgHI3G6Kvvcyq81nvw2razrPPsb0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zeu4p2I018M36sgE3z8Eyd2tx+MPgm2P1kse2cwyt38=;
 b=YxsrQ8sbbrPtk+2SjuL5bEfTRg3IUB79ftHicy0OCRuLPpwUKKpv7I0UoKJo7dDV/NsOhYWyxR/tQCyzUyVEtlffA94rxwr2VBQp6NWAsEtKhGbts8WEap19Z1Gpf32B4F9yPcga+nsRQKcjJalWTf/TuUcClqTBK55gDfFpgko=
Received: from MW4PR03CA0061.namprd03.prod.outlook.com (2603:10b6:303:b6::6)
 by MN2PR10MB4302.namprd10.prod.outlook.com (2603:10b6:208:199::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Thu, 15 Oct
 2026 02:11:23 +0000
Received: from CO1PEPF00012E60.namprd05.prod.outlook.com
 (2603:10b6:303:b6:cafe::3f) by MW4PR03CA0061.outlook.office365.com
 (2603:10b6:303:b6::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Thu, 15
 Oct 2026 02:11:23 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF00012E60.mail.protection.outlook.com (10.167.249.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Thu, 15 Oct 2026 02:11:21 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 14 Oct
 2026 21:11:02 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 14 Oct
 2026 21:11:02 -0500
Received: from DLEE213.ent.ti.com ([fe80::a556:26ae:12b3:7789]) by
 DLEE213.ent.ti.com ([fe80::a556:26ae:12b3:7789%20]) with mapi id
 15.02.2562.045; Wed, 14 Oct 2026 21:11:02 -0500
From: "Lannynd, Thorsten" <t-lannynd@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>,
        "Eatmon, Ryan" <reatmon@ti.com>, "Sapp, Randolph" <rs@ti.com>,
        "Etheridge,
 Darren" <detheridge@ti.com>,
        "Brnich, Brandon" <b-brnich@ti.com>
Subject: RE: [meta-ti][scarthgap][PATCH] meta-ti-bsp: flutter: fix
 nativesdk-flutter-engine-sdk build failures
Thread-Topic: [meta-ti][scarthgap][PATCH] meta-ti-bsp: flutter: fix
 nativesdk-flutter-engine-sdk build failures
Thread-Index: AQHdXCUYyTTIzEvWJ0yDYBHqKNy5pLb90ECg
Date: Thu, 15 Oct 2026 02:11:02 +0000
Message-ID: <ea8180fd3680489091a6fefda501327c@ti.com>
References: <20261014204330.2837679-1-t-lannynd@ti.com>
 <20261014214348.GS4190@denix.org>
In-Reply-To: <20261014214348.GS4190@denix.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.249.64.108]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E60:EE_|MN2PR10MB4302:EE_
X-MS-Office365-Filtering-Correlation-Id: 00bb9c18-cf96-4447-f740-08df2a619b37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|82310400026|42112799006|36860700016|376014|1800799024|6133799003|10067099003|22082099003|18002099003|3023799007|261009223027099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	dFzE8ndj/DzK67se+t5zFbkkQMo30kG7bykYzcyvrPig7Q3KjfRAtsEL99kPwpFzij+P+BlECTg3QxlgK10A3AgSayYTtaoJ73YBvvIEPHxub/azv8yoDlumlypv3MfGpxNFucYR6ueQmHnqbJ+fGEiatrSk2cINSil/Ei6UQCpmaWcdEb3xsQ9u+EkrmhLJa4IXKxi6vJ1Wji2NK3jQtsVcacoGblrWyodsYP8TDWQbg2jazCnMdBbb0S4RYjMNNgHAankxPdvl02gy8MJoD1OFqCJyTW2NZSZuQQtXMvOCMwBA7kpGh0WZl7cjBnBLZ5xVAzDJ+NKBA1pNulht4LHRfqH1iB9fmv8QNg6yFfeR+RiKwNTlvporiWdAix1CAw+R/mHwvyVdqMEl55T2KbUvqrZ95CY/e0l++tHxPr84Rx2UkG8mf8FfO+oF0eATFyM24Fv7KK5a2IWzMM/Wgo+FcTz9r414+RYa2aa45BIBMfwDi3jd5BhmdKUV9ae8mkzgC94CmMv3z+eFzYp+5Tvao2OQoEsguIBu8V5cAvfHGNpafOy2265sH+BWyYfTkAix0ZfcTSoS1mDAyjJKpAQmvVc6YmHKsB86EWnWt8VA8U416Ia+muT/SwglMuUjdMpYzo4Dp3siy0H68Hk6I1++eDbm6H1n5rdUOpOum+AhMk4t0iNzZgzOdkVZavqcbojJGTkVjgAf9KxByjjgvA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(42112799006)(36860700016)(376014)(1800799024)(6133799003)(10067099003)(22082099003)(18002099003)(3023799007)(261009223027099003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	NTduFPMUXdeeMxEEjKuuZD8M/CqXLnhkwqCdnwUUbRp9e1Hdgc9273nNUr7arCaHmqHnDlcAjf0YmYtJYHWDkcbxdNJqrjUH1Au1f6KNoZthgkXqR76AfgXy9gyvWZxweH1EKjyoyUq3UbtJ9lsT578AHqo5XydrgCa+rUBuMZrRHjMs/TMP6UTGhf2T90xdaOpUwxMwB79TrRKCew4zLYbhLNZOeqtMaxyBANQjUWYM+WJJndyrHHA13vPcytWHJ0qdYwIUtHCVRieSBBwyddS+4G7gPzM+SAFaOxXojVy5nW+DJFTOupOBfxWXF3RngC9XsoJYLoQ83aMbq7MPcpIhwcDsVZVDQyZf8ErqedqHuYYeoiWRULgIcXMtNgvh1SSy1ijsFjFu8m+CtdBWr3vU3sYhtNCVtVPRdt/9gAeVhRwKMJrdjU1vQRKqBsWW
X-Exchange-RoutingPolicyChecked: 
	1E2gdALMPp3DnyAj8oMoXFor09CJc3jSQIhjDMYXi+3iSF2+mnje7AmfMfmfKY5wbUfZ3zJ1d+t4sa5XHMz0dhrtWutw/Bv6GPDhUSRADpF6xBZ9KglQLC444XhQC7/LU2xrfW0k/SCNlsC5pObn6XhLyBZpryCKQMtaGcxW3tKmIP8D9AgmXl7Z0uCfZg5LpVcZiQAy4xXmvKLX9/eo6AkKBbI8dANp6CSw6lNwyptLXXhnvOft1REcyvUP9A7gpVGC6WGR7oqZe5oc8eyRe3q17MCNilj305a4ri5Bugb9sP06SxAxEm+CBED9bURV+029IN24IPm0cLnhaKFC8g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 02:11:21.2852
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00bb9c18-cf96-4447-f740-08df2a619b37
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF00012E60.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4302
X-Authority-Analysis: v=2.4 cv=ZIlCCn7b c=1 sm=1 tr=0 ts=6ad0364e cx=c_pps
 a=+KlkUUL6BOGgxGViHu3/Fg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=xqWC_Br6kY4A:10 a=mIsZ9g5srE8A:10
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=lDJ1C1MU0L8Xsd2dW40A:9 a=CjuIK1q_8ugA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAwOCBTYWx0ZWRfXy/6wkQb4wfhI
 adzpggirmqbT9qV/LjtVQ/ejPuqP621I3zaVsEVQhqNO2nhsJcsMi1PfqP44KQTkG3TExvAwgdd
 lzRzlDyL4ECBhh2cE4goxo1gzmpQdYpPRgvs5aDC4toW2kU9qXY2yTDL7/jVQz/EINHrHbpIJeZ
 Be3AllCQSLYlFLirIkWTQGfbEVersKouj7OxeQ+cs4z0PUswfqWvsf6MnI6EiI4BIZBZytpZ9Mb
 8jOuNnUOlkHq2ahcomEytRCeEQrhT3c/T1NbhyCyRF8zTDPuWqSl+5PUj8QSvNPo1NF1EbWJ6RP
 B+qryKGiEgNcBBo1oC8IaIc+FNVIKiED82G5iHM063hVlwO+hHC7e8ThmDjoIPDH+u29kqq/KBN
 gEkB5KSCLh3fvAmI0vIuRA3ufG795kMtH8nx+ITnbZzTNmRRuQ6sfCfqiU6tKZnDIH3T/R9qEWr
 I59DafB/3niAfOmpYAw==
X-Proofpoint-ORIG-GUID: YTGgizqQfjLGpBdQL9aoNBiD2I3wbxm3
X-Proofpoint-GUID: YTGgizqQfjLGpBdQL9aoNBiD2I3wbxm3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAwOCBTYWx0ZWRfX2LmYz3ABxCGl
 /isXMU78fptBYdkjLtt08jKvA7dyVIUyyu/16XzA2Juq/8cQQw0zwRAyRHmmY8L3te24+WMJT7g
 +M35pwJGklIgnjNwoJRGSoJFz6rLc4I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 clxscore=1011 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150008
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 15 Oct 2026 02:11:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20460


 On Wed, Oct 14, 2026 at 04:44 PM, Denys Dmytriyenko wrote:
> On Wed, Oct 14, 2026 at 03:43:30PM -0500, Thorsten Lannynd via
> lists.yoctoproject.org wrote:
> > Without BB_DEFER_BBCLASSES, :ti-soc is missing from OVERRIDES from a
> > nativesdk context so DEPLOY_DIR_IMAGE results in an incorrect path.
> >
> > Add :class-nativesdk to layer.conf and a flutter dynamic layer
> > bbappend to skip file-rdeps on the bundled host binaries.
> >
> > Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
> > ---
> >  meta-ti-bsp/conf/layer.conf                                    | 2 ++
> >  .../flutter-engine/flutter-engine-sdk_git.bbappend             | 3 +++
> >  2 files changed, 5 insertions(+)
> >  create mode 100644
> > meta-ti-bsp/dynamic-layers/flutter-layer/recipes-graphics/flutter-engi
> > ne/flutter-engine-sdk_git.bbappend
> >
> > diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
> > index d87d040b..ef4d233f 100644
> > --- a/meta-ti-bsp/conf/layer.conf
> > +++ b/meta-ti-bsp/conf/layer.conf
> > @@ -24,6 +24,7 @@ LAYERRECOMMENDS_meta-ti-bsp =3D " \
> >
> >  BBFILES_DYNAMIC +=3D " \
> >
> > openembedded-layer:${LAYERDIR}/dynamic-layers/openembedded-
> layer/recip
> > es*/*/*.bbappend \
> > +
> > + flutter-layer:${LAYERDIR}/dynamic-layers/flutter-layer/recipes*/*/*.
> > + bbappend \
> >  "
> >
> >  SIGGEN_EXCLUDERECIPES_ABISAFE +=3D " \
> > @@ -34,6 +35,7 @@ HOSTTOOLS_NONFATAL +=3D "truncate xxd comm"
> >
> >  TI_COMMON_DEPLOY ?=3D "${TOPDIR}/deploy-ti"
> >  DEPLOY_DIR_IMAGE:ti-soc =3D
> "${TI_COMMON_DEPLOY}/images/${MACHINE}"
> > +DEPLOY_DIR_IMAGE:class-nativesdk =3D
> "${TI_COMMON_DEPLOY}/images/${MACHINE}"
>=20
> I don't think this is correct.
> What nativesdk package are you trying to deploy to the target image deplo=
y
> area?

Hi Denys,

No package is being deployed to the target image deploy area. The
nativesdk-flutter-engine-sdk needs to know where to find the files
from the target recipe.

I believe an alternative is to add this to the bbappend file instead:
DEPLOY_DIR_IMAGE:pn-nativesdk-flutter-engine-sdk =3D "${TI_COMMON_DEPLOY}/i=
mages/${MACHINE}"

The error I was previously seeing in the flutter automated build:
ERROR: flutter-engine-sdk-native-3.47.5-r0 do_install: flutter-engine deplo=
yed no host tools at /scratch/chromium_build/chromium_flutter_yocto/build/a=
rago-tmp-default-glibc/deploy/images/am62pxx-evm/flutter-engine-sdk/3.47.5

Thanks,
Thorsten Lannynd

>=20
>=20
> >  SDK_DEPLOY:ti-soc =3D "${TI_COMMON_DEPLOY}/sdk"
> >  PSEUDO_IGNORE_PATHS:append:ti-soc =3D ",${TI_COMMON_DEPLOY}"
> >
> > diff --git a/meta-ti-bsp/dynamic-layers/flutter-layer/recipes-
> graphics/flutter-engine/flutter-engine-sdk_git.bbappend b/meta-ti-
> bsp/dynamic-layers/flutter-layer/recipes-graphics/flutter-engine/flutter-
> engine-sdk_git.bbappend
> > new file mode 100644
> > index 00000000..92e38f1e
> > --- /dev/null
> > +++ b/meta-ti-bsp/dynamic-layers/flutter-layer/recipes-graphics/flutter=
-
> engine/flutter-engine-sdk_git.bbappend
> > @@ -0,0 +1,3 @@
> > +# Pre-built x86-64 host binaries that link against libc/libm from the =
build
> > +# host, not a packaged nativesdk dep.
> > +INSANE_SKIP:class-nativesdk:append =3D " file-rdeps"
> > --
> > 2.34.1

