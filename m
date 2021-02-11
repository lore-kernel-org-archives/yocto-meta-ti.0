Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.9968.1613057521134035458
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 Feb 2021 07:32:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=J03WWco8;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: lokeshvutla@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 4C1DD38C066A
	for <meta-ti@yoctoproject.org>; Thu, 11 Feb 2021 15:32:00 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 11BFVxhk026387
	for <meta-ti@yoctoproject.org>; Thu, 11 Feb 2021 09:31:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1613057519;
	bh=n7040nVgrVnhG8nYdNM5I3gLHuH3bKVUeyy2Hy02sAc=;
	h=Subject:From:To:CC:References:Date:In-Reply-To;
	b=J03WWco8tBbBaaNCOXYuaHr6MNDct2NVhubjnsnNtoOS8xNoTn4XuRcdlZIDNle85
	 cZGUHLG2HvM8s7GF7zFKdIIxczsogytz10vFh7yTQg60PKnKSsmzikHHSNgweKVPyL
	 akQYvDWSHoTFQHQpBNSs5KZQUpu98vvH4IDiGyew=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 11BFVxGB043184
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 11 Feb 2021 09:31:59 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 11
 Feb 2021 09:31:59 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 11 Feb 2021 09:31:59 -0600
Received: from [10.24.69.20] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 11BFVvIq054342;
	Thu, 11 Feb 2021 09:31:57 -0600
Subject: Re: [meta-ti][dunfell PATCH] recipes-bsp: wl-fw: New recipe for WiLink firmwares
From: "Lokesh Vutla" <lokeshvutla@ti.com>
To: Nikhil Devshatwar <nikhil.nd@ti.com>, <meta-ti@yoctoproject.org>,
        <dmurphy@ti.com>
CC: <kishon@ti.com>, <nsekhar@ti.com>
References: <20210211105018.10470-1-nikhil.nd@ti.com>
 <53d3e34d-d202-988b-ac89-510e89933f32@ti.com>
Message-ID: <c366cda2-08ee-f593-c1ab-d8d293f3e697@ti.com>
Date: Thu, 11 Feb 2021 21:01:56 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <53d3e34d-d202-988b-ac89-510e89933f32@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 11/02/21 8:53 pm, Lokesh Vutla wrote:
> 
> 
> On 11/02/21 4:20 pm, Nikhil Devshatwar wrote:
>> Add a new recipe which installs the WiLink firmware from the
>> official ti-linux-firmware repo.
>>
>> This is required for supporting the Wireless functionaliy on
>> the am64xx-sk board.
>>
>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> 
> I see the following new firmwares are installed.
> -rw-r--r-- 1 lokesh lokesh  50K Feb 11 16:42 TIInit_6.2.31.bts
> -rw-r--r-- 1 lokesh lokesh  16K Feb 11 16:42 TIInit_6.6.15.bts
> -rw-r--r-- 1 lokesh lokesh  48K Feb 11 16:42 TIInit_7.2.31.bts
> -rw-r--r-- 1 lokesh lokesh 190K Feb 11 16:42 wl1251-fw.bin
> -rw-r--r-- 1 lokesh lokesh  752 Feb 11 16:42 wl1251-nvs.bin
> -rw-r--r-- 1 lokesh lokesh 268K Feb 11 16:42 wl1271-fw-2.bin
> -rw-r--r-- 1 lokesh lokesh 267K Feb 11 16:42 wl1271-fw-ap.bin
> -rw-r--r-- 1 lokesh lokesh 266K Feb 11 16:42 wl1271-fw.bin
> -rw-r--r-- 1 lokesh lokesh 274K Feb 11 16:42 wl127x-fw-3.bin
> -rw-r--r-- 1 lokesh lokesh 255K Feb 11 16:42 wl127x-fw-4-mr.bin
> -rw-r--r-- 1 lokesh lokesh 256K Feb 11 16:42 wl127x-fw-4-plt.bin
> -rw-r--r-- 1 lokesh lokesh 271K Feb 11 16:42 wl127x-fw-4-sr.bin
> -rw-r--r-- 1 lokesh lokesh 349K Feb 11 16:42 wl127x-fw-5-mr.bin
> -rw-r--r-- 1 lokesh lokesh 338K Feb 11 16:42 wl127x-fw-5-plt.bin
> -rw-r--r-- 1 lokesh lokesh 356K Feb 11 16:42 wl127x-fw-5-sr.bin
> -rw-r--r-- 1 lokesh lokesh 262K Feb 11 16:42 wl127x-fw-plt-3.bin
> -rw-r--r-- 1 lokesh lokesh  912 Feb 11 16:42 wl127x-nvs.bin
> -rw-r--r-- 1 lokesh lokesh 279K Feb 11 16:42 wl128x-fw-3.bin
> -rw-r--r-- 1 lokesh lokesh 259K Feb 11 16:42 wl128x-fw-4-mr.bin
> -rw-r--r-- 1 lokesh lokesh 264K Feb 11 16:42 wl128x-fw-4-plt.bin
> -rw-r--r-- 1 lokesh lokesh 278K Feb 11 16:42 wl128x-fw-4-sr.bin
> -rw-r--r-- 1 lokesh lokesh 354K Feb 11 16:42 wl128x-fw-5-mr.bin
> -rw-r--r-- 1 lokesh lokesh 346K Feb 11 16:42 wl128x-fw-5-plt.bin
> -rw-r--r-- 1 lokesh lokesh 365K Feb 11 16:42 wl128x-fw-5-sr.bin
> -rw-r--r-- 1 lokesh lokesh 260K Feb 11 16:42 wl128x-fw-ap.bin
> -rw-r--r-- 1 lokesh lokesh 267K Feb 11 16:42 wl128x-fw.bin
> -rw-r--r-- 1 lokesh lokesh 266K Feb 11 16:42 wl128x-fw-plt-3.bin
> -rw-r--r-- 1 lokesh lokesh 1.1K Feb 11 16:42 wl128x-nvs.bin
> -rw-r--r-- 1 lokesh lokesh 625K Feb 11 16:42 wl18xx-fw-2.bin
> -rw-r--r-- 1 lokesh lokesh 658K Feb 11 16:42 wl18xx-fw-3.bin
> -rw-r--r-- 1 lokesh lokesh 728K Feb 11 16:42 wl18xx-fw-4.bin
> -rw-r--r-- 1 lokesh lokesh 405K Feb 11 16:42 wl18xx-fw.bin
> 
> 
> Do we need all these firmwares?



> 
>> ---
>>  recipes-bsp/wl-fw/wl-fw_git.bb | 27 +++++++++++++++++++++++++++
>>  1 file changed, 27 insertions(+)
>>  create mode 100644 recipes-bsp/wl-fw/wl-fw_git.bb

Also, shouldn't this be similar to
recipes-connectivity/wlconf/wlconf_8.7.3.bb ?

Thanks and regards,
Lokesh

>>
>> diff --git a/recipes-bsp/wl-fw/wl-fw_git.bb b/recipes-bsp/wl-fw/wl-fw_git.bb
>> new file mode 100644
>> index 00000000..01d8e58b
>> --- /dev/null
>> +++ b/recipes-bsp/wl-fw/wl-fw_git.bb
>> @@ -0,0 +1,27 @@
>> +DESCRIPTION = "Firmware files for Wilink"
>> +LICENSE = "TI-TSPA"
>> +LIC_FILES_CHKSUM = "file://LICENCE.ti-connectivity;md5=c5e02be633f1499c109d1652514d85ec"
>> +
>> +PV = "7.3+git${SRCPV}"
> 
> Dan, this came up in one of our discussions. Isn't the preferred way is to put
> PV in file name?
> 
> Thanks and regards,
> Lokesh
> 
>> +
>> +SRCREV = "b66ee9ae020c31d7138f0af38518823bb4f5791e"
>> +BRANCH = "ti-linux-firmware"
>> +SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;branch=${BRANCH}"
>> +
>> +COMPATIBLE_MACHINE = "k3"
>> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>> +
>> +CLEANBROKEN = "1"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +do_compile() {
>> +    :
>> +}
>> +
>> +do_install() {
>> +    install -d ${D}${base_libdir}/firmware/ti-connectivity
>> +    install -m 644 ${S}/ti-connectivity/* ${D}${base_libdir}/firmware/ti-connectivity/
>> +}
>> +
>> +FILES_${PN} += "${base_libdir}/firmware/ti-connectivity/*"
>>
