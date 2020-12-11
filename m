Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.9939.1607705555309026638
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 11 Dec 2020 08:52:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=aCfBnweW;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: g-tammana@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 7EECF38C0885
	for <meta-ti@yoctoproject.org>; Fri, 11 Dec 2020 16:52:34 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BBGqX4V009128
	for <meta-ti@yoctoproject.org>; Fri, 11 Dec 2020 10:52:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607705553;
	bh=uMxEd9SrwlucpTbhR3rfvyUpZNxShp2E2lr2cxOm9ds=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=aCfBnweWgrU3euiwmaugztWItYS9DPVpezppta/DmG9PfUJo3vcbSiwQ1gFmu0aws
	 4mNwyKo9Ib4p+GRPFwIvfIxA+Zdxukvqy9km5TjkeGh5xV0eI/cd/zu4U+8edl1Lsf
	 ueYrgRCSdGpxW+d7TEWEfNsF+5ARZYurzchImvpo=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BBGqXIZ027071
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 11 Dec 2020 10:52:33 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 11
 Dec 2020 10:52:33 -0600
Received: from DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11]) by
 DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11%17]) with mapi id
 15.01.1979.003; Fri, 11 Dec 2020 10:52:33 -0600
From: "Gowtham Tammana" <g-tammana@ti.com>
To: "Murphy, Dan" <dmurphy@ti.com>,
        "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Subject: Re: [EXTERNAL] [meta-ti] [dunfell/master] [PATCH] ti-sysbios: upgrade 6.76.03.01 -> 6.76.04.02
Thread-Topic: [EXTERNAL] [meta-ti] [dunfell/master] [PATCH] ti-sysbios:
 upgrade 6.76.03.01 -> 6.76.04.02
Thread-Index: AQHWz8Jj8aTFWxZGIEOFqfNs2pfoJqnx+igAgABmgID//7MTkA==
Date: Fri, 11 Dec 2020 16:52:33 +0000
Message-ID: <3b34acff802640298f27a1a7171502cf@ti.com>
References: <20201211133436.10566-1-dmurphy@ti.com>
 <bea5488ac8a74c069e2b19f0c1a66599@ti.com>
 <361317b8-11d8-64ce-7946-9a940346dd20@ti.com>
In-Reply-To: <361317b8-11d8-64ce-7946-9a940346dd20@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.42.213]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IE11cnBoeSwgRGFuDQo+U2Vu
dDogRnJpZGF5LCBEZWNlbWJlciAxMSwgMjAyMCA4OjU2IEFNDQo+VG86IFRhbW1hbmEsIEdvd3Ro
YW0gPGctdGFtbWFuYUB0aS5jb20+OyBtZXRhLXRpQHlvY3RvcHJvamVjdC5vcmcNCj5TdWJqZWN0
OiBSZTogW0VYVEVSTkFMXSBbbWV0YS10aV0gW2R1bmZlbGwvbWFzdGVyXSBbUEFUQ0hdIHRpLXN5
c2Jpb3M6DQo+dXBncmFkZSA2Ljc2LjAzLjAxIC0+IDYuNzYuMDQuMDINCj4NCj5Hb3d0aGFtDQo+
DQo+T24gMTIvMTEvMjAgODo1MSBBTSwgVGFtbWFuYSwgR293dGhhbSB3cm90ZToNCj4+DQo+Pj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+PiBGcm9tOiBtZXRhLXRpQGxpc3RzLnlvY3Rv
cHJvamVjdC5vcmcgPG1ldGEtdGlAbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4gT24NCj4+PiBCZWhh
bGYgT2YgRGFuIE11cnBoeSB2aWEgbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KPj4+IFNlbnQ6IEZy
aWRheSwgRGVjZW1iZXIgMTEsIDIwMjAgNzozNSBBTQ0KPj4+IFRvOiBtZXRhLXRpQHlvY3RvcHJv
amVjdC5vcmcNCj4+PiBDYzogTXVycGh5LCBEYW4gPGRtdXJwaHlAdGkuY29tPg0KPj4+IFN1Ympl
Y3Q6IFtFWFRFUk5BTF0gW21ldGEtdGldIFtkdW5mZWxsL21hc3Rlcl0gW1BBVENIXSB0aS1zeXNi
aW9zOg0KPnVwZ3JhZGUNCj4+PiA2Ljc2LjAzLjAxIC0+IDYuNzYuMDQuMDINCj4+Pg0KPj4+IFNp
Z25lZC1vZmYtYnk6IERhbiBNdXJwaHkgPGRtdXJwaHlAdGkuY29tPg0KPj4+IC0tLQ0KPj4+IC4u
Li97dGktc3lzYmlvc182Ljc2LjAzLjAxLmJiID0+IHRpLXN5c2Jpb3NfNi43Ni4wNC4wMi5iYn0g
IHwgNiArKystLS0NCj4+PiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQ0KPj4+IHJlbmFtZSByZWNpcGVzLXRpL2Jpb3Mve3RpLXN5c2Jpb3NfNi43Ni4wMy4w
MS5iYiA9PiB0aS0NCj4+PiBzeXNiaW9zXzYuNzYuMDQuMDIuYmJ9ICg2OCUpDQo+Pj4NCj4+PiBk
aWZmIC0tZ2l0IGEvcmVjaXBlcy10aS9iaW9zL3RpLXN5c2Jpb3NfNi43Ni4wMy4wMS5iYiBiL3Jl
Y2lwZXMtDQo+dGkvYmlvcy90aS0NCj4+PiBzeXNiaW9zXzYuNzYuMDQuMDIuYmINCj4+PiBzaW1p
bGFyaXR5IGluZGV4IDY4JQ0KPj4+IHJlbmFtZSBmcm9tIHJlY2lwZXMtdGkvYmlvcy90aS1zeXNi
aW9zXzYuNzYuMDMuMDEuYmINCj4+PiByZW5hbWUgdG8gcmVjaXBlcy10aS9iaW9zL3RpLXN5c2Jp
b3NfNi43Ni4wNC4wMi5iYg0KPj4+IGluZGV4IGQyNDI1MTBmODAxZS4uMjM3YjQ4OTI5NzM5IDEw
MDY0NA0KPj4+IC0tLSBhL3JlY2lwZXMtdGkvYmlvcy90aS1zeXNiaW9zXzYuNzYuMDMuMDEuYmIN
Cj4+PiArKysgYi9yZWNpcGVzLXRpL2Jpb3MvdGktc3lzYmlvc182Ljc2LjA0LjAyLmJiDQo+Pj4g
QEAgLTEsMTMgKzEsMTMgQEANCj4+PiByZXF1aXJlIHJlY2lwZXMtdGkvYmlvcy90aS1zeXNiaW9z
LmluYw0KPj4+DQo+Pj4gUEUgPSAiMSINCj4+PiAtUFYgPSAiNl83Nl8wM18wMSINCj4+PiArUFYg
PSAiNl83Nl8wNF8wMiINCj4+IFBWIG5vdCBuZWVkZWQgaGVyZSBhcyBpdCBpcyBhbHJlYWR5IHNw
ZWNpZmllZCBpbiB0aGUgcmVjaXBlIG5hbWUuDQo+DQo+QWN0dWFsbHkgdGhhdCBpcyBub3QgdHJ1
ZS7CoCBSZWNpcGUgbmFtZSBpcyA2Ljc2LjA0LjAyIFBWIGhhcyB1bmRlcnNjb3Jlcw0KPjZfNzZf
MDRfMDIgYXMgdGhlIFBWIGlzIHVzZWQgaW4gdGhlIGJpbmFyeSBuYW1lIGZyb20gdGhlIGRvd25s
b2FkIHNpdGUNCg0KQWggZGlkbuKAmXQgbm90aWNlIHRoZSB1bmRlcnNjb3JlcyBhbmQgZG90cyBo
ZXJlLiBUaGUgcmVjaXBlIG5hbWluZyBjb252ZW50aW9uDQppcyAke1BOfV8ke1BWfS5iYiBhbmQg
aGVyZSBpdCBpcyBiZWluZyBvdmVycmlkZGVuIGluIHRoZSByZWNpcGUgd2hpY2ggaXMNCmRpc2Nv
dXJhZ2VkIGFzIHBlciBbMV0uIEkgc2VlIHRoYXQgZmlsZSBsb2NhdGlvbnMgcmVxdWlyZSB0aGUg
dW5kZXJzY29yZQ0Kbm90YXRpb24sIGFuZCBwZXJoYXBzIHRoZSByZWNpcGUgbmFtZSBjb3VsZCBi
ZSBkb25lIHdpdGhvdXQgdGhlIFBWIGFzIGl0IGlzDQpvdmVycmlkZGVuIGFueXdheSBpbiB0aGUg
cmVjaXBlIHRvIGF2b2lkIGNvbmZ1c2lvbi4NCg0KWzFdOiBodHRwczovL2RvY3MueW9jdG9wcm9q
ZWN0Lm9yZy9yZWYtbWFudWFsL3JlZi12YXJpYWJsZXMuaHRtbCN0ZXJtLVBWDQoNClRoYW5rcywN
Ckdvd3RoYW0NCg0KPkJJTkZJTEUgPSAiYmlvc18ke1BWfS5ydW4iDQo+DQo+RGFuDQoNCg==
