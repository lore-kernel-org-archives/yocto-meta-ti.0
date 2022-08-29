Return-Path: <gadiyar@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0019ECAAD2
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 16:50:08 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.553.1661791805956523169
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 29 Aug 2022 09:50:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=LtyYYpHl;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: gadiyar@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 27TGo0o6012275;
	Mon, 29 Aug 2022 11:50:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1661791800;
	bh=K7/iqWmksXHOR1f44f3mSC69hu//TvmAU9DBIQTSgNg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=LtyYYpHl2nDpzBdQ2+brTIo8jfyiXWSCVBF6ONClDwsOK8AWf8aFuR9eMgItuBBsF
	 J2QBLUqt5QQJ1kNIHZdvujtvJAX2JmNa8HfRgLU7TgTStDInWlY7hLHAh1Kxde5Noq
	 IihKiXNztlXRAsj8osBmbAVOntS1SuHF+xzsBkOY=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 27TGo0NK017022
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 29 Aug 2022 11:50:00 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Mon, 29
 Aug 2022 11:50:00 -0500
Received: from DFLE111.ent.ti.com ([fe80::6c89:b1ca:ee8f:1a6f]) by
 DFLE111.ent.ti.com ([fe80::6c89:b1ca:ee8f:1a6f%17]) with mapi id
 15.01.2507.006; Mon, 29 Aug 2022 11:50:00 -0500
From: "Gadiyar, Anand" <gadiyar@ti.com>
To: "Eatmon, Ryan" <reatmon@ti.com>,
        "meta-ti@lists.yoctoproject.org"
	<meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, "Nagalla, Hari" <hnagalla@ti.com>,
        "Davis, Andrew" <afd@ti.com>, "Bajjuri, Praneeth" <praneeth@ti.com>
Subject: RE: [dunfell][PATCH] machine: add am62xx-lp-skevm configuration
Thread-Topic: [dunfell][PATCH] machine: add am62xx-lp-skevm configuration
Thread-Index: AQHYuX2Vkt+vKa590ECFFQcXuOcfvq3B/FSAgAQfOeA=
Date: Mon, 29 Aug 2022 16:50:00 +0000
Message-ID: <45f59672c0db48988d35339976be43f6@ti.com>
References: <20220826185638.1030640-1-gadiyar@ti.com>
 <c69f0615-a9a8-b4da-a006-62c68f66396f@ti.com>
In-Reply-To: <c69f0615-a9a8-b4da-a006-62c68f66396f@ti.com>
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
 <meta-ti@lists.yoctoproject.org>; Mon, 29 Aug 2022 16:50:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14977

PiBGcm9tOiBFYXRtb24sIFJ5YW4gPHJlYXRtb25AdGkuY29tPg0KPiANCj4gDQo+IE9uIDgvMjYv
MjAyMiAxMzo1NiwgQW5hbmQgR2FkaXlhciB3cm90ZToNCj4gPiBUaGlzIHBsYXRmb3JtIGlzIHNp
bWlsYXIgdG8gdGhlIGN1cnJlbnRseSBzdXBwb3J0ZWQgYW02Mnh4LWV2bSwgZXhjZXB0DQo+ID4g
dGhhdCB3ZSBjdXJyZW50bHkgbmVlZCBuZXcgZGVmY29uZmlncyBmb3IgdS1ib290IGFuZCBuZXcg
ZHRicyBpbiB0aGUNCj4gPiBmaWxlc3lzdGVtLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQW5h
bmQgR2FkaXlhciA8Z2FkaXlhckB0aS5jb20+DQo+ID4gQ2M6IEhhcmkgTmFnYWxsYSA8aG5hZ2Fs
bGFAdGkuY29tPg0KPiA+IENjOiBBbmRyZXcgRGF2aXMgPGFmZEB0aS5jb20+DQo+ID4gQ2M6IFBy
YW5lZXRoIEJhamp1cmkgPHByYW5lZXRoQHRpLmNvbT4NCj4gPiBDYzogUnlhbiBFYXRtb24gPHJl
YXRtb25AdGkuY29tPg0KPiA+IC0tLQ0KPiA+IEZvciB5b2N0byBwdXJwb3NlcywgdGhpcyBtYWNo
aW5lIGlzIG5lYXJseSBpZGVudGljYWwgdG8gdGhlIEFNNjJ4IFNLLA0KPiA+IGFuZCB3ZSB3aWxs
IGhhdmUgbW9yZSBzaW1pbGFyIG1hY2hpbmVzIGluIHRoZSBmdXR1cmUuDQo+ID4NCj4gPiBNYWlu
bHksIHdlIGp1c3QgbmVlZCB0byBhZGQgbW9yZSBkdGJzIGluIHRoZSBmaWxlc3lzdGVtIGFuZCB0
byBidWlsZA0KPiA+IHUtYm9vdC9zcGwvdGlib290My5iaW4gd2l0aCBkaWZmZXJlbnQgZGVmY29u
ZmlncyB0aGFuIHRoZSBBTTYyeCBTSy4NCj4gPg0KPiA+IElmIHRoZXJlJ3MgYSBiZXR0ZXIgd2F5
IHRvIGFkZCBzdXBwb3J0IGZvciB0aGlzLCBsZXQgbWUga25vdy4gTm93J3MgYQ0KPiA+IGJldHRl
ciB0aW1lIHRoYW4gbGF0ZXIuDQo+IA0KPiANCj4gRXZlbiB0aG91Z2ggdGhlIGZpcnN0IGJvYXJk
IHRoYXQgY2FtZSBvdXQgd2FzIGFuIFNLIGJvYXJkLCBpbiB0aGUgbG9uZw0KPiBydW4gdGhlIGJv
YXJkcyB3aWxsIGV2ZW50dWFsbHkgYmUgY2FsbGVkIEVWTSBib2FyZHMuICBXZSB0eXBpY2FsbHkg
cGljaw0KPiB0aGUgbmFtZXMgZm9yIHRoZSBsb25nIHJ1biwgYW5kIG5vdCB0aGUgc2hvcnQgdGVy
bS4gIFBsZWFzZSBjaGFuZ2UgdGhlDQo+IG5hbWUgb2YgdGhlIHBsYXRmb3JtIHRvIGFtNjJ4eC1s
cC1ldm0gKHJlbW92ZSB0aGUgc2spLg0KPiANCj4gVGhpcyBtZWFucyBjaGFuZ2luZyB0aGUgbmFt
ZSBvZiB0aGUgY29uZiBmaWxlcywgYW5kIHRoZSB2YXJpb3VzIHBsYWNlcw0KPiBpbiB0aGUgb3Ro
ZXIgZmlsZXMgdGhhdCByZWZlcmVuY2UgdGhlIG1hY2hpbmUgbmFtZSBpbiB2YXJpYWJsZSBzZXR0
aW5ncy4NCj4gDQo+IFNvIHRvIHJlc3RhdGU6DQo+IA0KPiBhbTYyeHgtbHAtc2tldm0gLS0+IGFt
NjJ4eC1scC1ldm0NCg0KRG9uZSAtIGNoYW5nZWQgaW4gdjIuDQoNCg0KPiA+ICAgY29uZi9tYWNo
aW5lL2FtNjJ4eC1scC1za2V2bS1rM3I1LmNvbmYgICAgICAgICB8IDExICsrKysrKysrKysrDQo+
ID4gICBjb25mL21hY2hpbmUvYW02Mnh4LWxwLXNrZXZtLmNvbmYgICAgICAgICAgICAgIHwgMTYg
KysrKysrKysrKysrKysrKw0KPiA+ICAgcmVjaXBlcy1ic3AvdGktc2NpLWZ3L3RpLXNjaS1md19n
aXQuYmIgICAgICAgICB8ICAxICsNCj4gPiAgIHJlY2lwZXMtYnNwL3RpZnMtbHBtLXN0dWIvdGlm
cy1scG0tc3R1Yl9naXQuYmIgfCAgMiArLQ0KPiA+ICAgcmVjaXBlcy1rZXJuZWwvbGludXgva2Vy
bmVsLXJkZXBlbmRzLmluYyAgICAgICB8ICAxICsNCj4gPiAgIHJlY2lwZXMtc2VjdXJpdHkvb3B0
ZWUvb3B0ZWUtb3NfJS5iYmFwcGVuZCAgICAgfCAgMSArDQo+ID4gICA2IGZpbGVzIGNoYW5nZWQs
IDMxIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPiAgIGNyZWF0ZSBtb2RlIDEwMDY0
NCBjb25mL21hY2hpbmUvYW02Mnh4LWxwLXNrZXZtLWszcjUuY29uZg0KPiA+ICAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGNvbmYvbWFjaGluZS9hbTYyeHgtbHAtc2tldm0uY29uZg0KPiA+DQo+ID4gZGlm
ZiAtLWdpdCBhL2NvbmYvbWFjaGluZS9hbTYyeHgtbHAtc2tldm0tazNyNS5jb25mIGIvY29uZi9t
YWNoaW5lL2FtNjJ4eC1scC1za2V2bS1rM3I1LmNvbmYNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0
NA0KPiA+IGluZGV4IDAwMDAwMDAwLi44ZTNiMDRkMA0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiAr
KysgYi9jb25mL21hY2hpbmUvYW02Mnh4LWxwLXNrZXZtLWszcjUuY29uZg0KPiA+IEBAIC0wLDAg
KzEsMTEgQEANCj4gPiArI0BUWVBFOiBNYWNoaW5lDQo+ID4gKyNATkFNRTogQU02MlhYIEVWTSAo
UjVGKQ0KPiA+ICsjQERFU0NSSVBUSU9OOiBNYWNoaW5lIGNvbmZpZ3VyYXRpb24gZm9yIHRoZSBU
SSBBTTYyeHggRVZNIChSNUYgY29yZSkNCj4gDQo+IENvcHkgcGFzdGUgZXJyb3I/ICBOZWVkIHRv
IGFkZCBMUCB0byB0aGUgZGVzY3JpcHRpb24/DQo+IA0KPiAgPiArDQo+ID4gK3JlcXVpcmUgY29u
Zi9tYWNoaW5lL2luY2x1ZGUvazNyNS5pbmMNCj4gPiArDQo+ID4gK1NZU0ZXX1NPQyA9ICJhbTYy
eCINCj4gPiArU1lTRldfQ09ORklHID0gImV2bSINCj4gPiArU1lTRldfU1VGRklYID0gImdwIg0K
PiA+ICsNCj4gPiArVUJPT1RfTUFDSElORSA9ICJhbTYyeF9scHNrX3I1X2RlZmNvbmZpZyINCj4g
PiBkaWZmIC0tZ2l0IGEvY29uZi9tYWNoaW5lL2FtNjJ4eC1scC1za2V2bS5jb25mIGIvY29uZi9t
YWNoaW5lL2FtNjJ4eC1scC1za2V2bS5jb25mDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4g
PiBpbmRleCAwMDAwMDAwMC4uMWJlZDFmZjANCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIv
Y29uZi9tYWNoaW5lL2FtNjJ4eC1scC1za2V2bS5jb25mDQo+ID4gQEAgLTAsMCArMSwxNiBAQA0K
PiA+ICsjQFRZUEU6IE1hY2hpbmUNCj4gPiArI0BOQU1FOiBBTTYyWFggRVZNDQo+ID4gKyNAREVT
Q1JJUFRJT046IE1hY2hpbmUgY29uZmlndXJhdGlvbiBmb3IgdGhlIFRJIEFNNjJYWCBFVk0NCj4g
DQo+IA0KPiBDb3B5IHBhc3RlIGVycm9yPyAgTmVlZCB0byBhZGQgTFAgdG8gdGhlIGRlc2NyaXB0
aW9uPw0KDQpUaGFua3MhIEZpeGVkIGluIGJvdGggcGxhY2VzIGluIHYyLg0KDQoNCg==

