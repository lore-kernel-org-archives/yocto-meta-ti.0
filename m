Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAA1EC7EE2C
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 11:29:51 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.7348.1685446185362715688
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 30 May 2023 04:29:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=gGfqy+lI;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: a-limaye@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34UBTiWC003975
	for <meta-ti@lists.yoctoproject.org>; Tue, 30 May 2023 06:29:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685446184;
	bh=LKYJen2j93krT2BVWlt8dDCzL8vaZTriRqu3Fp5C7I8=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=gGfqy+lIzK8ufwOKdA098/vgQfDPwoZXwrcKSHSIyVuEp4JFcPdvQV24CzF0LJPcG
	 khabcZ1jnKICyNFJVT6EMoMrg00+7ySsDWGZOIrT53xYX2C88DKD+o3yvkq9aaMdDF
	 RDqhbCscniGqeN4gdyWBfg15WA/K9NODi3H1TdKs=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34UBTinE021612
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 30 May 2023 06:29:44 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 30
 May 2023 06:29:44 -0500
Received: from DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455]) by
 DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455%17]) with mapi id
 15.01.2507.023; Tue, 30 May 2023 06:29:43 -0500
From: "Limaye, Aniket" <a-limaye@ti.com>
To: "Chawdhry, Manorit" <m-chawdhry@ti.com>, "Eatmon, Ryan" <reatmon@ti.com>,
        "Dmytriyenko, Denys" <denys@ti.com>,
        "meta-ti@lists.yoctoproject.org"
	<meta-ti@lists.yoctoproject.org>,
        "Davis, Andrew" <afd@ti.com>
Subject: RE: Fit image signature
Thread-Topic: Fit image signature
Thread-Index: AQHZkuHXbAZ5CwQJlE6mIy+5Vbhf669yqLww
Date: Tue, 30 May 2023 11:29:43 +0000
Message-ID: <aff76fb0c59b4de0800708f45df6b9dd@ti.com>
References: <5dd77f89-8c9c-e135-5db9-a526d4b3b8de@ti.com>
In-Reply-To: <5dd77f89-8c9c-e135-5db9-a526d4b3b8de@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.218.216]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 30 May 2023 11:29:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16620

SGVyZSdzIG1vcmUgaW5mbywgaWYgbmVlZGVkLCA6DQoNClRoZSBkZXBsb3kgZm9yIHRoZSAuZHRi
IGlzIGJlaW5nIGRvbmUgZnJvbSBoZXJlIDogaHR0cHM6Ly9naXQub3BlbmVtYmVkZGVkLm9yZy9v
cGVuZW1iZWRkZWQtY29yZS90cmVlL21ldGEvY2xhc3Nlcy9rZXJuZWwtZml0aW1hZ2UuYmJjbGFz
cz9oPWtpcmtzdG9uZSNuNzU1DQpUaGUgY2xhc3MgaXMgYXBwZW5kaW5nIHRoZSBmdW5jdGlvbmFs
aXR5IHRvIGtlcm5lbF9kb19kZXBsb3kNCg0KV2hlcmVhcyBvdXIgbGludXgtdGktc3RhZ2luZyBp
cyBub3QgdXNpbmcgdGhhdCBmdW5jdGlvbiBhdCBhbGwuIFdlIGFyZSB1c2luZyBrZXJuZWxfdmVu
ZG9yX2R0Yl9kb19kZXBsb3kgZnJvbSBoZXJlIDogaHR0cHM6Ly9naXQudGkuY29tL2NnaXQvYXJh
Z28tcHJvamVjdC9tZXRhLXRpL3RyZWUvbWV0YS10aS1ic3AvY2xhc3Nlcy9rZXJuZWxfdmVuZG9y
X2R0Yi5iYmNsYXNzP2g9a2lya3N0b25lI243NzYNCg0KUmVnYXJkcywNCkFuaWtldA0KDQoNCi0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBDaGF3ZGhyeSwgTWFub3JpdCA8bS1jaGF3
ZGhyeUB0aS5jb20+IA0KU2VudDogVHVlc2RheSwgTWF5IDMwLCAyMDIzIDQ6MDEgUE0NClRvOiBF
YXRtb24sIFJ5YW4gPHJlYXRtb25AdGkuY29tPjsgRG15dHJpeWVua28sIERlbnlzIDxkZW55c0B0
aS5jb20+OyBtZXRhLXRpQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc7IERhdmlzLCBBbmRyZXcgPGFm
ZEB0aS5jb20+OyBMaW1heWUsIEFuaWtldCA8YS1saW1heWVAdGkuY29tPg0KU3ViamVjdDogRml0
IGltYWdlIHNpZ25hdHVyZQ0KDQpIaSBSeWFuLA0KDQpJIHdhcyByZWNlbnRseSB0cnlpbmcgdG8g
ZW5hYmxlIHRoZSBmaXQgc2lnbmF0dXJlIGxvY2FsbHkgb24geW9jdG8gYW5kIGZhY2VkIGEgd2Fy
bmluZy4uDQoNCldBUk5JTkc6IHUtYm9vdC10aS1zdGFnaW5nLTFfMjAyMy4wNCtnaXRBVVRPSU5D
KzAxMGFmYzFmZTctcjAgZG9fZGVwbG95OiBGYWlsdXJlIHdoaWxlIGFkZGluZyBwdWJsaWMga2V5
IHRvIHUtYm9vdCBiaW5hcnkuIFZlcmlmaWVkIGJvb3Qgd29uJ3QgYmUgYXZhaWxhYmxlLg0KDQpJ
IHdhcyB0YWxraW5nIHRvIEFuaWtldCBhYm91dCBpdCBhbmQgaGUgbGV0IG1lIGtub3cgdGhhdCB0
aGVyZSBpcyBzb21lIHZlbmRvciBzcGVjaWZpYyBvdmVycmlkZSBpbiB0aGUga2VybmVsIGNsYXNz
IG5vdyBhbmQgYW0gd29ycmllZCB0aGF0IHRoaXMgdmVuZG9yIHNwZWNpZmljIG92ZXJyaWRlIG1p
Z2h0IG5vdCBiZSBjb21wYXRpYmxlIHdpdGggdGhlIGZpdCBzaWduYXR1cmUgdGhhdCBpcyB0aGVy
ZSBpbiB0aGUgdXBzdHJlYW0uIENhbiB5b3UgbGV0IG1lIGtub3cgaWYgdGhpcyB2ZW5kb3Igc3Bl
Y2lmaWMgY2xhc3MgaGFzIHRoZSB0aGluZ3MgcmVsYXRlZCB0byBlbmFibGluZyB0aGUgZml0IHNp
Z25hdHVyZSBib290aW5nIHdpdGggdWJvb3Q/DQoNClJlZ2FyZHMsDQpNYW5vcml0DQoNCg==

