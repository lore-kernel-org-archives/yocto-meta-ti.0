Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0193FC4332F
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 14:31:04 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.41718.1666017055143955102
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 17 Oct 2022 07:30:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=gNifNWqJ;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29HEUoem056576;
	Mon, 17 Oct 2022 09:30:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1666017050;
	bh=79GPZNeF1Y+lMd+tmUUk/6H3tNced5OBYHatDs+NQzY=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=gNifNWqJq9PrCZ0OkcEYcvqPzdjsWMe2h+Zua1vtFxcspD0OYdjQXwv+z3z4UI5j4
	 Iryvft5Yw5725W6uOa1T8A7BZJsmcwdfrvlrYpsD+NiFAunIvMCvRW3vC0epe/VWwg
	 ILnQPifx9Fd0zCfN5GtRbPpf2WvMPLd4Lur8MUME=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29HEUors062969
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 17 Oct 2022 09:30:50 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Mon, 17
 Oct 2022 09:30:49 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Mon, 17 Oct 2022 09:30:49 -0500
Received: from [10.250.33.68] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29HEUn2B108030;
	Mon, 17 Oct 2022 09:30:49 -0500
Content-Type: multipart/mixed;
	boundary="------------8ByEWg3jxYxm5Wd4vPZT0CZF"
Message-ID: <c36e7e4d-2ed2-f8eb-0184-1988871d9e4e@ti.com>
Date: Mon, 17 Oct 2022 09:30:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [meta-ti] Build failure for beaglebone on kirkstone branch
Content-Language: en-US
To: Paul Barker <paul.barker@sancloud.com>, <meta-ti@lists.yoctoproject.org>,
        Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
References: <0ba3f29c-3e37-ab9d-93e1-82e9da6ccc9a@sancloud.com>
 <f991b40b-d8be-ed31-ec49-43931f3fc338@ti.com>
 <17190C28A5DB5EE8.9603@lists.yoctoproject.org>
 <73652b02-aef1-0dfe-b1a7-d53acb284484@sancloud.com>
 <885b0468-d6ce-51ec-b614-620c7cba9fcb@ti.com>
 <74d40ad2-f2f4-061a-f49b-6311e52498ed@sancloud.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <74d40ad2-f2f4-061a-f49b-6311e52498ed@sancloud.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 17 Oct 2022 14:31:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15179

--------------8ByEWg3jxYxm5Wd4vPZT0CZF
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/6/22 5:04 AM, Paul Barker wrote:
> On 05/10/2022 17:23, Andrew Davis wrote:
>> On 10/5/22 7:47 AM, Paul Barker wrote:
>>> On 28/09/2022 15:21, Paul Barker wrote:
>>>> Hi Andrew,
>>>>
>>>> On 27/09/2022 18:53, Andrew Davis wrote:
>>>>> On 9/27/22 12:01 PM, Paul Barker wrote:
>>>>>> Hi folks,
>>>>>>
>>>>>> I'm trying to add support for the Yocto Project kirkstone release to our
>>>>>> meta-sancloud BSP layer and I'm facing a build issue. I've reproduced the
>>>>>> issue using just the meta-ti layer and its dependencies, targeting the
>>>>>> beaglebone machine. I've used the kirkstone-next branch of meta-ti as
>>>>>> the kirkstone branch has not been updated in 5 months and has the same
>>>>>> issue.
>>>>>>
>>>>>> The build fails due to a lack of buildable providers for virtual/libgl.
>>>>>> Is this a known issue?
>>>>>>
>>>>>
>>>>>
>>>>> I've run into this before, Cairo package pulls in desktop OpenGL when
>>>>> GLES2 would be more appropriate. I'll look for the exact fix but
>>>>> you can try putting this in your distro .conf file:
>>>>>
>>>>> PACKAGECONFIG_remove_pn-cairo = "opengl"
>>>>> PACKAGECONFIG_append_pn-cairo = " egl"
>>>>> PACKAGECONFIG_append_pn-cairo = " glesv2"
>>>>
>>>> If these settings are required they should be applied by default (perhaps via a
>>>> MACHINE_FEATURE). I would expect the beaglebone machine to build
>>>> "out-of-the-box" with the poky distro. If that really isn't possible then
>>>> necessary settings should be documented in the readme file for the layer, added
>>>> to a local.conf.sample file or applied via a setup script.
>>>>
>>>> Thanks
>>> Looking at this again today, I attempted to try the above PACKAGECONFIG changes
>>> however they do not match the correct override syntax for kirkstone. That
>>> suggests to me that they haven't been tested.
>>>
>>
>> They have not been tested on Kirkstone. These are the changes I needed for
>> Dunfell, I'd guess fixing the override syntax and trying the same on
>> Kirkstone will help your issue, but no guarantees.
>>
>>> Please also note that this is not specificly an issue with the cairo
>>> configuration, attempting to build core-image-x11 & core-image-weston also fail.
>>> For example, for core-image-x11 the errors are as follows, re-tested today with
>>> the current HEAD of the kirkstone branch (2b11afa8aa19):
>>>
>>> ERROR: Nothing PROVIDES 'virtual/libgl' (but /workdir/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb, /workdir/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb, /workdir/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb DEPENDS on or otherwise requires it)
>>> mesa-gl PROVIDES virtual/libgl but was skipped: PREFERRED_PROVIDER_virtual/libgl set to mesa, not mesa-gl
>>> mesa PROVIDES virtual/libgl but was skipped: PREFERRED_PROVIDER_virtual/libgles1 set to ti-sgx-ddk-um, not mesa
>>> NOTE: Runtime target 'xserver-xorg' is unbuildable, removing...
>>> Missing or unbuildable dependency chain was: ['xserver-xorg', 'virtual/libgl']
>>> NOTE: Runtime target 'packagegroup-core-x11-xserver' is unbuildable, removing...
>>> Missing or unbuildable dependency chain was: ['packagegroup-core-x11-xserver', 'xserver-xorg', 'virtual/libgl']
>>> NOTE: Runtime target 'packagegroup-core-x11-base' is unbuildable, removing...
>>> Missing or unbuildable dependency chain was: ['packagegroup-core-x11-base', 'packagegroup-core-x11-xserver', 'xserver-xorg', 'virtual/libgl']
>>> ERROR: Required build target 'core-image-x11' has no buildable providers.
>>> Missing or unbuildable dependency chain was: ['core-image-x11', 'packagegroup-core-x11-base', 'packagegroup-core-x11-xserver', 'xserver-xorg', 'virtual/libgl']
>>>
>>> Is the kirkstone branch currently tested or expected to work? If there are known
>>> limitations or additional configuration changes neccessary in local.conf, could
>>> they be documented in the readme?
>>>
>>
>> Kirkstone is still WIP, the base builds and boots, but there are some
>> spots still being readied yet (especially around graphics).
> 
> I appreciate this is still WIP. However, Kirkstone was released several months
> ago now and some of the projects we're involved in (e.g. Automotive Grade Linux)
> have already upgraded to this release. As we use TI SoCs, our BSP depends on
> meta-ti and the lack of Kirkstone support is holding back our participation in
> these projects and preventing us from offering an up-to-date BSP release to our
> customers.
> 
>>
>> Xorg by default assumes desktop OpenGL support, being an embedded device
>> we only support OpenGLES. Xorg does work just fine with OpenGLES but
>> you have to tell it what to use with distro level PACKAGECONFIG selecting
>> (same for cairo).
>>
>> In the future I'd like to split the "opengl" DISTRO_FEATURE into two
>> (one for OpenGL and one for GLES2) and move them into MACHINE_FEATURE
>> where they belong. Then we can set these down in the BSP layer.
>> Until then you'll have to do the manual selecting.
> 
> I have tried building with `DISTRO_FEATURES:remove = "opengl"` and this allows
> non-graphical images like core-image-base to build successfully. However, x11
> and wayland images still fail:
> 


You won't want to completely remove opengl, we do support it (ES version) and
that is needed in several spots. I'm attaching a patch for meta-ti that should
get both core-image-x11 and core-image-weston building for Kirkstone.

Let me know if you have any issues.

Andrew


> core-image-x11:
> 
>      gtk+3_3.24.34.bb:do_compile fails. The full log.do_compile is 327kB so I
>      won't include it all here, but there are several errors of the following
>      form:
> 
>      In file included from ../../../gtk+-3.24.34/gdk/wayland/gdkscreen-wayland.c:28:
>      ../../../gtk+-3.24.34/gdk/wayland/gdkdisplay-wayland.h:48:10: fatal error: epoxy/egl.h: No such file or directory
>      48 | #include <epoxy/egl.h>
>          |          ^~~~~~~~~~~~~
>      compilation terminated.
> 
> core-image-weston:
> 
>      ERROR: Nothing RPROVIDES 'weston-xwayland' (but /workdir/poky/meta/recipes-graphics/images/core-image-weston.bb RDEPENDS on or otherwise requires it)
>      weston RPROVIDES weston-xwayland but was skipped: missing required distro feature 'opengl' (not in DISTRO_FEATURES)
>      NOTE: Runtime target 'weston-xwayland' is unbuildable, removing...
>      Missing or unbuildable dependency chain was: ['weston-xwayland']
>      ERROR: Required build target 'core-image-weston' has no buildable providers.
>      Missing or unbuildable dependency chain was: ['core-image-weston', 'weston-xwayland']
> 
> Thanks,
> 
--------------8ByEWg3jxYxm5Wd4vPZT0CZF
Content-Type: text/x-patch; charset="UTF-8";
	name="0001-Add-core-image-weston-and-core-image-x11-support.patch"
Content-Disposition: attachment;
	filename="0001-Add-core-image-weston-and-core-image-x11-support.patch"
Content-Transfer-Encoding: base64

RnJvbSBjODFmYmFlMmNmNzc4N2VkMDFlZTAwYjM3OGU5NWJlOWQ2NTNkN2RmIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBBbmRyZXcgRGF2aXMgPGFmZEB0aS5jb20+CkRhdGU6
IFRodSwgMTMgT2N0IDIwMjIgMDk6NTk6NDYgLTA1MDAKU3ViamVjdDogW1BBVENIXSBBZGQg
Y29yZS1pbWFnZS13ZXN0b24gYW5kIGNvcmUtaW1hZ2UteDExIHN1cHBvcnQKClRoaXMgaXMg
bW9yZSBjaGFuZ2VzIHRoYW4gSSB3b3VsZCBub3JtYWxseSBsaWtlIGluIGEgc2luZ2xlIGNv
bW1pdApidXQgdGhlc2UgYWxsIGRvIHNlZW0gc28gbG9naWNhbGx5IGNvbm5lY3RlZC4gVGhl
IGdvYWwgYmVpbmcgdG8KZW5hYmxlIHRoZSB0d28gb2UtY29yZSBncmFwaGljYWwgaW1hZ2Vz
LgoKVGhlc2UgY2hhbmdlcyBhcmUgbmVlZGVkIGR1ZSB0byBvdXIgTUFDSElORVMgYWxsIG9u
bHkgaGF2aW5nIEdMRVMyCmFuZCBub3QgdGhlIGRlc2t0b3AgT3BlbkdMIHZlcnNpb25zLiBU
aGF0IHdvdWxkIG1lYW4gdGhlc2UgYmVsb25nCmluIHRoZSBsYXllciB0aGF0IGFkZHMgdGhl
IG1hY2hpbmVzIGFuZCBub3QgaW4gYSBkaXN0cm8gbGF5ZXIuCgpBdCBzb21lIHBvaW50IHdl
IHNob3VsZCBhZGQgYSBuZXcgTUFDSElORV9GRUFUVVJFIHRoYXQgbGV0cyBhIEJTUApsYXll
ciBzcGVjaWZ5IHRoZSBBUEkgc3VwcG9ydGVkIGJ5IHRoZSBoYXJkd2FyZS4gVW50aWwgdGhl
bgp3ZSBhcHBlbmQgdGhlc2Uga2V5IHJlY2lwZXMgdG8gc3dpdGNoIHRoZW0gb3ZlciB0byBH
TEVTMi4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBEYXZpcyA8YWZkQHRpLmNvbT4KLS0tCiAu
Li4vcmVjaXBlcy1ncmFwaGljcy9jYWlyby9jYWlyb18lLmJiYXBwZW5kICAgfCAgMyArKwog
Li4uYWJsaW5nLXBhdGNoLXRvLW5vdC1leGNsdWRlLWxpYmVwb3h5LnBhdGNoIHwgNDYgKysr
KysrKysrKysrKysrKysrKwogLi4uL3JlY2lwZXMtZ3JhcGhpY3MvZ3RrKy9ndGsrM18lLmJi
YXBwZW5kICAgIHwgIDkgKysrKwogLi4uL2xpYmVwb3h5L2xpYmVwb3h5XyUuYmJhcHBlbmQg
ICAgICAgICAgICAgIHwgIDMgKysKIC4uLi94b3JnLXhzZXJ2ZXIveHNlcnZlci14b3JnXyUu
YmJhcHBlbmQgICAgICB8ICAyICsKIC4uLi94d2F5bGFuZC94d2F5bGFuZF8lLmJiYXBwZW5k
ICAgICAgICAgICAgICB8ICAzICsrCiA2IGZpbGVzIGNoYW5nZWQsIDY2IGluc2VydGlvbnMo
KykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLXRpLWJzcC9yZWNpcGVzLWdyYXBoaWNzL2Nh
aXJvL2NhaXJvXyUuYmJhcHBlbmQKIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLXRpLWJzcC9y
ZWNpcGVzLWdyYXBoaWNzL2d0aysvZ3RrKzMvMDAwMS1GaXgtT3BlbkdMLWRpc2FibGluZy1w
YXRjaC10by1ub3QtZXhjbHVkZS1saWJlcG94eS5wYXRjaAogY3JlYXRlIG1vZGUgMTAwNjQ0
IG1ldGEtdGktYnNwL3JlY2lwZXMtZ3JhcGhpY3MvZ3RrKy9ndGsrM18lLmJiYXBwZW5kCiBj
cmVhdGUgbW9kZSAxMDA2NDQgbWV0YS10aS1ic3AvcmVjaXBlcy1ncmFwaGljcy9saWJlcG94
eS9saWJlcG94eV8lLmJiYXBwZW5kCiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS10aS1ic3Av
cmVjaXBlcy1ncmFwaGljcy94b3JnLXhzZXJ2ZXIveHNlcnZlci14b3JnXyUuYmJhcHBlbmQK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhLXRpLWJzcC9yZWNpcGVzLWdyYXBoaWNzL3h3YXls
YW5kL3h3YXlsYW5kXyUuYmJhcHBlbmQKCmRpZmYgLS1naXQgYS9tZXRhLXRpLWJzcC9yZWNp
cGVzLWdyYXBoaWNzL2NhaXJvL2NhaXJvXyUuYmJhcHBlbmQgYi9tZXRhLXRpLWJzcC9yZWNp
cGVzLWdyYXBoaWNzL2NhaXJvL2NhaXJvXyUuYmJhcHBlbmQKbmV3IGZpbGUgbW9kZSAxMDA2
NDQKaW5kZXggMDAwMDAwMDAuLjcyNmYzOTExCi0tLSAvZGV2L251bGwKKysrIGIvbWV0YS10
aS1ic3AvcmVjaXBlcy1ncmFwaGljcy9jYWlyby9jYWlyb18lLmJiYXBwZW5kCkBAIC0wLDAg
KzEsMyBAQAorUFI6YXBwZW5kOnRpLXNvYyA9ICIudGkxIgorUEFDS0FHRUNPTkZJRzphcHBl
bmQ6dGktc29jID0gIiAke0BiYi51dGlscy5jb250YWlucygnTUFDSElORV9GRUFUVVJFUycs
ICdncHUnLCAnZWdsIGdsZXN2MicsICcnLCBkKX0iCitQQUNLQUdFQ09ORklHOnJlbW92ZTp0
aS1zb2MgPSAib3BlbmdsIgpkaWZmIC0tZ2l0IGEvbWV0YS10aS1ic3AvcmVjaXBlcy1ncmFw
aGljcy9ndGsrL2d0ayszLzAwMDEtRml4LU9wZW5HTC1kaXNhYmxpbmctcGF0Y2gtdG8tbm90
LWV4Y2x1ZGUtbGliZXBveHkucGF0Y2ggYi9tZXRhLXRpLWJzcC9yZWNpcGVzLWdyYXBoaWNz
L2d0aysvZ3RrKzMvMDAwMS1GaXgtT3BlbkdMLWRpc2FibGluZy1wYXRjaC10by1ub3QtZXhj
bHVkZS1saWJlcG94eS5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAw
MC4uYzg3M2ZiOGQKLS0tIC9kZXYvbnVsbAorKysgYi9tZXRhLXRpLWJzcC9yZWNpcGVzLWdy
YXBoaWNzL2d0aysvZ3RrKzMvMDAwMS1GaXgtT3BlbkdMLWRpc2FibGluZy1wYXRjaC10by1u
b3QtZXhjbHVkZS1saWJlcG94eS5wYXRjaApAQCAtMCwwICsxLDQ2IEBACitGcm9tIGViMTZl
ODBiZjFmN2M1MTAyNGYzZWQ5NTBhZTg1NTQxZTViYTIyMzMgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tOiBBbmRyZXcgRGF2aXMgPGFmZEB0aS5jb20+CitEYXRlOiBXZWQsIDEy
IE9jdCAyMDIyIDEzOjA1OjQ1IC0wNTAwCitTdWJqZWN0OiBbUEFUQ0hdIEZpeCBPcGVuR0wg
ZGlzYWJsaW5nIHBhdGNoIHRvIG5vdCBleGNsdWRlIGxpYmVwb3h5CisKK1Vwc3RyZWFtLVN0
YXR1czogSW5hcHByb3ByaWF0ZQorU2lnbmVkLW9mZi1ieTogQW5kcmV3IERhdmlzIDxhZmRA
dGkuY29tPgorLS0tCisgY29uZmlndXJlLmFjIHwgOSArKysrLS0tLS0KKyAxIGZpbGUgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQorCitkaWZmIC0tZ2l0IGEv
Y29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCitpbmRleCAzY2IyNGU5Li5hYTM2NWJlIDEw
MDY0NAorLS0tIGEvY29uZmlndXJlLmFjCisrKysgYi9jb25maWd1cmUuYWMKK0BAIC0zNDgs
MTAgKzM0OCw5IEBAIEFDX0FSR19FTkFCTEUoY2xvdWRwcm92aWRlcnMsCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgW2Nsb3VkcHJvdmlkZXJzX3NldD15ZXNdKQorIEFDX0FS
R19FTkFCTEUob3BlbmdsLAorICAgICAgICAgICAgICAgW0FTX0hFTFBfU1RSSU5HKFstLWVu
YWJsZS1vcGVuZ2xdLAorLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFtXaGVuIGVu
YWJsZWQsIEd0aysgd2lsbCB1c2UgbGliZXBveHkgYW5kIGV4cG9zZXMgR3RrR0xBcmVhIHdp
ZGdldCBdKV0pCisrICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgW1doZW4gZW5hYmxl
ZCwgR3RrKyBleHBvc2VzIEd0a0dMQXJlYSB3aWRnZXQgXSldKQorIEFTX0lGKFt0ZXN0ICJ4
JGVuYWJsZV9vcGVuZ2wiICE9ICJ4bm8iXSwgWworLSAgQUNfREVGSU5FKFtIQVZFX09QRU5H
TF0sIFsxXSwgW2xpYmVwb3h5IGFuZCBvcGVuZ2wgQVBJcyBhcmUgYXZhaWxhYmxlIGF0IGJ1
aWxkdGltZV0pCistICBFUE9YWV9QQUNLQUdFUz0iZXBveHkgPj0gZXBveHlfcmVxdWlyZWRf
dmVyc2lvbiIKKysgIEFDX0RFRklORShbSEFWRV9PUEVOR0xdLCBbMV0sIFtPcGVuR0wgQVBJ
cyBhcmUgYXZhaWxhYmxlIGF0IGJ1aWxkdGltZV0pCisgXSkKKyBBTV9DT05ESVRJT05BTChb
SEFWRV9PUEVOR0xdLFt0ZXN0ICJ4JGVuYWJsZV9vcGVuZ2wiICE9ICJ4bm8iXSkKKyAKK0BA
IC0xMzY1LDcgKzEzNjQsNyBAQCBDRkxBR1M9IiRzYXZlZF9jZmxhZ3MiCisgTERGTEFHUz0i
JHNhdmVkX2xkZmxhZ3MiCisgCisgR0RLX1BBQ0tBR0VTPSIkUEFOR09fUEFDS0FHRVMgZ2Rr
LXBpeGJ1Zi0yLjAgPj0gZ2RrX3BpeGJ1Zl9yZXF1aXJlZF92ZXJzaW9uIGNhaXJvID49IGNh
aXJvX3JlcXVpcmVkX3ZlcnNpb24gY2Fpcm8tZ29iamVjdCA+PSBjYWlyb19yZXF1aXJlZF92
ZXJzaW9uIgorLUdES19QUklWQVRFX1BBQ0tBR0VTPSIkR0RLX0dJT19QQUNLQUdFICRYX1BB
Q0tBR0VTICRXQVlMQU5EX1BBQ0tBR0VTICRjYWlyb19iYWNrZW5kcyAkRVBPWFlfUEFDS0FH
RVMgJENMT1VEUFJPVklERVJfUEFDS0FHRVMgJFBST0ZJTEVSX1BBQ0tBR0VTIGZyaWJpZGkg
Pj0gZnJpYmlkaV9yZXF1aXJlZF92ZXJzaW9uIgorK0dES19QUklWQVRFX1BBQ0tBR0VTPSIk
R0RLX0dJT19QQUNLQUdFICRYX1BBQ0tBR0VTICRXQVlMQU5EX1BBQ0tBR0VTICRjYWlyb19i
YWNrZW5kcyBlcG94eSA+PSBlcG94eV9yZXF1aXJlZF92ZXJzaW9uICRDTE9VRFBST1ZJREVS
X1BBQ0tBR0VTICRQUk9GSUxFUl9QQUNLQUdFUyBmcmliaWRpID49IGZyaWJpZGlfcmVxdWly
ZWRfdmVyc2lvbiIKKyAKKyBQS0dfQ0hFQ0tfTU9EVUxFUyhHREtfREVQLCAkR0RLX1BBQ0tB
R0VTICRHREtfUFJJVkFURV9QQUNLQUdFUykKKyBHREtfREVQX0xJQlM9IiRHREtfRVhUUkFf
TElCUyAkR0RLX0RFUF9MSUJTICRNQVRIX0xJQiIKK0BAIC0xMzk5LDcgKzEzOTgsNyBAQCBm
aQorIFBLR19DSEVDS19NT0RVTEVTKEFUSywgJEFUS19QQUNLQUdFUykKKyAKKyBHVEtfUEFD
S0FHRVM9ImF0ayA+PSBhdGtfcmVxdWlyZWRfdmVyc2lvbiBjYWlybyA+PSBjYWlyb19yZXF1
aXJlZF92ZXJzaW9uIGNhaXJvLWdvYmplY3QgPj0gY2Fpcm9fcmVxdWlyZWRfdmVyc2lvbiBn
ZGstcGl4YnVmLTIuMCA+PSBnZGtfcGl4YnVmX3JlcXVpcmVkX3ZlcnNpb24gZ2lvLTIuMCA+
PSBnbGliX3JlcXVpcmVkX3ZlcnNpb24iCistR1RLX1BSSVZBVEVfUEFDS0FHRVM9IiRBVEtf
UEFDS0FHRVMgJFdBWUxBTkRfUEFDS0FHRVMgJEVQT1hZX1BBQ0tBR0VTIGZyaWJpZGkgPj0g
ZnJpYmlkaV9yZXF1aXJlZF92ZXJzaW9uIgorK0dUS19QUklWQVRFX1BBQ0tBR0VTPSIkQVRL
X1BBQ0tBR0VTICRXQVlMQU5EX1BBQ0tBR0VTIGVwb3h5ID49IGVwb3h5X3JlcXVpcmVkX3Zl
cnNpb24gZnJpYmlkaSA+PSBmcmliaWRpX3JlcXVpcmVkX3ZlcnNpb24iCisgaWYgdGVzdCAi
eCRlbmFibGVfeDExX2JhY2tlbmQiID0geHllcyAtbyAieCRlbmFibGVfd2F5bGFuZF9iYWNr
ZW5kIiA9IHh5ZXM7IHRoZW4KKyAgIEdUS19QUklWQVRFX1BBQ0tBR0VTPSIkR1RLX1BSSVZB
VEVfUEFDS0FHRVMgcGFuZ29mdDIiCisgZmkKZGlmZiAtLWdpdCBhL21ldGEtdGktYnNwL3Jl
Y2lwZXMtZ3JhcGhpY3MvZ3RrKy9ndGsrM18lLmJiYXBwZW5kIGIvbWV0YS10aS1ic3AvcmVj
aXBlcy1ncmFwaGljcy9ndGsrL2d0ayszXyUuYmJhcHBlbmQKbmV3IGZpbGUgbW9kZSAxMDA2
NDQKaW5kZXggMDAwMDAwMDAuLmI2ZTgyZDE0Ci0tLSAvZGV2L251bGwKKysrIGIvbWV0YS10
aS1ic3AvcmVjaXBlcy1ncmFwaGljcy9ndGsrL2d0ayszXyUuYmJhcHBlbmQKQEAgLTAsMCAr
MSw5IEBACitGSUxFU0VYVFJBUEFUSFM6cHJlcGVuZCA6PSAiJHtUSElTRElSfS8ke1BOfToi
CisKK1NSQ19VUkk6YXBwZW5kOnRpLXNvYyA9ICIgXAorCWZpbGU6Ly8wMDAxLUZpeC1PcGVu
R0wtZGlzYWJsaW5nLXBhdGNoLXRvLW5vdC1leGNsdWRlLWxpYmVwb3h5LnBhdGNoIFwKKyIK
KworUFI6YXBwZW5kOnRpLXNvYyA9ICIudGkxIgorUEFDS0FHRUNPTkZJRzpyZW1vdmU6dGkt
c29jID0gIm9wZW5nbCIKK0RFUEVORFM6YXBwZW5kOnRpLXNvYyA9ICIgbGliZXBveHkiCmRp
ZmYgLS1naXQgYS9tZXRhLXRpLWJzcC9yZWNpcGVzLWdyYXBoaWNzL2xpYmVwb3h5L2xpYmVw
b3h5XyUuYmJhcHBlbmQgYi9tZXRhLXRpLWJzcC9yZWNpcGVzLWdyYXBoaWNzL2xpYmVwb3h5
L2xpYmVwb3h5XyUuYmJhcHBlbmQKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAw
MDAuLmFhZGY1YmFiCi0tLSAvZGV2L251bGwKKysrIGIvbWV0YS10aS1ic3AvcmVjaXBlcy1n
cmFwaGljcy9saWJlcG94eS9saWJlcG94eV8lLmJiYXBwZW5kCkBAIC0wLDAgKzEsMyBAQAor
UFI6YXBwZW5kOnRpLXNvYyA9ICIudGkxIgorUEFDS0FHRUNPTkZJRzphcHBlbmQ6dGktc29j
ID0gIiAke0BiYi51dGlscy5jb250YWlucygnTUFDSElORV9GRUFUVVJFUycsICdncHUnLCAn
ZWdsJywgJycsIGQpfSIKK1BBQ0tBR0VDT05GSUc6cmVtb3ZlOnRpLXNvYyA9ICJ4MTEiCmRp
ZmYgLS1naXQgYS9tZXRhLXRpLWJzcC9yZWNpcGVzLWdyYXBoaWNzL3hvcmcteHNlcnZlci94
c2VydmVyLXhvcmdfJS5iYmFwcGVuZCBiL21ldGEtdGktYnNwL3JlY2lwZXMtZ3JhcGhpY3Mv
eG9yZy14c2VydmVyL3hzZXJ2ZXIteG9yZ18lLmJiYXBwZW5kCm5ldyBmaWxlIG1vZGUgMTAw
NjQ0CmluZGV4IDAwMDAwMDAwLi44NmMxZTcxNAotLS0gL2Rldi9udWxsCisrKyBiL21ldGEt
dGktYnNwL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy14c2VydmVyL3hzZXJ2ZXIteG9yZ18lLmJi
YXBwZW5kCkBAIC0wLDAgKzEsMiBAQAorUFI6YXBwZW5kOnRpLXNvYyA9ICIudGkxIgorT1BF
TkdMX1BLR0NPTkZJR1M6dGktc29jID0gIiIKZGlmZiAtLWdpdCBhL21ldGEtdGktYnNwL3Jl
Y2lwZXMtZ3JhcGhpY3MveHdheWxhbmQveHdheWxhbmRfJS5iYmFwcGVuZCBiL21ldGEtdGkt
YnNwL3JlY2lwZXMtZ3JhcGhpY3MveHdheWxhbmQveHdheWxhbmRfJS5iYmFwcGVuZApuZXcg
ZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMC4uZTcxNjMyMDcKLS0tIC9kZXYvbnVs
bAorKysgYi9tZXRhLXRpLWJzcC9yZWNpcGVzLWdyYXBoaWNzL3h3YXlsYW5kL3h3YXlsYW5k
XyUuYmJhcHBlbmQKQEAgLTAsMCArMSwzIEBACitQUjphcHBlbmQ6dGktc29jID0gIi50aTEi
CitQQUNLQUdFQ09ORklHOnJlbW92ZTp0aS1zb2MgPSAiZ2x4IgorREVQRU5EUzphcHBlbmQ6
dGktc29jID0gIiBsaWJ4c2htZmVuY2UiCi0tIAoyLjM3LjMKCg==

--------------8ByEWg3jxYxm5Wd4vPZT0CZF--

