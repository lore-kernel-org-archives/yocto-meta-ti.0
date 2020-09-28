Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.8085.1601334700640990858
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Sep 2020 16:11:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=JZqdcTE8;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: denys@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08SNBdK2080530
	for <meta-ti@lists.yoctoproject.org>; Mon, 28 Sep 2020 18:11:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1601334699;
	bh=SjI7dToI6tk/uIqdJuAFtXnDiMTHcak6/YqorOnW89U=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=JZqdcTE8s8Xo1RPP6Te/Id51U6aKkvp0Wm+yoPSzHNLtcbzIk8CMGNWqU0urJvrTX
	 3umgFK6UH79enfRE9QhWG3J1nrMnhdtFLo8NOyjgW3BBw7AT14cY+UVnGi3a7tM0Vi
	 xgGxih3xS7LK7sXhedD//miQvYXgimR1QiQB9tH8=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08SNBdIH009938
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 28 Sep 2020 18:11:39 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 28
 Sep 2020 18:11:39 -0500
Received: from DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895]) by
 DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895%17]) with mapi id
 15.01.1979.003; Mon, 28 Sep 2020 18:11:39 -0500
From: "Denys Dmytriyenko" <denys@ti.com>
To: "Quadros, Roger" <rogerq@ti.com>
CC: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>,
        "Nori,
 Sekhar" <nsekhar@ti.com>, "Murphy, Dan" <dmurphy@ti.com>
Subject: Re: [PATCH] prueth-fw-am65x-sr2: update AM65 sr2.0 PRU ethernet firmware
Thread-Topic: [PATCH] prueth-fw-am65x-sr2: update AM65 sr2.0 PRU ethernet
 firmware
Thread-Index: AQHWkxCpgW9GvmCEiEeWwpkyZK05p6l54jQAgAQPbgCAALCsQA==
Date: Mon, 28 Sep 2020 23:11:39 +0000
Message-ID: <195ce1128d74495e99012d7c695c213c@ti.com>
References: <20200925075118.4861-1-rogerq@ti.com>
 <20200925203812.GE14006@beryl> <21f6545c-2a2b-31f3-4cc6-ea89024618ff@ti.com>
In-Reply-To: <21f6545c-2a2b-31f3-4cc6-ea89024618ff@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.74.252]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Um9nZXIsDQoNCldoZXJlIGRpZCB5b3UgZ2V0IHRoaXMgY29tbWl0IElEIGZyb20/DQorU1JDUkVW
ID0gIjgwYTU1ZTI3MDI0YWQ1MjQzMzUwOWUwNTZlNzBlMGU3NjdhNTYwMzgiDQoNCkl0IGRvZXNu
J3Qgc2VlbSB0byBleGlzdDoNCkVSUk9SOiBGZXRjaGVyIGZhaWx1cmU6IFVuYWJsZSB0byBmaW5k
IHJldmlzaW9uIDgwYTU1ZTI3MDI0YWQ1MjQzMzUwOWUwNTZlNzBlMGU3NjdhNTYwMzggaW4gYnJh
bmNoIHRpLWxpbnV4LWZpcm13YXJlIGV2ZW4gZnJvbSB1cHN0cmVhbQ0KDQpodHRwczovL2dpdC50
aS5jb20vY2dpdC9wcm9jZXNzb3ItZmlybXdhcmUvdGktbGludXgtZmlybXdhcmUvY29tbWl0Lz9o
PXRpLWxpbnV4LWZpcm13YXJlJmlkPTgwYTU1ZTI3MDI0YWQ1MjQzMzUwOWUwNTZlNzBlMGU3Njdh
NTYwMzgNCkJhZCBjb21taXQgcmVmZXJlbmNlOiA4MGE1NWUyNzAyNGFkNTI0MzM1MDllMDU2ZTcw
ZTBlNzY3YTU2MDM4DQoNCi0tIA0KRGVueXMNCg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+IEZyb206IFF1YWRyb3MsIFJvZ2VyDQo+IFNlbnQ6IE1vbmRheSwgU2VwdGVtYmVyIDI4
LCAyMDIwIDI6MzggQU0NCj4gVG86IERteXRyaXllbmtvLCBEZW55cw0KPiBDYzogbWV0YS10aUBs
aXN0cy55b2N0b3Byb2plY3Qub3JnOyBOb3JpLCBTZWtoYXI7IE11cnBoeSwgRGFuDQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0hdIHBydWV0aC1mdy1hbTY1eC1zcjI6IHVwZGF0ZSBBTTY1IHNyMi4wIFBS
VSBldGhlcm5ldA0KPiBmaXJtd2FyZQ0KPiANCj4gRGVueXMsDQo+IA0KPiBPbiAyNS8wOS8yMDIw
IDIzOjM4LCBEZW55cyBEbXl0cml5ZW5rbyB3cm90ZToNCj4gPiBJcyBpdCB2Mj8gV2hhdCdzIHRo
ZSBkaWZmZXJlbmNlIGZyb20gdjE/IEkgYWxyZWFkeSBtZXJnZWQgdjEgdG8gZHVuZmVsbC1uZXh0
IC0NCj4gPiBzaG91bGQgSSBkcm9wIGl0IGFuZCBtZXJnZSB0aGlzIG9uZSBpbnN0ZWFkPw0KPiAN
Cj4gVGhlcmUgaXMgbm8gZGlmZmVyZW5jZS4gWW91ciBtZXJnZSBpcyBmaW5lLiBUaGFua3MhDQo+
IA0KPiBjaGVlcnMsDQo+IC1yb2dlcg0KPiA+DQo+ID4NCj4gPiBPbiBGcmksIFNlcCAyNSwgMjAy
MCBhdCAxMDo1MToxOEFNICswMzAwLCBSb2dlciBRdWFkcm9zIHdyb3RlOg0KPiA+PiBVcGRhdGUg
dG8gcmVsZWFzZSBSRUwuUFJVLUlDU1MtUFJPRklORVQtU1dJVENIXzAyLjAyLjA0LjAyDQo+ID4+
DQo+ID4+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFF1YWRyb3MgPHJvZ2VycUB0aS5jb20+DQo+ID4+
IC0tLQ0KPiA+PiAgIHJlY2lwZXMtYnNwL3BydWV0aC1mdy9wcnVldGgtZnctYW02NXgtc3IyX2dp
dC5iYiB8IDIgKy0NCj4gPj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkNCj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBhL3JlY2lwZXMtYnNwL3BydWV0aC1mdy9w
cnVldGgtZnctYW02NXgtc3IyX2dpdC5iYiBiL3JlY2lwZXMtDQo+IGJzcC9wcnVldGgtZncvcHJ1
ZXRoLWZ3LWFtNjV4LXNyMl9naXQuYmINCj4gPj4gaW5kZXggNmUxN2M0YWEuLjczNGNhOWMxIDEw
MDY0NA0KPiA+PiAtLS0gYS9yZWNpcGVzLWJzcC9wcnVldGgtZncvcHJ1ZXRoLWZ3LWFtNjV4LXNy
Ml9naXQuYmINCj4gPj4gKysrIGIvcmVjaXBlcy1ic3AvcHJ1ZXRoLWZ3L3BydWV0aC1mdy1hbTY1
eC1zcjJfZ2l0LmJiDQo+ID4+IEBAIC0xMSw3ICsxMSw3IEBAIENPTVBBVElCTEVfTUFDSElORSA9
ICJhbTY1eHgtZXZtIg0KPiA+Pg0KPiA+PiAgIFBBQ0tBR0VfQVJDSCA9ICIke01BQ0hJTkVfQVJD
SH0iDQo+ID4+DQo+ID4+IC1TUkNSRVYgPSAiZWE0YmY1M2JhMGE0YTMwYmI3ZTBlOGI2MTM4ZmRi
MjJmZTUwMzcyYSINCj4gPj4gK1NSQ1JFViA9ICI4MGE1NWUyNzAyNGFkNTI0MzM1MDllMDU2ZTcw
ZTBlNzY3YTU2MDM4Ig0KPiA+PiAgIEJSQU5DSCA/PSAidGktbGludXgtZmlybXdhcmUiDQo+ID4+
DQo+ID4+ICAgU1JDX1VSSSA9ICJnaXQ6Ly9naXQudGkuY29tL3Byb2Nlc3Nvci1maXJtd2FyZS90
aS1saW51eC0NCj4gZmlybXdhcmUuZ2l0O3Byb3RvY29sPWdpdDticmFuY2g9JHtCUkFOQ0h9Ig0K
PiA+PiAtLQ0KPiA+PiBUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1
IDIyLCAwMDE4MCBIZWxzaW5raS4NCj4gPj4gWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEt
NC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kNCj4gPj4NCj4gDQo+IC0tDQo+IFRleGFz
IEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNpbmtp
Lg0KPiBZLXR1bm51cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFpa2thL0RvbWljaWxl
OiBIZWxzaW5raQ0K
