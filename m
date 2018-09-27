Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4DA51E00754; Thu, 27 Sep 2018 09:52:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DD194E00519
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 09:52:38 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8RGqcab019627
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 11:52:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538067158;
	bh=s/53maV95Jj5ohCdhfdK0YiivunGdd03TcdtsCrzkns=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=WpI6gW0W3BOjirWUBnL6k4QoXoOt4zyNF9E+1lxdpKojXIYjsdzRsOzPE3CHueFmj
	hkz3hEiNAslQv9wrk6UR7zZjSzfijhFD+wwhJrd2ymFwNPoHF2D9ZNstIEa2a/Sdot
	2F8uMzFSJ8PYAnfjXYJbYWuiPFUifDq2HxLfZKUs=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RGqclX019528
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 11:52:38 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 27 Sep 2018 11:52:38 -0500
Received: from DLEE109.ent.ti.com ([fe80::992e:7546:157e:3b3d]) by
	DLEE109.ent.ti.com ([fe80::992e:7546:157e:3b3d%17]) with mapi id
	15.01.1466.003; Thu, 27 Sep 2018 11:52:37 -0500
From: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [EXTERNAL] [meta-ti] [rocko/master][PATCH 02/30] common-csl-ip:
	Update to version 03.03.00.12
Thread-Index: AQHUVn1xXD3C3HnG7EuF8TaeHrXnOKUEVC1Q
Date: Thu, 27 Sep 2018 16:52:37 +0000
Message-ID: <821c3cf9f2454cdd99c1a4868d475ba5@ti.com>
References: <1538061764-54977-1-git-send-email-m-radhakrishnan2@ti.com>
	<1538061764-54977-3-git-send-email-m-radhakrishnan2@ti.com>
	<5ddb6edb-e4f5-16a0-d986-ade05423e72b@ti.com>
In-Reply-To: <5ddb6edb-e4f5-16a0-d986-ade05423e72b@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.117.116]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [rocko/master][PATCH 02/30] common-csl-ip: Update to version 03.03.00.12
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
X-List-Received-Date: Thu, 27 Sep 2018 16:52:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBTdGlmZmxlciwgSmFjb2IgDQpT
ZW50OiBUaHVyc2RheSwgU2VwdGVtYmVyIDI3LCAyMDE4IDEyOjE2IFBNDQpUbzogUmFkaGFrcmlz
aG5hbiwgTWFoZXNoOyBtZXRhLXRpQHlvY3RvcHJvamVjdC5vcmcNClN1YmplY3Q6IFJlOiBbRVhU
RVJOQUxdIFttZXRhLXRpXSBbcm9ja28vbWFzdGVyXVtQQVRDSCAwMi8zMF0gY29tbW9uLWNzbC1p
cDogVXBkYXRlIHRvIHZlcnNpb24gMDMuMDMuMDAuMTINCg0KDQoNCk9uIDkvMjcvMjAxOCAxMToy
MiBBTSwgTWFoZXNoIFJhZGhha3Jpc2huYW4gd3JvdGU6DQo+IFNpZ25lZC1vZmYtYnk6IE1haGVz
aCBSYWRoYWtyaXNobmFuIDxtLXJhZGhha3Jpc2huYW4yQHRpLmNvbT4NCj4gLS0tDQo+ICAgcmVj
aXBlcy1ic3AvY29tbW9uLWNzbC1pcC9jb21tb24tY3NsLWlwLmluYyB8IDYgKysrLS0tDQo+ICAg
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4NCj4gZGlm
ZiAtLWdpdCBhL3JlY2lwZXMtYnNwL2NvbW1vbi1jc2wtaXAvY29tbW9uLWNzbC1pcC5pbmMgYi9y
ZWNpcGVzLWJzcC9jb21tb24tY3NsLWlwL2NvbW1vbi1jc2wtaXAuaW5jDQo+IGluZGV4IGVkODA3
OGQuLmMzMWQzMTMgMTAwNjQ0DQo+IC0tLSBhL3JlY2lwZXMtYnNwL2NvbW1vbi1jc2wtaXAvY29t
bW9uLWNzbC1pcC5pbmMNCj4gKysrIGIvcmVjaXBlcy1ic3AvY29tbW9uLWNzbC1pcC9jb21tb24t
Y3NsLWlwLmluYw0KPiBAQCAtNCw3ICs0LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8v
Q09QWUlORy50eHQ7bWQ1PTU4NTc4MzNlMjA4MzYyMTM2NzdmYWMzM2Y5YWRlZDIxIg0KPiAgIA0K
PiAgIENPTVBBVElCTEVfTUFDSElORSA9ICJrZXlzdG9uZXxkcmE3eHh8dGkzM3h8dGk0M3h8b21h
cGwxIg0KPiAgIA0KPiAtUFYgPSAiMDUuMDEuMDAuMDAiDQo+ICtQViA9ICIwMy4wNC4wMC4xMiIN
Cg0KV2h5IGlzIHRoZSB2ZXJzaW9uIGdvaW5nIGJhY2t3YXJkcz8NClRoaXMgY2FtZSBkdWUgdG8g
dGhlIGRpc2NyZXBhbmN5IGluIHRoZSBtb2R1bGUncyBwYWNrYWdlLnhkYyB3aGljaCBzYXlzIDAz
LjA0LjAwLjEyLiANCkkgd2lsbCBjb3JyZWN0IGl0IGFuZCByZXN1Ym1pdC4gVGhlIGFjdHVhbCB2
ZXJzaW9uIHNob3VsZCBiZSBQViAwNi4wMS4wMC4wMA0KDQo+ICAgSU5DX1BSID0gInIwIg0KPiAg
IA0KPiAgIENTTF9HSVRfVVJJID0gImdpdDovL2dpdC50aS5jb20va2V5c3RvbmUtcnRvcy9jb21t
b24tY3NsLWlwLmdpdCINCj4gQEAgLTEyLDggKzEyLDggQEAgQ1NMX0dJVF9QUk9UT0NPTCA9Imdp
dCINCj4gICBDU0xfR0lUX0JSQU5DSCA9ICJtYXN0ZXIiDQo+ICAgQ1NMX0dJVF9ERVNUU1VGRklY
ID0gImdpdCINCj4gICANCj4gLSMgQmVsb3cgY29tbWl0IElEIGNvcnJlc3BvbmRpbmcgdG8gIkRF
Vi5DU0xfUFJPQ0VTU09SLVNESy4wNS4wMS4wMC4wMCINCj4gLUNTTF9TUkNSRVYgPSAiOGRiM2Q2
NzMxMDFhNTA0ZmQ3ZmIzNmQ2YzljNDk4MWUxZTE1ZmY1MCINCj4gKyMgQmVsb3cgY29tbWl0IElE
IGNvcnJlc3BvbmRpbmcgdG8gIkRFVi5DU0xfUFJPQ0VTU09SLVNESy4wMy4wMy4wMC4xMiINCj4g
K0NTTF9TUkNSRVYgPSAiMGMzYjJjOGEwNTRkMmFmMjdmZTE2ODNlOWFhNTc5ZDQzMDQ5YTNiZiIN
Cj4gICANCj4gICBCUkFOQ0g9IiR7Q1NMX0dJVF9CUkFOQ0h9Ig0KPiAgIFNSQ19VUkkgPSAiJHtD
U0xfR0lUX1VSSX07cHJvdG9jb2w9JHtDU0xfR0lUX1BST1RPQ09MfTticmFuY2g9JHtCUkFOQ0h9
O2Rlc3RzdWZmaXg9JHtDU0xfR0lUX0RFU1RTVUZGSVh9Ig0KDQo=

