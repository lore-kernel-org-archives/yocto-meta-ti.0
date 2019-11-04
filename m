Return-Path: <afd@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DBBC5E00D7E; Mon,  4 Nov 2019 07:28:33 -0800 (PST)
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
	*      [198.47.19.142 listed in list.dnswl.org]
	*  0.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 39E0FE00D7E
	for <meta-ti@yoctoproject.org>; Mon,  4 Nov 2019 07:28:32 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA4FSVIQ032248
	for <meta-ti@yoctoproject.org>; Mon, 4 Nov 2019 09:28:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1572881311;
	bh=aqP3aG5lPJZwZowxDMNardgu82LxXB/OHShoypcI5FA=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=THp92Wl3a+P4ZsXQUDe8GKy+4CkIwBO3NZ8Q57vphMxO8uAkA57RMX1Vw9fUAg2yU
	KKef7D1LEAmTKPogvK/9gCt+Ag/lg0tQkQg15m0QCcPxxq6VIsmheIDx/2LQ7M4VR5
	fP/CO6kAb6qFEx/Z6Od2GZTv12fPiERO/ploSOMo=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA4FSVJ9059289
	for <meta-ti@yoctoproject.org>; Mon, 4 Nov 2019 09:28:31 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 4 Nov 2019 09:28:16 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 4 Nov 2019 09:28:16 -0600
Received: from [10.250.45.147] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA4FSUUZ093947;
	Mon, 4 Nov 2019 09:28:30 -0600
To: "Ruei, Eric" <a0850410@ti.com>, "Tammana, Gowtham" <g-tammana@ti.com>,
	"Ruei, Eric" <e-ruei1@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
References: <20191029132020.8891-1-e-ruei1@ti.com>
	<aceddb08-4720-395a-e454-e0537fd77aee@ti.com>
	<45b0c0c5-832c-7128-3475-d1b045027151@ti.com>
	<a53bb589-e9e6-883c-f8ad-c6047aff9c9f@ti.com>
	<05819c0f80764f22a5693f493bd871dd@ti.com>
	<d8ba1b4e-5175-96fe-ef71-67736e0cd3d0@ti.com>
	<445d8d7b-7324-c6da-096d-2d8349bf955d@ti.com>
	<76c8ba28-561f-0deb-c25d-ca395ffee2b4@ti.com>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <0a3acfc1-717e-37cf-4cf5-8ae0e64652c6@ti.com>
Date: Mon, 4 Nov 2019 10:28:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <76c8ba28-561f-0deb-c25d-ca395ffee2b4@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
X-List-Received-Date: Mon, 04 Nov 2019 15:28:34 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 10/31/19 8:39 AM, Ruei, Eric wrote:
> Hi, Andrew, Gowtham and Denys:
> 
> What is our conclusion (solution) for the package size increment?
> 


As said, the Mesa part is a debug build (this is intentional, we really
do want all the symbols and debug strings while enabling this new
feature, or any issues will be much harder to solve). If we do this for
another cycle then I can do a release build then. But the hopeful plan
is to have Mesa built as its own recipe (mesa-pvr) which will mean this
wont be a problem next time (2020lts).

Andrew


> Best regards,
> 
> Eric
> 
> On 10/30/2019 10:58 AM, Andrew F. Davis wrote:
>> On 10/30/19 10:53 AM, Ruei, Eric wrote:
>>> On 10/30/2019 9:53 AM, Tammana, Gowtham wrote:
>>>>
>>>>
>>>>> -----Original Message-----
>>>>> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>>>>> bounces@yoctoproject.org] On Behalf Of Davis, Andrew
>>>>> Sent: Wednesday, October 30, 2019 8:36 AM
>>>>> To: Ruei, Eric; Ruei, Eric; meta-ti@yoctoproject.org
>>>>> Subject: [EXTERNAL] Re: [meta-ti] [PATCH] ti-sgx-ddk-um: update
>>>>> SRCREV to pick
>>>>> up Mesa-based EGL/GLES libraries
>>>>>
>>>>> On 10/30/19 9:31 AM, Ruei, Eric wrote:
>>>>>> On 10/30/2019 9:22 AM, Andrew F. Davis wrote:
>>>>>>> On 10/29/19 9:20 AM, Eric Ruei wrote:
>>>>>>>> This is the initial step toward Mesa-based EGL/GLES libraries which
>>>>>>>> support all the required EGL 1.5 extensions. We plan to provide a
>>>>>>>> Mesa-pvr recipe to build Mesa from source and SGX/DDK patches where
>>>>>>>> ti-sgx-ddk-um shall provide the EGL/GLES plugins only at the next
>>>>>>>> step.
>>>>>>>>
>>>>>>>> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
>>>>>>>> ---
>>>>>>>>     recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb | 8
>>>>>>>> +++++---
>>>>>>>>     1 file changed, 5 insertions(+), 3 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
>>>>>>>> b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
>>>>>>>> index 7a6f013e..3991d917 100644
>>>>>>>> --- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
>>>>>>>> +++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
>>>>>>>> @@ -11,7 +11,7 @@ PR = "r34"
>>>>>>>>     BRANCH = "ti-img-sgx/thud/${PV}"
>>>>>>>>       SRC_URI =
>>>>>>>> "git://git.ti.com/graphics/omap5-sgx-ddk-um-
>>>>> linux.git;protocol=git;branch=${BRANCH}"
>>>>>>>>
>>>>>>>> -SRCREV = "87d7e5c1e4db1bab048939c9719059d549c1e8dd"
>>>>>>>> +SRCREV = "2a2e5bb090ced870d73ed4edbc54793e952cc6d8"
>>>>>>>>       TARGET_PRODUCT_omap-a15 = "jacinto6evm"
>>>>>>>>     TARGET_PRODUCT_ti33x = "ti335x"
>>>>>>>> @@ -47,7 +47,9 @@ S = "${WORKDIR}/git"
>>>>>>>>       do_install () {
>>>>>>>>         oe_runmake install DESTDIR=${D}
>>>>>>>> TARGET_PRODUCT=${TARGET_PRODUCT}
>>>>>>>> -    ln -sf libGLESv2.so.${PV} ${D}${libdir}/libGLESv2.so.1
>>>>>>>> +    ln -sf libGLESv2.so ${D}${libdir}/libGLESv2.so.1
>>>>>>>> +
>>>>>>>> +    rm -rf ${D}${includedir}/GL
>>>>>>>
>>>>>>>
>>>>>>> Why remove this?
>>>>>>>
>>>>>>>
>>>>>>
>>>>>> There is another component provides GL header files.
>>>>>> Denys: how do we resolve this conflict?
>>>>>>
>>>>>
>>>>>
>>>>> The DSP OpenCL implementation? That package needs fixed, not this one,
>>>>> the OpenGL implementation (this driver) should provide the GL headers.
>>>>
>>>> We don't support desktop GL, they shouldn't come from this package.
>>>>
>>>> Gowtham
>>>>
>>>
>>> Andrew:
>>>
>>> Do you agree? I can keep the line here tentatively until GL is removed
>>> from the package itself.
>>>
>>
>>
>> I still believe we should be shipping the GL headers in this package.
>> But I won't object to removing the headers temporarily using this recipe
>> until the conflicting ones can be removed from the OpenCL package.
>>
>> Andrew
>>
>>
>>> Eric
>>>
>>>
>>>
>>>>>>
>>>>>>
>>>>>>>>           chown -R root:root ${D}
>>>>>>>>     }
>>>>>>>> @@ -58,7 +60,7 @@ FILES_${PN} +=  "${includedir}/*"
>>>>>>>>     FILES_${PN} +=  "${sysconfdir}/*"
>>>>>>>>       PACKAGES =+ "${PN}-plugins"
>>>>>>>> -FILES_${PN}-plugins = "${libdir}/libsrv_init.so
>>>>>>>> ${libdir}/libsrv_um.so ${libdir}/libglslcompiler.so
>>>>>>>> ${libdir}/libPVRScopeServices.so ${libdir}/libGLESv2.so
>>>>>>>> ${libdir}/libEGL.so ${libdir}/libGLES_CM.so
>>>>>>>> ${libdir}/libpvrDRMWSEGL.so  ${libdir}/libpvrGBMWSEGL.so
>>>>>>>> ${libdir}/libpvrws_WAYLAND.so"
>>>>>>>> +FILES_${PN}-plugins = "${libdir}/libsrv_init.so
>>>>>>>> ${libdir}/libsrv_um.so ${libdir}/libglslcompiler.so
>>>>>>>> ${libdir}/libPVRScopeServices.so ${libdir}/libGLESv2.so
>>>>>>>> ${libdir}/libEGL.so ${libdir}/libGLESv1_CM.so
>>>>>>>> ${libdir}/libGLES_CM.so
>>>>>>>> ${libdir}/libGLESv1_PVR_MESA.so ${libdir}/libGLESv2_PVR_MESA.so"
>>>>>>>>     RDEPENDS_${PN} += "${PN}-plugins"
>>>>>>>
>>>>>>>
>>>>>>> The newer binaries after the DDK commit "um: Attempt to load shared
>>>>>>> object with version extension automatically" do not need all this
>>>>>>> plugin
>>>>>>> stuff, it can all be dropped.
>>>>>>>
>>>>>>> Andrew
>>>>>>>
>>>>>>>
>>>>>>>>       ALLOW_EMPTY_${PN}-plugins = "1"
>>>>>>>>
>>>>>>
>>>>> -- 
>>>>> _______________________________________________
>>>>> meta-ti mailing list
>>>>> meta-ti@yoctoproject.org
>>>>> https://lists.yoctoproject.org/listinfo/meta-ti
>>>
> 

