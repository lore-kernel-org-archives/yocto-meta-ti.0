Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03D2CC636D3
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 20:58:17 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.10710.1675889889691052531
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Feb 2023 12:58:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=eAb8bVBx;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 318Kw6I4077020;
	Wed, 8 Feb 2023 14:58:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675889886;
	bh=+aUNzwuPdbh0Ch/VQ7pyW9Q64MXBn6cIB1v1/FnMgdU=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=eAb8bVBx138fzJ7tnv+FzTNsLgR7J10mlnEzKUdJI+kM2BwLO7P7bpuxSVmEsWhPo
	 lPtOdxpjbzpSZXxzcAdNmbWOzPGbPr6uyDclStrVx+5DYnuN9DDEgNzGDFWg4GcRoT
	 Hg/7ydD4h5ZKKen/5mN3XP9OUA65l2DGi9S8WhQE=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 318Kw6F1077481
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Feb 2023 14:58:06 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 8
 Feb 2023 14:58:06 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 8 Feb 2023 14:58:06 -0600
Received: from [10.250.32.73] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 318Kw6XU123362;
	Wed, 8 Feb 2023 14:58:06 -0600
Message-ID: <9d8896e2-08b3-5fc9-1eab-6d578ddaa771@ti.com>
Date: Wed, 8 Feb 2023 14:58:06 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [meta-ti] [dunfell] ti-rtos-firmware: Check if TI_SECURE_DEV is
 set before signing
Content-Language: en-US
To: <afd@ti.com>, Wadim Egorov <w.egorov@phytec.de>,
        <upstream@lists.phytec.de>, <meta-ti@lists.yoctoproject.org>
References: <20230201143126.3003913-1-w.egorov@phytec.de>
 <d68053d1-66e3-e582-a8f8-1dddc597fe6c@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <d68053d1-66e3-e582-a8f8-1dddc597fe6c@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: base64
X-MIME-Autoconverted: from 8bit to base64 by fllv0015.ext.ti.com id 318Kw6I4077020
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Feb 2023 20:58:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15761

DQoNCk9uIDIvNy8yMDIzIDE3OjQ0LCBBbmRyZXcgRGF2aXMgdmlhIGxpc3RzLnlvY3RvcHJv
amVjdC5vcmcgd3JvdGU6DQo+IE9uIDIvMS8yMyA4OjMxIEFNLCBXYWRpbSBFZ29yb3Ygd3Jv
dGU6DQo+PiBDaGVjayBpZiAke1RJX1NFQ1VSRV9ERVZfUEtHfS9zY3JpcHRzL3NlY3VyZS1i
aW5hcnktaW1hZ2Uuc2ggaXMgc2V0DQo+PiBiZWZvcmUgc2lnbmluZyBmaXJtd2FyZSBmb3Ig
YW02Mnh4IGJhc2VkIG1hY2hpbmVzLiBPdGhlcndpc2UgZG8gbm90DQo+PiBzaWduLCBpbnN0
ZWFkIGNvcHkgdGhlIGJpbmFyeSBhbmQgd2FybiBhYm91dCBpdC4NCj4+DQo+PiBGaXhlcw0K
Pj4gwqDCoCBydW4uZG9faW5zdGFsbDogMTExOiAvc2NyaXB0cy9zZWN1cmUtYmluYXJ5LWlt
YWdlLnNoOiBub3QgZm91bmQNCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBXYWRpbSBFZ29yb3Yg
PHcuZWdvcm92QHBoeXRlYy5kZT4NCj4+IC0tLQ0KPiANCj4gVGhpcyBwYXRjaCBvbmx5IGZp
eGVzIHRoaXMgZm9yIEFNNjJ4LCBhIGJldHRlciB3YXkgbWlnaHQgYmUgdG8gdXNlDQo+IHRo
ZSB0aS1rMy1zZWNkZXYtbmF0aXZlIHBhY2thZ2UgdG8gZ2V0IHRoZSBzaWduaW5nIHRvb2wg
d2hlbiBpdCBpcw0KPiBub3QgZGVmaW5lZC4gSSBkbyB0aGF0IGluIHRoZSBzZXJpZXMgZm9y
IEtpcmtzdG9uZSB0aGF0IGluY2x1ZGVzDQo+IHNldmVyYWwgZml4ZXMgdG8gdGhpcyByZWNp
cGVbMF0uDQo+IA0KPiBBbmRyZXcNCj4gDQo+IFswXSANCj4gaHR0cHM6Ly9saXN0cy55b2N0
b3Byb2plY3Qub3JnL2cvbWV0YS10aS90b3BpYy9tYXN0ZXJfa2lya3N0b25lX3BhdGNoXzFf
OC85NjgxOTc3MQ0KDQpJIGhhZCBzaW1pbGFyIGNvbW1lbnRzLiAgVGhpcyBwYXRjaCBpcyB0
b28gbmFycm93bHkgZm9jdXNlZCB0byBqdXN0IGEgDQpzaW5nbGUgcGxhdGZvcm0sIEkga25v
dyBpdCB3YXMgdGhlIHBsYXRmb3JtIHlvdSB3ZXJlIGNhcmluZyBhYm91dCBidXQgDQp0aGUg
cGF0Y2ggYXMgaXMgaXMgdG9vIG5hcnJvdy4gIEFuZCwgdGhlIHJlcXVpcmVtZW50IHdlIGhh
dmUgaXMgdG8gDQpnZW5lcmF0ZSB0aGUgc2lnbmVkIGltYWdlcywgc28gYnlwYXNzaW5nIHRo
ZSBzaWduaW5nIGlzIG5vdCBnb2luZyB0byBmbHkuDQoNCkFsbCB0aGF0IHNhaWQsIEkgaGF2
ZSBiYWNrIHBvcnRlZCB0aGUgYWJvdmUgcGF0Y2ggdGhhdCBpcyBwZW5kaW5nIGZvciANCmtp
cmtzdG9uZSB0byBkdW5mZWxsLiAgU28gdGhpcyBwYXRjaCBzaG91bGQgbm90IGJlIG5lZWRl
ZCBiZWNhdXNlIGl0IA0Kd2lsbCB1c2UgaW4gdGhlIGludGVybmFsIHJlY2lwZSB0byBmZXRj
aCB0aGUgc2lnbmluZyB0b29sIGlmIHlvdSBhcmUgbm90IA0KdXNpbmcgdGhlIGV4dGVybmFs
IHRvb2xzZXQuDQoNCg0KPj4gwqAgcmVjaXBlcy10aS90aS1ydG9zLWJpbi90aS1ydG9zLWZp
cm13YXJlLmJiIHwgMTcgKysrKysrKysrKysrKystLS0NCj4+IMKgIDEgZmlsZSBjaGFuZ2Vk
LCAxNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQg
YS9yZWNpcGVzLXRpL3RpLXJ0b3MtYmluL3RpLXJ0b3MtZmlybXdhcmUuYmIgDQo+PiBiL3Jl
Y2lwZXMtdGkvdGktcnRvcy1iaW4vdGktcnRvcy1maXJtd2FyZS5iYg0KPj4gaW5kZXggNzJk
ODVhNmIuLjY2YzZhNGU0IDEwMDY0NA0KPj4gLS0tIGEvcmVjaXBlcy10aS90aS1ydG9zLWJp
bi90aS1ydG9zLWZpcm13YXJlLmJiDQo+PiArKysgYi9yZWNpcGVzLXRpL3RpLXJ0b3MtYmlu
L3RpLXJ0b3MtZmlybXdhcmUuYmINCj4+IEBAIC0xNzksMTIgKzE3OSwyMyBAQCBkb19pbnN0
YWxsX3ByZXBlbmRfYW02Mnh4KCkgew0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGV4cG9ydCBU
SV9TRUNVUkVfREVWX1BLRz0ke1RJX1NFQ1VSRV9ERVZfUEtHfQ0KPj4gwqDCoMKgwqDCoMKg
wqDCoMKgICggY2QgJHtSVE9TX0RNX0ZXX0RJUn07IFwNCj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgbXYgJHtETV9GSVJNV0FSRX0gJHtETV9GSVJNV0FSRX0udW5z
aWduZWQ7IFwNCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJHtUSV9TRUNV
UkVfREVWX1BLR30vc2NyaXB0cy9zZWN1cmUtYmluYXJ5LWltYWdlLnNoIA0KPj4gJHtETV9G
SVJNV0FSRX0udW5zaWduZWQgJHtETV9GSVJNV0FSRX07IFwNCj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgaWYgWyAtZiANCj4+ICR7VElfU0VDVVJFX0RFVl9QS0d9L3Nj
cmlwdHMvc2VjdXJlLWJpbmFyeS1pbWFnZS5zaCBdOyB0aGVuIFwNCj4+ICsgICAgICAgICAg
ICAgICAgICAgIA0KPj4gJHtUSV9TRUNVUkVfREVWX1BLR30vc2NyaXB0cy9zZWN1cmUtYmlu
YXJ5LWltYWdlLnNoIA0KPj4gJHtETV9GSVJNV0FSRX0udW5zaWduZWQgJHtETV9GSVJNV0FS
RX07IFwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZWxzZSBcDQo+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZWNobyAiV2FybmluZzog
VElfU0VDVVJFX0RFVl9QS0cgbm90IHNldCwgDQo+PiAke0RNX0ZJUk1XQVJFfSBub3Qgc2ln
bmVkLiI7IFwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBj
cCAke0RNX0ZJUk1XQVJFfS51bnNpZ25lZCAke0RNX0ZJUk1XQVJFfTsgXA0KPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmaTsgXA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKg
ICkNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAoIGNkICR7UlRPU19JUENfRldfRElSfTsgXA0K
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtdiBhbTYyLW1jdS1tNGYw
XzAtZncgDQo+PiBpcGNfZWNob19iYXJlbWV0YWxfdGVzdF9tY3UyXzBfcmVsZWFzZV9zdHJp
cC54ZXI1ZjsgXA0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAke1RJX1NF
Q1VSRV9ERVZfUEtHfS9zY3JpcHRzL3NlY3VyZS1iaW5hcnktaW1hZ2Uuc2ggDQo+PiBpcGNf
ZWNob19iYXJlbWV0YWxfdGVzdF9tY3UyXzBfcmVsZWFzZV9zdHJpcC54ZXI1ZiBcDQo+PiAt
ICAgICAgICAgICAgICAgICAgICANCj4+IGlwY19lY2hvX2JhcmVtZXRhbF90ZXN0X21jdTJf
MF9yZWxlYXNlX3N0cmlwLnhlcjVmLnNpZ25lZDsgXA0KPj4gKw0KPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBpZiBbIC1mIA0KPj4gJHtUSV9TRUNVUkVfREVWX1BLR30v
c2NyaXB0cy9zZWN1cmUtYmluYXJ5LWltYWdlLnNoIF07IHRoZW4gXA0KPj4gKyAgICAgICAg
ICAgICAgICAgICAgDQo+PiAke1RJX1NFQ1VSRV9ERVZfUEtHfS9zY3JpcHRzL3NlY3VyZS1i
aW5hcnktaW1hZ2Uuc2ggDQo+PiBpcGNfZWNob19iYXJlbWV0YWxfdGVzdF9tY3UyXzBfcmVs
ZWFzZV9zdHJpcC54ZXI1ZiBcDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgDQo+PiBp
cGNfZWNob19iYXJlbWV0YWxfdGVzdF9tY3UyXzBfcmVsZWFzZV9zdHJpcC54ZXI1Zi5zaWdu
ZWQ7IFwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZWxzZSBcDQo+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZWNobyAiV2FybmluZzog
VElfU0VDVVJFX0RFVl9QS0cgbm90IHNldCwgDQo+PiBpcGNfZWNob19iYXJlbWV0YWxfdGVz
dF9tY3UyXzBfcmVsZWFzZV9zdHJpcC54ZXI1ZiBub3Qgc2lnbmVkIjsgXA0KPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNwIA0KPj4gaXBjX2VjaG9fYmFy
ZW1ldGFsX3Rlc3RfbWN1Ml8wX3JlbGVhc2Vfc3RyaXAueGVyNWYgDQo+PiBpcGNfZWNob19i
YXJlbWV0YWxfdGVzdF9tY3UyXzBfcmVsZWFzZV9zdHJpcC54ZXI1Zi5zaWduZWQ7IFwNCj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZmk7IFwNCj4+IMKgwqDCoMKgwqDC
oMKgwqDCoCApDQo+PiDCoCB9DQo+Pg0KPj4NCj4+DQo+Pg0KPj4NCj4gDQo+IA0KPiAtPS09
LT0tPS09LT0tPS09LT0tPS09LQ0KPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2Vz
IHNlbnQgdG8gdGhpcyBncm91cC4NCj4gVmlldy9SZXBseSBPbmxpbmUgKCMxNTc0OSk6IGh0
dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9nL21ldGEtdGkvbWVzc2FnZS8xNTc0OQ0K
PiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9tdC85
NjY3NzMzNC82NTUxMDU0DQo+IEdyb3VwIE93bmVyOiBtZXRhLXRpK293bmVyQGxpc3RzLnlv
Y3RvcHJvamVjdC5vcmcNCj4gVW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9q
ZWN0Lm9yZy9nL21ldGEtdGkvdW5zdWIgW3JlYXRtb25AdGkuY29tXQ0KPiAtPS09LT0tPS09
LT0tPS09LT0tPS09LQ0KPiANCg0KLS0gDQpSeWFuIEVhdG1vbiAgICAgICAgICAgICAgICBy
ZWF0bW9uQHRpLmNvbQ0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0NClRleGFzIEluc3RydW1lbnRzLCBJbmMuICAtICBMQ1BEICAtICBNR1RTDQo=

