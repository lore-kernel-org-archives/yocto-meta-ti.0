Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.2520.1581624364080301510
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Feb 2020 12:06:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=QjSwPvoz;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01DK63TW112071
	for <meta-ti@lists.yoctoproject.org>; Thu, 13 Feb 2020 14:06:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1581624363;
	bh=gL8GpzlN+EZ2TY/uDZn71iDS8DME9uwy6m1g4YuWVUY=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=QjSwPvozf9qHrtqXDCkWhdRZzFvauKD7jpk8dGreEfuOATXGO4TkBrAZIwUrL1VC8
	 gBouDLGuAEjvaM/NU7R/Se4EWFXwc0W4Hy+UmDoD7rvShiaqb7Pr0llsNs1doO7+WI
	 EqCSp9Aj9l7q5TM+5Dc5UodlPy7fXwaPQ6pCxt0U=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01DK635b115822
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 13 Feb 2020 14:06:03 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 13
 Feb 2020 14:06:03 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 13 Feb 2020 14:06:02 -0600
Received: from [10.250.73.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01DK62tV047389;
	Thu, 13 Feb 2020 14:06:02 -0600
Subject: Re: [meta-ti][zeus/master][PATCH 1/2] ti-sgx-ddk-um: bump SRCREV for zeus support
To: Denys Dmytriyenko <denys@ti.com>
CC: Gowtham Tammana <g-tammana@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20200213162958.7600-1-afd@ti.com> <20200213184958.GD7085@beryl>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <49e5ca4f-3aae-288d-735a-22ed72a96db7@ti.com>
Date: Thu, 13 Feb 2020 15:06:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200213184958.GD7085@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2/13/20 1:49 PM, Denys Dmytriyenko wrote:
> On Thu, Feb 13, 2020 at 11:29:57AM -0500, Andrew F. Davis wrote:
>> This also allows us to do two extra tasks so lets do them here:
>>  - Add support back for Beagleboard and Pandaboard
>>  - Remove plugins workaround as SO names are handled correctly now
> 
> Thanks for the update and for taking care of these 2 extra items!
> 
> 
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>> ---
>>  .../libgles/ti-sgx-ddk-um_1.17.4948957.bb     | 19 +++++++------------
>>  1 file changed, 7 insertions(+), 12 deletions(-)
>>
>> diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
>> index ecf3ffcc..129d5cee 100644
>> --- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
>> +++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
>> @@ -4,19 +4,21 @@ LICENSE = "TI-TSPA"
>>  LIC_FILES_CHKSUM = "file://TI-Linux-Graphics-DDK-UM-Manifest.doc;md5=b17390502bc89535c86cfbbae961a2a8"
>>  
>>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>> -COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k3"
>> +COMPATIBLE_MACHINE = "pandaboard|beagleboard|ti33x|ti43x|omap-a15|k3"
>>  
>> -PR = "r34"
>> +PR = "r35"
>>  
>> -BRANCH = "ti-img-sgx/thud/${PV}"
>> +BRANCH = "ti-img-sgx/zeus/${PV}"
>>  
>>  SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
>> -SRCREV = "2a2e5bb090ced870d73ed4edbc54793e952cc6d8"
>> +SRCREV = "ce7b96b88d31da27af5b3a2a890aba180a014fc4"
>>  
>>  TARGET_PRODUCT_omap-a15 = "jacinto6evm"
>>  TARGET_PRODUCT_ti33x = "ti335x"
>>  TARGET_PRODUCT_ti43x = "ti437x"
>>  TARGET_PRODUCT_k3 = "ti654x"
>> +TARGET_PRODUCT_beagleboard = "ti343x"
>> +TARGET_PRODUCT_pandaboard = "ti443x"
>>  
>>  INITSCRIPT_NAME = "rc.pvr"
>>  INITSCRIPT_PARAMS = "defaults 8"
>> @@ -59,14 +61,7 @@ FILES_${PN} += " ${libdir}/*"
>>  FILES_${PN} +=  "${includedir}/*"
>>  FILES_${PN} +=  "${sysconfdir}/*"
>>  
>> -PACKAGES =+ "${PN}-plugins"
>> -FILES_${PN}-plugins = "${libdir}/libsrv_init.so ${libdir}/libsrv_um.so ${libdir}/libglslcompiler.so ${libdir}/libPVRScopeServices.so ${libdir}/libGLESv2.so ${libdir}/libEGL.so ${libdir}/libGLESv1_CM.so ${libdir}/libGLES_CM.so ${libdir}/libGLESv1_PVR_MESA.so ${libdir}/libGLESv2_PVR_MESA.so"
>> -RDEPENDS_${PN} += "${PN}-plugins"
>> -
>> -ALLOW_EMPTY_${PN}-plugins = "1"
>> -
>>  INSANE_SKIP_${PN} += "dev-so ldflags useless-rpaths"
>> -INSANE_SKIP_${PN}-plugins = "dev-so"
>> -INSANE_SKIP_${PN} += "already-stripped"
>> +INSANE_SKIP_${PN} += "already-stripped dev-deps"
> 
> What's new dev-deps is for?
> 


The DRI driver is called: dri/pvr_dri.so, the check looks for anything
linking to a .so and thinks there is a runtime dependency on the -dev
package. There would be if we didn't force dri/pvr_dri.so to get shipped
as part of the normal package.

Andrew


> 
>>  CLEANBROKEN = "1"
>> -- 
>> 2.17.1
>>
