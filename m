Return-Path: <gadiyar@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69732ECAAD5
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 19:40:09 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.16984.1662061203228151192
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 01 Sep 2022 12:40:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=lXqUKeY9;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: gadiyar@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 281Je0W9096024;
	Thu, 1 Sep 2022 14:40:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1662061200;
	bh=Kjhaqk2WfLc8tXOwBJKqrBA6yNF7h0zOOI0LXIhbyN4=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=lXqUKeY90z2gA8j7LrecG9jni8WnWITQt7T3oWjkCGkxZqOIjsB4OzWJcVIwEpTVY
	 gmx7pzEP6d14vpVjoYT0oBnsV6NYrz8fraJdsBp7NqmhbF8cxv08ypYrVTRyyUWGoZ
	 gFbtWowSxcEgJzN+h2/LTDd0SJz7ShoGeFmIHueQ=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 281Je0xw081082
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 Sep 2022 14:40:00 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Thu, 1 Sep
 2022 14:39:59 -0500
Received: from DFLE111.ent.ti.com ([fe80::6c89:b1ca:ee8f:1a6f]) by
 DFLE111.ent.ti.com ([fe80::6c89:b1ca:ee8f:1a6f%17]) with mapi id
 15.01.2507.006; Thu, 1 Sep 2022 14:39:59 -0500
From: "Gadiyar, Anand" <gadiyar@ti.com>
To: "Davis, Andrew" <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        "Eatmon, Ryan" <reatmon@ti.com>,
        "meta-ti@lists.yoctoproject.org"
	<meta-ti@lists.yoctoproject.org>
Subject: RE: [meta-ti][dunfell][PATCH 2/2] optee-os: Lower log level for AM62x
Thread-Topic: [meta-ti][dunfell][PATCH 2/2] optee-os: Lower log level for
 AM62x
Thread-Index: AQHYuYBgnvwvNZ+SQki4U93vU3Bh5K3LSgGA//+3VkA=
Date: Thu, 1 Sep 2022 19:39:59 +0000
Message-ID: <eaf0b3e408724b3982ff04cb47f3d764@ti.com>
References: <20220826191641.31116-1-afd@ti.com>
 <20220826191641.31116-2-afd@ti.com>
 <f71a1fe4-92e3-0e82-e2bd-07b5a32fd86a@ti.com>
In-Reply-To: <f71a1fe4-92e3-0e82-e2bd-07b5a32fd86a@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.247.23.90]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 01 Sep 2022 19:40:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14990

PiBGcm9tOiBEYXZpcywgQW5kcmV3IDxhZmRAdGkuY29tPg0KPiANCj4gT24gOC8yNi8yMiAyOjE2
IFBNLCBBbmRyZXcgRGF2aXMgd3JvdGU6DQo+ID4gRHVyaW5nIHJlc3VtZSBmcm9tIGxvdyBwb3dl
ciBtb2RlIHN1c3BlbmQgT1AtVEVFIHByaW50cyBzb21lIG1lc3NhZ2VzDQo+ID4gb24gdGhlIFVB
UlQuIEl0IHNlZW1zIHRoaXMgVUFSVCBpcyBub3QgcG93ZXJlZCBhdCB0aGlzIHBvaW50IGluIHRo
ZQ0KPiA+IHNlcXVlbmNlIGJyZWFraW5nIHN1c3BlbmQvcmVzdW1lLiBXZSBzaG91bGQgdHJhY2sg
ZG93biB0aGUgZXhhY3QNCj4gPiBwcmludHMgYW5kIHF1aWV0IHRoZW0uIFVudGlsIHdlIGdldCB0
aGF0IGZpeCB1cHN0cmVhbSwgbGV0cyBsb3dlcg0KPiA+IHRoZSBsb2cgbGV2ZWwgZm9yIHRoaXMg
cGxhdGZvcm0gdG8gdW5ibG9jayB0aGUgTFBNIHdvcmsuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBBbmRyZXcgRGF2aXMgPGFmZEB0aS5jb20+DQo+ID4gLS0tDQo+ID4gICByZWNpcGVzLXNlY3Vy
aXR5L29wdGVlL29wdGVlLW9zXyUuYmJhcHBlbmQgfCAyICstDQo+ID4gICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9y
ZWNpcGVzLXNlY3VyaXR5L29wdGVlL29wdGVlLW9zXyUuYmJhcHBlbmQgYi9yZWNpcGVzLQ0KPiBz
ZWN1cml0eS9vcHRlZS9vcHRlZS1vc18lLmJiYXBwZW5kDQo+ID4gaW5kZXggNDA4MWIzMjQuLjNj
ZGE4NTU5IDEwMDY0NA0KPiA+IC0tLSBhL3JlY2lwZXMtc2VjdXJpdHkvb3B0ZWUvb3B0ZWUtb3Nf
JS5iYmFwcGVuZA0KPiA+ICsrKyBiL3JlY2lwZXMtc2VjdXJpdHkvb3B0ZWUvb3B0ZWUtb3NfJS5i
YmFwcGVuZA0KPiA+IEBAIC02LDcgKzYsNyBAQCBERVBFTkRTX2FwcGVuZF90aS1zb2MgPSAiIHB5
dGhvbjMtY3J5cHRvZ3JhcGh5LW5hdGl2ZSINCj4gPg0KPiA+ICAgRVhUUkFfT0VNQUtFX2FwcGVu
ZF9rMyA9ICIke0AgJ0NGR19DT05TT0xFX1VBUlQ9JysgZC5nZXRWYXIoJ09QVEVFX0szX1VTQVJU
JykgaWYgZC5nZXRWYXIoJ09QVEVFX0szX1VTQVJUJykgZWxzZSAnJ30iDQo+ID4NCj4gPiAtRVhU
UkFfT0VNQUtFX2FwcGVuZF9hbTYyeHgtZXZtID0gIiBDRkdfV0lUSF9TT0ZUV0FSRV9QUk5HPXki
DQo+ID4gK0VYVFJBX09FTUFLRV9hcHBlbmRfYW02Mnh4LWV2bSA9ICIgQ0ZHX1dJVEhfU09GVFdB
UkVfUFJORz15IENGR19URUVfQ09SRV9MT0dfTEVWRUw9MSINCj4gDQo+IA0KPiBwaW5nLg0KPiAN
Cj4gTG9va3MgbGlrZSB0aGVyZSBpcyBub3cgYSBtZXJnZSBjb25mbGljdCBmb3IgdGhpcywgZWFz
eSBlbm91Z2ggdG8NCj4gZml4LCBhZGQgQ0ZHX1RFRV9DT1JFX0xPR19MRVZFTD0xIHRvIHRoZSBu
ZXcgYW02Mnh4LWxwLWV2bSBhbHNvLg0KPiANCj4gSWYgeW91IHdhbnQgbWUgdG8gcmUtc2VuZCBs
ZXQgbWUga25vdy4NCj4gDQo+IEFuZHJldw0KDQpQcm9iYWJseSBiZXN0IHRvIHJlc2VuZCAtIEkg
dGhvdWdodCBJIGhhZCBhZGRlZCBpdCBmb3IgYW02Mnh4LWxwLWV2bQ0Kd2hlbiBJIHNlbnQgaXQg
b3V0IGJ1dCBpdCBzZWVtcyBJIGRpZCBub3QuIFNvcnJ5Lg0KDQoNCg==

