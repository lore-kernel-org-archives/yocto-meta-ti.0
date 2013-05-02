Return-Path: <prabu@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 17573E014E0
	for <meta-ti@yoctoproject.org>; Thu,  2 May 2013 07:02:59 -0700 (PDT)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r42E2u6o011155;
	Thu, 2 May 2013 09:02:57 -0500
Received: from DBDE73.ent.ti.com (dbde73.ent.ti.com [172.24.171.98])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r42E2r3a030422;
	Thu, 2 May 2013 09:02:54 -0500
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE73.ent.ti.com ([fe80::bc19:dc43:44da:7415%27]) with mapi id
	14.02.0342.003; Thu, 2 May 2013 22:02:52 +0800
From: "Sundareson, Prabindh" <prabu@ti.com>
To: =?utf-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@googlemail.com>
Thread-Topic: [meta-ti] [PATCH 03/10] libgles-omap3: Remove unsupported core
	build option ES2.0
Thread-Index: AQHORzxwj9RSTQ5BFkid8Z6zOxKs4Jjx6wEg
Date: Thu, 2 May 2013 14:02:52 +0000
Message-ID: <321768C95D21724485BCE784F1BE98473EB08741@DBDE04.ent.ti.com>
References: <1367501964-6294-1-git-send-email-prabu@ti.com>
	<1367501964-6294-3-git-send-email-prabu@ti.com>
	<CALbNGRRs=v0_ZGTVvDK3FwkgYGsAXOF1qLK57mAvOERGXea=2g@mail.gmail.com>
In-Reply-To: <CALbNGRRs=v0_ZGTVvDK3FwkgYGsAXOF1qLK57mAvOERGXea=2g@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 03/10] libgles-omap3: Remove unsupported core build option ES2.0
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 02 May 2013 14:02:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhpcyByZW1vdmVzIHN1cHBvcnQgaW4gdGhlIHJlY2lwZSBmb3IgdGhlIFNHWCBjb3JlIHJldmlz
aW9uIDEuMC4zLCB0aGF0IHRoZSBHcmFwaGljcyBTREsgc3RvcHBlZCBzdXBwb3J0aW5nIGFsbW9z
dCAyIHllYXJzIGJhY2sgKGZyb20gcmVsZWFzZSA0LjA1LjAwLjAxIG9ud2FyZHMpLg0KDQpyZWdh
cmRzLA0KUHJhYnUNCg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogQW5kcmVh
cyBNw7xsbGVyIFttYWlsdG86c2Nobml0emVsdG9ueUBnb29nbGVtYWlsLmNvbV0gDQpTZW50OiBU
aHVyc2RheSwgTWF5IDAyLCAyMDEzIDc6MjMgUE0NClRvOiBTdW5kYXJlc29uLCBQcmFiaW5kaA0K
Q2M6IG1ldGEtdGlAeW9jdG9wcm9qZWN0Lm9yZw0KU3ViamVjdDogUmU6IFttZXRhLXRpXSBbUEFU
Q0ggMDMvMTBdIGxpYmdsZXMtb21hcDM6IFJlbW92ZSB1bnN1cHBvcnRlZCBjb3JlIGJ1aWxkIG9w
dGlvbiBFUzIuMA0KDQpPbiBUaHUsIE1heSAyLCAyMDEzIGF0IDM6MzkgUE0sIFByYWJpbmRoIFN1
bmRhcmVzb24gPHByYWJ1QHRpLmNvbT4gd3JvdGU6DQo+IEVTMi4wIGJ1aWxkIG9wdGlvbiBmb3Ig
U0dYIHVzZXIgYmluYXJpZXMgaXMgZGVwcmVjYXRlZCBhcyB0aGUgDQo+IGNvcnJlc3BvbmRpbmcg
U09DIGlzIG5vIGxvbmdlciBpbiBwcm9kdWN0aW9uDQpEb2VzIHRoaXMgbWVhbiBlbmQgb2Ygc3Vw
cG9ydCBmb3IgdGhpcyBoYXJkd2FyZT8NCg0KQW5kcmVhcw0K

