Return-Path: <g-tammana@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7BBF1E00DAF; Wed, 30 Oct 2019 06:54:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5C41BE00D99
	for <meta-ti@yoctoproject.org>; Wed, 30 Oct 2019 06:54:11 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9UDsAGP088900
	for <meta-ti@yoctoproject.org>; Wed, 30 Oct 2019 08:54:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1572443650;
	bh=WSL5dcUP0ZGB2BHAXhTVEyfJhI2+xPIDQVQB+UowJ9A=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=q4EikwhuqVfWVPot/khkEdYybAIjx0Q5ttBY6+1C/4mDSxvTkXFa/WVU9bSnzZy2u
	C3TJuIjXgvzFPp6pspy/NZK0WioRqcrkJttHoXfRzOiveyuEG9F+EKOeMvZTCl2B2W
	QU/JgFQHrEjMqfeVyJ5HRzsZFMBWcoibp81+7zwM=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9UDsAmR009381
	for <meta-ti@yoctoproject.org>; Wed, 30 Oct 2019 08:54:10 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 30 Oct 2019 08:53:57 -0500
Received: from DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11]) by
	DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11%17]) with mapi id
	15.01.1713.004; Wed, 30 Oct 2019 08:53:57 -0500
From: "Tammana, Gowtham" <g-tammana@ti.com>
To: "Davis, Andrew" <afd@ti.com>, "Ruei, Eric" <e-ruei1@ti.com>, "Ruei, Eric"
	<e-ruei1@ti.com>, "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [EXTERNAL] Re: [meta-ti] [PATCH] ti-sgx-ddk-um: update SRCREV to
	pick up Mesa-based EGL/GLES libraries
Thread-Index: AQHVjyVm+sRx5Xej4UmkQDlbpOkQDKdzgkyAgAABLYD//6+rsA==
Date: Wed, 30 Oct 2019 13:53:57 +0000
Message-ID: <05819c0f80764f22a5693f493bd871dd@ti.com>
References: <20191029132020.8891-1-e-ruei1@ti.com>
	<aceddb08-4720-395a-e454-e0537fd77aee@ti.com>
	<45b0c0c5-832c-7128-3475-d1b045027151@ti.com>
	<a53bb589-e9e6-883c-f8ad-c6047aff9c9f@ti.com>
In-Reply-To: <a53bb589-e9e6-883c-f8ad-c6047aff9c9f@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.53.237]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] Re: [PATCH] ti-sgx-ddk-um: update SRCREV to pick up Mesa-based EGL/GLES libraries
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
X-List-Received-Date: Wed, 30 Oct 2019 13:54:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IG1ldGEtdGktYm91bmNlc0B5
b2N0b3Byb2plY3Qub3JnIFttYWlsdG86bWV0YS10aS0NCj5ib3VuY2VzQHlvY3RvcHJvamVjdC5v
cmddIE9uIEJlaGFsZiBPZiBEYXZpcywgQW5kcmV3DQo+U2VudDogV2VkbmVzZGF5LCBPY3RvYmVy
IDMwLCAyMDE5IDg6MzYgQU0NCj5UbzogUnVlaSwgRXJpYzsgUnVlaSwgRXJpYzsgbWV0YS10aUB5
b2N0b3Byb2plY3Qub3JnDQo+U3ViamVjdDogW0VYVEVSTkFMXSBSZTogW21ldGEtdGldIFtQQVRD
SF0gdGktc2d4LWRkay11bTogdXBkYXRlIFNSQ1JFViB0byBwaWNrDQo+dXAgTWVzYS1iYXNlZCBF
R0wvR0xFUyBsaWJyYXJpZXMNCj4NCj5PbiAxMC8zMC8xOSA5OjMxIEFNLCBSdWVpLCBFcmljIHdy
b3RlOg0KPj4gT24gMTAvMzAvMjAxOSA5OjIyIEFNLCBBbmRyZXcgRi4gRGF2aXMgd3JvdGU6DQo+
Pj4gT24gMTAvMjkvMTkgOToyMCBBTSwgRXJpYyBSdWVpIHdyb3RlOg0KPj4+PiBUaGlzIGlzIHRo
ZSBpbml0aWFsIHN0ZXAgdG93YXJkIE1lc2EtYmFzZWQgRUdML0dMRVMgbGlicmFyaWVzIHdoaWNo
DQo+Pj4+IHN1cHBvcnQgYWxsIHRoZSByZXF1aXJlZCBFR0wgMS41IGV4dGVuc2lvbnMuIFdlIHBs
YW4gdG8gcHJvdmlkZSBhDQo+Pj4+IE1lc2EtcHZyIHJlY2lwZSB0byBidWlsZCBNZXNhIGZyb20g
c291cmNlIGFuZCBTR1gvRERLIHBhdGNoZXMgd2hlcmUNCj4+Pj4gdGktc2d4LWRkay11bSBzaGFs
bCBwcm92aWRlIHRoZSBFR0wvR0xFUyBwbHVnaW5zIG9ubHkgYXQgdGhlIG5leHQgc3RlcC4NCj4+
Pj4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogRXJpYyBSdWVpIDxlLXJ1ZWkxQHRpLmNvbT4NCj4+Pj4g
LS0tDQo+Pj4+IMKgIHJlY2lwZXMtZ3JhcGhpY3MvbGliZ2xlcy90aS1zZ3gtZGRrLXVtXzEuMTcu
NDk0ODk1Ny5iYiB8IDggKysrKystLS0NCj4+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4+Pj4NCj4+Pj4gZGlmZiAtLWdpdCBhL3JlY2lwZXMt
Z3JhcGhpY3MvbGliZ2xlcy90aS1zZ3gtZGRrLXVtXzEuMTcuNDk0ODk1Ny5iYg0KPj4+PiBiL3Jl
Y2lwZXMtZ3JhcGhpY3MvbGliZ2xlcy90aS1zZ3gtZGRrLXVtXzEuMTcuNDk0ODk1Ny5iYg0KPj4+
PiBpbmRleCA3YTZmMDEzZS4uMzk5MWQ5MTcgMTAwNjQ0DQo+Pj4+IC0tLSBhL3JlY2lwZXMtZ3Jh
cGhpY3MvbGliZ2xlcy90aS1zZ3gtZGRrLXVtXzEuMTcuNDk0ODk1Ny5iYg0KPj4+PiArKysgYi9y
ZWNpcGVzLWdyYXBoaWNzL2xpYmdsZXMvdGktc2d4LWRkay11bV8xLjE3LjQ5NDg5NTcuYmINCj4+
Pj4gQEAgLTExLDcgKzExLDcgQEAgUFIgPSAicjM0Ig0KPj4+PiDCoCBCUkFOQ0ggPSAidGktaW1n
LXNneC90aHVkLyR7UFZ9Ig0KPj4+PiDCoCDCoCBTUkNfVVJJID0NCj4+Pj4gImdpdDovL2dpdC50
aS5jb20vZ3JhcGhpY3Mvb21hcDUtc2d4LWRkay11bS0NCj5saW51eC5naXQ7cHJvdG9jb2w9Z2l0
O2JyYW5jaD0ke0JSQU5DSH0iDQo+Pj4+DQo+Pj4+IC1TUkNSRVYgPSAiODdkN2U1YzFlNGRiMWJh
YjA0ODkzOWM5NzE5MDU5ZDU0OWMxZThkZCINCj4+Pj4gK1NSQ1JFViA9ICIyYTJlNWJiMDkwY2Vk
ODcwZDczZWQ0ZWRiYzU0NzkzZTk1MmNjNmQ4Ig0KPj4+PiDCoCDCoCBUQVJHRVRfUFJPRFVDVF9v
bWFwLWExNSA9ICJqYWNpbnRvNmV2bSINCj4+Pj4gwqAgVEFSR0VUX1BST0RVQ1RfdGkzM3ggPSAi
dGkzMzV4Ig0KPj4+PiBAQCAtNDcsNyArNDcsOSBAQCBTID0gIiR7V09SS0RJUn0vZ2l0Ig0KPj4+
PiDCoCDCoCBkb19pbnN0YWxsICgpIHsNCj4+Pj4gwqDCoMKgwqDCoCBvZV9ydW5tYWtlIGluc3Rh
bGwgREVTVERJUj0ke0R9IFRBUkdFVF9QUk9EVUNUPSR7VEFSR0VUX1BST0RVQ1R9DQo+Pj4+IC3C
oMKgwqAgbG4gLXNmIGxpYkdMRVN2Mi5zby4ke1BWfSAke0R9JHtsaWJkaXJ9L2xpYkdMRVN2Mi5z
by4xDQo+Pj4+ICvCoMKgwqAgbG4gLXNmIGxpYkdMRVN2Mi5zbyAke0R9JHtsaWJkaXJ9L2xpYkdM
RVN2Mi5zby4xDQo+Pj4+ICsNCj4+Pj4gK8KgwqDCoCBybSAtcmYgJHtEfSR7aW5jbHVkZWRpcn0v
R0wNCj4+Pg0KPj4+DQo+Pj4gV2h5IHJlbW92ZSB0aGlzPw0KPj4+DQo+Pj4NCj4+DQo+PiBUaGVy
ZSBpcyBhbm90aGVyIGNvbXBvbmVudCBwcm92aWRlcyBHTCBoZWFkZXIgZmlsZXMuDQo+PiBEZW55
czogaG93IGRvIHdlIHJlc29sdmUgdGhpcyBjb25mbGljdD8NCj4+DQo+DQo+DQo+VGhlIERTUCBP
cGVuQ0wgaW1wbGVtZW50YXRpb24/IFRoYXQgcGFja2FnZSBuZWVkcyBmaXhlZCwgbm90IHRoaXMg
b25lLA0KPnRoZSBPcGVuR0wgaW1wbGVtZW50YXRpb24gKHRoaXMgZHJpdmVyKSBzaG91bGQgcHJv
dmlkZSB0aGUgR0wgaGVhZGVycy4NCg0KV2UgZG9uJ3Qgc3VwcG9ydCBkZXNrdG9wIEdMLCB0aGV5
IHNob3VsZG4ndCBjb21lIGZyb20gdGhpcyBwYWNrYWdlLg0KDQpHb3d0aGFtDQoNCj4+DQo+Pg0K
Pj4+PiDCoCDCoMKgwqDCoMKgIGNob3duIC1SIHJvb3Q6cm9vdCAke0R9DQo+Pj4+IMKgIH0NCj4+
Pj4gQEAgLTU4LDcgKzYwLDcgQEAgRklMRVNfJHtQTn0gKz3CoCAiJHtpbmNsdWRlZGlyfS8qIg0K
Pj4+PiDCoCBGSUxFU18ke1BOfSArPcKgICIke3N5c2NvbmZkaXJ9LyoiDQo+Pj4+IMKgIMKgIFBB
Q0tBR0VTID0rICIke1BOfS1wbHVnaW5zIg0KPj4+PiAtRklMRVNfJHtQTn0tcGx1Z2lucyA9ICIk
e2xpYmRpcn0vbGlic3J2X2luaXQuc28NCj4+Pj4gJHtsaWJkaXJ9L2xpYnNydl91bS5zbyAke2xp
YmRpcn0vbGliZ2xzbGNvbXBpbGVyLnNvDQo+Pj4+ICR7bGliZGlyfS9saWJQVlJTY29wZVNlcnZp
Y2VzLnNvICR7bGliZGlyfS9saWJHTEVTdjIuc28NCj4+Pj4gJHtsaWJkaXJ9L2xpYkVHTC5zbyAk
e2xpYmRpcn0vbGliR0xFU19DTS5zbw0KPj4+PiAke2xpYmRpcn0vbGlicHZyRFJNV1NFR0wuc2/C
oCAke2xpYmRpcn0vbGlicHZyR0JNV1NFR0wuc28NCj4+Pj4gJHtsaWJkaXJ9L2xpYnB2cndzX1dB
WUxBTkQuc28iDQo+Pj4+ICtGSUxFU18ke1BOfS1wbHVnaW5zID0gIiR7bGliZGlyfS9saWJzcnZf
aW5pdC5zbw0KPj4+PiAke2xpYmRpcn0vbGlic3J2X3VtLnNvICR7bGliZGlyfS9saWJnbHNsY29t
cGlsZXIuc28NCj4+Pj4gJHtsaWJkaXJ9L2xpYlBWUlNjb3BlU2VydmljZXMuc28gJHtsaWJkaXJ9
L2xpYkdMRVN2Mi5zbw0KPj4+PiAke2xpYmRpcn0vbGliRUdMLnNvICR7bGliZGlyfS9saWJHTEVT
djFfQ00uc28gJHtsaWJkaXJ9L2xpYkdMRVNfQ00uc28NCj4+Pj4gJHtsaWJkaXJ9L2xpYkdMRVN2
MV9QVlJfTUVTQS5zbyAke2xpYmRpcn0vbGliR0xFU3YyX1BWUl9NRVNBLnNvIg0KPj4+PiDCoCBS
REVQRU5EU18ke1BOfSArPSAiJHtQTn0tcGx1Z2lucyINCj4+Pg0KPj4+DQo+Pj4gVGhlIG5ld2Vy
IGJpbmFyaWVzIGFmdGVyIHRoZSBEREsgY29tbWl0ICJ1bTogQXR0ZW1wdCB0byBsb2FkIHNoYXJl
ZA0KPj4+IG9iamVjdCB3aXRoIHZlcnNpb24gZXh0ZW5zaW9uIGF1dG9tYXRpY2FsbHkiIGRvIG5v
dCBuZWVkIGFsbCB0aGlzIHBsdWdpbg0KPj4+IHN0dWZmLCBpdCBjYW4gYWxsIGJlIGRyb3BwZWQu
DQo+Pj4NCj4+PiBBbmRyZXcNCj4+Pg0KPj4+DQo+Pj4+IMKgIMKgIEFMTE9XX0VNUFRZXyR7UE59
LXBsdWdpbnMgPSAiMSINCj4+Pj4NCj4+DQo+LS0NCj5fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXw0KPm1ldGEtdGkgbWFpbGluZyBsaXN0DQo+bWV0YS10aUB5
b2N0b3Byb2plY3Qub3JnDQo+aHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL2xpc3RpbmZv
L21ldGEtdGkNCg==

