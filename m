Return-Path: <afd@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 08C74E00D9F; Wed, 30 Oct 2019 08:14:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1A4CDE00D83
	for <meta-ti@yoctoproject.org>; Wed, 30 Oct 2019 08:14:37 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9UFEbPd029688
	for <meta-ti@yoctoproject.org>; Wed, 30 Oct 2019 10:14:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1572448477;
	bh=nUh/yP8A8ZwYuSF391coUQzvc3eYXDpH1sqfMCg05i0=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=IU9dpL89gNOr6n7JU3fO0bIP1zUOIhpm5/j8D7rbRK23SfRTI2ruPAOfy/FImKgb3
	nIArx+4XiW2FWDtYaaa275kQXqRVm6oU7Hl8bQ0XgMUe5p6rynhb7fUkCx6a4dzpb8
	YYYbVg0oY0UROrdFQKs4m9BHyjP3mKlpA1eJAIKw=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9UFEbte014953
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 30 Oct 2019 10:14:37 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 30 Oct 2019 10:14:24 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 30 Oct 2019 10:14:24 -0500
Received: from [10.250.45.147] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9UFEa3T122524;
	Wed, 30 Oct 2019 10:14:36 -0500
To: Denys Dmytriyenko <denys@ti.com>
References: <20191029132020.8891-1-e-ruei1@ti.com>
	<aceddb08-4720-395a-e454-e0537fd77aee@ti.com>
	<45b0c0c5-832c-7128-3475-d1b045027151@ti.com>
	<a53bb589-e9e6-883c-f8ad-c6047aff9c9f@ti.com>
	<05819c0f80764f22a5693f493bd871dd@ti.com>
	<d8ba1b4e-5175-96fe-ef71-67736e0cd3d0@ti.com>
	<445d8d7b-7324-c6da-096d-2d8349bf955d@ti.com>
	<20191030150639.GQ7518@beryl>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <fa9568df-2189-8206-66dd-79815b84bf52@ti.com>
Date: Wed, 30 Oct 2019 11:14:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191030150639.GQ7518@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "Ruei, Eric" <a0850410@ti.com>,
	"meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
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
X-List-Received-Date: Wed, 30 Oct 2019 15:14:39 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 10/30/19 11:06 AM, Denys Dmytriyenko wrote:
> On Wed, Oct 30, 2019 at 10:58:31AM -0400, Andrew F. Davis wrote:
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
>>>>>>>>    recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb | 8
>>>>>>>> +++++---
>>>>>>>>    1 file changed, 5 insertions(+), 3 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
>>>>>>>> b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
>>>>>>>> index 7a6f013e..3991d917 100644
>>>>>>>> --- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
>>>>>>>> +++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
>>>>>>>> @@ -11,7 +11,7 @@ PR = "r34"
>>>>>>>>    BRANCH = "ti-img-sgx/thud/${PV}"
>>>>>>>>      SRC_URI =
>>>>>>>> "git://git.ti.com/graphics/omap5-sgx-ddk-um-
>>>>> linux.git;protocol=git;branch=${BRANCH}"
>>>>>>>>
>>>>>>>> -SRCREV = "87d7e5c1e4db1bab048939c9719059d549c1e8dd"
>>>>>>>> +SRCREV = "2a2e5bb090ced870d73ed4edbc54793e952cc6d8"
>>>>>>>>      TARGET_PRODUCT_omap-a15 = "jacinto6evm"
>>>>>>>>    TARGET_PRODUCT_ti33x = "ti335x"
>>>>>>>> @@ -47,7 +47,9 @@ S = "${WORKDIR}/git"
>>>>>>>>      do_install () {
>>>>>>>>        oe_runmake install DESTDIR=${D}
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
> 
> Previously DDK only provided headers in these dirs: EGL, GLES, GLES2, KHR, gbm.
> 
> And OpenCL required GL headers, hence there was a "hacky" package created 
> specifically for that:
> http://arago-project.org/git/?p=meta-arago.git;a=blob;f=meta-arago-extras/recipes-ti/ocl/ocl-gl-headers_git.bb;hb=HEAD
> 
> If DDK now properly provides GL headers, the other package can be dropped.
> 
> But the question remains - should DDK actually provide GL headers, even though 
> it doesn't provide full support for it?
> 

The GL headers are the stock headers provided by Kronos that every GL
implementation should provide, they often contain definitions for
unsupported features (even the GLES folders have unsupported extension
definitions). The exact set of usable features can be determined at
runtime using various provided methods.

Basically it is up to the EGL layer to report back what the underlying
implementation supports, it should not be based on the content/age of
the headers at compile time. Without these headers valid/usable programs
may not compile on our platform.

Andrew

