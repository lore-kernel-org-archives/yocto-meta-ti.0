Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B4A2E7719C
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 19:59:21 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.471.1736539155906423646
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 10 Jan 2025 11:59:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=a/5lawT0;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 50AJxErO124142;
	Fri, 10 Jan 2025 13:59:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736539154;
	bh=DFROZpwgqAhGyFp8DVLzpmvglasB+J3qrtVHCHadYEI=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=a/5lawT0ShHR9t7y8rbrE7Kb/O2qr6MPvxzz3WSeTt+od269FolV/Y8cDJSApcT+2
	 6dGneFpnjUVfP70yNhCLnulWk1T3w3VdA31rH6iSkhBOlFr49DmyJWl2XYlDyMh6UD
	 gwxq+dCWSRrsHMkO2NQmwTRax9JpjMSke0tMDP98=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50AJxEGJ052442
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Jan 2025 13:59:14 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 10
 Jan 2025 13:59:14 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 10 Jan 2025 13:59:14 -0600
Received: from [10.249.33.244] ([10.249.33.244])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50AJxEgJ094344;
	Fri, 10 Jan 2025 13:59:14 -0600
Message-ID: <ae034db9-275b-4194-863b-13eaad47f209@ti.com>
Date: Fri, 10 Jan 2025 13:59:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [meta-arago][master][PATCH v2] libdce: Fix compile
 errors
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <18196CF61C4D3145.16280@lists.yoctoproject.org>
 <18196D0EF52608A6.7995@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <18196D0EF52608A6.7995@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: base64
X-MIME-Autoconverted: from 8bit to base64 by fllv0015.ext.ti.com id 50AJxErO124142
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 10 Jan 2025 19:59:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18183

DQpXZWxsIHdyb25nLCByZXBvIGluIHRoZSBzdWJqZWN0Li4uDQoNCg0KT24gMS8xMC8yMDI1
IDE6NTcgUE0sIFJ5YW4gRWF0bW9uIHZpYSBsaXN0cy55b2N0b3Byb2plY3Qub3JnIHdyb3Rl
Og0KPiANCj4gV3JvbmcgbWFpbGluZyBsaXN0Li4uwqAgaWdub3JlDQo+IA0KPiANCj4gT24g
MS8xMC8yMDI1IDE6NTUgUE0sIFJ5YW4gRWF0bW9uIHZpYSBsaXN0cy55b2N0b3Byb2plY3Qu
b3JnIHdyb3RlOg0KPj4gVXBkYXRlIFNSQ1JFViB0byBwaWNrIHVwIHBhdGNoIHRoYXQgZml4
ZXMgc29tZSBjb21waWxlIGVycm9yczoNCj4+DQo+PiAuLi9naXQvbWVtcGx1Z2luX2xpbnV4
LmM6IEluIGZ1bmN0aW9uICdtZW1wbHVnaW5fYWxsb2MnOg0KPj4gLi4vZ2l0L21lbXBsdWdp
bl9saW51eC5jOjY5Ojk6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlv
biANCj4+ICdkc3BfZGNlX2J1Zl9sb2NrJyBbLVdpbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJh
dGlvbl0NCj4+IMKgwqDCoCA2OSB8wqDCoMKgwqDCoMKgwqDCoCBkc3BfZGNlX2J1Zl9sb2Nr
KDEsICYoaC0+ZG1hX2J1Zl9mZCkpOw0KPj4gwqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDC
oMKgIF5+fn5+fn5+fn5+fn5+fn4NCj4+IC4uL2dpdC9tZW1wbHVnaW5fbGludXguYzo3MTo5
OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24gDQo+PiAnZGNlX2J1
Zl9sb2NrJyBbLVdpbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0NCj4+IMKgwqDCoCA3
MSB8wqDCoMKgwqDCoMKgwqDCoCBkY2VfYnVmX2xvY2soMSwgJihoLT5kbWFfYnVmX2ZkKSk7
DQo+PiDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqAgXn5+fn5+fn5+fn5+DQo+PiAu
Li9naXQvbWVtcGx1Z2luX2xpbnV4LmM6IEluIGZ1bmN0aW9uICdtZW1wbHVnaW5fZnJlZSc6
DQo+PiAuLi9naXQvbWVtcGx1Z2luX2xpbnV4LmM6OTE6MTc6IGVycm9yOiBpbXBsaWNpdCBk
ZWNsYXJhdGlvbiBvZiANCj4+IGZ1bmN0aW9uICdkc3BfZGNlX2J1Zl91bmxvY2snIFstV2lt
cGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQ0KPj4gwqDCoMKgIDkxIHzCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkc3BfZGNlX2J1Zl91bmxvY2soMSwgJihoLT5kbWFf
YnVmX2ZkKSk7DQo+PiDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIF5+fn5+fn5+fn5+fn5+fn5+fg0KPj4gLi4vZ2l0L21lbXBsdWdpbl9saW51eC5j
OjkzOjE3OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgDQo+PiBmdW5jdGlvbiAn
ZGNlX2J1Zl91bmxvY2snIFstV2ltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQ0KPj4g
wqDCoMKgIDkzIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkY2VfYnVmX3Vu
bG9jaygxLCAmKGgtPmRtYV9idWZfZmQpKTsNCj4+IMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXn5+fn5+fn5+fn5+fn4NCj4+IC4uL2dpdC9tZW1w
bHVnaW5fbGludXguYzo5NToxMzogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIA0K
Pj4gZnVuY3Rpb24gJ2Nsb3NlJzsgZGlkIHlvdSBtZWFuICdwY2xvc2UnPyANCj4+IFstV2lt
cGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQ0KPj4gwqDCoMKgIDk1IHzCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgY2xvc2UoaC0+ZG1hX2J1Zl9mZCk7DQo+PiDCoMKgwqDCoMKgwqAg
fMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBefn5+fg0KPj4gwqDCoMKgwqDCoMKgIHzCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcGNsb3NlDQo+Pg0KPj4gYW5kDQo+Pg0KPj4gLi4vZ2l0
L2xpYmRjZV9saW51eC5jOiBJbiBmdW5jdGlvbiAnZGNlX2RlaW5pdCc6DQo+PiAuLi9naXQv
bGliZGNlX2xpbnV4LmM6OTA6OTogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1
bmN0aW9uIA0KPj4gJ2Nsb3NlJzsgZGlkIHlvdSBtZWFuICdwY2xvc2UnPyBbLVdpbXBsaWNp
dC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0NCj4+IMKgwqDCoCA5MCB8wqDCoMKgwqDCoMKgwqDC
oCBjbG9zZShPbWFwRHJtX0ZEKTsNCj4+IMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDC
oCBefn5+fg0KPj4gwqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgIHBjbG9zZQ0KPj4N
Cj4+IFNpZ25lZC1vZmYtYnk6IFJ5YW4gRWF0bW9uIDxyZWF0bW9uQHRpLmNvbT4NCj4+IC0t
LQ0KPj4gdjI6IFRoZSBwYXRjaCB3YXMgYWRkZWQgdG8gdGhlIHJlcG8sIHNvIHdlIGNhbiBq
dXN0IHBvaW50IHRvIHRoZSBuZXcNCj4+IMKgwqDCoMKgIFNSQ1JFVi4NCj4+DQo+PiDCoCBt
ZXRhLXRpLWV4dHJhcy9yZWNpcGVzLW11bHRpbWVkaWEvbGliZGNlL2xpYmRjZV8zLjAwLjE1
LjAwLmJiIHwgMiArLQ0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCANCj4+IGEvbWV0YS10aS1leHRyYXMv
cmVjaXBlcy1tdWx0aW1lZGlhL2xpYmRjZS9saWJkY2VfMy4wMC4xNS4wMC5iYiANCj4+IGIv
bWV0YS10aS1leHRyYXMvcmVjaXBlcy1tdWx0aW1lZGlhL2xpYmRjZS9saWJkY2VfMy4wMC4x
NS4wMC5iYg0KPj4gaW5kZXggZjQ2ZDljNzcuLmEzMWZlMjBkIDEwMDY0NA0KPj4gLS0tIGEv
bWV0YS10aS1leHRyYXMvcmVjaXBlcy1tdWx0aW1lZGlhL2xpYmRjZS9saWJkY2VfMy4wMC4x
NS4wMC5iYg0KPj4gKysrIGIvbWV0YS10aS1leHRyYXMvcmVjaXBlcy1tdWx0aW1lZGlhL2xp
YmRjZS9saWJkY2VfMy4wMC4xNS4wMC5iYg0KPj4gQEAgLTgsNyArOCw3IEBAIERFUEVORFMg
PSAibGliZHJtIHRpLWlwYyINCj4+IMKgIFNSQ19VUkkgPSANCj4+ICJnaXQ6Ly9naXQudGku
Y29tL2dpdC9vbWFwem9vbS9saWJkY2UuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYXN0
ZXIiDQo+PiAtU1JDUkVWID0gImVjMTRlMWQ1Y2VhMWVkM2MzZWEwZTJiOWNmMWZkNTgxYWNm
ZjkzZTMiDQo+PiArU1JDUkVWID0gIjE4MmFlYTE4NTk2ZWIyYjNhODJjZmZjNTM2YTY0MDRm
NTAwMGZiMzAiDQo+PiDCoCBTID0gIiR7V09SS0RJUn0vZ2l0Ig0KPj4gwqAgRVhUUkFfT0VD
T05GICs9ICJJUENfSEVBREVSUz0ke1NUQUdJTkdfSU5DRElSfS90aS9pcGMvbW0iDQo+Pg0K
Pj4NCj4+DQo+Pg0KPj4NCj4gDQo+IA0KPiANCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0N
Cj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAu
DQo+IFZpZXcvUmVwbHkgT25saW5lICgjMTgxODEpOiBodHRwczovL2xpc3RzLnlvY3RvcHJv
amVjdC5vcmcvZy9tZXRhLXRpL21lc3NhZ2UvMTgxODENCj4gTXV0ZSBUaGlzIFRvcGljOiBo
dHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvbXQvMTEwNTQxOTM3LzY1NTEwNTQNCj4g
R3JvdXAgT3duZXI6IG1ldGEtdGkrb3duZXJAbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KPiBV
bnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL2cvbWV0YS10aS91
bnN1YiBbcmVhdG1vbkB0aS5jb21dDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IA0K
DQotLSANClJ5YW4gRWF0bW9uICAgICAgICAgICAgICAgIHJlYXRtb25AdGkuY29tDQotLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KVGV4YXMgSW5zdHJ1bWVu
dHMsIEluYy4gIC0gIExDUEQgIC0gIE1HVFMNCg==

