Return-Path: <anandb@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A1DCC61D9B
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 13:56:59 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.19856.1700661415996296159
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Nov 2023 05:56:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=WIwwH+lx;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: anandb@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3AMDuppU004794;
	Wed, 22 Nov 2023 07:56:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1700661411;
	bh=YpvIKYLS4MhsVtrl6J/66aZnJHMqrEv2REOHIv/LRCo=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=WIwwH+lx4XMd/Arh4YRv5NIhVeRXBzlK9ErTBpmlQhyitDrzygKzF6tXtRHOwiAh8
	 WJkPomGMVaCqH0XcfRm0PUR6thYR7WBppIFLghVoAT5+44mTMImcco+0SdGYOiBswY
	 SfgGY44R+qluBaUtqBYwQ0TzKEGXF+Zi1H+pkW64=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3AMDupWB062057
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 22 Nov 2023 07:56:51 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 22
 Nov 2023 07:56:51 -0600
Received: from DLEE106.ent.ti.com ([fe80::8d93:1ed8:6156:7891]) by
 DLEE106.ent.ti.com ([fe80::8d93:1ed8:6156:7891%17]) with mapi id
 15.01.2507.023; Wed, 22 Nov 2023 07:56:51 -0600
From: "Balagopalakrishnan, Anand" <anandb@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>,
        "Etheridge, Darren"
	<detheridge@ti.com>
CC: "max.krummenacher@toradex.com" <max.krummenacher@toradex.com>,
        "Eatmon,
 Ryan" <reatmon@ti.com>, "Sapp, Randolph" <rs@ti.com>,
        "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Subject: RE: [EXTERNAL] Re: [meta-ti][kirkstone][PATCH] mesa-pvr: rollback
 srcrev to unbreak Rogue GPU based platforms
Thread-Topic: [EXTERNAL] Re: [meta-ti][kirkstone][PATCH] mesa-pvr: rollback
 srcrev to unbreak Rogue GPU based platforms
Thread-Index: AQHaHJrjt4IXH4lMTkyn/Nkz/P34A7CFtxWAgACnC3A=
Date: Wed, 22 Nov 2023 13:56:49 +0000
Message-ID: <9fdb3c013e7a4c7f94f02a65a5f22661@ti.com>
References: <20231121165038.6088-1-detheridge@ti.com>
 <CAB2aN6Nsu7kJJmrC+v4NB=wg7h7CKxdkqGxDGQvnpydZsFUN3g@mail.gmail.com>
In-Reply-To: <CAB2aN6Nsu7kJJmrC+v4NB=wg7h7CKxdkqGxDGQvnpydZsFUN3g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.249.142.86]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 Nov 2023 13:56:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17327

RGVueXMsDQoNCkkgd2lsbCBzZW5kIGEgZGlmZmVyZW50IHZlcnNpb24gb2YgdGhlIHBhdGNoIHNo
b3J0bHkuDQoNClJlZ2FyZHMsDQpBbmFuZA0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
RnJvbTogRGVueXMgRG15dHJpeWVua28gPGRlbnlzQGtvbnN1bGtvLmNvbT4gDQpTZW50OiBXZWRu
ZXNkYXksIE5vdmVtYmVyIDIyLCAyMDIzIDM6MjggQU0NClRvOiBFdGhlcmlkZ2UsIERhcnJlbiA8
ZGV0aGVyaWRnZUB0aS5jb20+DQpDYzogbWF4LmtydW1tZW5hY2hlckB0b3JhZGV4LmNvbTsgQmFs
YWdvcGFsYWtyaXNobmFuLCBBbmFuZCA8YW5hbmRiQHRpLmNvbT47IEVhdG1vbiwgUnlhbiA8cmVh
dG1vbkB0aS5jb20+OyBTYXBwLCBSYW5kb2xwaCA8cnNAdGkuY29tPjsgbWV0YS10aUBsaXN0cy55
b2N0b3Byb2plY3Qub3JnDQpTdWJqZWN0OiBbRVhURVJOQUxdIFJlOiBbbWV0YS10aV1ba2lya3N0
b25lXVtQQVRDSF0gbWVzYS1wdnI6IHJvbGxiYWNrIHNyY3JldiB0byB1bmJyZWFrIFJvZ3VlIEdQ
VSBiYXNlZCBwbGF0Zm9ybXMNCg0KSSBoYXZlbid0IHNlZW4gdGhpcyBvbiB0aGUgbGlzdCAtIHdh
cyB0aGlzIGJsb2NrZWQ/DQoNCkFzIG9mIHRoZSBjaGFuZ2UgaXRzZWxmIC0gaXMgdGhpcyBlc3Nl
bnRpYWxseSB1bmJyZWFraW5nIFJvZ3VlIGJ5IGJyZWFraW5nIGJhY2sgU0dYPw0KDQpPbiBUdWUs
IE5vdiAyMSwgMjAyMyBhdCAxMTo1MOKAr0FNIERhcnJlbiBFdGhlcmlkZ2UgPGRldGhlcmlkZ2VA
dGkuY29tPiB3cm90ZToNCj4NCj4gQSBidWcgd2FzIGludHJvZHVjZWQgd2hpbGUgdHJ5aW5nIHRv
IHVuaWZ5IHRoZSBNZXNhIHZlcnNpb24gdGhhdCBpcyB1c2VkDQo+IG9uIFNHWCBHUFUncyBhbmQg
Um9ndWUgR1BVJ3MuICAgSXQgbWFuaWZlc3RzIGl0c2VsZiBhcyBhbiBpbW1lZGlhdGUgc2VnZmF1
bHQNCj4gd2hlbmV2ZXIgeW91IHRyeSBhbmQgcnVuIHNvbWV0aGluZyBsaWtlIGdsbWFyazItZXMy
LXdheWxhbmQgb3IgDQo+IHdlc3Rvbi1zaW1wbGUtZWdsIG9uIGNlcnRhaW4gUm9ndWUgYmFzZWQg
cGxhdGZvcm1zIChzcGVjaWZpY2FsbHkgYW02MngpLg0KPg0KPiBSb2xsYmFjayB0aGUgU1JDUkVW
IHRvIGEgdmVyc2lvbiBiZWZvcmUgdGhlIE1lc2EgU0dYIGNoYW5nZXMgd2VyZSBhZGRlZC4NCj4g
V2hpbGUgd2UgZmlndXJlIG91dCB3aGF0IHRoZSB1bmRlcmx5aW5nIGlzc3VlIGlzIHdpdGggdGhl
IHVuaWZpZWQgDQo+IHZlcnNpb24uDQo+DQo+IFRoaXMgcmV2ZXJ0cyB0aGUgbWVzYS1wdnIgcmVj
aXBlIGJhY2sgdG8gYmUgdGhlIGVxdWl2YWxlbnQgb2YgY29tbWl0IGlkOg0KPiAgICAgICAgIDIx
ZmI5Y2JjMDEzOTBmMzYyY2EzNzY4OTFiOWY5NmYyYWQyNGYzNDQNCj4NCj4gU2lnbmVkLW9mZi1i
eTogRGFycmVuIEV0aGVyaWRnZSA8ZGV0aGVyaWRnZUB0aS5jb20+DQo+IC0tLQ0KPiAgbWV0YS10
aS1ic3AvcmVjaXBlcy1ncmFwaGljcy9tZXNhL21lc2EtcHZyXzIyLjMuNS5iYiB8IDIgKy0NCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPg0KPiBkaWZm
IC0tZ2l0IGEvbWV0YS10aS1ic3AvcmVjaXBlcy1ncmFwaGljcy9tZXNhL21lc2EtcHZyXzIyLjMu
NS5iYiANCj4gYi9tZXRhLXRpLWJzcC9yZWNpcGVzLWdyYXBoaWNzL21lc2EvbWVzYS1wdnJfMjIu
My41LmJiDQo+IGluZGV4IDk4ZDMwYzViLi4yODFkNmEyMSAxMDA2NDQNCj4gLS0tIGEvbWV0YS10
aS1ic3AvcmVjaXBlcy1ncmFwaGljcy9tZXNhL21lc2EtcHZyXzIyLjMuNS5iYg0KPiArKysgYi9t
ZXRhLXRpLWJzcC9yZWNpcGVzLWdyYXBoaWNzL21lc2EvbWVzYS1wdnJfMjIuMy41LmJiDQo+IEBA
IC0yMyw3ICsyMyw3IEBAIFNSQ19VUkkgPSAiIFwNCj4NCj4gIFMgPSAiJHtXT1JLRElSfS9naXQi
DQo+DQo+IC1TUkNSRVYgPSAiN2M5NTIyYTQxNDc4MzYwNjRmNTgyMjc4ZTRmNzExNTczNWMxNjg2
OCINCj4gK1NSQ1JFViA9ICI1NGZkOWQ3ZGVhMDk4YjZmMTFjMmEyNDRiMGM2NzYzZGM4YzU2OTBj
Ig0KPg0KPiAgUEFDS0FHRUNPTkZJRzphcHBlbmQgPSAiIFwNCj4gICAgICAke0BiYi51dGlscy5j
b250YWlucygnUFJFRkVSUkVEX1BST1ZJREVSX3ZpcnR1YWwvZ3B1ZHJpdmVyJywgDQo+ICd0aS1p
bWctcm9ndWUtZHJpdmVyJywgJ3B2cicsICcnLCBkKX0gXA0KPiAtLQ0KPiAyLjE3LjENCj4NCg==

