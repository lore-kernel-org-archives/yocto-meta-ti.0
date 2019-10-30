Return-Path: <e-ruei1@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 81890E00DFC; Wed, 30 Oct 2019 06:17:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	*  0.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2F530E00DAF
	for <meta-ti@yoctoproject.org>; Wed, 30 Oct 2019 06:17:03 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9UDH3Hi111177
	for <meta-ti@yoctoproject.org>; Wed, 30 Oct 2019 08:17:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1572441423;
	bh=QfX1NSrG6ce8sr0NIjAC2W0ILRLTfgAA3oPG3BULn7s=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=qnSuGtaLld9oD78jqyeYF8M9MQWb1RcFqByn4fp3CAsSo5Ua6WdSSXkmAcl81qAyn
	bk0KZbumkAL7+j84Pw0jeN7bN99styvRHwKxdAWwLdwZun7WQJcepNG12CYA7PhGbJ
	pMgnH91Ddm5iwuCaBqJS6ev4KOVvvMPoow6C8p5k=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9UDH2fW039251
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 30 Oct 2019 08:17:03 -0500
Received: from [158.218.113.148] (158.218.113.148) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 30 Oct 2019 08:16:49 -0500
To: Denys Dmytriyenko <denys@ti.com>, Eric Ruei <e-ruei1@ti.com>, "Andrew F.
	Davis" <afd@ti.com>
References: <20191029132020.8891-1-e-ruei1@ti.com>
	<20191029232901.GK7518@beryl>
From: "Ruei, Eric" <a0850410@ti.com>
Message-ID: <49a855c9-17da-1167-c449-04399d9658b0@ti.com>
Date: Wed, 30 Oct 2019 09:16:47 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191029232901.GK7518@beryl>
X-Originating-IP: [158.218.113.148]
X-ClientProxiedBy: DLEE100.ent.ti.com (157.170.170.30) To DLEE113.ent.ti.com
	(157.170.170.24)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] ti-sgx-ddk-um: update SRCREV to pick up Mesa-based EGL/GLES libraries
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
X-List-Received-Date: Wed, 30 Oct 2019 13:17:05 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/29/2019 7:29 PM, Denys Dmytriyenko wrote:
> On Tue, Oct 29, 2019 at 09:20:20AM -0400, Eric Ruei wrote:
>> This is the initial step toward Mesa-based EGL/GLES libraries which
>> support all the required EGL 1.5 extensions. We plan to provide a
>> Mesa-pvr recipe to build Mesa from source and SGX/DDK patches where
>> ti-sgx-ddk-um shall provide the EGL/GLES plugins only at the next step.
> 
> Eric,
> 
> The new binaries are huge. The compressed package went from 900 KB to 8 MB in
> size and now both AM3 and AM4 won't fit into allocated rootfs size...
> 
> 
Denys:

The Mesa-based GLES/EGL is much bigger. The major increase is caused by 
the new file pvr_dri.so (28M) under usr/lib/dri. The LibEGL related 
libraries are also increased from sub-200K to 1.1 M and there is another 
library libglapi.so (900k).

Eric


>> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
>> ---
>>   recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb | 8 +++++---
>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
>> index 7a6f013e..3991d917 100644
>> --- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
>> +++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
>> @@ -11,7 +11,7 @@ PR = "r34"
>>   BRANCH = "ti-img-sgx/thud/${PV}"
>>   
>>   SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
>> -SRCREV = "87d7e5c1e4db1bab048939c9719059d549c1e8dd"
>> +SRCREV = "2a2e5bb090ced870d73ed4edbc54793e952cc6d8"
>>   
>>   TARGET_PRODUCT_omap-a15 = "jacinto6evm"
>>   TARGET_PRODUCT_ti33x = "ti335x"
>> @@ -47,7 +47,9 @@ S = "${WORKDIR}/git"
>>   
>>   do_install () {
>>       oe_runmake install DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT}
>> -    ln -sf libGLESv2.so.${PV} ${D}${libdir}/libGLESv2.so.1
>> +    ln -sf libGLESv2.so ${D}${libdir}/libGLESv2.so.1
>> +
>> +    rm -rf ${D}${includedir}/GL
>>   
>>       chown -R root:root ${D}
>>   }
>> @@ -58,7 +60,7 @@ FILES_${PN} +=  "${includedir}/*"
>>   FILES_${PN} +=  "${sysconfdir}/*"
>>   
>>   PACKAGES =+ "${PN}-plugins"
>> -FILES_${PN}-plugins = "${libdir}/libsrv_init.so ${libdir}/libsrv_um.so ${libdir}/libglslcompiler.so ${libdir}/libPVRScopeServices.so ${libdir}/libGLESv2.so ${libdir}/libEGL.so ${libdir}/libGLES_CM.so ${libdir}/libpvrDRMWSEGL.so  ${libdir}/libpvrGBMWSEGL.so  ${libdir}/libpvrws_WAYLAND.so"
>> +FILES_${PN}-plugins = "${libdir}/libsrv_init.so ${libdir}/libsrv_um.so ${libdir}/libglslcompiler.so ${libdir}/libPVRScopeServices.so ${libdir}/libGLESv2.so ${libdir}/libEGL.so ${libdir}/libGLESv1_CM.so ${libdir}/libGLES_CM.so ${libdir}/libGLESv1_PVR_MESA.so ${libdir}/libGLESv2_PVR_MESA.so"
>>   RDEPENDS_${PN} += "${PN}-plugins"
>>   
>>   ALLOW_EMPTY_${PN}-plugins = "1"
>> -- 
>> 2.17.1
>>
>> -- 
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti


