Return-Path: <afd@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E6F98E00DFD; Wed, 30 Oct 2019 06:36:05 -0700 (PDT)
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
	*      [198.47.23.249 listed in list.dnswl.org]
	*  0.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 38539E00DAF
	for <meta-ti@yoctoproject.org>; Wed, 30 Oct 2019 06:36:05 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9UDa4xk121171
	for <meta-ti@yoctoproject.org>; Wed, 30 Oct 2019 08:36:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1572442564;
	bh=nN1Sey9rgDuIGdTUW5m1wntD0Mq54JP8O+kG0wkzqHg=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=JsVMsszRIO22agoEUdv/0xmkmwmxiIK7vQJr42ocp6tv02/TAwbJDwU+7suZlV3g8
	sFywcomSSyWQIa9qEbHy+e4RL6qv8RNgGuoiwZQSB7cxgv/UN/wMQD0A9SMkCcd3ji
	4/apedckoFadUkxwVG5Hpfldi0ou+q6924Q2litw=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9UDa4eg070748
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 30 Oct 2019 08:36:04 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 30 Oct 2019 08:35:51 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 30 Oct 2019 08:35:51 -0500
Received: from [10.250.45.147] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9UDa3cF031223;
	Wed, 30 Oct 2019 08:36:03 -0500
To: "Ruei, Eric" <a0850410@ti.com>, Eric Ruei <e-ruei1@ti.com>,
	<meta-ti@yoctoproject.org>
References: <20191029132020.8891-1-e-ruei1@ti.com>
	<aceddb08-4720-395a-e454-e0537fd77aee@ti.com>
	<45b0c0c5-832c-7128-3475-d1b045027151@ti.com>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <a53bb589-e9e6-883c-f8ad-c6047aff9c9f@ti.com>
Date: Wed, 30 Oct 2019 09:36:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <45b0c0c5-832c-7128-3475-d1b045027151@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
X-List-Received-Date: Wed, 30 Oct 2019 13:36:06 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 10/30/19 9:31 AM, Ruei, Eric wrote:
> On 10/30/2019 9:22 AM, Andrew F. Davis wrote:
>> On 10/29/19 9:20 AM, Eric Ruei wrote:
>>> This is the initial step toward Mesa-based EGL/GLES libraries which
>>> support all the required EGL 1.5 extensions. We plan to provide a
>>> Mesa-pvr recipe to build Mesa from source and SGX/DDK patches where
>>> ti-sgx-ddk-um shall provide the EGL/GLES plugins only at the next step.
>>>
>>> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
>>> ---
>>>   recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb | 8 +++++---
>>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
>>> b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
>>> index 7a6f013e..3991d917 100644
>>> --- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
>>> +++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
>>> @@ -11,7 +11,7 @@ PR = "r34"
>>>   BRANCH = "ti-img-sgx/thud/${PV}"
>>>     SRC_URI =
>>> "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
>>>
>>> -SRCREV = "87d7e5c1e4db1bab048939c9719059d549c1e8dd"
>>> +SRCREV = "2a2e5bb090ced870d73ed4edbc54793e952cc6d8"
>>>     TARGET_PRODUCT_omap-a15 = "jacinto6evm"
>>>   TARGET_PRODUCT_ti33x = "ti335x"
>>> @@ -47,7 +47,9 @@ S = "${WORKDIR}/git"
>>>     do_install () {
>>>       oe_runmake install DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT}
>>> -    ln -sf libGLESv2.so.${PV} ${D}${libdir}/libGLESv2.so.1
>>> +    ln -sf libGLESv2.so ${D}${libdir}/libGLESv2.so.1
>>> +
>>> +    rm -rf ${D}${includedir}/GL
>>
>>
>> Why remove this?
>>
>>
> 
> There is another component provides GL header files.
> Denys: how do we resolve this conflict?
> 


The DSP OpenCL implementation? That package needs fixed, not this one,
the OpenGL implementation (this driver) should provide the GL headers.

Andrew


> Eric
> 
> 
> 
>>>         chown -R root:root ${D}
>>>   }
>>> @@ -58,7 +60,7 @@ FILES_${PN} +=  "${includedir}/*"
>>>   FILES_${PN} +=  "${sysconfdir}/*"
>>>     PACKAGES =+ "${PN}-plugins"
>>> -FILES_${PN}-plugins = "${libdir}/libsrv_init.so
>>> ${libdir}/libsrv_um.so ${libdir}/libglslcompiler.so
>>> ${libdir}/libPVRScopeServices.so ${libdir}/libGLESv2.so
>>> ${libdir}/libEGL.so ${libdir}/libGLES_CM.so
>>> ${libdir}/libpvrDRMWSEGL.so  ${libdir}/libpvrGBMWSEGL.so 
>>> ${libdir}/libpvrws_WAYLAND.so"
>>> +FILES_${PN}-plugins = "${libdir}/libsrv_init.so
>>> ${libdir}/libsrv_um.so ${libdir}/libglslcompiler.so
>>> ${libdir}/libPVRScopeServices.so ${libdir}/libGLESv2.so
>>> ${libdir}/libEGL.so ${libdir}/libGLESv1_CM.so ${libdir}/libGLES_CM.so
>>> ${libdir}/libGLESv1_PVR_MESA.so ${libdir}/libGLESv2_PVR_MESA.so"
>>>   RDEPENDS_${PN} += "${PN}-plugins"
>>
>>
>> The newer binaries after the DDK commit "um: Attempt to load shared
>> object with version extension automatically" do not need all this plugin
>> stuff, it can all be dropped.
>>
>> Andrew
>>
>>
>>>     ALLOW_EMPTY_${PN}-plugins = "1"
>>>
> 

