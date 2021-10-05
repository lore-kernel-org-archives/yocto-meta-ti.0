Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web09.24605.1633435577607022563
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 05 Oct 2021 05:06:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=MkWzNqCZ;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: nikhil.nd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 195C6FSW020121;
	Tue, 5 Oct 2021 07:06:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1633435575;
	bh=fpmKZmdr8JrYaL7TnyeuxDONg58TnphwNGBNV+WlTFc=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=MkWzNqCZN+nZ/sh5sPKftI2jAlUNqYhhwlxb/NBqOXvK/nRJlNJiL/OPe9bgQ0wNK
	 ApZTUpLh5iD8gG82PSJ2lBSN8s7aJVhzR2qr84JBz1vE4iS0orhwmUbcOugWNSvjGq
	 6/zeH1sOqMNA0CvZk2hjOwC9QWfRF4iDZWxUzGog=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 195C6FdB117403
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 5 Oct 2021 07:06:15 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 5
 Oct 2021 07:06:15 -0500
Received: from DFLE108.ent.ti.com ([fe80::c18:99ac:4a4:2ceb]) by
 DFLE108.ent.ti.com ([fe80::c18:99ac:4a4:2ceb%17]) with mapi id
 15.01.2308.014; Tue, 5 Oct 2021 07:06:15 -0500
From: "Nikhil Devshatwar" <nikhil.nd@ti.com>
To: Alan D Kozlay <alan.kozlay@ves-solutions.com>,
        "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] jailhouse recipe removed for all platforms?
Thread-Topic: [meta-ti] jailhouse recipe removed for all platforms?
Thread-Index: AQHXuX1yWyTJbLgo2UWNSRPHeB6iZKvES3Yw
Date: Tue, 5 Oct 2021 12:06:14 +0000
Message-ID: <ff104e20b6a9492a918b3be1d4e18146@ti.com>
References: <rENu.1633392633005298660.R6Z1@lists.yoctoproject.org>
In-Reply-To: <rENu.1633392633005298660.R6Z1@lists.yoctoproject.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.174.136]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQo+SXQgYXBwZWFycyB0aGF0IHRoZSBqYWlsaG91c2UgcmVjaXBlIHdhcyByZW1vdmVkIGF0IER1
bmZlbGwgKGxhdGVzdCByZWxlYXNlIGluIG1ldGEtdGkpIGluIDIwMjE6DQo+Y29tbWl0IGQ4ZTk2
NTQ1ZjEwYmQyMDU3YjY2NWExZTBjMzYzZjYwZjBhOGNkYTUgQXV0aG9yOiBOaWtoaWwgRGV2c2hh
dHdhciA8bmlraGlsLm5kQHRpLmNvbT4gRGF0ZTogVHVlIEp1biAxNSAxNjo0Mjo0NCAyMDIxICsw
NTMwwqAgDQo+SmFpbGhvdXNlIHN1cHBvcnQgaXMgZHJvcHBlZCBmb3IgSzMgcGxhdGZvcm1zLCBy
ZW1vdmUgdGhlDQo+cmVjaXBlIGFuZCBjb3JyZXNwb25kaW5nIHBhdGNoZXMuDQoNCj5CdXQgdGhl
IGphaWxob3VzZSBwcm9qZWN0IHBhZ2Ugb24gZ2l0aHViIGluZGljYXRlcyB0aGF0IGl0J3Mgc3Vw
cG9ydGVkIG9uIGEgdmFyaWV0eSBvZiBib2FyZHMgb3RoZXIgdGhhbiBqdXN0IHRoZSBLMyBTT0Nz
IGZyb20gVEkuDQo+V2h5IHdhcyB0aGlzIHJlY2lwZSByZW1vdmVkPyANCg0KQWxsIGZlYXR1cmVz
IHN1cHBvcnRlZCBpbiBwcm9jZXNzb3IgU0RLIGFyZSBtYWludGFpbmVkIGluIHRoZSBtZXRhLXRp
IHJlY2lwZXMuDQpDdXJyZW50bHkgSmFpbGhvdXNlIGlzIG5vdCBvZmZpY2lhbGx5IHN1cHBvcnRl
ZCBpbiBwcm9jZXNzb3IgU0RLcyBmb3IgYW55IG9mIHRoZSBwbGF0Zm9ybXMuDQpIZW5jZSB0aGUg
cmVjaXBlIHdhcyByZW1vdmVkLg0KDQpBcyBwYXJ0IG9mIEphaWxob3VzZSBjb21tdW5pdHkgcHJv
amVjdHMsIEszIGFuZCBub24tSzMgcGxhdGZvcm1zIGFyZSBzdXBwb3J0ZWQgaW4gdGhlIGNvZGVi
YXNlDQpCdXQgbm90IHN1cHBvcnRlZCAvIHRlc3RlZCBpbiB0aGUgcHJvY2Vzc29yIFNESyB3aXRo
IGxhdGVzdCBCU1AgY29tcG9uZW50cy4NCg0KUmVnYXJkcywNCk5pa2hpbCBEDQo=
