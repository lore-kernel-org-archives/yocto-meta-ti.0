Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.1084.1603908455682979782
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 28 Oct 2020 11:07:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=xAUabTEm;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: g-tammana@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 002A338C11F9
	for <meta-ti@yoctoproject.org>; Wed, 28 Oct 2020 11:07:34 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09SI7Y0b092860
	for <meta-ti@yoctoproject.org>; Wed, 28 Oct 2020 13:07:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603908454;
	bh=p4gqKSqM6LWw2SQlb7TJq1TaGgUTk3bV10Ytof0BBvo=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=xAUabTEmlZg/1rvqSLfN2whB7K4MK76F62HZTJjYjxh+R4eQokUS3l6SCPEnr8rCs
	 76GMnboNGqOnAnQLaC82R+p7uf/cJVU3S2QaHmBV/fmCSDTFuQ9QOcJ2Rz6KOTZ/Jt
	 ZeMMDZp0b6+qiJXVcmx2Kf9JrmqJpGLyp6q3XPc0=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09SI7Yww059400
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 28 Oct 2020 13:07:34 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 28
 Oct 2020 13:07:34 -0500
Received: from DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11]) by
 DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11%17]) with mapi id
 15.01.1979.003; Wed, 28 Oct 2020 13:07:34 -0500
From: "Gowtham Tammana" <g-tammana@ti.com>
To: "Murphy, Dan" <dmurphy@ti.com>,
        "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>,
        "Dmytriyenko, Denys" <denys@ti.com>
Subject: Re: [meta-ti][dunfell/master][PATCH v2] ti-img-rogue-driver: pull general toolchain support
Thread-Topic: [meta-ti][dunfell/master][PATCH v2] ti-img-rogue-driver: pull
 general toolchain support
Thread-Index: AQHWrVDS4JnSLu+8nEass6Xi5N/7Jamtn9MA//+s87CAAFZXAP//rH9Q
Date: Wed, 28 Oct 2020 18:07:34 +0000
Message-ID: <351921b9093e496ca1c93f510c876455@ti.com>
References: <20201028173608.10421-1-g-tammana@ti.com>
 <562ed28b-b53a-c87f-3c8e-359aa8adbfa4@ti.com>
 <3cd9303eba6e4ea19d7310cea8387ca0@ti.com>
 <1a1f5f98-3975-5644-911e-24eb6c570132@ti.com>
In-Reply-To: <1a1f5f98-3975-5644-911e-24eb6c570132@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.247.16.212]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IE11cnBoeSwgRGFuDQo+U2Vu
dDogV2VkbmVzZGF5LCBPY3RvYmVyIDI4LCAyMDIwIDE6MDYgUE0NCj5UbzogVGFtbWFuYSwgR293
dGhhbSA8Zy10YW1tYW5hQHRpLmNvbT47IG1ldGEtdGlAeW9jdG9wcm9qZWN0Lm9yZzsNCj5EbXl0
cml5ZW5rbywgRGVueXMgPGRlbnlzQHRpLmNvbT4NCj5TdWJqZWN0OiBSZTogW21ldGEtdGldW2R1
bmZlbGwvbWFzdGVyXVtQQVRDSCB2Ml0gdGktaW1nLXJvZ3VlLWRyaXZlcjogcHVsbA0KPmdlbmVy
YWwgdG9vbGNoYWluIHN1cHBvcnQNCj4NCj5Hb3d0aGFtDQo+DQo+T24gMTAvMjgvMjAgMTowMiBQ
TSwgVGFtbWFuYSwgR293dGhhbSB3cm90ZToNCj4+DQo+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4+PiBGcm9tOiBNdXJwaHksIERhbg0KPj4+IFNlbnQ6IFdlZG5lc2RheSwgT2N0b2Jl
ciAyOCwgMjAyMCAxMjo1NCBQTQ0KPj4+IFRvOiBUYW1tYW5hLCBHb3d0aGFtIDxnLXRhbW1hbmFA
dGkuY29tPjsgbWV0YS10aUB5b2N0b3Byb2plY3Qub3JnOw0KPj4+IERteXRyaXllbmtvLCBEZW55
cyA8ZGVueXNAdGkuY29tPg0KPj4+IFN1YmplY3Q6IFJlOiBbbWV0YS10aV1bZHVuZmVsbC9tYXN0
ZXJdW1BBVENIIHYyXSB0aS1pbWctcm9ndWUtZHJpdmVyOg0KPnB1bGwNCj4+PiBnZW5lcmFsIHRv
b2xjaGFpbiBzdXBwb3J0DQo+Pj4NCj4+PiBHb3d0aGFtDQo+Pj4NCj4+PiBPbiAxMC8yOC8yMCAx
MjozNiBQTSwgR293dGhhbSBUYW1tYW5hIHdyb3RlOg0KPj4+PiBUaGUgcGF0Y2ggZm9yIHN1cHBv
cnRpbmcgdGhlIGdlbmVyYWwgdG9vbGNoYWluIGlzIHB1bGxlZCBpbnRvIHRoZQ0KPnJlcG8uDQo+
Pj4+IFJlbW92aW5nIGl0IGhlcmUgZnJvbSB0aGUgcmVjaXBlLg0KPj4+Pg0KPj4+PiBTaWduZWQt
b2ZmLWJ5OiBHb3d0aGFtIFRhbW1hbmEgPGctdGFtbWFuYUB0aS5jb20+DQo+Pj4+IC0tLQ0KPj4+
PiB2MjogZml4IGVtYWlsIGluIHNpZ25vZmYNCj4+Pj4NCj4+Pj4gICAgLi4uLzAwMDEta20tc3Vw
cG9ydC1nZW5lcmFsLXRvb2xjaGFpbi5wYXRjaCAgIHwgNTYgLS0tLS0tLS0tLS0tLS0tLQ0KPi0t
LQ0KPj4+IERpZCB5b3UgdXNlICJnaXQgcm0iIHRvIHJlbW92ZSB0aGUgZmlsZT8gVGhpcyBsb29r
cyB3ZWlyZCB0aGF0IHRoZSBmaWxlDQo+Pj4gY2hhbmdlZCB0aGVuIGdvdCBkZWxldGVkDQo+PiBZ
ZXMsIGRpZCB1c2UgJ2dpdCBybScgdG8gcmVtb3ZlIHRoZSBmaWxlLiBIYXZlbid0IHBhaWQgYXR0
ZW50aW9uIHRvIHRoZQ0KPj4gaG93IHRoZSBjaGFuZ2VzIGFyZSBzdHJ1Y3R1cmVkIGJlZm9yZS4g
RG8geW91IHNlZSBhbnkgaXNzdWVzIHdpdGggYW0sIEkNCj53YXMNCj4+IGp1c3QgdHJ5aW5nIGl0
IGhlcmUgYWdhaW4gYW5kIGl0IGFwcGxpZXMgY2xlYW5seS4NCj4NCj5JdCBqdXN0IGxvb2tlZCB3
ZWlyZCBidXQgRGVueXMgc2FpZCBpdCBsb29rIGZpbmUgdG8gaGltDQoNCkdvdCBpdC4NCg0KLUdv
d3RoYW0NCg0K
